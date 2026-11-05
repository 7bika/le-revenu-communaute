import Link from 'next/link';
import { Avatar } from './Avatar';
import { CategoryTag, TypeTag } from './CategoryBadges';
import { Icon } from './Icon';
import { RoleTags } from './RoleTags';
import { fullDate, isWithinHours, timeAgo } from '@/lib/format';
import type { DiscussionSummary } from '@/lib/types';

/** Case de gauche : nombre de réponses, verte si résolue, en pointillés rouges si personne n'a répondu. */
function ReplyCountBox({ discussion }: { discussion: DiscussionSummary }) {
  const n = discussion.replyCount;
  const label = n > 1 ? 'réponses' : 'réponse';
  const base =
    'flex h-[58px] w-[62px] flex-col items-center justify-center rounded-sm border leading-[1.1] max-md:hidden';
  if (discussion.isSolved) {
    return (
      <div className={`${base} border-ok bg-ok text-surface`}>
        <b className="flex items-center gap-0.5 text-[19px] font-semibold tabular-nums">
          <Icon name="check" className="!size-3.5" />
          {n}
        </b>
        <span className="text-[10.5px] tracking-[0.02em]">{label}</span>
      </div>
    );
  }
  return (
    <div className={`${base} ${n ? 'border-line text-ink-2' : 'border-dashed border-line text-alert'}`}>
      <b className={`text-[19px] font-semibold tabular-nums ${n ? 'text-ink' : 'text-alert'}`}>{n}</b>
      <span className="text-[10.5px] tracking-[0.02em]">{label}</span>
    </div>
  );
}

export function DiscussionCard({ discussion }: { discussion: DiscussionSummary }) {
  const isNew = discussion.replyCount === 0 && isWithinHours(discussion.createdAt, 6);
  return (
    <article
      className="group relative grid grid-cols-[62px_minmax(0,1fr)] gap-4 border-t border-line px-[18px] py-4 transition-colors first:border-t-0 hover:bg-[color-mix(in_srgb,var(--surface-2)_70%,var(--surface))] max-md:grid-cols-1 max-md:gap-2 max-md:px-4 max-md:py-3.5"
      data-testid="discussion-card"
    >
      <ReplyCountBox discussion={discussion} />
      <div className="min-w-0">
        <div className="mb-[5px] flex flex-wrap items-center gap-2 text-[12.5px]">
          <CategoryTag category={discussion.category} />
          <TypeTag discussion={discussion} />
          {isNew && <span className="tag tag-new">Nouveau</span>}
        </div>
        <h3 className="font-display text-[18.5px] leading-[1.3] font-bold tracking-[-0.01em] text-ink group-hover:text-brand-text">
          <Link href={`/discussions/${discussion.slug}`} className="after:absolute after:inset-0 after:content-['']">
            {discussion.title}
          </Link>
        </h3>
        {discussion.excerpt && <p className="mt-1 line-clamp-2 text-sm text-ink-2">{discussion.excerpt}</p>}
        <div className="mt-2.5 flex flex-wrap items-center gap-2.5 text-[13px] text-ink-3">
          <span className="inline-flex items-center gap-[7px]">
            <Avatar user={discussion.author} size="xs" />
            <b className="font-semibold text-ink-2">{discussion.author?.displayName ?? 'Membre supprimé'}</b>
            {discussion.author?.communityRole === 'redaction' && <RoleTags author={discussion.author} />}
            <time dateTime={discussion.createdAt} title={fullDate(discussion.createdAt)}>
              · {timeAgo(discussion.createdAt)}
            </time>
          </span>
          <span className="ml-auto inline-flex items-center gap-1 md:hidden" title="Réponses">
            <Icon name="msg" className="!size-[15px]" />
            <span className="tabular-nums">{discussion.replyCount}</span>
          </span>
        </div>
      </div>
    </article>
  );
}
