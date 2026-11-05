import 'server-only';
import { strapiRequest } from './client';
import type { DiscussionDetail, DiscussionType, Reply, SessionUser } from '../types';

/**
 * Écritures et lectures privées : jamais mises en cache, toujours avec le JWT de l'utilisateur.
 * Les règles métier (validation, auteur, droits) sont appliquées par Strapi.
 */

export interface LoginResult {
  jwt: string;
  user: { id: number; username: string };
}

export function login(identifier: string, password: string) {
  return strapiRequest<LoginResult>('/auth/local', { method: 'POST', body: { identifier, password } });
}

export function fetchMe(token: string) {
  return strapiRequest<SessionUser>('/users/me', { token });
}

export interface CreateDiscussionPayload {
  title: string;
  content: string;
  type: DiscussionType;
  category: string;
}

export async function createDiscussion(token: string, data: CreateDiscussionPayload) {
  const res = await strapiRequest<{ data: DiscussionDetail }>('/discussions', {
    method: 'POST',
    token,
    body: { data },
  });
  return res.data;
}

export async function createReply(token: string, data: { discussion: string; content: string }) {
  const res = await strapiRequest<{ data: Reply & { discussion: { slug: string } } }>('/replies', {
    method: 'POST',
    token,
    body: { data },
  });
  return res.data;
}

export async function acceptReply(token: string, discussionDocumentId: string, replyDocumentId: string) {
  const res = await strapiRequest<{ data: DiscussionDetail }>(`/discussions/${discussionDocumentId}/solution`, {
    method: 'PUT',
    token,
    body: { data: { reply: replyDocumentId } },
  });
  return res.data;
}
