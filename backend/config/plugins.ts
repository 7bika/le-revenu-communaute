import type { Core } from '@strapi/strapi';

const config = ({ env }: Core.Config.Shared.ConfigParams): Core.Config.Plugin => ({
  'users-permissions': {
    config: {
      // JWT "classique" du plugin : le front Next.js le conserve dans un cookie httpOnly
      // et le transmet à Strapi dans l'en-tête Authorization.
      jwtManagement: 'legacy-support',
      jwt: { expiresIn: env('JWT_EXPIRES_IN', '7d') },
      register: {
        // Champs que l'inscription publique peut renseigner (le reste est réservé au back-office).
        allowedFields: ['displayName'],
      },
      ratelimit: { interval: 60000, max: env.int('AUTH_RATELIMIT_MAX', 30) },
    },
  },
});

export default config;
