import Link from 'next/link';
import { DiscussionCard } from './DiscussionCard';
import { Icon } from './Icon';
import type { DiscussionSummary } from '@/lib/types';

export function FeedList({ discussions }: { discussions: DiscussionSummary[] }) {
  return (
    <div
      className="flex flex-col overflow-hidden rounded-card border border-hairline bg-surface shadow-card"
      data-testid="discussion-feed"
    >
      {discussions.map((d) => (
        <DiscussionCard key={d.documentId} discussion={d} />
      ))}
    </div>
  );
}

export function EmptyState({
  title,
  text,
  cta = { href: '/nouvelle-discussion', label: 'Publier' },
}: {
  title: string;
  text: string;
  cta?: { href: string; label: string } | null;
}) {
  return (
    <div className="rounded-card border border-hairline bg-surface px-5 py-10 text-center text-ink-2 shadow-card" role="status">
      <h3 className="mb-1.5 font-display text-xl font-bold tracking-[-0.01em] text-ink">{title}</h3>
      <p>{text}</p>
      {cta && (
        <Link href={cta.href} className="btn btn-primary mt-3.5">
          <Icon name="plus" />
          {cta.label}
        </Link>
      )}
    </div>
  );
}

export function FeedSkeleton({ rows = 5 }: { rows?: number }) {
  return (
    <div className="flex flex-col overflow-hidden rounded-card border border-hairline bg-surface shadow-card" aria-busy="true" aria-label="Chargement des discussions">
      {Array.from({ length: rows }, (_, i) => (
        <div key={i} className="grid animate-pulse grid-cols-[62px_minmax(0,1fr)] gap-4 border-t border-line px-[18px] py-4 first:border-t-0 max-md:grid-cols-1">
          <div className="h-[58px] rounded-sm bg-fill max-md:hidden" />
          <div className="space-y-2.5">
            <div className="h-3 w-28 rounded bg-fill" />
            <div className="h-5 w-4/5 rounded bg-fill-2" />
            <div className="h-3.5 w-full rounded bg-fill" />
            <div className="h-3 w-40 rounded bg-fill" />
          </div>
        </div>
      ))}
    </div>
  );
}
