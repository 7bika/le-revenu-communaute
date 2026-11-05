import 'server-only';

/**
 * Client HTTP unique vers Strapi : URL de base, en-têtes, sérialisation et traduction des
 * erreurs au format Strapi ({ error: { status, name, message, details } }) en StrapiError.
 * Il n'est importable que côté serveur : le jeton JWT et l'URL interne ne fuient jamais au navigateur.
 */

export const STRAPI_URL = (process.env.STRAPI_URL ?? 'http://localhost:1337').replace(/\/$/, '');

export type FieldErrors = Record<string, string>;

export class StrapiError extends Error {
  constructor(
    readonly status: number,
    message: string,
    readonly name = 'StrapiError',
    readonly fieldErrors: FieldErrors = {}
  ) {
    super(message);
  }
}

interface StrapiErrorBody {
  error?: {
    status?: number;
    name?: string;
    message?: string;
    details?: { errors?: { path?: (string | number)[]; message?: string }[] };
  };
}

function toFieldErrors(body: StrapiErrorBody): FieldErrors {
  const errors: FieldErrors = {};
  for (const e of body.error?.details?.errors ?? []) {
    const key = String(e.path?.[0] ?? '_');
    if (!errors[key] && e.message) errors[key] = e.message;
  }
  return errors;
}

export interface StrapiRequestInit {
  method?: 'GET' | 'POST' | 'PUT' | 'DELETE';
  /** Corps JSON (sera sérialisé). */
  body?: unknown;
  /** JWT Users & Permissions de l'utilisateur connecté. */
  token?: string;
  query?: Record<string, string | number | undefined>;
}

export async function strapiRequest<T>(path: string, init: StrapiRequestInit = {}): Promise<T> {
  const url = new URL(`/api${path}`, STRAPI_URL);
  for (const [key, value] of Object.entries(init.query ?? {})) {
    if (value !== undefined && value !== '') url.searchParams.set(key, String(value));
  }

  let response: Response;
  try {
    response = await fetch(url, {
      method: init.method ?? 'GET',
      headers: {
        Accept: 'application/json',
        ...(init.body !== undefined ? { 'Content-Type': 'application/json' } : {}),
        ...(init.token ? { Authorization: `Bearer ${init.token}` } : {}),
      },
      body: init.body !== undefined ? JSON.stringify(init.body) : undefined,
      // Le cache est géré au niveau des fonctions ('use cache'), pas du fetch.
      cache: 'no-store',
      signal: AbortSignal.timeout(10_000),
    });
  } catch {
    throw new StrapiError(503, 'Le service de la communauté est momentanément indisponible.', 'NetworkError');
  }

  if (response.status === 204) return undefined as T;
  const json = (await response.json().catch(() => ({}))) as T & StrapiErrorBody;

  if (!response.ok) {
    throw new StrapiError(
      response.status,
      json.error?.message ?? `Erreur ${response.status}`,
      json.error?.name ?? 'StrapiError',
      toFieldErrors(json)
    );
  }
  return json;
}
