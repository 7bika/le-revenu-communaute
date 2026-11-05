/**
 * Empêche de publier au nom d'un autre membre.
 * Si le corps de la requête contient un champ « author », il doit désigner l'utilisateur
 * authentifié (id numérique ou documentId, sous forme simple ou { id } / { documentId }).
 * Toute autre valeur (autre membre, connect/set, tableau…) est refusée avec un 403.
 * Dans tous les cas, le service fixe ensuite l'auteur à partir du jeton.
 */
import type { PolicyContext } from '../types/policy';
import { errors } from '@strapi/utils';

const designatesUser = (value: unknown, user: { id: number; documentId: string }): boolean => {
  if (typeof value === 'number' || typeof value === 'string') {
    return String(value) === String(user.id) || value === user.documentId;
  }
  if (value && typeof value === 'object' && !Array.isArray(value)) {
    const keys = Object.keys(value);
    if (keys.length !== 1) return false;
    const v = value as { id?: unknown; documentId?: unknown };
    if ('id' in v) return String(v.id) === String(user.id);
    if ('documentId' in v) return v.documentId === user.documentId;
  }
  return false;
};

const preventAuthorSpoofing = (policyContext: PolicyContext) => {
  const user = policyContext.state.user;
  if (!user) return false;

  const data = (policyContext.request as any)?.body?.data;
  if (data && typeof data === 'object' && 'author' in data && !designatesUser(data.author, user)) {
    throw new errors.PolicyError('Vous ne pouvez pas publier au nom d’un autre membre.', {
      policy: 'prevent-author-spoofing',
    });
  }
  return true;
};

export default preventAuthorSpoofing;
