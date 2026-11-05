import Link from 'next/link';
import { Icon } from './Icon';
import { feedHref, type FeedState } from '@/lib/search-params';
import type { Pagination as PaginationMeta } from '@/lib/types';

function pagesToShow(current: number, total: number): (number | '…')[] {
  const pages = new Set([1, total, current - 1, current, current + 1].filter((p) => p >= 1 && p <= total));
  const sorted = [...pages].sort((a, b) => a - b);
  const out: (number | '…')[] = [];
  sorted.forEach((p, i) => {
    if (i > 0 && p - sorted[i - 1] > 1) out.push('…');
    out.push(p);
  });
  return out;
}

export function Pagination({ basePath, state, meta }: { basePath: string; state: FeedState; meta: PaginationMeta }) {
  if (meta.pageCount <= 1) return null;
  const { page, pageCount } = meta;
  const link = 'inline-grid h-9 min-w-9 place-items-center rounded-[10px] px-2.5 text-sm font-medium tabular-nums';
  return (
    <nav className="flex flex-wrap items-center justify-center gap-1" aria-label="Pagination">
      {page > 1 ? (
        <Link href={feedHref(basePath, state, { page: page - 1 })} className={`${link} btn-quiet`} rel="prev">
          <Icon name="arrowL" className="!size-4" />
          <span className="sr-only">Page précédente</span>
        </Link>
      ) : (
        <span className={`${link} text-ink-3 opacity-40`} aria-hidden="true">
          <Icon name="arrowL" className="!size-4" />
        </span>
      )}
      {pagesToShow(page, pageCount).map((p, i) =>
        p === '…' ? (
          <span key={`gap-${i}`} className="px-1 text-ink-3">
            …
          </span>
        ) : (
          <Link
            key={p}
            href={feedHref(basePath, state, { page: p })}
            className={`${link} ${p === page ? 'bg-surface font-semibold text-ink shadow-card' : 'btn-quiet'}`}
            aria-current={p === page ? 'page' : undefined}
          >
            {p}
          </Link>
        )
      )}
      {page < pageCount ? (
        <Link href={feedHref(basePath, state, { page: page + 1 })} className={`${link} btn-quiet`} rel="next">
          <Icon name="chev" className="!size-4" />
          <span className="sr-only">Page suivante</span>
        </Link>
      ) : (
        <span className={`${link} text-ink-3 opacity-40`} aria-hidden="true">
          <Icon name="chev" className="!size-4" />
        </span>
      )}
    </nav>
  );
}
