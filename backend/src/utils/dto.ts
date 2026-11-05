/**
 * Mise en forme des réponses de l'API. Les documents renvoyés par le Document Service
 * sont projetés vers des objets explicites : on maîtrise exactement ce qui sort de Strapi
 * (aucun champ privé de l'utilisateur, pas de relation non désirée).
 */
import type { DiscussionType } from './constants';

type AnyDoc = Record<string, any> | null | undefined;

export interface AuthorDTO {
  documentId: string;
  username: string;
  displayName: string;
  avatarColor: string;
  communityRole: 'member' | 'redaction' | 'expert';
  isSubscriber: boolean;
}

export interface CategoryDTO {
  documentId: string;
  name: string;
  slug: string;
  color: string;
  icon: string;
  description?: string | null;
}

export interface ReplyDTO {
  documentId: string;
  content: string;
  isAccepted: boolean;
  createdAt: string;
  author: AuthorDTO | null;
}

export interface DiscussionSummaryDTO {
  documentId: string;
  title: string;
  slug: string;
  excerpt: string;
  type: DiscussionType;
  replyCount: number;
  isSolved: boolean;
  createdAt: string;
  lastActivityAt: string;
  author: AuthorDTO | null;
  category: CategoryDTO | null;
}

export interface DiscussionDetailDTO extends Omit<DiscussionSummaryDTO, 'excerpt'> {
  content: string;
  replies: ReplyDTO[];
}

const toIso = (value: unknown): string =>
  value instanceof Date ? value.toISOString() : String(value ?? new Date(0).toISOString());

export function toAuthor(user: AnyDoc): AuthorDTO | null {
  if (!user) return null;
  return {
    documentId: user.documentId,
    username: user.username,
    displayName: user.displayName || user.username,
    avatarColor: user.avatarColor || '#6e6e73',
    communityRole: user.communityRole || 'member',
    isSubscriber: Boolean(user.isSubscriber),
  };
}

export function toCategory(category: AnyDoc, withDescription = false): CategoryDTO | null {
  if (!category) return null;
  return {
    documentId: category.documentId,
    name: category.name,
    slug: category.slug,
    color: category.color,
    icon: category.icon,
    ...(withDescription ? { description: category.description ?? null } : {}),
  };
}

/** Extrait en texte brut, coupé proprement sur un mot. */
export function excerpt(content: string, max = 220): string {
  const plain = String(content ?? '')
    .replace(/\*\*/g, '')
    .replace(/^- /gm, '')
    .replace(/\s+/g, ' ')
    .trim();
  if (plain.length <= max) return plain;
  const cut = plain.slice(0, max);
  const lastSpace = cut.lastIndexOf(' ');
  return `${(lastSpace > max * 0.6 ? cut.slice(0, lastSpace) : cut).trimEnd()}…`;
}

export function toReply(reply: Record<string, any>): ReplyDTO {
  return {
    documentId: reply.documentId,
    content: reply.content,
    isAccepted: Boolean(reply.isAccepted),
    createdAt: toIso(reply.createdAt),
    author: toAuthor(reply.author),
  };
}

export function toDiscussionSummary(doc: Record<string, any>): DiscussionSummaryDTO {
  return {
    documentId: doc.documentId,
    title: doc.title,
    slug: doc.slug,
    excerpt: excerpt(doc.content),
    type: doc.type,
    replyCount: doc.replyCount ?? 0,
    isSolved: Boolean(doc.isSolved),
    createdAt: toIso(doc.createdAt),
    lastActivityAt: toIso(doc.lastActivityAt ?? doc.createdAt),
    author: toAuthor(doc.author),
    category: toCategory(doc.category),
  };
}

export function toDiscussionDetail(doc: Record<string, any>, replies: Record<string, any>[]): DiscussionDetailDTO {
  const { excerpt: _excerpt, ...summary } = toDiscussionSummary(doc);
  return {
    ...summary,
    category: toCategory(doc.category, true),
    content: doc.content,
    replies: replies.map(toReply),
  };
}
