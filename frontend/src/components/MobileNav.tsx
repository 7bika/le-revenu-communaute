import Link from 'next/link';
import { Icon } from './Icon';

/** Barre basse mobile (< 760 px) avec le bouton central de publication. */
export function MobileNav() {
  const item = 'flex min-w-14 flex-col items-center gap-0.5 px-2 py-1 text-[11px] text-ink-3';
  return (
    <nav
      className="fixed inset-x-0 bottom-0 z-45 flex items-center justify-around border-t border-hairline bg-glass px-2 pt-1.5 pb-[calc(6px+env(safe-area-inset-bottom,0px))] backdrop-blur-[20px] md:hidden"
      aria-label="Navigation mobile"
    >
      <Link href="/" className={item}>
        <Icon name="home" />
        Accueil
      </Link>
      <Link href="/espaces" className={item}>
        <Icon name="grid" />
        Espaces
      </Link>
      <Link href="/nouvelle-discussion" aria-label="Publier" className="-mt-[18px] grid size-12 place-items-center rounded-full text-brand-ink btn-primary">
        <Icon name="plus" className="!size-6" />
      </Link>
      <Link href="/recherche" className={item}>
        <Icon name="search" />
        Recherche
      </Link>
      <Link href="/connexion" className={item}>
        <Icon name="user" />
        Compte
      </Link>
    </nav>
  );
}
