/**
 * Tests unitaires des utilitaires purs (compilés dans dist/ par `npm test`).
 */
import { describe, test } from 'node:test';
import assert from 'node:assert/strict';
import { createRequire } from 'node:module';

const require = createRequire(import.meta.url);
const { slugify } = require('../dist/src/utils/slugify.js');
const { excerpt } = require('../dist/src/utils/dto.js');
const { validateCreateDiscussion } = require('../dist/src/utils/validation.js');

describe('slugify', () => {
  test('accents, ponctuation et symboles', () => {
    assert.equal(slugify('J’ai 25 ans et 10 000 € de côté : je fais quoi ?'), 'j-ai-25-ans-et-10-000-eur-de-cote-je-fais-quoi');
    assert.equal(slugify('Frais réels ou abattement de 10 %'), 'frais-reels-ou-abattement-de-10-pourcent');
    assert.equal(slugify('Œuvre & cœur'), 'oeuvre-et-coeur');
  });
  test('longueur maximale coupée sur un mot', () => {
    const slug = slugify('mot '.repeat(60));
    assert.ok(slug.length <= 80);
    assert.ok(!slug.endsWith('-'));
  });
});

describe('excerpt', () => {
  test('retire le balisage et coupe proprement', () => {
    assert.equal(excerpt('**Gras**\n\n- item'), 'Gras item');
    const long = excerpt('mot '.repeat(100), 50);
    assert.ok(long.endsWith('…'));
    assert.ok(long.length <= 51);
  });
});

describe('validateCreateDiscussion', () => {
  test('normalise (trim) une entrée valide', async () => {
    const value = await validateCreateDiscussion({ title: '  Une question valable  ', content: ' Contenu ', type: 'question', category: 'bourse' });
    assert.equal(value.title, 'Une question valable');
    assert.equal(value.content, 'Contenu');
  });
  test('refuse un titre de moins de 10 caractères et un type inconnu', async () => {
    await assert.rejects(validateCreateDiscussion({ title: 'Court', content: 'x', type: 'poll', category: 'bourse' }), (error) => {
      const paths = error.details.errors.map((e) => e.path[0]).sort();
      assert.deepEqual(paths, ['title', 'type']);
      return true;
    });
  });
});
