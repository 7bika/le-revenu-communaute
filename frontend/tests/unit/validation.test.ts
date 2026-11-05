import { describe, expect, test } from 'vitest';
import { discussionSchema, fieldErrorsOf, safeRedirect } from '@/lib/validation';

describe('validation du formulaire de discussion', () => {
  test('erreurs par champ, avec les mêmes règles que Strapi', () => {
    const result = discussionSchema.safeParse({ title: 'Court', content: '  ', type: 'poll', category: '' });
    expect(result.success).toBe(false);
    if (!result.success) {
      expect(Object.keys(fieldErrorsOf(result.error)).sort()).toEqual(['category', 'content', 'title', 'type']);
      expect(fieldErrorsOf(result.error).title).toMatch(/10 caractères/);
    }
  });

  test('le titre est mesuré sans les espaces superflus', () => {
    expect(discussionSchema.safeParse({ title: '   123456789   ', content: 'x', type: 'question', category: 'a' }).success).toBe(false);
    expect(discussionSchema.safeParse({ title: '1234567890', content: 'x', type: 'discussion', category: 'a' }).success).toBe(true);
  });
});

describe('redirection après connexion', () => {
  test('n’accepte que des chemins internes', () => {
    expect(safeRedirect('/discussions/abc')).toBe('/discussions/abc');
    expect(safeRedirect('https://evil.example')).toBe('/');
    expect(safeRedirect('//evil.example')).toBe('/');
    expect(safeRedirect(undefined)).toBe('/');
  });
});
