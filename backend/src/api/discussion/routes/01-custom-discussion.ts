export default {
  routes: [
    {
      method: 'GET',
      path: '/discussions/slug/:slug',
      handler: 'api::discussion.discussion.findBySlug',
      config: { policies: [] },
    },
    {
      method: 'PUT',
      path: '/discussions/:id/solution',
      handler: 'api::discussion.discussion.acceptReply',
      config: {
        policies: ['global::is-authenticated', 'api::discussion.is-discussion-author'],
      },
    },
  ],
};
