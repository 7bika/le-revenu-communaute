import type { CSSProperties } from 'react';
import { initials } from '@/lib/format';
import type { Author, SessionUser } from '@/lib/types';

const SIZES = {
  xs: 'size-[22px] text-[9.5px]',
  sm: 'size-[30px] text-[11.5px]',
  md: 'size-10 text-sm',
  lg: 'size-14 text-xl',
} as const;

type Person = Pick<Author, 'displayName' | 'username' | 'avatarColor' | 'communityRole'> | SessionUser;

export function Avatar({ user, size = 'sm', className = '' }: { user: Person | null; size?: keyof typeof SIZES; className?: string }) {
  const name = user?.displayName || user?.username || 'Membre supprimé';
  const label = initials(name, user?.communityRole);
  return (
    <span
      className={`av ${SIZES[size]} ${user?.communityRole === 'redaction' ? 'redac' : ''} ${className}`}
      style={{ '--c': user?.avatarColor || '#6e6e73' } as CSSProperties}
      title={name}
      aria-hidden="true"
    >
      {size === 'xs' ? label[0] : label}
    </span>
  );
}
