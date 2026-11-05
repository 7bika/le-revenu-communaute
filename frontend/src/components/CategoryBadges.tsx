import Link from 'next/link';
import type { CSSProperties } from 'react';
import { Icon } from './Icon';
import type { Category, DiscussionSummary } from '@/lib/types';

const SIZES = { sm: '', md: '[--s:40px]', lg: '[--s:56px]' } as const;

export function CategoryIcon({ category, size = 'sm' }: { category: Pick<Category, 'color' | 'icon'>; size?: keyof typeof SIZES }) {
  return (
    <span className={`sp-ic ${SIZES[size]}`} style={{ '--c': category.color } as CSSProperties} aria-hidden="true">
      <Icon name={category.icon} />
    </span>
  );
}

export function CategoryTag({ category }: { category: Category | null }) {
  if (!category) return null;
  return (
    <Link
      href={`/espaces/${category.slug}`}
      className="relative z-10 inline-flex items-center gap-1.5 text-[12.5px] font-semibold text-brand-text hover:text-ink"
    >
      {category.name}
    </Link>
  );
}

export function TypeTag({ discussion }: { discussion: Pick<DiscussionSummary, 'type' | 'isSolved'> }) {
  if (discussion.type !== 'question') {
    return <span className="tag tag-q">Discussion</span>;
  }
  return discussion.isSolved ? (
    <span className="tag tag-ok">
      <Icon name="check" />
      Résolu
    </span>
  ) : (
    <span className="tag tag-q">Question</span>
  );
}
