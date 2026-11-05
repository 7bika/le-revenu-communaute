import { z } from 'zod';

/**
 * Contrôles côté interface, pour un retour immédiat dans les formulaires.
 * Ils reprennent les règles de Strapi mais ne les remplacent pas : Strapi revalide
 * systématiquement (src/utils/validation.ts du backend) et reste la référence.
 */
export const DISCUSSION_TYPES = ['question', 'discussion'] as const;

export const discussionSchema = z.object({
  title: z
    .string()
    .trim()
    .min(10, 'Le titre doit contenir au moins 10 caractères.')
    .max(150, 'Le titre ne doit pas dépasser 150 caractères.'),
  content: z
    .string()
    .trim()
    .min(1, 'Le contenu est obligatoire.')
    .max(10000, 'Le contenu ne doit pas dépasser 10 000 caractères.'),
  type: z.enum(DISCUSSION_TYPES, { error: 'Choisissez « Question » ou « Discussion ».' }),
  category: z.string().trim().min(1, 'Choisissez un espace.'),
});

export const replySchema = z.object({
  content: z
    .string()
    .trim()
    .min(2, 'La réponse doit contenir au moins 2 caractères.')
    .max(5000, 'La réponse ne doit pas dépasser 5 000 caractères.'),
});

export const loginSchema = z.object({
  identifier: z.string().trim().min(1, 'Saisissez votre adresse e-mail.'),
  password: z.string().min(1, 'Saisissez votre mot de passe.'),
});

export type DiscussionInput = z.infer<typeof discussionSchema>;

/** Première erreur par champ, au format attendu par les formulaires. */
export function fieldErrorsOf(error: z.ZodError): Record<string, string> {
  const out: Record<string, string> = {};
  for (const issue of error.issues) {
    const key = String(issue.path[0] ?? '_');
    if (!out[key]) out[key] = issue.message;
  }
  return out;
}

/** Chemin interne sûr pour une redirection après connexion (pas d'URL externe). */
export function safeRedirect(target: unknown, fallback = '/'): string {
  if (typeof target !== 'string' || !target.startsWith('/') || target.startsWith('//')) return fallback;
  return target;
}
