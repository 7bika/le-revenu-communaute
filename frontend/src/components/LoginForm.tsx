'use client';

import { useActionState } from 'react';
import { loginAction } from '@/app/actions/auth';
import { initialFormState } from '@/app/actions/types';
import { FieldError, FormAlert } from './forms/FieldError';
import { SubmitButton } from './forms/SubmitButton';

export function LoginForm({ redirectTo }: { redirectTo: string }) {
  const [state, formAction] = useActionState(loginAction, initialFormState);
  const errors = state.fieldErrors ?? {};
  return (
    <form action={formAction} className="flex flex-col gap-4" noValidate>
      <input type="hidden" name="redirect" value={redirectTo} />
      <FormAlert message={state.message} />
      <div className="flex flex-col gap-1.5">
        <label htmlFor="identifier" className="field-label">
          Adresse e-mail
        </label>
        <input
          id="identifier"
          name="identifier"
          type="email"
          autoComplete="username"
          className="input"
          defaultValue={state.values?.identifier}
          aria-invalid={Boolean(errors.identifier)}
          aria-describedby={errors.identifier ? 'identifier-error' : undefined}
          required
        />
        <FieldError id="identifier-error" message={errors.identifier} />
      </div>
      <div className="flex flex-col gap-1.5">
        <label htmlFor="password" className="field-label">
          Mot de passe
        </label>
        <input
          id="password"
          name="password"
          type="password"
          autoComplete="current-password"
          className="input"
          aria-invalid={Boolean(errors.password)}
          aria-describedby={errors.password ? 'password-error' : undefined}
          required
        />
        <FieldError id="password-error" message={errors.password} />
      </div>
      <SubmitButton pendingLabel="Connexion…" className="btn btn-primary w-full">
        Se connecter
      </SubmitButton>
    </form>
  );
}
