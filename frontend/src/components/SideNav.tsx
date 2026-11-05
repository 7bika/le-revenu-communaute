import Link from 'next/link';
import { CategoryIcon } from './CategoryBadges';
import { Icon } from './Icon';
import type { Category } from '@/lib/types';

const SITE = 'https://www.lerevenu.com';

const linkClass =
  'flex items-center gap-[11px] rounded-sm px-2.5 py-[7px] text-sm font-medium text-ink-2 hover:bg-fill hover:text-ink aria-[current=page]:bg-fill-2 aria-[current=page]:font-semibold aria-[current=page]:text-ink';

export function SideNav({ categories, active }: { categories: Category[]; active?: string }) {
  return (
    <nav className="sticky top-[86px] flex flex-col gap-0.5 max-md:hidden" aria-label="Navigation principale">
      <Link href="/" className={linkClass} aria-current={active === 'home' ? 'page' : undefined}>
        <Icon name="home" className={active === 'home' ? 'text-brand-text' : ''} />
        Accueil
      </Link>
      <Link href="/espaces" className={linkClass} aria-current={active === 'spaces' ? 'page' : undefined}>
        <Icon name="grid" className={active === 'spaces' ? 'text-brand-text' : ''} />
        Tous les espaces
      </Link>
      <div className="flex items-center gap-1.5 px-2.5 pt-[18px] pb-1.5 text-[11.5px] font-semibold text-ink-3">Espaces</div>
      {categories.map((c) => (
        <Link
          key={c.documentId}
          href={`/espaces/${c.slug}`}
          className={linkClass}
          aria-current={active === `cat:${c.slug}` ? 'page' : undefined}
        >
          <CategoryIcon category={c} />
          {c.name}
        </Link>
      ))}
      <a
        href={SITE}
        target="_blank"
        rel="noopener"
        className="mt-[18px] flex items-center gap-2 border-t border-hairline px-2.5 pt-3 text-[13px] text-ink-3 hover:text-brand-text"
      >
        Retour sur lerevenu.com
        <Icon name="external" className="ml-auto !size-[13px]" />
      </a>
    </nav>
  );
}

/** Espaces en pastilles défilantes, à la place de la barre latérale sur mobile. */
export function CategoryChips({ categories, active }: { categories: Category[]; active?: string }) {
  return (
    <nav className="-mx-4 flex gap-2 overflow-x-auto px-4 pb-0.5 [scrollbar-width:none] md:hidden" aria-label="Espaces">
      <Link href="/" className="chip" aria-current={!active ? 'page' : undefined}>
        Tout
      </Link>
      {categories.map((c) => (
        <Link key={c.documentId} href={`/espaces/${c.slug}`} className="chip" aria-current={active === c.slug ? 'page' : undefined}>
          {c.name}
        </Link>
      ))}
    </nav>
  );
}
