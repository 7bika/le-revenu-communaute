import Link from 'next/link';
import { Avatar } from './Avatar';
import { Icon } from './Icon';
import { plural } from '@/lib/format';
import type { SessionUser } from '@/lib/types';

export function Hero({ stats }: { stats: { discussions: number; unanswered: number; solved: number } }) {
  const nf = new Intl.NumberFormat('fr-FR');
  return (
    <section className="hero relative grid grid-cols-[minmax(0,1fr)_auto] items-end gap-x-6 gap-y-[18px] overflow-hidden rounded-[18px] px-7 pt-7 pb-6 text-white shadow-pop max-md:grid-cols-1 max-md:rounded-2xl max-md:px-5 max-md:py-[22px]">
      <div>
        <h1 className="max-w-[22ch] font-display text-[32px] leading-[1.12] font-bold tracking-[-0.01em] max-md:text-[25px]">
          La communauté des lecteurs du Revenu
        </h1>
        <p className="mt-2 max-w-[52ch] text-white/80">
          Posez vos questions d’argent, partagez vos expériences et échangez avec la rédaction. Bourse, épargne, impôts,
          retraite, transmission.
        </p>
        <div className="mt-4 flex flex-wrap gap-[22px] text-[13px] opacity-90">
          <span>
            <b className="block text-xl font-bold tabular-nums">{nf.format(stats.discussions)}</b>discussions
          </span>
          <span>
            <b className="block text-xl font-bold tabular-nums">{nf.format(stats.solved)}</b>questions résolues
          </span>
          <span>
            <b className="block text-xl font-bold tabular-nums">{nf.format(stats.unanswered)}</b>en attente d’une réponse
          </span>
        </div>
      </div>
      <div className="flex flex-col gap-2 max-md:flex-row max-md:flex-wrap">
        <Link href="/nouvelle-discussion" className="btn btn-primary hover:brightness-110">
          Poser une question
        </Link>
        <Link href="/espaces" className="btn border-white/20 bg-white/15 text-white backdrop-blur-[10px] hover:bg-white/25">
          Explorer les espaces
        </Link>
      </div>
    </section>
  );
}

export function QuickComposer({ user, category }: { user: SessionUser | null; category?: string }) {
  const href = (type: string) =>
    `/nouvelle-discussion?type=${type}${category ? `&espace=${encodeURIComponent(category)}` : ''}`;
  return (
    <div className="flex w-full items-center gap-3 rounded-card border border-hairline bg-surface px-3 py-2.5 shadow-card">
      {user ? (
        <Avatar user={user} size="md" />
      ) : (
        <span className="av size-10 text-sm" style={{ ['--c' as string]: 'var(--ink-3)' }} aria-hidden="true">
          <Icon name="user" />
        </span>
      )}
      <Link
        href={href('question')}
        className="min-w-0 flex-1 truncate rounded-[10px] bg-fill px-3.5 py-[9px] text-ink-3 hover:bg-fill-2"
      >
        Posez votre question à la communauté…
      </Link>
      <div className="flex gap-1 max-md:hidden">
        <Link href={href('question')} className="inline-flex items-center gap-1.5 rounded-sm px-2.5 py-[7px] text-[13.5px] font-medium text-ink-2 hover:bg-fill">
          <Icon name="help" />
          Question
        </Link>
        <Link href={href('discussion')} className="inline-flex items-center gap-1.5 rounded-sm px-2.5 py-[7px] text-[13.5px] font-medium text-ink-2 hover:bg-fill">
          <Icon name="msg" />
          Discussion
        </Link>
      </div>
    </div>
  );
}

export function JoinCard() {
  return (
    <section className="card join-card">
      <h3 className="mb-1.5 font-display text-[19px] font-bold tracking-[-0.01em]">Rejoignez la communauté</h3>
      <p className="text-sm text-ink-2">Avec votre compte lerevenu.com, gratuitement.</p>
      <ul className="mt-2.5 mb-3.5 flex flex-col gap-1.5 text-sm text-ink-2">
        {[
          'Posez vos questions d’argent à des milliers de lecteurs',
          'Recevez les réponses de la rédaction',
          'Aidez les autres membres grâce à votre expérience',
        ].map((t) => (
          <li key={t} className="flex items-start gap-2">
            <Icon name="check" className="mt-0.5 !size-4 text-brand-text" />
            {t}
          </li>
        ))}
      </ul>
      <Link href="/connexion" className="btn btn-primary w-full">
        Rejoindre la communauté
      </Link>
    </section>
  );
}

export function WelcomeCard({ user }: { user: SessionUser }) {
  return (
    <section className="card">
      <div className="mb-3.5 flex items-center gap-3">
        <Avatar user={user} size="md" />
        <div>
          <h3 className="text-base font-semibold">Bonjour {user.displayName || user.username}</h3>
          <small className="block text-[13px] text-ink-3">Connecté en tant que @{user.username}</small>
        </div>
      </div>
      <Link href="/nouvelle-discussion" className="btn btn-primary w-full">
        <Icon name="plus" />
        Nouvelle publication
      </Link>
    </section>
  );
}

export function UnansweredCard({ count, href }: { count: number; href: string }) {
  if (!count) return null;
  return (
    <section className="card border-transparent bg-surface-3">
      <h3 className="mb-1 text-[15.5px] font-semibold">{plural(count, 'question attend', 'questions attendent')} une réponse</h3>
      <p className="mb-3 text-[13.5px] text-ink-2">Votre expérience compte, même partielle : aidez un autre lecteur.</p>
      <Link href={href} className="btn btn-primary btn-sm">
        Voir les questions sans réponse
      </Link>
    </section>
  );
}

export function CharterCard() {
  return (
    <section className="card">
      <h2 className="card-title">
        <Icon name="shield" className="text-brand-text" />
        La charte en bref
      </h2>
      <ul className="flex flex-col gap-2 text-[13.5px] text-ink-2">
        <li>Partagez votre expérience : pas de conseil personnalisé ni de sollicitation.</li>
        <li>Citez vos sources, de préférence officielles (AMF, Banque de France, service-public.fr).</li>
        <li>Restez courtois : on critique les idées, pas les personnes.</li>
      </ul>
    </section>
  );
}
