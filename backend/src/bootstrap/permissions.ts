/**
 * Permissions Users & Permissions configurées par le code (idempotent à chaque démarrage),
 * pour qu'une installation neuve soit immédiatement fonctionnelle et sûre.
 *  - Public : lecture seule.
 *  - Authenticated : lecture + publication de discussions et de réponses.
 * Les droits d'écriture accidentellement accordés au rôle Public sont retirés.
 */
import type { Core } from '@strapi/strapi';

const READ = [
  'api::category.category.find',
  'api::category.category.findOne',
  'api::discussion.discussion.find',
  'api::discussion.discussion.findOne',
  'api::discussion.discussion.findBySlug',
  'api::reply.reply.find',
];

const WRITE = [
  'api::discussion.discussion.create',
  'api::discussion.discussion.acceptReply',
  'api::reply.reply.create',
];

export const ROLE_PERMISSIONS: Record<'public' | 'authenticated', { grant: string[]; revoke: string[] }> = {
  public: { grant: READ, revoke: WRITE },
  authenticated: { grant: [...READ, ...WRITE, 'plugin::users-permissions.user.me'], revoke: [] },
};

const PERMISSION_UID = 'plugin::users-permissions.permission';
const ROLE_UID = 'plugin::users-permissions.role';

export async function configurePermissions(strapi: Core.Strapi) {
  for (const [type, { grant, revoke }] of Object.entries(ROLE_PERMISSIONS)) {
    const role = await strapi.db.query(ROLE_UID).findOne({ where: { type } });
    if (!role) {
      strapi.log.warn(`[permissions] rôle « ${type} » introuvable`);
      continue;
    }

    const existing = await strapi.db.query(PERMISSION_UID).findMany({
      where: { role: role.id, action: { $in: [...grant, ...revoke] } },
    });
    const existingActions = new Set(existing.map((p: any) => p.action));

    for (const action of grant) {
      if (!existingActions.has(action)) {
        await strapi.db.query(PERMISSION_UID).create({ data: { action, role: role.id } });
      }
    }

    const toRevoke = existing.filter((p: any) => revoke.includes(p.action));
    for (const permission of toRevoke) {
      await strapi.db.query(PERMISSION_UID).delete({ where: { id: permission.id } });
      strapi.log.warn(`[permissions] droit « ${permission.action} » retiré du rôle ${type}`);
    }
  }
}
