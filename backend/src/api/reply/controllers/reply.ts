import { factories } from '@strapi/strapi';
import { errors } from '@strapi/utils';
import { REPLY_UID } from '../../../utils/constants';
import { extractData, validateListRepliesQuery } from '../../../utils/validation';

export default factories.createCoreController(REPLY_UID, ({ strapi }) => {
  const service = () => strapi.service(REPLY_UID) as any;

  return {
    /** GET /api/replies?discussion=<documentId>&page=&pageSize= */
    async find(ctx) {
      const query = await validateListRepliesQuery(ctx.query);
      const { results, pagination } = await service().listForDiscussion(query);
      ctx.body = { data: results, meta: { pagination } };
    },

    /** POST /api/replies — body : { data: { discussion, content } } */
    async create(ctx) {
      const user = ctx.state.user;
      if (!user) throw new errors.UnauthorizedError('Vous devez être connecté pour répondre.');
      const data = extractData(ctx.request.body);
      delete data.author; // déjà contrôlé par la policy prevent-author-spoofing
      const reply = await service().createReply(data, user);
      ctx.status = 201;
      ctx.body = { data: reply, meta: {} };
    },
  };
});
