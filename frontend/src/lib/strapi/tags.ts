/** Tags de cache partagés entre les lectures (cacheTag) et les mutations (updateTag). */
export const tags = {
  categories: 'categories',
  discussions: 'discussions',
  discussion: (slug: string) => `discussion:${slug}`,
};
