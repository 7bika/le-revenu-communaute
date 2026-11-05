/**
 * Tests d'intégration de l'API Strapi (Node test runner, sans dépendance supplémentaire).
 * Couvre : affichage des discussions, validation métier, refus des publications anonymes,
 * protection contre l'usurpation d'auteur, réponses et meilleure réponse.
 */
import { after, before, describe, test } from 'node:test';
import assert from 'node:assert/strict';
import { api, login, startStrapi, stopStrapi } from './helpers/strapi.mjs';

const validDiscussion = (overrides = {}) => ({
  title: 'Faut-il ouvrir un PER à 45 ans ?',
  content: 'Je suis salarié, TMI à 30 %. Le PER vaut-il le coup à mon âge ?',
  type: 'question',
  category: 'retraite',
  ...overrides,
});

let camille; // membre de démonstration
let vincent; // autre membre

before(async () => {
  await startStrapi();
  camille = await login('Camille_B');
  vincent = await login('Vincent_ETF');
});

after(async () => {
  await stopStrapi();
});

describe('Affichage des discussions', () => {
  test('liste paginée avec auteur, catégorie et nombre de réponses', async () => {
    const { status, body } = await api('/discussions?pageSize=5');
    assert.equal(status, 200);
    assert.equal(body.data.length, 5);
    assert.deepEqual(Object.keys(body.meta.pagination).sort(), ['page', 'pageCount', 'pageSize', 'total']);
    assert.equal(body.meta.pagination.total, 20);
    const first = body.data[0];
    for (const key of ['title', 'slug', 'excerpt', 'type', 'replyCount', 'createdAt', 'author', 'category']) {
      assert.ok(key in first, `champ ${key} attendu`);
    }
    assert.ok(first.author.displayName);
    assert.ok(first.category.slug);
  });

  test("n'expose aucune donnée privée de l'auteur", async () => {
    const { body } = await api('/discussions?pageSize=50');
    for (const d of body.data) {
      assert.equal(d.author.email, undefined);
      assert.equal(d.author.password, undefined);
      assert.equal(d.author.provider, undefined);
    }
  });

  test('tri par date de publication (récentes / anciennes)', async () => {
    const recent = (await api('/discussions?pageSize=50&sort=recent')).body.data.map((d) => Date.parse(d.createdAt));
    const oldest = (await api('/discussions?pageSize=50&sort=oldest')).body.data.map((d) => Date.parse(d.createdAt));
    assert.deepEqual(recent, [...recent].sort((a, b) => b - a));
    assert.deepEqual(oldest, [...oldest].sort((a, b) => a - b));
  });

  test('filtre par catégorie', async () => {
    const { body } = await api('/discussions?category=bourse&pageSize=50');
    assert.ok(body.data.length > 0);
    assert.ok(body.data.every((d) => d.category.slug === 'bourse'));
  });

  test('filtre « sans réponse » et recherche', async () => {
    const unanswered = await api('/discussions?status=unanswered&pageSize=50');
    assert.ok(unanswered.body.data.every((d) => d.replyCount === 0));
    const search = await api('/discussions?q=PEA&pageSize=50');
    const titles = search.body.data.map((d) => d.title);
    assert.ok(titles.includes('Ouvrir un PEA avec 5 000 € : par où commencer ?'));
    assert.ok(!titles.includes('Location meublée : micro-BIC ou régime réel ?'));
  });

  test('paramètres invalides : 400 explicite', async () => {
    assert.equal((await api('/discussions?pageSize=500')).status, 400);
    assert.equal((await api('/discussions?sort=popular')).status, 400);
    assert.equal((await api('/discussions?inconnu=1')).status, 400);
  });

  test('détail par slug avec réponses ordonnées, 404 sinon', async () => {
    const { status, body } = await api('/discussions/slug/ouvrir-un-pea-avec-5-000-eur-par-ou-commencer');
    assert.equal(status, 200);
    assert.equal(body.data.title, 'Ouvrir un PEA avec 5 000 € : par où commencer ?');
    assert.equal(body.data.replies.length, 4);
    const dates = body.data.replies.map((r) => Date.parse(r.createdAt));
    assert.deepEqual(dates, [...dates].sort((a, b) => a - b));
    assert.equal((await api('/discussions/slug/n-existe-pas')).status, 404);
  });
});

describe('Création d’une discussion : validation métier côté Strapi', () => {
  test('titre trop court, contenu vide, type et catégorie invalides : 400 avec le détail par champ', async () => {
    const { status, body } = await api('/discussions', {
      method: 'POST',
      token: camille.token,
      body: { data: { title: 'Court', content: '   ', type: 'sondage', category: '' } },
    });
    assert.equal(status, 400);
    assert.equal(body.error.name, 'ValidationError');
    const paths = body.error.details.errors.map((e) => e.path[0]).sort();
    assert.deepEqual(paths, ['category', 'content', 'title', 'type']);
  });

  test('un titre de 10 caractères « blancs » ne passe pas (trim)', async () => {
    const { status, body } = await api('/discussions', {
      method: 'POST',
      token: camille.token,
      body: { data: validDiscussion({ title: '   court     ' }) },
    });
    assert.equal(status, 400);
    assert.equal(body.error.details.errors[0].path[0], 'title');
  });

  test('catégorie inexistante : 400 sur le champ category', async () => {
    const { status, body } = await api('/discussions', {
      method: 'POST',
      token: camille.token,
      body: { data: validDiscussion({ category: 'inconnue' }) },
    });
    assert.equal(status, 400);
    assert.equal(body.error.details.errors[0].path[0], 'category');
  });

  test('les champs calculés ne peuvent pas être forcés par le client', async () => {
    const { status, body } = await api('/discussions', {
      method: 'POST',
      token: camille.token,
      body: { data: validDiscussion({ replyCount: 99, isSolved: true }) },
    });
    assert.equal(status, 400);
    assert.deepEqual(body.error.details.errors.map((e) => e.path[0]).sort(), ['isSolved', 'replyCount']);
  });

  test('corps sans objet data : 400', async () => {
    const { status } = await api('/discussions', { method: 'POST', token: camille.token, body: validDiscussion() });
    assert.equal(status, 400);
  });

  test('discussion valide : 201, slug propre, auteur = utilisateur connecté', async () => {
    const { status, body } = await api('/discussions', {
      method: 'POST',
      token: camille.token,
      body: { data: validDiscussion() },
    });
    assert.equal(status, 201);
    assert.equal(body.data.slug, 'faut-il-ouvrir-un-per-a-45-ans');
    assert.equal(body.data.author.username, 'Camille_B');
    assert.equal(body.data.category.slug, 'retraite');
    assert.equal(body.data.replyCount, 0);

    // Même titre : le slug reste unique
    const again = await api('/discussions', { method: 'POST', token: camille.token, body: { data: validDiscussion() } });
    assert.equal(again.body.data.slug, 'faut-il-ouvrir-un-per-a-45-ans-2');

    // Visible immédiatement dans la liste
    const list = await api('/discussions?pageSize=1');
    assert.equal(list.body.data[0].documentId, again.body.data.documentId);
  });
});

describe('Publication réservée aux utilisateurs authentifiés', () => {
  test('création de discussion sans jeton : refusée', async () => {
    const before = (await api('/discussions?pageSize=1')).body.meta.pagination.total;
    const { status } = await api('/discussions', { method: 'POST', body: { data: validDiscussion() } });
    assert.ok([401, 403].includes(status), `statut ${status}`);
    const afterTotal = (await api('/discussions?pageSize=1')).body.meta.pagination.total;
    assert.equal(afterTotal, before);
  });

  test('jeton invalide : 401', async () => {
    const { status } = await api('/discussions', { method: 'POST', token: 'jeton.invalide', body: { data: validDiscussion() } });
    assert.equal(status, 401);
  });

  test('réponse sans jeton : refusée', async () => {
    const d = (await api('/discussions?pageSize=1')).body.data[0];
    const { status } = await api('/replies', { method: 'POST', body: { data: { discussion: d.documentId, content: 'Bonjour' } } });
    assert.ok([401, 403].includes(status), `statut ${status}`);
  });

  test("pas d'endpoint de modification ou de suppression public", async () => {
    const d = (await api('/discussions?pageSize=1')).body.data[0];
    assert.ok([404, 405].includes((await api(`/discussions/${d.documentId}`, { method: 'DELETE' })).status));
    assert.ok([404, 405].includes((await api(`/discussions/${d.documentId}`, { method: 'PUT', body: { data: {} } })).status));
  });
});

describe('Protection contre l’usurpation d’auteur', () => {
  test('auteur = autre membre (id numérique) : 403', async () => {
    const { status, body } = await api('/discussions', {
      method: 'POST',
      token: camille.token,
      body: { data: validDiscussion({ author: vincent.user.id }) },
    });
    assert.equal(status, 403);
    assert.equal(body.error.details.policy, 'prevent-author-spoofing');
  });

  test('auteur = autre membre (documentId, connect) : 403', async () => {
    for (const author of [vincent.user.documentId, { documentId: vincent.user.documentId }, { connect: [vincent.user.documentId] }]) {
      const { status } = await api('/discussions', {
        method: 'POST',
        token: camille.token,
        body: { data: validDiscussion({ author }) },
      });
      assert.equal(status, 403, `author=${JSON.stringify(author)}`);
    }
  });

  test('réponse au nom d’un autre membre : 403', async () => {
    const d = (await api('/discussions?pageSize=1')).body.data[0];
    const { status } = await api('/replies', {
      method: 'POST',
      token: camille.token,
      body: { data: { discussion: d.documentId, content: 'Usurpation', author: vincent.user.id } },
    });
    assert.equal(status, 403);
  });

  test("préciser son propre identifiant est accepté, et l'auteur reste l'utilisateur connecté", async () => {
    const { status, body } = await api('/discussions', {
      method: 'POST',
      token: vincent.token,
      body: { data: validDiscussion({ title: 'ETF monde : capitalisant ou distribuant ?', author: vincent.user.id }) },
    });
    assert.equal(status, 201);
    assert.equal(body.data.author.username, 'Vincent_ETF');
  });
});

describe('Réponses et meilleure réponse', () => {
  let discussion;

  before(async () => {
    const res = await api('/discussions', {
      method: 'POST',
      token: camille.token,
      body: { data: validDiscussion({ title: 'Livret A ou LDDS pour mon épargne de précaution ?', category: 'epargne' }) },
    });
    discussion = res.body.data;
  });

  test('réponse valide : 201, compteur de réponses et dernière activité mis à jour', async () => {
    const { status, body } = await api('/replies', {
      method: 'POST',
      token: vincent.token,
      body: { data: { discussion: discussion.documentId, content: 'Les deux, plafonds et taux identiques.' } },
    });
    assert.equal(status, 201);
    assert.equal(body.data.author.username, 'Vincent_ETF');

    const detail = await api(`/discussions/slug/${discussion.slug}`);
    assert.equal(detail.body.data.replyCount, 1);
    assert.equal(detail.body.data.replies[0].content, 'Les deux, plafonds et taux identiques.');
    assert.ok(Date.parse(detail.body.data.lastActivityAt) >= Date.parse(detail.body.data.createdAt));
  });

  test('réponse vide ou vers une discussion inconnue : 400', async () => {
    const empty = await api('/replies', { method: 'POST', token: vincent.token, body: { data: { discussion: discussion.documentId, content: ' ' } } });
    assert.equal(empty.status, 400);
    const unknown = await api('/replies', {
      method: 'POST',
      token: vincent.token,
      body: { data: { discussion: 'aaaaaaaaaaaaaaaaaaaaaaaa', content: 'Bonjour à tous' } },
    });
    assert.equal(unknown.status, 400);
    assert.equal(unknown.body.error.details.errors[0].path[0], 'discussion');
  });

  test("seul l'auteur de la question choisit la meilleure réponse", async () => {
    const reply = (await api(`/discussions/slug/${discussion.slug}`)).body.data.replies[0];

    const byOther = await api(`/discussions/${discussion.documentId}/solution`, {
      method: 'PUT',
      token: vincent.token,
      body: { data: { reply: reply.documentId } },
    });
    assert.equal(byOther.status, 403);

    const byAuthor = await api(`/discussions/${discussion.documentId}/solution`, {
      method: 'PUT',
      token: camille.token,
      body: { data: { reply: reply.documentId } },
    });
    assert.equal(byAuthor.status, 200);
    assert.equal(byAuthor.body.data.isSolved, true);
    assert.equal(byAuthor.body.data.replies[0].isAccepted, true);
  });
});
