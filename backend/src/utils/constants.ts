/** UID des Content Types manipulés par la logique métier. */
export const DISCUSSION_UID = 'api::discussion.discussion' as const;
export const REPLY_UID = 'api::reply.reply' as const;
export const CATEGORY_UID = 'api::category.category' as const;
export const USER_UID = 'plugin::users-permissions.user' as const;

export const DISCUSSION_TYPES = ['question', 'discussion'] as const;
export type DiscussionType = (typeof DISCUSSION_TYPES)[number];

/** Champs exposés pour un auteur : jamais l'e-mail, le rôle technique ni les jetons. */
export const AUTHOR_FIELDS = ['username', 'displayName', 'avatarColor', 'communityRole', 'isSubscriber'] as const;
export const CATEGORY_FIELDS = ['name', 'slug', 'color', 'icon'] as const;
export const DISCUSSION_LIST_FIELDS = [
  'title',
  'slug',
  'content',
  'type',
  'replyCount',
  'isSolved',
  'lastActivityAt',
  'createdAt',
] as const;
export const REPLY_FIELDS = ['content', 'isAccepted', 'createdAt'] as const;

export const LIMITS = {
  titleMin: 10,
  titleMax: 150,
  contentMax: 10000,
  replyMin: 2,
  replyMax: 5000,
  pageSizeDefault: 10,
  pageSizeMax: 50,
  searchMax: 100,
  repliesPerDiscussion: 200,
} as const;
