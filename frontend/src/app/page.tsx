import type { Metadata } from 'next';
import { CommunityLayout } from '@/components/CommunityLayout';
import { EmptyState, FeedList } from '@/components/Feed';
import { FeedToolbar } from '@/components/FeedToolbar';
import { Pagination } from '@/components/Pagination';
import { CategoryChips } from '@/components/SideNav';
import { CharterCard, Hero, JoinCard, QuickComposer, UnansweredCard, WelcomeCard } from '@/components/Widgets';
import { plural } from '@/lib/format';
import { feedHref, parseFeedParams, toApiParams } from '@/lib/search-params';
import { getCategories, getDiscussions } from '@/lib/strapi/queries';
import { getCurrentUser } from '@/lib/session';
import { Suspense } from 'react';
import { connection } from 'next/server';
import { FeedPageSkeleton } from '@/components/Skeletons';

export const metadata: Metadata = { title: { absolute: 'Communauté Le Revenu' } };

/**
 * Accueil : Server Component. Les paramètres d'URL (filtre, tri, page, recherche) sont lus
 * à la requête ; les listes viennent de lectures Strapi mises en cache (lib/strapi/queries).
 * Pendant le chargement, app/loading.tsx sert de squelette (Suspense).
 */
export default function HomePage(props: PageProps<'/'>) {
  return (
    <Suspense fallback={<FeedPageSkeleton />}>
      <HomeContent {...props} />
    </Suspense>
  );
}

async function HomeContent({ searchParams }: PageProps<'/'>) {
  // Rendu à la requête (paramètres d'URL, session, dates relatives) ; les lectures Strapi restent en cache.
  await connection();
  const state = parseFeedParams(await searchParams);

  const [categories, feed, all, unanswered, solved, user] = await Promise.all([
    getCategories(),
    getDiscussions(toApiParams(state)),
    getDiscussions({ pageSize: 1 }),
    getDiscussions({ pageSize: 1, status: 'unanswered' }),
    getDiscussions({ pageSize: 1, status: 'solved' }),
    getCurrentUser(),
  ]);

  const { pagination } = feed.meta;
  const isFiltered = state.status !== 'all';

  return (
    <CommunityLayout
      categories={categories}
      active="home"
      aside={
        <>
          {user ? <WelcomeCard user={user} /> : <JoinCard />}
          <UnansweredCard count={unanswered.meta.pagination.total} href={feedHref('/', state, { status: 'unanswered', q: undefined })} />
          <CharterCard />
        </>
      }
    >
      {state.q ? (
        <div>
          <h1 className="font-display text-[26px] font-bold tracking-[-0.01em]">Recherche</h1>
          <p className="mt-1 text-ink-3" role="status">
            <span className="tabular-nums">{plural(pagination.total, 'résultat')}</span> pour « {state.q} »
          </p>
        </div>
      ) : (
        <Hero
          stats={{
            discussions: all.meta.pagination.total,
            solved: solved.meta.pagination.total,
            unanswered: unanswered.meta.pagination.total,
          }}
        />
      )}
      <QuickComposer user={user} />
      <CategoryChips categories={categories} />
      <FeedToolbar basePath="/" state={state} unansweredCount={unanswered.meta.pagination.total} />
      {feed.data.length ? (
        <FeedList discussions={feed.data} />
      ) : state.q ? (
        <EmptyState
          title="Aucune discussion trouvée"
          text="Essayez d’autres mots-clés, ou posez directement votre question à la communauté."
          cta={{ href: '/nouvelle-discussion', label: 'Poser ma question' }}
        />
      ) : isFiltered ? (
        <EmptyState
          title={state.status === 'unanswered' ? 'Toutes les questions ont une réponse' : 'Aucune question résolue'}
          text="Revenez plus tard ou lancez à votre tour une discussion."
        />
      ) : (
        <EmptyState title="Rien ici pour l’instant" text="Lancez la première discussion de la communauté." />
      )}
      <Pagination basePath="/" state={state} meta={pagination} />
    </CommunityLayout>
  );
}
