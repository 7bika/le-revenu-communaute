import type { ReactNode } from 'react';
import { SideNav } from './SideNav';
import type { Category } from '@/lib/types';

/**
 * Mise en page « forum » de la maquette : espaces | fil | colonne d'accompagnement.
 * < 1180 px : la colonne de droite passe sous le fil ; < 760 px : une seule colonne.
 */
export function CommunityLayout({
  categories,
  active,
  children,
  aside,
}: {
  categories: Category[];
  active?: string;
  children: ReactNode;
  aside?: ReactNode;
}) {
  return (
    <div className="grid grid-cols-1 items-start gap-7 pt-4 pb-[100px] md:grid-cols-[200px_minmax(0,1fr)] md:pt-6 md:pb-24 lg:grid-cols-[212px_minmax(0,1fr)_304px]">
      <SideNav categories={categories} active={active} />
      <main id="contenu" className="flex min-w-0 flex-col gap-[18px]">
        {children}
      </main>
      {aside && <aside className="flex min-w-0 flex-col gap-[18px] md:col-start-2 lg:col-start-3 lg:row-start-1">{aside}</aside>}
    </div>
  );
}
