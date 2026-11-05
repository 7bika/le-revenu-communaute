/**
 * Service métier des réponses.
 */
import { factories } from '@strapi/strapi';
import { AUTHOR_FIELDS, DISCUSSION_UID, REPLY_FIELDS, REPLY_UID } from '../../../utils/constants';
import { toReply } from '../../../utils/dto';
import { fieldError, validateCreateReply, type ListRepliesQuery } from '../../../utils/validation';

type AuthUser = { id: number; documentId: string };

export default factories.createCoreService(REPLY_UID, ({ strapi }) => ({
  async listForDiscussion(query: ListRepliesQuery) {
    const filters = { discussion: { documentId: { $eq: query.discussion } } };
    const [rows, total] = await Promise.all([
      strapi.documents(REPLY_UID).findMany({
        filters,
        fields: [...REPLY_FIELDS],
        populate: { author: { fields: [...AUTHOR_FIELDS] } },
        sort: [{ createdAt: 'asc' }, { id: 'asc' }],
        start: (query.page - 1) * query.pageSize,
        limit: query.pageSize,
      }),
      strapi.documents(REPLY_UID).count({ filters }),
    ]);
    return {
      results: rows.map(toReply),
      pagination: { page: query.page, pageSize: query.pageSize, pageCount: Math.ceil(total / query.pageSize), total },
    };
  },

  /**
   * Publie une réponse au nom de l'utilisateur authentifié et met à jour les compteurs
   * de la discussion, le tout dans une transaction.
   */
  async createReply(rawData: Record<string, unknown>, user: AuthUser) {
    const input = await validateCreateReply(rawData);

    const discussion = await strapi.documents(DISCUSSION_UID).findOne({
      documentId: input.discussion,
      fields: ['slug'],
    });
    if (!discussion) {
      throw fieldError('discussion', 'Cette discussion n’existe pas.', 'La réponse contient des erreurs.');
    }

    const created = await strapi.db.transaction(async () => {
      const reply = await strapi.documents(REPLY_UID).create({
        data: { content: input.content, discussion: discussion.documentId, author: user.documentId, isAccepted: false } as any,
        fields: [...REPLY_FIELDS],
        populate: { author: { fields: [...AUTHOR_FIELDS] } },
      });
      await (strapi.service(DISCUSSION_UID) as any).refreshStats(discussion.documentId);
      return reply;
    });

    return { ...toReply(created), discussion: { documentId: discussion.documentId, slug: discussion.slug } };
  },
}));
