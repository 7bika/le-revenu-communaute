import type { Metadata } from 'next';
import Link from 'next/link';
import { Avatar } from '@/components/Avatar';
import { Icon } from '@/components/Icon';
import { LoginForm } from '@/components/LoginForm';
import { logoutAction } from '@/app/actions/auth';
import { getCurrentUser } from '@/lib/session';
import { safeRedirect } from '@/lib/validation';
import { Suspense } from 'react';
import { connection } from 'next/server';
import { LoginSkeleton } from '@/components/Skeletons';

export const metadata: Metadata = { title: 'Connexion', robots: { index: false } };

/** Comptes de démonstration créés par le seed de Strapi (mot de passe : DEMO_USER_PASSWORD). */
const DEMO_ACCOUNTS = [
  { email: 'camille.b@demo.lerevenu.fr', label: 'Camille — membre abonnée' },
  { email: 'thomas.pea@demo.lerevenu.fr', label: 'Thomas — auteur de « Ouvrir un PEA… »' },
  { email: 'laredaction@demo.lerevenu.fr', label: 'La rédaction du Revenu' },
];

export default function LoginPage(props: PageProps<'/connexion'>) {
  return (
    <Suspense fallback={<LoginSkeleton />}>
      <LoginContent {...props} />
    </Suspense>
  );
}

async function LoginContent({ searchParams }: PageProps<'/connexion'>) {
  // Rendu à la requête (paramètres d'URL, session, dates relatives) ; les lectures Strapi restent en cache.
  await connection();
  const { redirect } = await searchParams;
  const redirectTo = safeRedirect(redirect);
  const user = await getCurrentUser();

  return (
    <div className="mx-auto flex max-w-[440px] flex-col gap-4 pt-8 pb-[100px]">
      <div className="overflow-hidden rounded-2xl border border-hairline bg-surface shadow-card">
        <div className="flex flex-col gap-4 p-[22px]">
          <h1 className="font-display text-[23px] font-bold tracking-[-0.01em]">
            {user ? 'Vous êtes connecté' : 'Rejoindre la communauté'}
          </h1>
          {user ? (
            <>
              <div className="flex items-center gap-3">
                <Avatar user={user} size="md" />
                <div>
                  <b>{user.displayName || user.username}</b>
                  <small className="block text-ink-3">@{user.username}</small>
                </div>
              </div>
              <div className="flex gap-2">
                <Link href={redirectTo} className="btn btn-primary flex-1">
                  Continuer
                </Link>
                <form action={logoutAction}>
                  <button type="submit" className="btn btn-secondary">
                    <Icon name="out" />
                    Se déconnecter
                  </button>
                </form>
              </div>
            </>
          ) : (
            <>
              <div className="flex items-center gap-3 rounded-sm border border-line bg-surface-2 px-3.5 py-3">
                <span className="grid size-[38px] flex-none place-items-center rounded-[9px] bg-brand text-xl font-black text-white">R</span>
                <div>
                  <b>Votre compte lerevenu.com</b>
                  <small className="block text-[12.5px] text-ink-3">Le même identifiant que pour le site et le magazine</small>
                </div>
              </div>
              <LoginForm redirectTo={redirectTo} />
            </>
          )}
        </div>
      </div>
      {!user && process.env.SHOW_DEMO_ACCOUNTS !== 'false' && (
        <section className="card text-[13.5px]">
          <h2 className="card-title">
            <Icon name="user" className="text-brand-text" />
            Comptes de démonstration
          </h2>
          <ul className="flex flex-col gap-1.5 text-ink-2">
            {DEMO_ACCOUNTS.map((a) => (
              <li key={a.email}>
                <code className="text-ink">{a.email}</code>
                <br />
                <span className="text-ink-3">{a.label}</span>
              </li>
            ))}
          </ul>
          <p className="mt-2.5 text-ink-3">
            Mot de passe : <code className="text-ink">Demo1234!</code>
          </p>
        </section>
      )}
    </div>
  );
}
