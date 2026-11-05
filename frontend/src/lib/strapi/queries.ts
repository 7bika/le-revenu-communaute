import 'server-only';
import { cacheLife, cacheTag } from 'next/cache';
import { StrapiError, strapiRequest } from './client';
import type {
  Category,
  DiscussionDetail,
  DiscussionListParams,
  DiscussionSummary,
  Paginated,
} from '../types';
import { tags } from './tags';

/**
 * Lectures publiques, mises en cache côté serveur ('use cache').
 * Elles ne dépendent d'aucune donnée de l'utilisateur : le même résultat est partagé entre
 * tous les visiteurs, et les Server Actions l'invalident par tag après une publication.
 */

export async function getCategories(): Promise<Category[]> {
  'use cache';
  cacheLife('hours');
  cacheTag(tags.categories);

  // Endpoint natif de Strapi : tri, sélection de champs et pagination standards.
  const res = await strapiRequest<Paginated<Category>>('/categories', {
    query: {
      sort: 'position:asc',
      'fields[0]': 'name',
      'fields[1]': 'slug',
      'fields[2]': 'color',
      'fields[3]': 'icon',
      'fields[4]': 'description',
      'pagination[pageSize]': 100,
    },
  });
  return res.data;
}

export async function getDiscussions(params: DiscussionListParams): Promise<Paginated<DiscussionSummary>> {
  'use cache';
  // Fil de discussions : quelques secondes de fraîcheur suffisent, la publication
  // d'un membre invalide le tag immédiatement (updateTag dans les Server Actions).
  cacheLife({ stale: 30, revalidate: 60, expire: 3600 });
  cacheTag(tags.discussions);

  return strapiRequest<Paginated<DiscussionSummary>>('/discussions', {
    query: {
      page: params.page,
      pageSize: params.pageSize,
      category: params.category,
      sort: params.sort,
      status: params.status,
      type: params.type,
      q: params.q,
    },
  });
}

export async function getDiscussionBySlug(slug: string): Promise<DiscussionDetail | null> {
  'use cache';
  cacheLife({ stale: 30, revalidate: 60, expire: 3600 });
  cacheTag(tags.discussions, tags.discussion(slug));

  try {
    const res = await strapiRequest<{ data: DiscussionDetail }>(`/discussions/slug/${encodeURIComponent(slug)}`);
    return res.data;
  } catch (error) {
    if (error instanceof StrapiError && error.status === 404) return null;
    throw error;
  }
}
