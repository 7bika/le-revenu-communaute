import { Icon } from './Icon';

const SITE = 'https://www.lerevenu.com';
const RUBRIQUES = ['Bourse', 'Économie', 'Placements', 'Immobilier', 'Impôts', 'Succession', 'Vie pratique'];

/** Barre de liaison avec lerevenu.com (non collante). */
export function SiteBar() {
  return (
    <div className="border-b border-hairline bg-surface text-[13px] text-ink-2">
      <div className="mx-auto flex h-[38px] max-w-[1260px] items-center gap-5 px-4">
        <a href={SITE} target="_blank" rel="noopener" className="inline-flex items-center gap-1.5 font-semibold whitespace-nowrap text-ink hover:text-brand-text">
          <Icon name="arrowL" className="!size-[15px]" />
          Retour sur lerevenu.com
        </a>
        <nav className="flex min-w-0 gap-4 overflow-hidden border-l border-line pl-5 max-[1100px]:hidden" aria-label="Rubriques de lerevenu.com">
          {RUBRIQUES.map((r) => (
            <a key={r} href={SITE} target="_blank" rel="noopener" className="whitespace-nowrap hover:text-brand-text">
              {r}
            </a>
          ))}
        </nav>
        <span className="ml-auto flex items-center gap-4">
          <a href={SITE} target="_blank" rel="noopener" className="inline-flex items-center gap-1.5 whitespace-nowrap hover:text-brand-text max-md:hidden">
            <Icon name="book" className="!size-[15px]" />
            Le magazine
          </a>
          <a href={SITE} target="_blank" rel="noopener" className="rounded-full bg-brand px-[11px] py-[3px] font-semibold whitespace-nowrap text-white hover:brightness-[0.93]">
            S’abonner
          </a>
        </span>
      </div>
    </div>
  );
}
