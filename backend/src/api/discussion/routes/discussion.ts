import { factories } from '@strapi/strapi';

/**
 * Routes natives conservées : find, findOne, create (contrôleurs surchargés).
 * update/delete ne sont pas exposés : la modération se fait depuis le back-office.
 */
export default factories.createCoreRouter('api::discussion.discussion', {
  only: ['find', 'findOne', 'create'],
  config: {
    create: {
      policies: ['global::is-authenticated', 'global::prevent-author-spoofing'],
    },
  },
});
