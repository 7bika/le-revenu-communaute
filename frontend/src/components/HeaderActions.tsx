import Link from 'next/link';
import { Avatar } from './Avatar';
import { Icon } from './Icon';
import { logoutAction } from '@/app/actions/auth';
import { getCurrentUser } from '@/lib/session';

export async function HeaderActions() {
  const user = await getCurrentUser();

  if (!user) {
    return (
      <>
        <Link href="/connexion" className="btn btn-quiet">
          Se connecter
        </Link>
        <Link href="/connexion" className="btn btn-primary max-[860px]:hidden">
          Rejoindre
        </Link>
      </>
    );
  }

  return (
    <>
      <Link href="/nouvelle-discussion" className="btn btn-primary max-[860px]:hidden">
        <Icon name="plus" />
        Publier
      </Link>
      <span className="flex items-center gap-2 rounded-full border border-hairline bg-surface py-[3px] pr-2.5 pl-[3px] shadow-[0_1px_2px_rgba(0,0,0,0.05)]">
        <Avatar user={user} size="sm" />
        <span className="text-[13px] font-semibold max-md:hidden" data-testid="current-user">
          {user.displayName || user.username}
        </span>
      </span>
      <form action={logoutAction}>
        <button type="submit" className="inline-grid size-9 place-items-center rounded-[9px] text-ink-2 hover:bg-fill hover:text-ink" aria-label="Se déconnecter" title="Se déconnecter">
          <Icon name="out" />
        </button>
      </form>
    </>
  );
}
