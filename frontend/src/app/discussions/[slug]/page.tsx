import type { Metadata } from 'next';
import Link from 'next/link';
import { notFound } from 'next/navigation';
import { AcceptReplyButton } from '@/components/AcceptReplyButton';
import { Avatar } from '@/components/Avatar';
import { CategoryIcon, CategoryTag, TypeTag } from '@/components/CategoryBadges';
import { CommunityLayout } from '@/components/CommunityLayout';
import { Icon } from '@/components/Icon';
import { Prose } from '@/components/Prose';
import { ReplyForm } from '@/components/ReplyForm';
import { RoleTags } from '@/components/RoleTags';
import { fullDate, plural, timeAgo } from '@/lib/format';
import { getCategories, getDiscussionBySlug } from '@/lib/strapi/queries';
import { getCurrentUser } from '@/lib/session';
import type { DiscussionDetail, Reply } from '@/lib/types';
import { Suspense } from 'react';
import { connection } from 'next/server';
import { DiscussionSkeleton } from '@/components/Skeletons';

export async function generateMetadata({ params }: PageProps<'/discussions/[slug]'>): Promise<Metadata> {
  const { slug } = await params;
  const discussion = await getDiscussionBySlug(slug);
  if (!discussion) return { title: 'Discussion introuvable' };
  return {
    title: discussion.title,
    description: discussion.content.replace(/\*\*/g, '').replace(/\s+/g, ' ').slice(0, 160),
    alternates: { canonical: `/discussions/${discussion.slug}` },
  };
}

function ReplyCard({ reply, discussion, canAccept }: { reply: Reply; discussion: DiscussionDetail; canAccept: boolean }) {
  const redac = reply.author?.communityRole === 'redaction';
  return (
    <article
      id={`reponse-${reply.documentId}`}
      data-testid="reply"
      className={`scroll-mt-24 rounded-card border bg-surface px-5 py-4 shadow-card max-md:p-4 ${
        reply.isAccepted
          ? 'border-ok shadow-[0_0_0_1px_var(--ok),var(--shadow)]'
          : redac
            ? 'border-[color-mix(in_srgb,var(--redac)_35%,var(--line))] bg-redac-soft'
            : 'border-hairline'
      }`}
    >
      {reply.isAccepted && (
        <div className="mb-2.5 inline-flex items-center gap-1.5 text-[12.5px] font-semibold text-ok">
          <Icon name="check" className="!size-3.5" />
          Meilleure réponse
        </div>
      )}
      {redac && !reply.isAccepted && (
        <div className="mb-2.5 inline-flex items-center gap-1.5 text-[12.5px] font-semibold text-redac">
          <Icon name="check" className="!size-3.5" />
          Réponse de la rédaction
        </div>
      )}
      <div className="flex items-center gap-[11px]">
        <Avatar user={reply.author} size="sm" />
        <div>
          <div className="flex flex-wrap items-center gap-[7px] font-semibold">
            {reply.author?.displayName ?? 'Membre supprimé'} <RoleTags author={reply.author} />
          </div>
          <time className="text-[12.5px] text-ink-3" dateTime={reply.createdAt} title={fullDate(reply.createdAt)}>
            {timeAgo(reply.createdAt)}
          </time>
        </div>
      </div>
      <Prose text={reply.content} className="mt-2.5 !text-[15px]" />
      {canAccept && !reply.isAccepted && (
        <div className="mt-3.5 flex">
          <AcceptReplyButton discussion={discussion.documentId} slug={discussion.slug} reply={reply.documentId} />
        </div>
      )}
    </article>
  );
}

/**
 * Détail d'une discussion. URL propre : /discussions/<slug>.
 * La discussion et ses réponses viennent d'une lecture mise en cache (tag discussion:<slug>),
 * invalidée par la Server Action de publication d'une réponse.
 */
export default function DiscussionPage(props: PageProps<'/discussions/[slug]'>) {
  return (
    <Suspense fallback={<DiscussionSkeleton />}>
      <DiscussionContent {...props} />
    </Suspense>
  );
}

async function DiscussionContent({ params }: PageProps<'/discussions/[slug]'>) {
  // Rendu à la requête (paramètres d'URL, session, dates relatives) ; les lectures Strapi restent en cache.
  await connection();
  const { slug } = await params;
  const [discussion, categories, user] = await Promise.all([
    getDiscussionBySlug(slug),
    getCategories(),
    getCurrentUser(),
  ]);
  if (!discussion) notFound();

  const { author, category, replies } = discussion;
  const isAuthor = Boolean(user && author && user.documentId === author.documentId);
  const solution = replies.find((r) => r.isAccepted);
  const n = replies.length;

  return (
    <CommunityLayout
      categories={categories}
      active={category ? `cat:${category.slug}` : undefined}
      aside={
        <>
          <section className="card">
            <h2 className="card-title">Cette discussion</h2>
            <dl className="grid grid-cols-2 gap-x-2.5 gap-y-3">
              <div>
                <dt className="text-xs text-ink-3">Réponses</dt>
                <dd className="text-base font-semibold tabular-nums">{n}</dd>
              </div>
              <div>
                <dt className="text-xs text-ink-3">Statut</dt>
                <dd className="text-[13.5px] font-semibold">
                  {discussion.type === 'question' ? (discussion.isSolved ? 'Résolue' : 'En attente') : 'Discussion'}
                </dd>
              </div>
              <div>
                <dt className="text-xs text-ink-3">Publiée</dt>
                <dd className="text-[13.5px] font-semibold">{timeAgo(discussion.createdAt)}</dd>
              </div>
              <div>
                <dt className="text-xs text-ink-3">Dernière activité</dt>
                <dd className="text-[13.5px] font-semibold">{timeAgo(discussion.lastActivityAt)}</dd>
              </div>
            </dl>
          </section>
          {category && (
            <section className="card">
              <h3 className="flex items-center gap-2 font-display text-lg font-bold tracking-[-0.01em]">
                <CategoryIcon category={category} />
                {category.name}
              </h3>
              {category.description && <p className="mt-1.5 mb-3 text-sm text-ink-2">{category.description}</p>}
              <Link href={`/nouvelle-discussion?espace=${category.slug}`} className="btn btn-secondary btn-sm">
                <Icon name="plus" />
                Publier dans cet espace
              </Link>
            </section>
          )}
        </>
      }
    >
      <nav className="flex flex-wrap items-center gap-1.5 text-[13.5px] text-ink-3" aria-label="Fil d’Ariane">
        <Link href="/" className="hover:text-ink">
          Accueil
        </Link>
        {category && (
          <>
            <Icon name="chev" className="!size-3.5" />
            <Link href={`/espaces/${category.slug}`} className="hover:text-ink">
              {category.name}
            </Link>
          </>
        )}
      </nav>

      <article className="rounded-card border border-hairline bg-surface px-[22px] py-5 shadow-card max-md:p-4">
        <div className="flex flex-wrap items-center gap-2">
          <CategoryTag category={category} />
          <TypeTag discussion={discussion} />
        </div>
        <h1 className="mt-1.5 mb-3.5 font-display text-[29px] leading-[1.2] font-bold tracking-[-0.01em] max-md:text-2xl">
          {discussion.title}
        </h1>
        <div className="flex items-center gap-[11px]">
          <Avatar user={author} size="md" />
          <div>
            <div className="flex flex-wrap items-center gap-[7px] font-semibold">
              {author?.displayName ?? 'Membre supprimé'} <RoleTags author={author} />
            </div>
            <div className="text-[12.5px] text-ink-3">
              Publiée <time dateTime={discussion.createdAt}>le {fullDate(discussion.createdAt)}</time>
            </div>
          </div>
        </div>
        <Prose text={discussion.content} className="mt-3.5" />
      </article>

      {solution && (
        <a href={`#reponse-${solution.documentId}`} className="flex items-start gap-3 rounded-card bg-ok-soft px-4 py-3.5 text-ink">
          <Icon name="check" className="mt-0.5 text-ok" />
          <div>
            <b className="text-ok">Meilleure réponse</b> · {solution.author?.displayName}
            <p className="mt-0.5 line-clamp-2 text-sm text-ink-2">{solution.content.replace(/\*\*/g, '')}</p>
          </div>
        </a>
      )}

      <section className="flex flex-col gap-3" aria-labelledby="reponses">
        <h2 id="reponses" className="section-title">
          {n ? plural(n, 'réponse') : 'Aucune réponse pour l’instant'}
        </h2>
        {replies.map((reply) => (
          <ReplyCard
            key={reply.documentId}
            reply={reply}
            discussion={discussion}
            canAccept={isAuthor && discussion.type === 'question' && reply.author?.documentId !== user?.documentId}
          />
        ))}
        {user ? (
          <ReplyForm
            discussion={discussion.documentId}
            slug={discussion.slug}
            user={user}
            placeholder={
              discussion.type === 'question'
                ? `Partagez votre expérience pour aider ${author?.displayName ?? 'ce membre'}…`
                : 'Votre avis sur la question…'
            }
          />
        ) : (
          <div className="flex flex-col items-center gap-2.5 rounded-card border border-hairline bg-surface px-5 py-[26px] text-center shadow-card">
            <h3 className="font-display text-[19px] font-bold tracking-[-0.01em]">Vous avez un avis ou une expérience à partager ?</h3>
            <p className="text-ink-3">Rejoignez la communauté avec votre compte lerevenu.com.</p>
            <Link href={`/connexion?redirect=${encodeURIComponent(`/discussions/${discussion.slug}`)}`} className="btn btn-primary">
              Se connecter pour répondre
            </Link>
          </div>
        )}
      </section>
    </CommunityLayout>
  );
}
