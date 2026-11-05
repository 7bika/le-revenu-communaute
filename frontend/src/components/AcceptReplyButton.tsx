'use client';

import { acceptReplyAction } from '@/app/actions/discussions';
import { Icon } from './Icon';
import { SubmitButton } from './forms/SubmitButton';

/** Visible uniquement par l'auteur de la question ; Strapi revérifie ce droit (policy). */
export function AcceptReplyButton(target: { discussion: string; slug: string; reply: string }) {
  return (
    <form action={acceptReplyAction.bind(null, target)}>
      <SubmitButton
        pendingLabel="Enregistrement…"
        className="inline-flex h-8 items-center gap-1.5 rounded-lg border border-hairline bg-surface px-[11px] text-[13.5px] font-medium text-ink-2 shadow-[0_1px_2px_rgba(0,0,0,0.05)] hover:bg-ok-soft hover:text-ok"
      >
        <Icon name="check" className="!size-4" />
        Choisir comme meilleure réponse
      </SubmitButton>
    </form>
  );
}
