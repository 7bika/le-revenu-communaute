import { describe, expect, test } from 'vitest';
import { initials, plural, timeAgo } from '@/lib/format';

describe('formats d’affichage', () => {
  const now = Date.parse('2026-11-05T12:00:00Z');
  const ago = (min: number) => new Date(now - min * 60_000).toISOString();

  test('dates relatives comme dans la maquette', () => {
    expect(timeAgo(ago(0.5), now)).toBe('à l’instant');
    expect(timeAgo(ago(14), now)).toBe('il y a 14 min');
    expect(timeAgo(ago(180), now)).toBe('il y a 3 h');
    expect(timeAgo(ago(60 * 26), now)).toBe('hier');
    expect(timeAgo(ago(60 * 24 * 4), now)).toBe('il y a 4 j');
  });

  test('pluriels et monogrammes', () => {
    expect(plural(1, 'réponse')).toBe('1 réponse');
    expect(plural(3, 'réponse')).toBe('3 réponses');
    expect(initials('Papy Boursier')).toBe('PB');
    expect(initials('La rédaction du Revenu', 'redaction')).toBe('R');
  });
});
