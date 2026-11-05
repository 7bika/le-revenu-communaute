import Link from 'next/link';
import { Icon } from './Icon';
import { feedHref, type FeedState } from '@/lib/search-params';

/**
 * Filtres et tri du fil, sous forme de liens (fonctionne sans JavaScript, URL partageable).
 */
export function FeedToolbar({
  basePath,
  state,
  unansweredCount,
}: {
  basePath: string;
  state: FeedState;
  unansweredCount: number;
}) {
  const filters = [
    { status: 'all', icon: 'list', label: 'Toutes' },
    { status: 'unanswered', icon: 'help', label: 'Sans réponse' },
    { status: 'solved', icon: 'check', label: 'Résolues' },
  ] as const;

  const sorts = [
    { sort: 'recent', label: 'Récentes' },
    { sort: 'oldest', label: 'Anciennes' },
  ] as const;

  return (
    <div className="flex flex-wrap items-center justify-between gap-3">
      <nav className="tabs" aria-label="Filtrer les discussions">
        {filters.map((f) => (
          <Link
            key={f.status}
            href={feedHref(basePath, state, { status: f.status })}
            className="tab"
            aria-current={state.status === f.status ? 'page' : undefined}
            scroll={false}
          >
            <Icon name={f.icon} />
            {f.label}
            {f.status === 'unanswered' && unansweredCount > 0 && (
              <span className="rounded-full bg-alert-soft px-[7px] py-px text-[11.5px] text-alert tabular-nums">
                {unansweredCount}
              </span>
            )}
          </Link>
        ))}
      </nav>
      <nav className="tabs" aria-label="Trier par date de publication">
        <span className="flex items-center pl-2 text-ink-3" aria-hidden="true">
          <Icon name="clock" className="!size-4" />
        </span>
        {sorts.map((s) => (
          <Link
            key={s.sort}
            href={feedHref(basePath, state, { sort: s.sort })}
            className="tab !px-3 !text-[13px]"
            aria-current={state.sort === s.sort ? 'page' : undefined}
            scroll={false}
          >
            {s.label}
          </Link>
        ))}
      </nav>
    </div>
  );
}
