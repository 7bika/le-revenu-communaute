import type { DiscussionListParams } from './types';

/**
 * Paramètres d'URL du fil (en français, partageables) <-> paramètres de l'API Strapi.
 *   ?tri=recentes|anciennes  &filtre=sans-reponse|resolues  &type=question|discussion  &q=…  &page=2
 */
export interface FeedState {
  sort: 'recent' | 'oldest';
  status: 'all' | 'unanswered' | 'solved';
  type?: 'question' | 'discussion';
  q?: string;
  page: number;
}

type RawParams = Record<string, string | string[] | undefined>;
const first = (v: string | string[] | undefined) => (Array.isArray(v) ? v[0] : v);

export function parseFeedParams(raw: RawParams): FeedState {
  const tri = first(raw.tri);
  const filtre = first(raw.filtre);
  const type = first(raw.type);
  const q = first(raw.q)?.trim().slice(0, 100);
  const page = Number.parseInt(first(raw.page) ?? '1', 10);
  return {
    sort: tri === 'anciennes' ? 'oldest' : 'recent',
    status: filtre === 'sans-reponse' ? 'unanswered' : filtre === 'resolues' ? 'solved' : 'all',
    type: type === 'question' || type === 'discussion' ? type : undefined,
    q: q || undefined,
    page: Number.isFinite(page) && page > 0 ? Math.min(page, 1000) : 1,
  };
}

export const PAGE_SIZE = 10;

export function toApiParams(state: FeedState, category?: string): DiscussionListParams {
  return {
    page: state.page,
    pageSize: PAGE_SIZE,
    sort: state.sort,
    status: state.status,
    type: state.type,
    q: state.q,
    category,
  };
}

/** Construit l'URL du fil en conservant l'état courant ; toute modification ramène à la page 1. */
export function feedHref(basePath: string, state: FeedState, patch: Partial<FeedState> = {}): string {
  const next = { ...state, page: 1, ...patch };
  const params = new URLSearchParams();
  if (next.q) params.set('q', next.q);
  if (next.sort === 'oldest') params.set('tri', 'anciennes');
  if (next.status === 'unanswered') params.set('filtre', 'sans-reponse');
  if (next.status === 'solved') params.set('filtre', 'resolues');
  if (next.type) params.set('type', next.type);
  if (next.page > 1) params.set('page', String(next.page));
  const qs = params.toString();
  return qs ? `${basePath}?${qs}` : basePath;
}
