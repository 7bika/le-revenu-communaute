# Communauté Le Revenu — test technique Full Stack

Espace communautaire où les lecteurs du Revenu publient des questions et des discussions, y répondent et désignent la meilleure réponse.
Intégration de la maquette HTML fournie, avec **Next.js 16 (App Router)** côté front et **Strapi v5 + PostgreSQL** côté back.

| | |
|---|---|
| `frontend/` | Next.js 16, React 19, TypeScript, Tailwind CSS 4 |
| `backend/` | Strapi 5.61, TypeScript, PostgreSQL 16, API REST |
| `database/lerevenu.sql` | Export PostgreSQL prêt à l'emploi (données de démonstration + compte back-office) |
| `docker-compose.yml` | PostgreSQL + Strapi + Next.js en une commande |

## Périmètre réalisé

**Fonctionnalités demandées**
- **Accueil** : discussions servies par l'API Strapi (titre, auteur, catégorie, nombre de réponses, date de publication), filtre par catégorie (`/espaces/[slug]`), tri par date de publication (récentes / anciennes), lien vers le détail.
- **Détail** : URL propre `/discussions/[slug]`, contenu, auteur, date, catégorie, réponses ; publication d'une réponse enregistrée dans PostgreSQL via Strapi.
- **Création** : formulaire titre (10 caractères minimum), contenu obligatoire, catégorie, type (question / discussion) ; erreurs affichées par champ ; redirection vers la nouvelle discussion.
- **Utilisateurs et permissions** : Users & Permissions de Strapi avec des membres de démonstration ; chaque discussion et chaque réponse est liée à son auteur ; publication refusée aux anonymes ; impossible de publier au nom d'un autre membre ; permissions configurées dans Strapi.

**Bonus réalisés** : recherche, pagination, meilleure réponse (choisie par l'auteur de la question), tests end-to-end Playwright, Docker Compose.
Non réalisés (choix de périmètre) : votes « Utile », sondages, profils membres.

## Démarrage rapide (local)

Prérequis : **Node.js 22**, **PostgreSQL 14+** (ou Docker, voir plus bas).

### 1. Base de données

```bash
psql -U postgres -c "CREATE USER strapi WITH PASSWORD 'strapi' CREATEDB;"
psql -U postgres -c "CREATE DATABASE lerevenu OWNER strapi;"
# Uniquement pour les tests d'API (base vidée à chaque exécution) :
psql -U postgres -c "CREATE DATABASE lerevenu_test OWNER strapi;"
```

Deux façons d'obtenir les données :
- **Automatique (recommandé)** : au premier démarrage sur une base vide, Strapi crée les 11 espaces, 18 membres, 20 discussions et 48 réponses de la maquette (dates relatives au moment du démarrage).
- **Export SQL** : `psql -U strapi -d lerevenu -f database/lerevenu.sql` (contient aussi le compte du back-office).

### 2. Strapi (port 1337)

```bash
cd backend
cp .env.example .env      # puis remplacez les secrets « changeMe » (commande ci-dessous)
npm install
npm run develop
```

Générer un secret : `node -e "console.log(require('crypto').randomBytes(16).toString('base64'))"`.
Back-office : <http://localhost:1337/admin> — `admin@lerevenu.local` / `Admin1234!` (créé au démarrage via `ADMIN_EMAIL` / `ADMIN_PASSWORD`).

### 3. Next.js (port 3000)

```bash
cd frontend
cp .env.example .env.local   # STRAPI_URL=http://localhost:1337 ; COOKIE_SECURE=false pour `npm start` en HTTP
npm install
npm run dev                  # ou : npm run build && npm start
```

Ouvrir <http://localhost:3000>. **Comptes de démonstration** (mot de passe `Demo1234!`) :

| E-mail | Profil |
|---|---|
| `camille.b@demo.lerevenu.fr` | membre abonnée |
| `thomas.pea@demo.lerevenu.fr` | auteur de la question « Ouvrir un PEA… » |
| `vincent.etf@demo.lerevenu.fr` | membre actif |
| `laredaction@demo.lerevenu.fr` | compte de la rédaction |

Les autres membres suivent le même modèle : `<pseudo en minuscules, ponctuation remplacée par des points>@demo.lerevenu.fr`.

Remettre les données à zéro : `cd backend && npm run seed:reset && npm run develop`.

### Avec Docker

```bash
docker compose up --build
```

PostgreSQL, Strapi (seed et compte back-office automatiques) puis Next.js : <http://localhost:3000>. Les secrets du `docker-compose.yml` sont des valeurs de démonstration, à surcharger par variables d'environnement hors poste local.

## Tests

| Commande | Contenu |
|---|---|
| `cd backend && npm test` | **29 tests** : unitaires (slug, extrait, validation) + intégration de l'API sur une vraie instance Strapi et la base `lerevenu_test` (vidée puis réensemencée à chaque exécution) |
| `cd frontend && npm test` | **11 tests** Vitest : paramètres d'URL, validation des formulaires, formats, rendu du texte (dont l'échappement HTML) |
| `cd frontend && npm run test:e2e` | **14 tests** Playwright (bureau + mobile) — Strapi doit tourner sur le port 1337 ; Next est lancé automatiquement. Première fois : `npx playwright install chromium` |

Les cas demandés sont couverts :
- **validation d'une discussion** : titre < 10 caractères, titre composé d'espaces, contenu vide, type et catégorie invalides, champs calculés forcés (`replyCount`, `isSolved`) → 400 avec le détail par champ ;
- **publication non authentifiée** : discussion et réponse sans jeton refusées, jeton invalide → 401, aucune écriture en base ;
- **usurpation d'auteur** : `author` = autre membre (id, documentId, `{ documentId }`, `{ connect }`) → 403 ; son propre id est toléré mais l'auteur reste toujours celui du jeton ;
- **affichage** : liste paginée, tri par date, filtre par catégorie, absence de données privées (e-mail…), détail par slug ; côté interface, parcours complets (lister, filtrer, trier, ouvrir, se connecter, publier, répondre, choisir la meilleure réponse).

Les tests e2e créent des discussions dans la base de développement : `npm run seed:reset` les efface.

## Architecture backend (Strapi v5)

### Modèle de données

```
User (Users & Permissions, étendu)          Category
  username, email, password…                  name, slug (uid), description,
  + displayName, bio, avatarColor,            color, icon, position
    communityRole (member|redaction|expert),        │ 1
    isSubscriber                                    │
        │ 1                                         │ n
        │ n                                  Discussion
        ├──────────── author ─────────────── title (10–150), slug (uid, unique),
        │                                    content (≤ 10 000), type (question|discussion),
        │                                    replyCount, lastActivityAt, isSolved
        │ n                                         │ 1
        └──────────── author ─────────────── Reply  │ n
                                             content (2–5 000), isAccepted, discussion
```

Schémas : `backend/src/api/*/content-types/*/schema.json` et `backend/src/extensions/users-permissions/content-types/user/schema.json`. Brouillon/publication désactivé : une contribution est publique dès sa création.

### Endpoints

| Méthode | Route | Accès | Rôle |
|---|---|---|---|
| GET | `/api/categories` | public | endpoint **natif** (tri, `fields`, pagination standards) |
| GET | `/api/discussions?category=&sort=recent\|oldest&status=all\|unanswered\|solved&type=&q=&page=&pageSize=` | public | liste paginée, triée et filtrée en base |
| GET | `/api/discussions/slug/:slug` | public | détail + réponses (URL propre du front) |
| GET | `/api/discussions/:documentId` | public | détail par identifiant |
| POST | `/api/discussions` | authentifié | création `{ data: { title, content, type, category } }` |
| PUT | `/api/discussions/:documentId/solution` | auteur de la question | meilleure réponse `{ data: { reply } }` |
| GET | `/api/replies?discussion=&page=&pageSize=` | public | réponses paginées d'une discussion |
| POST | `/api/replies` | authentifié | réponse `{ data: { discussion, content } }` |
| POST | `/api/auth/local`, GET `/api/users/me` | — | natifs Users & Permissions |

Pas de route publique de modification ni de suppression : la modération passe par le back-office.

### Où est la logique

- **Contrôleurs** (`controllers/`) : protocole HTTP seulement (paramètres, statut 201, format `{ data, meta }`).
- **Services** (`services/`) : règles métier, via le **Document Service API** (`strapi.documents(...)`) : création, slug unique, compteurs, meilleure réponse dans une transaction.
- **Validation** (`src/utils/validation.ts`, yup fourni par `@strapi/utils`) : appliquée côté Strapi quel que soit le client. Les entrées sont normalisées (trim), les champs inconnus sont refusés explicitement plutôt qu'ignorés, la catégorie et la discussion référencées doivent exister. Les contraintes sont aussi déclarées dans les schémas (min/max, required).
- **Policies** :
  - `global::is-authenticated` — refuse toute écriture anonyme (401), même si le rôle Public recevait par erreur le droit `create` ;
  - `global::prevent-author-spoofing` — 403 si le corps désigne un autre auteur ; le service fixe de toute façon l'auteur depuis `ctx.state.user` ;
  - `api::discussion.is-discussion-author` — seul l'auteur choisit la meilleure réponse.
- **Permissions** (`src/bootstrap/permissions.ts`) : appliquées par le code à chaque démarrage, de façon idempotente. Public = lecture ; Authenticated = lecture + publication. Un droit d'écriture accordé par erreur au rôle Public est retiré.
- **Erreurs** : format Strapi homogène `{ error: { status, name, message, details } }` — 400 `ValidationError` (avec `details.errors[].path` par champ), 401, 403 `PolicyError`, 404 `NotFoundError`. Messages en français, affichés tels quels par le front.

### Performance des lectures

- `fields` et `populate` ciblés : l'auteur n'est chargé qu'avec `username, displayName, avatarColor, communityRole, isSubscriber` (jamais l'e-mail), la catégorie avec ses champs d'affichage. Les relations sont chargées en lot par Strapi, sans N+1.
- Liste : une requête de page + une requête `count`, en parallèle ; tri (`createdAt`, puis `id` pour un ordre stable), filtres et pagination exécutés par PostgreSQL ; `pageSize` plafonné à 50.
- Compteurs dénormalisés (`replyCount`, `lastActivityAt`) recalculés à chaque réponse, dans une transaction : la liste affiche et filtre (« Sans réponse ») sans compter les réponses à chaque requête.
- Index PostgreSQL ajoutés au démarrage (`src/bootstrap/indexes.ts`) : unicité du slug, `created_at`, `reply_count`, tri des réponses. Les tables de liaison sont indexées par Strapi.

### Données de démonstration

`src/seed/demo-data.json` reprend les espaces, membres, discussions et réponses de la maquette (les sondages deviennent des discussions). `src/seed/seed.ts` les insère au premier démarrage sur une base vide (`SEED_DEMO_DATA=true`), avec des dates de publication échelonnées.

## Architecture frontend (Next.js 16)

```
src/
  app/                       routes (Server Components)
    page.tsx                 accueil : fil, filtres, tri, recherche, pagination
    espaces/[slug]/          fil d'un espace
    discussions/[slug]/      détail + réponses
    nouvelle-discussion/     création (protégée)
    connexion/  recherche/  espaces/
    actions/                 Server Actions (connexion, publication, réponse, meilleure réponse)
    error.tsx  not-found.tsx
  components/                composants réutilisables (carte, fil, avatar, formulaires…)
  lib/
    strapi/client.ts         client HTTP unique et typé, erreurs Strapi -> StrapiError
    strapi/queries.ts        lectures publiques mises en cache ('use cache' + tags)
    strapi/mutations.ts      écritures et lectures privées (jamais en cache)
    session.ts               cookie de session httpOnly, utilisateur courant
    validation.ts            schémas zod des formulaires
    search-params.ts         URL du fil <-> paramètres de l'API
```

**Server ou Client Components.** Tout est rendu côté serveur par défaut : pages, listes, détail, cartes (pas de JavaScript envoyé pour l'affichage, bon référencement). Seuls les éléments interactifs sont des Client Components : formulaires (`DiscussionForm`, `ReplyForm`, `LoginForm`) pour l'état et les erreurs immédiates, bouton « meilleure réponse », champ de recherche (pré-rempli depuis l'URL). Filtres, tri et pagination sont de simples liens : ils fonctionnent sans JavaScript et l'URL est partageable.

**Récupération des données.** Les Server Components appellent Strapi via `lib/strapi` ; l'URL de Strapi et le jeton ne sont jamais exposés au navigateur (`server-only`). Next.js n'accède jamais à PostgreSQL et ne porte aucune règle métier : les Server Actions ne font que relayer les formulaires à Strapi avec le JWT de la session, puis traduire ses réponses pour l'interface.

**Rendu et actualisation** (modèle Cache Components de Next.js 16, activé par défaut) :
- la coque de chaque page (barre du site, en-tête, squelette) est prérendue et s'affiche immédiatement ; le contenu arrive en streaming dans une frontière `<Suspense>` ;
- les lectures publiques sont mises en cache côté serveur avec `'use cache'`, `cacheLife` (60 s pour les discussions, quelques heures pour les espaces) et `cacheTag` (`discussions`, `discussion:<slug>`, `categories`) ; elles sont partagées entre visiteurs car elles ne dépendent pas de la session ;
- après une publication, la Server Action appelle `updateTag(...)` : l'auteur voit immédiatement sa discussion ou sa réponse (lecture de sa propre écriture), et les autres lecteurs au plus tard après l'expiration du cache ;
- les données liées à l'utilisateur (`/users/me`) ne sont jamais mises en cache (mémorisées le temps d'une requête avec `React.cache`) ;
- le build ne dépend pas de Strapi (les données sont lues à la requête).

**États de chargement, d'erreur et d'absence de données.** Squelettes en fallback de `<Suspense>` ; `error.tsx` (API indisponible, bouton « Réessayer ») ; `not-found.tsx` (slug ou espace inconnu) ; états vides dédiés (aucun résultat de recherche, aucune question sans réponse, espace vide) ; boutons désactivés pendant l'envoi ; erreurs de formulaire par champ, reliées au champ (`aria-invalid`, `aria-describedby`).

**Authentification.** `POST /api/auth/local` depuis une Server Action ; le JWT est stocké dans un cookie `httpOnly`, `SameSite=Lax`, `Secure` en production (non lisible par le JavaScript du navigateur). Si Strapi répond 401 (jeton expiré), la session est effacée et l'utilisateur renvoyé vers la connexion, avec retour à la page d'origine (redirection limitée aux chemins internes).

**Intégration de la maquette.** Les jetons de la maquette (couleurs, ombres, rayons, typographies, thème sombre) sont des variables CSS exposées à Tailwind via `@theme` ; quelques classes de composants (`btn`, `card`, `tag`, `tab`…) regroupent les styles répétés dans `globals.css`, le reste est en utilitaires Tailwind. Mise en page fidèle : trois colonnes au-delà de 1180 px, colonne de droite sous le fil entre 760 et 1180 px, une colonne avec pastilles d'espaces et barre de navigation basse en dessous de 760 px. Les pictogrammes reprennent les tracés de la maquette.

## Bibliothèques ajoutées

| Bibliothèque | Pourquoi |
|---|---|
| `pg` (back) | pilote PostgreSQL requis par Strapi |
| `dotenv` (back, dev) | lecture du `.env` par les scripts de test et de remise à zéro |
| `zod` (front) | validation typée des formulaires, partagée entre le client (retour immédiat) et les Server Actions |
| `server-only` (front) | erreur de build si le client Strapi ou la session sont importés dans un composant client |
| `@fontsource/playfair-display`, `@fontsource/inter` (front) | polices de la maquette auto-hébergées : aucun appel à Google Fonts (RGPD, performance) |
| `vitest`, `@playwright/test` (front, dev) | tests unitaires et de bout en bout |

Les tests de l'API utilisent le runner intégré de Node (`node --test`), sans dépendance.

## Limites et évolutions possibles

- **Authentification** : comptes de démonstration Users & Permissions. En production, connexion SSO avec le compte lerevenu.com (provider OAuth/OIDC de Users & Permissions) et inscription désactivée côté API publique.
- **Modération** : signalement, édition/suppression par l'auteur (policy `is-owner` sur `update`/`delete`), limitation du débit de publication (middleware Strapi), filtrage des liens comme prévu dans la maquette.
- **Bonus de la maquette** : votes « Utile » (type `vote` avec unicité utilisateur/cible en base), sondages, profils et badges, notifications, mentions avec autocomplétion.
- **Recherche** : `$containsi` suffit à ce volume ; au-delà, index plein texte PostgreSQL (`tsvector`, configuration `french`) ou moteur dédié.
- **Cache** : sur plusieurs instances Next.js, `'use cache: remote'` (ou un cache partagé) et webhooks Strapi -> `revalidateTag` pour les modifications faites dans le back-office.
