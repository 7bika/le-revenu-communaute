/**
 * Service métier des discussions.
 * Toutes les lectures/écritures passent par le Document Service API de Strapi v5 avec :
 *  - une sélection explicite des champs (fields) pour ne charger que l'utile ;
 *  - un populate ciblé des relations (auteur, catégorie) : pas de requêtes N+1 ;
 *  - pagination et tri exécutés par la base de données.
 */
import { factories } from '@strapi/strapi';
import { errors } from '@strapi/utils';
import {
  AUTHOR_FIELDS,
  CATEGORY_FIELDS,
  CATEGORY_UID,
  DISCUSSION_LIST_FIELDS,
  DISCUSSION_UID,
  LIMITS,
  REPLY_FIELDS,
  REPLY_UID,
} from '../../../utils/constants';
import { toDiscussionDetail, toDiscussionSummary } from '../../../utils/dto';
import { slugify } from '../../../utils/slugify';
import {
  fieldError,
  validateCreateDiscussion,
  type ListDiscussionsQuery,
} from '../../../utils/validation';

const { NotFoundError, ValidationError } = errors;

type AuthUser = { id: number; documentId: string };

const listPopulate = {
  author: { fields: [...AUTHOR_FIELDS] },
  category: { fields: [...CATEGORY_FIELDS] },
};

const detailPopulate = {
  author: { fields: [...AUTHOR_FIELDS] },
  category: { fields: [...CATEGORY_FIELDS, 'description' as const] },
};

export default factories.createCoreService(DISCUSSION_UID, ({ strapi }) => {
  const documents = () => strapi.documents(DISCUSSION_UID);

  /** Construit les filtres Strapi à partir des paramètres validés. */
  const buildFilters = (query: ListDiscussionsQuery) => {
    const and: Record<string, unknown>[] = [];
    if (query.category) and.push({ category: { slug: { $eq: query.category } } });
    if (query.type) and.push({ type: { $eq: query.type } });
    if (query.status === 'unanswered') and.push({ replyCount: { $eq: 0 } });
    if (query.status === 'solved') and.push({ isSolved: { $eq: true } });
    if (query.q) {
      and.push({ $or: [{ title: { $containsi: query.q } }, { content: { $containsi: query.q } }] });
    }
    return and.length ? { $and: and } : {};
  };

  /** Slug lisible et unique : « titre-de-la-discussion », puis « …-2 », « …-3 » en cas de doublon. */
  const uniqueSlug = async (title: string): Promise<string> => {
    const base = slugify(title);
    const taken = await documents().findMany({
      filters: { slug: { $startsWith: base } },
      fields: ['slug'],
      limit: 500,
    });
    const used = new Set(taken.map((d: any) => d.slug));
    if (!used.has(base)) return base;
    let n = 2;
    while (used.has(`${base}-${n}`)) n += 1;
    return `${base}-${n}`;
  };

  const findCategory = (ref: string) =>
    strapi.documents(CATEGORY_UID).findFirst({
      filters: { $or: [{ documentId: { $eq: ref } }, { slug: { $eq: ref } }] },
      fields: ['name', 'slug'],
    });

  const loadReplies = (discussionDocumentId: string) =>
    strapi.documents(REPLY_UID).findMany({
      filters: { discussion: { documentId: { $eq: discussionDocumentId } } },
      fields: [...REPLY_FIELDS],
      populate: { author: { fields: [...AUTHOR_FIELDS] } },
      sort: [{ createdAt: 'asc' }, { id: 'asc' }],
      limit: LIMITS.repliesPerDiscussion,
    });

  const getDetail = async (filters: Record<string, unknown>) => {
    const doc = await documents().findFirst({
      filters,
      fields: [...DISCUSSION_LIST_FIELDS],
      populate: detailPopulate,
    });
    if (!doc) return null;
    const replies = await loadReplies(doc.documentId);
    return toDiscussionDetail(doc, replies);
  };

  return {
    async list(query: ListDiscussionsQuery) {
      const filters = buildFilters(query);
      const direction = query.sort === 'oldest' ? 'asc' : 'desc';
      const start = (query.page - 1) * query.pageSize;

      const [rows, total] = await Promise.all([
        documents().findMany({
          filters,
          fields: [...DISCUSSION_LIST_FIELDS],
          populate: listPopulate,
          sort: [{ createdAt: direction }, { id: direction }],
          start,
          limit: query.pageSize,
        }),
        documents().count({ filters }),
      ]);

      return {
        results: rows.map(toDiscussionSummary),
        pagination: {
          page: query.page,
          pageSize: query.pageSize,
          pageCount: Math.ceil(total / query.pageSize),
          total,
        },
      };
    },

    getBySlug(slug: string) {
      return getDetail({ slug: { $eq: slug } });
    },

    getByDocumentId(documentId: string) {
      return getDetail({ documentId: { $eq: documentId } });
    },

    /**
     * Crée une discussion pour l'utilisateur authentifié.
     * L'auteur vient exclusivement du jeton (ctx.state.user), jamais du corps de la requête.
     */
    async createDiscussion(rawData: Record<string, unknown>, user: AuthUser) {
      const input = await validateCreateDiscussion(rawData);

      const category = await findCategory(input.category);
      if (!category) {
        throw fieldError('category', 'Cette catégorie n’existe pas.', 'La discussion contient des erreurs.');
      }

      const now = new Date();
      const created = await documents().create({
        data: {
          title: input.title,
          slug: await uniqueSlug(input.title),
          content: input.content,
          type: input.type,
          category: category.documentId,
          author: user.documentId,
          replyCount: 0,
          isSolved: false,
          lastActivityAt: now,
        } as any,
        fields: [...DISCUSSION_LIST_FIELDS],
        populate: detailPopulate,
      });

      return toDiscussionDetail(created, []);
    },

    /**
     * Recalcule les compteurs dénormalisés (nombre de réponses, dernière activité).
     * Ils permettent d'afficher et de filtrer la liste sans compter les réponses à chaque requête.
     */
    async refreshStats(discussionDocumentId: string) {
      const replyCount = await strapi.documents(REPLY_UID).count({
        filters: { discussion: { documentId: { $eq: discussionDocumentId } } },
      });
      const [last] = await strapi.documents(REPLY_UID).findMany({
        filters: { discussion: { documentId: { $eq: discussionDocumentId } } },
        fields: ['createdAt'],
        sort: { createdAt: 'desc' },
        limit: 1,
      });
      const discussion = await documents().findOne({ documentId: discussionDocumentId, fields: ['createdAt'] });
      await documents().update({
        documentId: discussionDocumentId,
        data: { replyCount, lastActivityAt: last?.createdAt ?? discussion?.createdAt ?? new Date() } as any,
      });
      return replyCount;
    },

    /**
     * Désigne la meilleure réponse d'une question. Le contrôle « seul l'auteur de la question »
     * est fait par la policy is-discussion-author ; ici on vérifie la cohérence des données.
     */
    async acceptReply(discussionDocumentId: string, replyDocumentId: string, user: AuthUser) {
      const discussion = await documents().findOne({
        documentId: discussionDocumentId,
        fields: ['type', 'slug'],
      });
      if (!discussion) throw new NotFoundError('Discussion introuvable.');
      if (discussion.type !== 'question') {
        throw new ValidationError('Seule une question peut avoir une meilleure réponse.');
      }

      const reply = await strapi.documents(REPLY_UID).findFirst({
        filters: {
          documentId: { $eq: replyDocumentId },
          discussion: { documentId: { $eq: discussionDocumentId } },
        },
        fields: ['isAccepted'],
        populate: { author: { fields: ['username'] } },
      });
      if (!reply) throw fieldError('reply', 'Cette réponse n’appartient pas à la discussion.');
      if ((reply as any).author?.documentId === user.documentId) {
        throw fieldError('reply', 'Vous ne pouvez pas choisir votre propre réponse.');
      }

      await strapi.db.transaction(async () => {
        const previous = await strapi.documents(REPLY_UID).findMany({
          filters: {
            discussion: { documentId: { $eq: discussionDocumentId } },
            isAccepted: { $eq: true },
            documentId: { $ne: replyDocumentId },
          },
          fields: ['documentId'],
        });
        for (const p of previous) {
          await strapi.documents(REPLY_UID).update({ documentId: p.documentId, data: { isAccepted: false } as any });
        }
        await strapi.documents(REPLY_UID).update({ documentId: replyDocumentId, data: { isAccepted: true } as any });
        await documents().update({ documentId: discussionDocumentId, data: { isSolved: true } as any });
      });

      return getDetail({ documentId: { $eq: discussionDocumentId } });
    },
  };
});
