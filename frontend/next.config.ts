import type { NextConfig } from 'next';

const nextConfig: NextConfig = {
  // Modèle de rendu par défaut de Next.js 16 : coque statique prérendue + données en streaming,
  // mise en cache explicite avec la directive 'use cache' (voir src/lib/strapi/queries.ts).
  cacheComponents: true,
  partialPrefetching: true,
  // Image Docker légère (voir frontend/Dockerfile) ; `next start` classique en local.
  output: process.env.NEXT_OUTPUT === 'standalone' ? 'standalone' : undefined,
  poweredByHeader: false,
  agentRules: false,
  turbopack: {
    rules: {
      '*.css': {
        loaders: ['@tailwindcss/turbopack'],
        as: '*.css',
      },
    },
  },
};

export default nextConfig;
