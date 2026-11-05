import type { Metadata } from 'next';
import Link from 'next/link';
import { notFound } from 'next/navigation';
import { CategoryIcon } from '@/components/CategoryBadges';
import { CommunityLayout } from '@/components/CommunityLayout';
import { EmptyState, FeedList } from '@/components/Feed';
import { FeedToolbar } from '@/components/FeedToolbar';
import { Icon } from '@/components/Icon';
import { Pagination } from '@/components/Pagination';
import { CategoryChips } from '@/components/SideNav';
import { CharterCard, JoinCard, QuickComposer, WelcomeCard } from '@/components/Widgets';
import { plural } from '@/lib/format';
import { parseFeedParams, toApiParams } from '@/lib/search-params';
import { getCategories, getDiscussions } from '@/lib/strapi/queries';
import { getCurrentUser } from '@/lib/session';
import { Suspense } from 'react';
import { connection } from 'next/server';
import { FeedPageSkeleton } from '@/components/Skeletons';

export async function generateMetadata({ params }: PageProps<'/espaces/[slug]'>): Promise<Metadata> {
  const { slug } = await params;
  const category = (await getCategories()).find((c) => c.slug === slug);
  return category ? { title: category.name, description: category.description ?? undefined } : { title: 'Espace introuvable' };
}

/** Espace thématique : même fil que l'accueil, filtré par catégorie côté Strapi. */
export default function CategoryPage(props: PageProps<'/espaces/[slug]'>) {
  return (
    <Suspense fallback={<FeedPageSkeleton />}>
      <CategoryContent {...props} />
    </Suspense>
  );
}

async function CategoryContent({ params, searchParams }: PageProps<'/espaces/[slug]'>) {
  // Rendu à la requête (paramètres d'URL, session, dates relatives) ; les lectures Strapi restent en cache.
  await connection();
  const [{ slug }, raw] = await Promise.all([params, searchParams]);
  const state = parseFeedParams(raw);
  // La recherche est globale (barre d'en-tête) : on l'ignore dans un espace.
  state.q = undefined;

  const categories = await getCategories();
  const category = categories.find((c) => c.slug === slug);
  if (!category) notFound();

  const [feed, all, unanswered, user] = await Promise.all([
    getDiscussions(toApiParams(state, slug)),
    getDiscussions({ pageSize: 1, category: slug }),
    getDiscussions({ pageSize: 1, status: 'unanswered', category: slug }),
    getCurrentUser(),
  ]);
  const basePath = `/espaces/${slug}`;

  return (
    <CommunityLayout
      categories={categories}
      active={`cat:${slug}`}
      aside={
        <>
          {user ? <WelcomeCard user={user} /> : <JoinCard />}
          <CharterCard />
        </>
      }
    >
      <section className="flex flex-wrap items-center gap-[18px] rounded-card border border-hairline bg-surface p-[22px] shadow-card">
        <CategoryIcon category={category} size="lg" />
        <div className="min-w-[220px] flex-1">
          <h1 className="font-display text-[28px] font-bold tracking-[-0.01em]">{category.name}</h1>
          {category.description && <p className="mt-1 max-w-[60ch] text-ink-2">{category.description}</p>}
          <div className="mt-2 flex flex-wrap gap-3.5 text-[13px] text-ink-3">
            <span className="tabular-nums">{plural(all.meta.pagination.total, 'discussion')}</span>
            <span className="tabular-nums">{plural(unanswered.meta.pagination.total, 'question sans réponse', 'questions sans réponse')}</span>
          </div>
        </div>
        <Link href={`/nouvelle-discussion?espace=${slug}`} className="btn btn-primary">
          <Icon name="plus" />
          Publier ici
        </Link>
      </section>
      <QuickComposer user={user} category={slug} />
      <CategoryChips categories={categories} active={slug} />
      <FeedToolbar basePath={basePath} state={state} unansweredCount={unanswered.meta.pagination.total} />
      {feed.data.length ? (
        <FeedList discussions={feed.data} />
      ) : (
        <EmptyState
          title={state.status === 'unanswered' ? 'Toutes les questions ont une réponse' : 'Rien ici pour l’instant'}
          text={state.status === 'all' ? 'Lancez la première discussion de cet espace.' : 'Aucune discussion ne correspond à ce filtre.'}
          cta={{ href: `/nouvelle-discussion?espace=${slug}`, label: 'Publier' }}
        />
      )}
      <Pagination basePath={basePath} state={state} meta={feed.meta.pagination} />
    </CommunityLayout>
  );
}
