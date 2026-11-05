/**
 * Vide la base PostgreSQL configurée dans .env (schéma public).
 * Au prochain démarrage, Strapi recrée les tables puis le seed de démonstration.
 *   npm run seed:reset && npm run develop
 */
import { createRequire } from 'node:module';
const require = createRequire(import.meta.url);
require('dotenv').config();
const { Client } = require('pg');

const client = new Client({
  host: process.env.DATABASE_HOST || 'localhost',
  port: Number(process.env.DATABASE_PORT || 5432),
  user: process.env.DATABASE_USERNAME || 'strapi',
  password: process.env.DATABASE_PASSWORD || 'strapi',
  database: process.env.DATABASE_NAME || 'lerevenu',
});

await client.connect();
await client.query('DROP SCHEMA IF EXISTS public CASCADE; CREATE SCHEMA public;');
await client.end();
console.log(`Base « ${client.database} » vidée : relancez Strapi pour recréer les données de démonstration.`);
