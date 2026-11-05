'use client';

import { useActionState, useState } from 'react';
import { createReplyAction } from '@/app/actions/discussions';
import { initialFormState } from '@/app/actions/types';
import { fieldErrorsOf, replySchema } from '@/lib/validation';
import type { SessionUser } from '@/lib/types';
import { Avatar } from './Avatar';
import { FieldError, FormAlert } from './forms/FieldError';
import { SubmitButton } from './forms/SubmitButton';

/**
 * Formulaire de réponse (Client Component : état du formulaire et retour immédiat).
 * L'envoi passe par une Server Action qui transmet la réponse à Strapi avec le JWT de session.
 */
export function ReplyForm({
  discussion,
  slug,
  user,
  placeholder,
}: {
  discussion: string;
  slug: string;
  user: SessionUser;
  placeholder: string;
}) {
  const [state, formAction] = useActionState(createReplyAction.bind(null, { discussion, slug }), initialFormState);
  const [clientError, setClientError] = useState<string>();
  const error = clientError ?? state.fieldErrors?.content;

  return (
    <form
      action={formAction}
      onSubmit={(e) => {
        const parsed = replySchema.safeParse({ content: new FormData(e.currentTarget).get('content') });
        if (!parsed.success) {
          e.preventDefault();
          setClientError(fieldErrorsOf(parsed.error).content);
        } else {
          setClientError(undefined);
        }
      }}
      className="flex flex-col gap-2.5 rounded-card border border-hairline bg-surface px-5 py-4 shadow-card max-md:p-4"
      noValidate
      aria-label="Répondre à la discussion"
    >
      <div className="flex items-center gap-[11px]">
        <Avatar user={user} size="sm" />
        <span className="text-[12.5px] text-ink-3">
          Répondre en tant que <b className="text-ink">{user.displayName || user.username}</b>
        </span>
      </div>
      <label htmlFor="reply-content" className="sr-only">
        Votre réponse
      </label>
      <textarea
        id="reply-content"
        name="content"
        rows={4}
        maxLength={5000}
        defaultValue={state.ok ? '' : (state.values?.content ?? '')}
        placeholder={placeholder}
        aria-invalid={Boolean(error)}
        aria-describedby={error ? 'reply-content-error' : undefined}
        onChange={() => clientError && setClientError(undefined)}
        className="input min-h-[110px]"
      />
      <FieldError id="reply-content-error" message={error} />
      {state.message && !state.fieldErrors && <FormAlert message={state.message} tone={state.ok ? 'success' : 'error'} />}
      <div className="flex flex-wrap items-center justify-between gap-2.5">
        <span className="hint">**gras**, « - » pour une liste, @pseudo pour mentionner</span>
        <SubmitButton pendingLabel="Publication…">Publier ma réponse</SubmitButton>
      </div>
    </form>
  );
}
