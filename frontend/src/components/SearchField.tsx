'use client';

import { useSearchParams } from 'next/navigation';
import { Icon } from './Icon';

/**
 * Recherche : simple formulaire GET vers l'accueil (fonctionne sans JavaScript).
 * Composant client uniquement pour pré-remplir le champ avec la recherche en cours.
 */
export function SearchField({ className = 'max-[860px]:hidden', autoFocus = false }: { className?: string; autoFocus?: boolean }) {
  const q = useSearchParams().get('q') ?? '';
  return (
    <form
      action="/"
      role="search"
      className={`flex h-9 max-w-[420px] flex-1 items-center gap-2 rounded-[10px] border border-transparent bg-fill px-3 text-sm text-ink-3 transition-[background,box-shadow] focus-within:border-brand focus-within:bg-surface focus-within:shadow-[0_0_0_3px_color-mix(in_srgb,var(--brand)_25%,transparent)] ${className}`}
    >
      <Icon name="search" />
      <label htmlFor={autoFocus ? 'q-page' : 'q'} className="sr-only">
        Rechercher une discussion
      </label>
      <input
        key={q}
        id={autoFocus ? 'q-page' : 'q'}
        name="q"
        type="search"
        defaultValue={q}
        maxLength={100}
        placeholder="Rechercher une discussion, un sujet…"
        autoComplete="off"
        autoFocus={autoFocus}
        className="h-full min-w-0 flex-1 bg-transparent text-ink outline-none placeholder:text-ink-3"
      />
    </form>
  );
}
