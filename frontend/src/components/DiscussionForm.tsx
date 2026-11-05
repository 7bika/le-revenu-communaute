'use client';

import { useActionState, useState } from 'react';
import { createDiscussionAction } from '@/app/actions/discussions';
import { initialFormState } from '@/app/actions/types';
import { discussionSchema, fieldErrorsOf } from '@/lib/validation';
import type { Category, DiscussionType } from '@/lib/types';
import { Icon } from './Icon';
import { FieldError, FormAlert } from './forms/FieldError';
import { SubmitButton } from './forms/SubmitButton';

const TYPES: { value: DiscussionType; icon: string; label: string; hint: string }[] = [
  { value: 'question', icon: 'help', label: 'Poser une question', hint: 'Obtenez l’aide des membres et de la rédaction' },
  { value: 'discussion', icon: 'msg', label: 'Lancer une discussion', hint: 'Partagez une expérience, un avis, une actualité' },
];

const PLACEHOLDERS: Record<DiscussionType, string> = {
  question: 'Ex. : Faut-il ouvrir un PER à 45 ans ?',
  discussion: 'Ex. : Mon retour d’expérience sur la renégociation de mon crédit',
};

/**
 * Formulaire de création (Client Component) : retour immédiat sur les erreurs de saisie,
 * puis Server Action -> Strapi, qui applique ses propres validations métier.
 * Après création, la Server Action redirige vers la nouvelle discussion.
 */
export function DiscussionForm({
  categories,
  defaults,
}: {
  categories: Category[];
  defaults: { type: DiscussionType; category: string };
}) {
  const [state, formAction] = useActionState(createDiscussionAction, initialFormState);
  const [clientErrors, setClientErrors] = useState<Record<string, string> | null>(null);
  const [type, setType] = useState<DiscussionType>((state.values?.type as DiscussionType) || defaults.type);
  const [titleLength, setTitleLength] = useState((state.values?.title ?? '').trim().length);

  const errors = clientErrors ?? state.fieldErrors ?? {};
  const v = state.values;
  const clear = (field: string) => {
    if (clientErrors?.[field]) setClientErrors({ ...clientErrors, [field]: '' });
  };
  const describedBy = (field: string, hint?: string) =>
    [errors[field] ? `${field}-error` : null, hint].filter(Boolean).join(' ') || undefined;

  return (
    <form
      action={formAction}
      noValidate
      onSubmit={(e) => {
        const data = Object.fromEntries(new FormData(e.currentTarget));
        const parsed = discussionSchema.safeParse(data);
        if (!parsed.success) {
          e.preventDefault();
          setClientErrors(fieldErrorsOf(parsed.error));
          const first = e.currentTarget.querySelector<HTMLElement>(`[name="${String(parsed.error.issues[0]?.path[0] ?? "")}"]`);
          first?.focus();
        } else {
          setClientErrors(null);
        }
      }}
      className="overflow-hidden rounded-2xl border border-hairline bg-surface shadow-card"
    >
      <div className="flex flex-col gap-4 px-[22px] pt-[18px] pb-[22px] max-md:px-4">
        <FormAlert message={!clientErrors && state.message ? state.message : undefined} />

        <fieldset>
          <legend className="field-label mb-1.5">Type de publication</legend>
          <div className="grid grid-cols-2 gap-2.5 max-md:grid-cols-1" role="radiogroup">
            {TYPES.map((t) => (
              <label
                key={t.value}
                className="relative flex cursor-pointer flex-col gap-1 rounded-xl border-[1.5px] border-line px-3 py-3.5 hover:border-line-strong has-checked:border-brand has-checked:bg-brand-soft has-focus-visible:outline-2 has-focus-visible:outline-offset-2 has-focus-visible:outline-brand max-md:flex-row max-md:items-center max-md:gap-2.5 max-md:py-[11px]"
              >
                <input
                  type="radio"
                  name="type"
                  value={t.value}
                  defaultChecked={(v?.type || defaults.type) === t.value}
                  onChange={() => {
                    setType(t.value);
                    clear('type');
                  }}
                  className="pointer-events-none absolute opacity-0"
                />
                <Icon name={t.icon} className="mb-1 !size-[22px] text-brand-text max-md:mb-0" />
                <b className="text-[14.5px]">{t.label}</b>
                <small className="text-[12.5px] leading-[1.35] text-ink-3 max-md:hidden">{t.hint}</small>
              </label>
            ))}
          </div>
          <FieldError id="type-error" message={errors.type} />
        </fieldset>

        <div className="flex flex-col gap-1.5">
          <label htmlFor="title" className="field-label">
            Titre
          </label>
          <input
            id="title"
            name="title"
            className="input"
            maxLength={150}
            autoComplete="off"
            defaultValue={v?.title}
            placeholder={PLACEHOLDERS[type]}
            aria-invalid={Boolean(errors.title)}
            aria-describedby={describedBy('title', 'title-hint')}
            onChange={(e) => {
              setTitleLength(e.target.value.trim().length);
              clear('title');
            }}
          />
          <FieldError id="title-error" message={errors.title} />
          <span id="title-hint" className="hint">
            {titleLength < 10
              ? `Au moins 10 caractères (${titleLength}/10). Un titre clair, formulé comme une question, obtient plus vite des réponses.`
              : `${titleLength}/150 caractères`}
          </span>
        </div>

        <div className="flex flex-col gap-1.5">
          <label htmlFor="category" className="field-label">
            Espace
          </label>
          <select
            id="category"
            name="category"
            className="input"
            defaultValue={v?.category ?? defaults.category}
            aria-invalid={Boolean(errors.category)}
            aria-describedby={describedBy('category')}
            onChange={() => clear('category')}
          >
            <option value="">Choisissez un espace…</option>
            {categories.map((c) => (
              <option key={c.documentId} value={c.documentId}>
                {c.name}
              </option>
            ))}
          </select>
          <FieldError id="category-error" message={errors.category} />
        </div>

        <div className="flex flex-col gap-1.5">
          <label htmlFor="content" className="field-label">
            Détails
          </label>
          <textarea
            id="content"
            name="content"
            rows={7}
            maxLength={10000}
            className="input"
            defaultValue={v?.content}
            placeholder="Votre situation, ce que vous avez déjà envisagé… Plus le contexte est précis, meilleures sont les réponses."
            aria-invalid={Boolean(errors.content)}
            aria-describedby={describedBy('content', 'content-hint')}
            onChange={() => clear('content')}
          />
          <FieldError id="content-error" message={errors.content} />
          <span id="content-hint" className="hint">
            **gras**, « - » en début de ligne pour une liste, @pseudo pour mentionner un membre
          </span>
        </div>

        <p className="flex items-start gap-2.5 rounded-sm bg-surface-2 px-3 py-2.5 text-[13px] text-ink-2">
          <Icon name="shield" className="mt-px !size-4 text-ink-3" />
          Partagez votre expérience : pas de conseil personnalisé ni de sollicitation.
        </p>
      </div>
      <div className="flex flex-wrap items-center justify-between gap-2.5 border-t border-hairline px-[22px] py-3.5 max-md:px-4">
        <span className="hint">Votre publication est visible immédiatement par tous les lecteurs.</span>
        <SubmitButton pendingLabel="Publication…">Publier</SubmitButton>
      </div>
    </form>
  );
}
