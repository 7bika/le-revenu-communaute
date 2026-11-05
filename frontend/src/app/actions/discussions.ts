'use server';

import { redirect } from 'next/navigation';
import { updateTag } from 'next/cache';
import { StrapiError } from '@/lib/strapi/client';
import { acceptReply, createDiscussion, createReply } from '@/lib/strapi/mutations';
import { tags } from '@/lib/strapi/tags';
import { clearSession, getToken } from '@/lib/session';
import { discussionSchema, fieldErrorsOf, replySchema } from '@/lib/validation';
import type { FormState } from './types';

/**
 * Server Actions : passerelle entre les formulaires et l'API Strapi.
 * Elles ajoutent le JWT de la session, traduisent les erreurs HTTP de Strapi pour l'interface
 * et invalident le cache des lectures (updateTag) pour que l'auteur voie immédiatement sa publication.
 */

async function requireToken(redirectTo: string) {
  const token = await getToken();
  if (!token) redirect(`/connexion?redirect=${encodeURIComponent(redirectTo)}`);
  return token;
}

async function handleStrapiError(error: unknown, values: Record<string, string>, redirectTo: string): Promise<FormState> {
  if (error instanceof StrapiError) {
    if (error.status === 401) {
      await clearSession();
      redirect(`/connexion?redirect=${encodeURIComponent(redirectTo)}`);
    }
    if (error.status === 400) {
      return { message: error.message, fieldErrors: error.fieldErrors, values };
    }
    return { message: error.message, values };
  }
  throw error;
}

export async function createDiscussionAction(_prev: FormState, formData: FormData): Promise<FormState> {
  const token = await requireToken('/nouvelle-discussion');
  const values = {
    title: String(formData.get('title') ?? ''),
    content: String(formData.get('content') ?? ''),
    type: String(formData.get('type') ?? ''),
    category: String(formData.get('category') ?? ''),
  };

  const parsed = discussionSchema.safeParse(values);
  if (!parsed.success) {
    return { message: 'Le formulaire contient des erreurs.', fieldErrors: fieldErrorsOf(parsed.error), values };
  }

  let slug: string;
  try {
    const discussion = await createDiscussion(token, parsed.data);
    slug = discussion.slug;
  } catch (error) {
    return handleStrapiError(error, values, '/nouvelle-discussion');
  }

  updateTag(tags.discussions);
  redirect(`/discussions/${slug}`);
}

export async function createReplyAction(
  target: { discussion: string; slug: string },
  _prev: FormState,
  formData: FormData
): Promise<FormState> {
  const path = `/discussions/${target.slug}`;
  const token = await requireToken(path);
  const values = { content: String(formData.get('content') ?? '') };

  const parsed = replySchema.safeParse(values);
  if (!parsed.success) return { fieldErrors: fieldErrorsOf(parsed.error), values };

  try {
    await createReply(token, { discussion: target.discussion, content: parsed.data.content });
  } catch (error) {
    return handleStrapiError(error, values, path);
  }

  updateTag(tags.discussions);
  updateTag(tags.discussion(target.slug));
  return { ok: true, message: 'Votre réponse a été publiée.' };
}

export async function acceptReplyAction(target: { discussion: string; slug: string; reply: string }) {
  const path = `/discussions/${target.slug}`;
  const token = await requireToken(path);
  try {
    await acceptReply(token, target.discussion, target.reply);
  } catch (error) {
    if (error instanceof StrapiError && error.status === 401) {
      await clearSession();
      redirect(`/connexion?redirect=${encodeURIComponent(path)}`);
    }
    throw error;
  }
  updateTag(tags.discussions);
  updateTag(tags.discussion(target.slug));
}
