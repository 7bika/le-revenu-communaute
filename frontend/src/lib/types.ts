/**
 * Types des données renvoyées par l'API Strapi (contrats des contrôleurs personnalisés).
 */
export type DiscussionType = 'question' | 'discussion';
export type CommunityRole = 'member' | 'redaction' | 'expert';

export interface Author {
  documentId: string;
  username: string;
  displayName: string;
  avatarColor: string;
  communityRole: CommunityRole;
  isSubscriber: boolean;
}

export interface Category {
  documentId: string;
  name: string;
  slug: string;
  color: string;
  icon: string;
  description?: string | null;
}

export interface Reply {
  documentId: string;
  content: string;
  isAccepted: boolean;
  createdAt: string;
  author: Author | null;
}

export interface DiscussionSummary {
  documentId: string;
  title: string;
  slug: string;
  excerpt: string;
  type: DiscussionType;
  replyCount: number;
  isSolved: boolean;
  createdAt: string;
  lastActivityAt: string;
  author: Author | null;
  category: Category | null;
}

export interface DiscussionDetail extends Omit<DiscussionSummary, 'excerpt'> {
  content: string;
  replies: Reply[];
}

export interface Pagination {
  page: number;
  pageSize: number;
  pageCount: number;
  total: number;
}

export interface Paginated<T> {
  data: T[];
  meta: { pagination: Pagination };
}

export interface SessionUser {
  id: number;
  documentId: string;
  username: string;
  displayName: string | null;
  avatarColor: string | null;
  communityRole: CommunityRole;
  isSubscriber: boolean;
}

/** Paramètres de liste, tels qu'attendus par GET /api/discussions */
export interface DiscussionListParams {
  page?: number;
  pageSize?: number;
  category?: string;
  sort?: 'recent' | 'oldest';
  status?: 'all' | 'unanswered' | 'solved';
  type?: DiscussionType;
  q?: string;
}
