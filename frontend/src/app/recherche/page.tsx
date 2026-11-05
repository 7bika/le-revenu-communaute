import type { Metadata } from 'next';
import { Suspense } from 'react';
import { SearchField } from '@/components/SearchField';

export const metadata: Metadata = { title: 'Rechercher' };

/** Page de recherche mobile : le champ envoie vers l'accueil (?q=…). */
export default function SearchPage() {
  return (
    <div className="mx-auto flex max-w-xl flex-col gap-4 py-8">
      <h1 className="font-display text-[28px] font-bold tracking-[-0.01em]">Rechercher</h1>
      <Suspense>
        <SearchField className="!max-w-none !h-11" autoFocus />
      </Suspense>
    </div>
  );
}
