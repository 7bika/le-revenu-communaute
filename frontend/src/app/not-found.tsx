import Link from 'next/link';

export default function NotFound() {
  return (
    <div className="mx-auto my-16 max-w-xl rounded-card border border-hairline bg-surface px-6 py-10 text-center shadow-card">
      <h1 className="mb-2 font-display text-2xl font-bold">Page introuvable</h1>
      <p className="text-ink-2">Cette discussion a peut-être été supprimée, ou le lien est incorrect.</p>
      <Link href="/" className="btn btn-primary mt-5">
        Retour à l’accueil
      </Link>
    </div>
  );
}
