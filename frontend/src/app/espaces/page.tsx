import type { Metadata } from 'next';
import Link from 'next/link';
import { connection } from 'next/server';
import { Suspense } from 'react';
import { FeedPageSkeleton } from '@/components/Skeletons';
import { CategoryIcon } from '@/components/CategoryBadges';
import { CommunityLayout } from '@/components/CommunityLayout';
import { getCategories } from '@/lib/strapi/queries';

export const metadata: Metadata = { title: 'Tous les espaces' };

export default function SpacesPage() {
  return (
    <Suspense fallback={<FeedPageSkeleton />}>
      <SpacesContent />
    </Suspense>
  );
}

async function SpacesContent() {
  // Rendu à la requête : la liste des espaces vient de Strapi (et n'est pas figée au build).
  await connection();
  const categories = await getCategories();
  return (
    <CommunityLayout categories={categories} active="spaces">
      <div>
        <h1 className="font-display text-[28px] font-bold tracking-[-0.01em]">Tous les espaces</h1>
        <p className="mt-1.5 max-w-[62ch] text-ink-2">Chaque espace réunit les discussions d’un grand thème du Revenu.</p>
      </div>
      <div className="grid grid-cols-[repeat(auto-fill,minmax(250px,1fr))] gap-3.5">
        {categories.map((c) => (
          <Link
            key={c.documentId}
            href={`/espaces/${c.slug}`}
            className="flex flex-col gap-1.5 rounded-card border border-hairline bg-surface p-[18px] shadow-card transition-[transform,box-shadow] hover:-translate-y-0.5 hover:shadow-pop"
          >
            <span className="mb-1.5">
              <CategoryIcon category={c} size="md" />
            </span>
            <h2 className="font-display text-lg font-bold tracking-[-0.01em]">{c.name}</h2>
            <p className="flex-1 text-[13.5px] text-ink-2">{c.description}</p>
          </Link>
        ))}
      </div>
    </CommunityLayout>
  );
}
