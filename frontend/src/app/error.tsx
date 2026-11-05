'use client';

import { useEffect } from 'react';

/** Erreur inattendue (API indisponible…) : message clair et possibilité de réessayer. */
export default function ErrorPage({ error, reset }: { error: Error & { digest?: string }; reset: () => void }) {
  useEffect(() => {
    console.error(error);
  }, [error]);

  return (
    <div className="mx-auto my-16 max-w-xl rounded-card border border-hairline bg-surface px-6 py-10 text-center shadow-card" role="alert">
      <h1 className="mb-2 font-display text-2xl font-bold">La communauté est momentanément indisponible</h1>
      <p className="text-ink-2">Nous n’avons pas pu charger cette page. Réessayez dans quelques instants.</p>
      <button type="button" onClick={reset} className="btn btn-primary mt-5">
        Réessayer
      </button>
    </div>
  );
}
