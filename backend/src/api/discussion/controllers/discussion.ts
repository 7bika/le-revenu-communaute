/**
 * Contrôleur des discussions : il se limite au protocole HTTP (lecture des paramètres,
 * codes de statut, format { data, meta }). La logique métier est dans le service.
 */
import { factories } from '@strapi/strapi';
import { errors } from '@strapi/utils';
import { DISCUSSION_UID } from '../../../utils/constants';
import { extractData, validateAcceptReply, validateListDiscussionsQuery } from '../../../utils/validation';

const { NotFoundError, UnauthorizedError } = errors;

export default factories.createCoreController(DISCUSSION_UID, ({ strapi }) => {
  const service = () => strapi.service(DISCUSSION_UID) as any;

  const requireUser = (ctx: any) => {
    const user = ctx.state.user;
    if (!user) throw new UnauthorizedError('Vous devez être connecté pour publier.');
    return user as { id: number; documentId: string };
  };

  return {
    /** GET /api/discussions?category=&sort=recent|oldest&status=&type=&q=&page=&pageSize= */
    async find(ctx) {
      const query = await validateListDiscussionsQuery(ctx.query);
      const { results, pagination } = await service().list(query);
      ctx.body = { data: results, meta: { pagination } };
    },

    /** GET /api/discussions/:id (documentId) */
    async findOne(ctx) {
      const discussion = await service().getByDocumentId(ctx.params.id);
      if (!discussion) throw new NotFoundError('Discussion introuvable.');
      ctx.body = { data: discussion, meta: {} };
    },

    /** GET /api/discussions/slug/:slug — URL propre utilisée par le front */
    async findBySlug(ctx) {
      const slug = String(ctx.params.slug ?? '');
      const discussion = /^[a-z0-9-]{1,120}$/.test(slug) ? await service().getBySlug(slug) : null;
      if (!discussion) throw new NotFoundError('Discussion introuvable.');
      ctx.body = { data: discussion, meta: {} };
    },

    /** POST /api/discussions — body : { data: { title, content, type, category } } */
    async create(ctx) {
      const user = requireUser(ctx);
      const data = extractData(ctx.request.body);
      // La policy prevent-author-spoofing a déjà refusé tout auteur différent de l'utilisateur
      // connecté : un éventuel champ « author » identique est simplement ignoré.
      delete data.author;
      const created = await service().createDiscussion(data, user);
      ctx.status = 201;
      ctx.body = { data: created, meta: {} };
    },

    /** PUT /api/discussions/:id/solution — body : { data: { reply } } */
    async acceptReply(ctx) {
      const user = requireUser(ctx);
      const { reply } = await validateAcceptReply(extractData(ctx.request.body));
      const discussion = await service().acceptReply(ctx.params.id, reply, user);
      ctx.body = { data: discussion, meta: {} };
    },
  };
});
