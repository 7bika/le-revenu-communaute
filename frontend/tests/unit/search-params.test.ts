import { describe, expect, test } from 'vitest';
import { feedHref, parseFeedParams, toApiParams } from '@/lib/search-params';

describe('paramètres du fil', () => {
  test('valeurs par défaut', () => {
    expect(parseFeedParams({})).toEqual({ sort: 'recent', status: 'all', type: undefined, q: undefined, page: 1 });
  });

  test('URL française -> paramètres de l’API Strapi', () => {
    const state = parseFeedParams({ tri: 'anciennes', filtre: 'sans-reponse', page: '3', q: '  PEA ' });
    expect(toApiParams(state, 'bourse')).toEqual({
      page: 3,
      pageSize: 10,
      sort: 'oldest',
      status: 'unanswered',
      type: undefined,
      q: 'PEA',
      category: 'bourse',
    });
  });

  test('valeurs invalides ignorées', () => {
    expect(parseFeedParams({ tri: 'x', filtre: 'y', page: '-4', type: 'sondage' })).toMatchObject({
      sort: 'recent',
      status: 'all',
      page: 1,
      type: undefined,
    });
  });

  test('les liens conservent l’état et reviennent en page 1', () => {
    const state = parseFeedParams({ tri: 'anciennes', page: '4' });
    expect(feedHref('/espaces/bourse', state, { status: 'solved' })).toBe('/espaces/bourse?tri=anciennes&filtre=resolues');
    expect(feedHref('/', state, { page: 5 })).toBe('/?tri=anciennes&page=5');
    expect(feedHref('/', parseFeedParams({}))).toBe('/');
  });
});
