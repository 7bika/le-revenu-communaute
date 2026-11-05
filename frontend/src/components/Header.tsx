import Link from 'next/link';
import { Suspense } from 'react';
import { HeaderActions } from './HeaderActions';
import { Icon } from './Icon';
import { SearchField } from './SearchField';

export function Logo() {
  return (
    <span className="lr-logo" aria-hidden="true">
      <span className="lr-le">LE</span>
      <span>REVENU</span>
    </span>
  );
}

/**
 * En-tête : la partie statique (logo, recherche) fait partie de la coque prérendue ;
 * la zone de compte dépend du cookie de session et arrive en streaming (Suspense).
 */
export function Header() {
  return (
    <header className="sticky top-0 z-40 border-b border-hairline bg-glass backdrop-blur-[20px] backdrop-saturate-[1.8]">
      <div className="mx-auto flex h-[62px] max-w-[1260px] items-center gap-5 px-4">
        <Link href="/" className="flex flex-none items-center gap-2.5 max-md:flex-col max-md:items-start max-md:gap-1" aria-label="Le Revenu, accueil de la communauté">
          <Logo />
          <span className="h-5 w-px bg-line-strong max-md:hidden" />
          <span className="text-[15px] font-semibold text-ink-2 max-md:text-xs">Communauté</span>
        </Link>
        <Suspense fallback={<SearchFieldFallback />}>
          <SearchField />
        </Suspense>
        <div className="ml-auto flex items-center gap-2.5">
          <Link href="/recherche" className="inline-grid size-9 place-items-center rounded-[9px] text-ink-2 hover:bg-fill hover:text-ink min-[861px]:hidden" aria-label="Rechercher">
            <Icon name="search" />
          </Link>
          <Suspense fallback={<div className="h-9 w-40 max-md:w-24" aria-hidden="true" />}>
            <HeaderActions />
          </Suspense>
        </div>
      </div>
    </header>
  );
}

function SearchFieldFallback() {
  return <div className="h-9 max-w-[420px] flex-1 rounded-[10px] bg-fill max-[860px]:hidden" aria-hidden="true" />;
}
