import 'server-only';
import { cache } from 'react';
import { cookies } from 'next/headers';
import { StrapiError } from './strapi/client';
import { fetchMe } from './strapi/mutations';
import type { SessionUser } from './types';

/**
 * Session : le JWT émis par Strapi (Users & Permissions) est stocké dans un cookie httpOnly,
 * illisible par le JavaScript du navigateur. Next.js le relaie à Strapi dans l'en-tête
 * Authorization lors des Server Actions. Next.js ne prend aucune décision d'autorisation :
 * c'est Strapi qui vérifie le jeton, les permissions du rôle et les policies.
 */
export const SESSION_COOKIE = 'lr_session';
const MAX_AGE = 60 * 60 * 24 * 7; // aligné sur JWT_EXPIRES_IN (7 jours) côté Strapi

export async function getToken(): Promise<string | null> {
  return (await cookies()).get(SESSION_COOKIE)?.value ?? null;
}

export async function setSession(token: string) {
  (await cookies()).set(SESSION_COOKIE, token, {
    httpOnly: true,
    sameSite: 'lax',
    secure: process.env.NODE_ENV === 'production' && process.env.COOKIE_SECURE !== 'false',
    path: '/',
    maxAge: MAX_AGE,
  });
}

export async function clearSession() {
  (await cookies()).delete(SESSION_COOKIE);
}

/** Utilisateur courant, mémorisé le temps d'une requête (React cache), jamais partagé. */
export const getCurrentUser = cache(async (): Promise<SessionUser | null> => {
  const token = await getToken();
  if (!token) return null;
  try {
    return await fetchMe(token);
  } catch (error) {
    if (error instanceof StrapiError && [401, 403, 503].includes(error.status)) return null;
    throw error;
  }
});
