/**
 * Démarre une instance Strapi réelle sur une base PostgreSQL de test vidée à chaque exécution,
 * avec le seed de démonstration. Les tests appellent ensuite l'API REST comme un vrai client.
 */
import { createRequire } from 'node:module';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const require = createRequire(import.meta.url);
const appDir = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '../..');

process.env.NODE_ENV = 'test';
process.env.DATABASE_NAME = process.env.TEST_DATABASE_NAME || 'lerevenu_test';
process.env.PORT = process.env.TEST_PORT || '1338';
process.env.SEED_DEMO_DATA = 'true';
process.env.DEMO_USER_PASSWORD = 'Demo1234!';

export const BASE_URL = `http://127.0.0.1:${process.env.PORT}/api`;

async function resetDatabase() {
  require('dotenv').config({ path: path.join(appDir, '.env') });
  const { Client } = require('pg');
  const client = new Client({
    host: process.env.DATABASE_HOST || 'localhost',
    port: Number(process.env.DATABASE_PORT || 5432),
    user: process.env.DATABASE_USERNAME || 'strapi',
    password: process.env.DATABASE_PASSWORD || 'strapi',
    database: process.env.DATABASE_NAME,
  });
  await client.connect();
  await client.query('DROP SCHEMA IF EXISTS public CASCADE; CREATE SCHEMA public;');
  await client.end();
}

let instance;

export async function startStrapi() {
  if (instance) return instance;
  await resetDatabase();
  const { createStrapi, compileStrapi } = require('@strapi/strapi');
  const appContext = await compileStrapi({ appDir });
  instance = createStrapi({ ...appContext, autoReload: false, serveAdminPanel: false });
  instance.log.level = 'error';
  await instance.start();
  return instance;
}

export async function stopStrapi() {
  if (!instance) return;
  await instance.destroy();
  instance = undefined;
}

/** Petit client HTTP de test. */
export async function api(pathname, { method = 'GET', token, body } = {}) {
  const res = await fetch(`${BASE_URL}${pathname}`, {
    method,
    headers: {
      ...(body !== undefined ? { 'Content-Type': 'application/json' } : {}),
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: body !== undefined ? JSON.stringify(body) : undefined,
  });
  const json = await res.json().catch(() => null);
  return { status: res.status, body: json };
}

export async function login(username) {
  const identifier = `${username.toLowerCase().replace(/[^a-z0-9]+/g, '.')}@demo.lerevenu.fr`;
  const { status, body } = await api('/auth/local', { method: 'POST', body: { identifier, password: 'Demo1234!' } });
  if (status !== 200) throw new Error(`Connexion impossible pour ${username} (${status})`);
  return { token: body.jwt, user: body.user };
}
