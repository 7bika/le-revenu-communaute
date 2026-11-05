/**
 * Défense en profondeur : même si le rôle Public recevait par erreur la permission « create »
 * dans le back-office, une écriture sans utilisateur authentifié reste refusée (401).
 */
import type { PolicyContext } from '../types/policy';
import { errors } from '@strapi/utils';

const isAuthenticated = (policyContext: PolicyContext) => {
  if (!policyContext.state.user) {
    throw new errors.UnauthorizedError('Vous devez être connecté pour publier.');
  }
  return true;
};

export default isAuthenticated;
