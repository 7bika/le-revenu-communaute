/**
 * Données de démonstration (reprises de la maquette) : espaces, membres, discussions et réponses.
 * Exécuté au démarrage quand la base ne contient encore aucun espace (SEED_DEMO_DATA=true),
 * ou à la demande avec `npm run seed` (voir scripts/seed.js).
 */
import type { Core } from '@strapi/strapi';
import demo from './demo-data.json';
import { CATEGORY_UID, DISCUSSION_UID, REPLY_UID, USER_UID } from '../utils/constants';
import { slugify } from '../utils/slugify';

const minutesAgo = (min: number) => new Date(Date.now() - min * 60_000);

export const demoEmail = (username: string) =>
  `${username.toLowerCase().replace(/[^a-z0-9]+/g, '.')}@demo.lerevenu.fr`;

export async function isSeeded(strapi: Core.Strapi) {
  return (await strapi.documents(CATEGORY_UID).count({})) > 0;
}

/** Fixe les dates de création (le Document Service les gère seul, on passe par le Query Engine). */
async function backdate(strapi: Core.Strapi, uid: string, documentId: string, date: Date, extra = {}) {
  await strapi.db
    .query(uid as any)
    .updateMany({ where: { documentId }, data: { createdAt: date, updatedAt: date, publishedAt: date, ...extra } });
}

export async function seedDemoData(strapi: Core.Strapi) {
  const password = process.env.DEMO_USER_PASSWORD || 'Demo1234!';
  const role = await strapi.db.query('plugin::users-permissions.role').findOne({ where: { type: 'authenticated' } });

  strapi.log.info('[seed] création des données de démonstration…');

  // Espaces
  const categories = new Map<string, string>();
  for (const c of demo.categories) {
    const doc = await strapi.documents(CATEGORY_UID).create({ data: c as any });
    categories.set(c.slug, doc.documentId);
  }

  // Membres (mot de passe haché par le Document Service)
  const users = new Map<string, string>();
  for (const u of demo.users) {
    const existing = await strapi.db.query(USER_UID).findOne({ where: { username: u.username } });
    const doc =
      existing ??
      (await strapi.documents(USER_UID).create({
        data: {
          ...u,
          email: demoEmail(u.username),
          password,
          provider: 'local',
          confirmed: true,
          blocked: false,
          role: role?.id,
        } as any,
      }));
    users.set(u.username, doc.documentId);
  }

  // Discussions et réponses
  const usedSlugs = new Set<string>();
  for (const d of demo.discussions) {
    let slug = slugify(d.title);
    for (let n = 2; usedSlugs.has(slug); n += 1) slug = `${slugify(d.title)}-${n}`;
    usedSlugs.add(slug);

    const createdAt = minutesAgo(d.minutesAgo);
    const discussion = await strapi.documents(DISCUSSION_UID).create({
      data: {
        title: d.title,
        slug,
        content: d.content,
        type: d.type,
        category: categories.get(d.category),
        author: users.get(d.author),
        replyCount: d.replies.length,
        isSolved: d.replies.some((r) => r.isAccepted),
      } as any,
    });

    let lastActivity = createdAt;
    for (const r of d.replies) {
      const reply = await strapi.documents(REPLY_UID).create({
        data: {
          content: r.content,
          isAccepted: r.isAccepted,
          discussion: discussion.documentId,
          author: users.get(r.author),
        } as any,
      });
      const replyDate = minutesAgo(r.minutesAgo);
      if (replyDate > lastActivity) lastActivity = replyDate;
      await backdate(strapi, REPLY_UID, reply.documentId, replyDate);
    }
    await backdate(strapi, DISCUSSION_UID, discussion.documentId, createdAt, { lastActivityAt: lastActivity });
  }

  strapi.log.info(
    `[seed] ${demo.categories.length} espaces, ${demo.users.length} membres, ${demo.discussions.length} discussions créés`
  );
}
