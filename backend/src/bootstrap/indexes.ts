/**
 * Index PostgreSQL complémentaires, adaptés aux requêtes de la communauté :
 *  - tri des listes par date de publication ;
 *  - filtre « sans réponse » ;
 *  - unicité et recherche rapide par slug (URL des discussions).
 * Les tables de liaison des relations sont déjà indexées par Strapi.
 * Créés après la synchronisation du schéma, de façon idempotente (IF NOT EXISTS).
 */
import type { Core } from '@strapi/strapi';

const STATEMENTS = [
  'CREATE UNIQUE INDEX IF NOT EXISTS discussions_slug_uniq ON discussions (slug)',
  'CREATE INDEX IF NOT EXISTS discussions_created_at_idx ON discussions (created_at DESC, id DESC)',
  'CREATE INDEX IF NOT EXISTS discussions_reply_count_idx ON discussions (reply_count)',
  'CREATE INDEX IF NOT EXISTS replies_created_at_idx ON replies (created_at, id)',
  'CREATE UNIQUE INDEX IF NOT EXISTS categories_slug_uniq ON categories (slug)',
];

export async function ensureIndexes(strapi: Core.Strapi) {
  if (strapi.db.dialect.client !== 'postgres') return;
  for (const sql of STATEMENTS) {
    try {
      await strapi.db.connection.raw(sql);
    } catch (error) {
      strapi.log.warn(`[indexes] ${sql} : ${(error as Error).message}`);
    }
  }
}
