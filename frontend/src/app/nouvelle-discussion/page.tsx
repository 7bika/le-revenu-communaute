import type { Metadata } from 'next';
import Link from 'next/link';
import { redirect } from 'next/navigation';
import { DiscussionForm } from '@/components/DiscussionForm';
import { Icon } from '@/components/Icon';
import { getCategories } from '@/lib/strapi/queries';
import { getCurrentUser } from '@/lib/session';
import { Suspense } from 'react';
import { connection } from 'next/server';
import { FormSkeleton } from '@/components/Skeletons';

export const metadata: Metadata = { title: 'Nouvelle publication', robots: { index: false } };

export default function NewDiscussionPage(props: PageProps<'/nouvelle-discussion'>) {
  return (
    <Suspense fallback={<FormSkeleton />}>
      <NewDiscussionContent {...props} />
    </Suspense>
  );
}

async function NewDiscussionContent({ searchParams }: PageProps<'/nouvelle-discussion'>) {
  // Rendu à la requête (paramètres d'URL, session, dates relatives) ; les lectures Strapi restent en cache.
  await connection();
  const raw = await searchParams;
  const user = await getCurrentUser();
  if (!user) {
    const qs = new URLSearchParams(Object.entries(raw).flatMap(([k, v]) => (typeof v === 'string' ? [[k, v]] : []))).toString();
    redirect(`/connexion?redirect=${encodeURIComponent(`/nouvelle-discussion${qs ? `?${qs}` : ''}`)}`);
  }

  const categories = await getCategories();
  const espace = typeof raw.espace === 'string' ? raw.espace : '';
  const preselected = categories.find((c) => c.slug === espace)?.documentId ?? '';
  const type = raw.type === 'discussion' ? 'discussion' : 'question';

  return (
    <div className="mx-auto flex max-w-[680px] flex-col gap-4 pt-6 pb-[100px]">
      <nav className="flex items-center gap-1.5 text-[13.5px] text-ink-3" aria-label="Fil d’Ariane">
        <Link href="/" className="hover:text-ink">
          Accueil
        </Link>
        <Icon name="chev" className="!size-3.5" />
        <span>Nouvelle publication</span>
      </nav>
      <h1 className="font-display text-[26px] font-bold tracking-[-0.01em]">Nouvelle publication</h1>
      <DiscussionForm categories={categories} defaults={{ type, category: preselected }} />
    </div>
  );
}
