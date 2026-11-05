'use server';

import { redirect } from 'next/navigation';
import { StrapiError } from '@/lib/strapi/client';
import { login } from '@/lib/strapi/mutations';
import { clearSession, setSession } from '@/lib/session';
import { fieldErrorsOf, loginSchema, safeRedirect } from '@/lib/validation';
import type { FormState } from './types';

export async function loginAction(_prev: FormState, formData: FormData): Promise<FormState> {
  const values = {
    identifier: String(formData.get('identifier') ?? ''),
    password: String(formData.get('password') ?? ''),
  };
  const parsed = loginSchema.safeParse(values);
  if (!parsed.success) {
    return { fieldErrors: fieldErrorsOf(parsed.error), values: { identifier: values.identifier } };
  }

  try {
    const { jwt } = await login(parsed.data.identifier, parsed.data.password);
    await setSession(jwt);
  } catch (error) {
    const message =
      error instanceof StrapiError && error.status === 400
        ? 'Adresse e-mail ou mot de passe incorrect.'
        : error instanceof StrapiError && error.status === 429
          ? 'Trop de tentatives. Réessayez dans une minute.'
          : 'La connexion est momentanément impossible. Réessayez plus tard.';
    return { message, values: { identifier: values.identifier } };
  }

  redirect(safeRedirect(formData.get('redirect')));
}

export async function logoutAction() {
  await clearSession();
  redirect('/');
}
