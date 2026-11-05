import { FeedSkeleton } from './Feed';

/**
 * Squelettes affichés pendant le chargement (fallbacks des frontières <Suspense> des pages).
 * Ils font partie de la coque statique prérendue : la page s'affiche instantanément,
 * puis les données de Strapi arrivent en streaming.
 */
export function FeedPageSkeleton() {
  return (
    <div className="grid grid-cols-1 items-start gap-7 pt-4 md:grid-cols-[200px_minmax(0,1fr)] md:pt-6 lg:grid-cols-[212px_minmax(0,1fr)_304px]">
      <div className="flex flex-col gap-2 max-md:hidden" aria-hidden="true">
        {Array.from({ length: 10 }, (_, i) => (
          <div key={i} className="h-7 animate-pulse rounded-sm bg-fill" />
        ))}
      </div>
      <div className="flex flex-col gap-[18px]">
        <div className="h-[200px] animate-pulse rounded-[18px] bg-fill-2" />
        <FeedSkeleton />
      </div>
      <div className="h-64 animate-pulse rounded-card bg-fill max-lg:hidden" aria-hidden="true" />
    </div>
  );
}

export function DiscussionSkeleton() {
  return (
    <div className="grid grid-cols-1 items-start gap-7 pt-4 md:grid-cols-[200px_minmax(0,1fr)] md:pt-6 lg:grid-cols-[212px_minmax(0,1fr)_304px]" aria-busy="true">
      <div className="max-md:hidden" />
      <div className="flex flex-col gap-3">
        <div className="h-4 w-48 animate-pulse rounded bg-fill" />
        <div className="h-56 animate-pulse rounded-card bg-fill-2" />
        <div className="h-6 w-32 animate-pulse rounded bg-fill" />
        <div className="h-32 animate-pulse rounded-card bg-fill" />
        <div className="h-32 animate-pulse rounded-card bg-fill" />
      </div>
      <div className="h-40 animate-pulse rounded-card bg-fill max-lg:hidden" />
    </div>
  );
}

export function FormSkeleton() {
  return (
    <div className="mx-auto flex max-w-[680px] flex-col gap-4 pt-6" aria-busy="true">
      <div className="h-8 w-64 animate-pulse rounded bg-fill-2" />
      <div className="h-[520px] animate-pulse rounded-2xl bg-fill" />
    </div>
  );
}

export function LoginSkeleton() {
  return <div className="mx-auto mt-8 h-[420px] max-w-[440px] animate-pulse rounded-2xl bg-fill" aria-busy="true" />;
}
