/**
 * Seul l'auteur d'une discussion peut désigner sa meilleure réponse.
 */
import type { Core } from '@strapi/strapi';
import type { PolicyContext } from '../../../types/policy';
import { errors } from '@strapi/utils';
import { DISCUSSION_UID } from '../../../utils/constants';

const { NotFoundError, PolicyError } = errors;

const isDiscussionAuthor = async (policyContext: PolicyContext, _config: unknown, { strapi }: { strapi: Core.Strapi }) => {
  const user = policyContext.state.user;
  const documentId = policyContext.params?.id;
  if (!user || !documentId) return false;

  const discussion = await strapi.documents(DISCUSSION_UID).findOne({
    documentId,
    fields: ['title'],
    populate: { author: { fields: ['username'] } },
  });
  if (!discussion) throw new NotFoundError('Discussion introuvable.');

  if ((discussion as any).author?.documentId !== user.documentId) {
    throw new PolicyError('Seul l’auteur de la discussion peut choisir la meilleure réponse.', {
      policy: 'is-discussion-author',
    });
  }
  return true;
};

export default isDiscussionAuthor;
