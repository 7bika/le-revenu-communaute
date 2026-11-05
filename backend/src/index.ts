import type { Core } from '@strapi/strapi';
import { configurePermissions } from './bootstrap/permissions';
import { ensureIndexes } from './bootstrap/indexes';
import { ensureAdmin } from './bootstrap/admin';
import { isSeeded, seedDemoData } from './seed/seed';

export default {
  register() {},

  async bootstrap({ strapi }: { strapi: Core.Strapi }) {
    await configurePermissions(strapi);
    await ensureIndexes(strapi);
    await ensureAdmin(strapi);

    if (process.env.SEED_DEMO_DATA !== 'false' && !(await isSeeded(strapi))) {
      await seedDemoData(strapi);
    }
  },
};
