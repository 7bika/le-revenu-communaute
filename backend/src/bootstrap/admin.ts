/**
 * Compte administrateur du back-office créé au premier démarrage si ADMIN_EMAIL et
 * ADMIN_PASSWORD sont définis (pratique avec Docker). Sinon, Strapi propose de le créer
 * sur http://localhost:1337/admin.
 */
import type { Core } from '@strapi/strapi';

export async function ensureAdmin(strapi: Core.Strapi) {
  const email = process.env.ADMIN_EMAIL;
  const password = process.env.ADMIN_PASSWORD;
  if (!email || !password) return;

  const users = strapi.service('admin::user') as any;
  if (await users.exists()) return;

  try {
    await users.createFirstAdmin({
      email,
      password,
      firstname: process.env.ADMIN_FIRSTNAME || 'Admin',
      lastname: process.env.ADMIN_LASTNAME || 'Le Revenu',
    });
    strapi.log.info(`[admin] compte administrateur ${email} créé`);
  } catch (error) {
    strapi.log.warn(`[admin] création impossible : ${(error as Error).message}`);
  }
}
