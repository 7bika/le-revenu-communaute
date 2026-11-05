/**
 * Règles de validation métier, appliquées côté Strapi quel que soit le client
 * (front Next.js, appel curl, script…). Les messages sont en français car ils sont
 * affichés tels quels dans le formulaire.
 */
import { yup, validateYupSchema, errors } from '@strapi/utils';
import { DISCUSSION_TYPES, LIMITS, type DiscussionType } from './constants';

const { ValidationError } = errors;

const SLUG_RE = /^[a-z0-9]+(?:-[a-z0-9]+)*$/;
const DOCUMENT_ID_RE = /^[a-z0-9]{20,32}$/;

const nonBlank = (label: string) =>
  yup.string().transform((v) => (typeof v === 'string' ? v.trim() : v)).required(`${label} est obligatoire.`);

export const createDiscussionSchema = yup
  .object({
    title: nonBlank('Le titre')
      .min(LIMITS.titleMin, `Le titre doit contenir au moins ${LIMITS.titleMin} caractères.`)
      .max(LIMITS.titleMax, `Le titre ne doit pas dépasser ${LIMITS.titleMax} caractères.`),
    content: nonBlank('Le contenu').max(
      LIMITS.contentMax,
      `Le contenu ne doit pas dépasser ${LIMITS.contentMax} caractères.`
    ),
    type: yup
      .string()
      .required('Le type est obligatoire.')
      .oneOf([...DISCUSSION_TYPES], 'Le type doit être « question » ou « discussion ».'),
    // documentId ou slug de l'espace
    category: nonBlank('La catégorie').test(
      'category-ref',
      'La catégorie est invalide.',
      (v) => !v || DOCUMENT_ID_RE.test(v) || SLUG_RE.test(v)
    ),
  })
  .noUnknown(true, 'Champ non autorisé : ${unknown}.');

export const createReplySchema = yup
  .object({
    content: nonBlank('Le contenu de la réponse')
      .min(LIMITS.replyMin, `La réponse doit contenir au moins ${LIMITS.replyMin} caractères.`)
      .max(LIMITS.replyMax, `La réponse ne doit pas dépasser ${LIMITS.replyMax} caractères.`),
    discussion: nonBlank('La discussion').matches(DOCUMENT_ID_RE, 'La discussion est invalide.'),
  })
  .noUnknown(true, 'Champ non autorisé : ${unknown}.');

export const acceptReplySchema = yup
  .object({
    reply: nonBlank('La réponse').matches(DOCUMENT_ID_RE, 'La réponse est invalide.'),
  })
  .noUnknown(true, 'Champ non autorisé : ${unknown}.');

export const listDiscussionsQuerySchema = yup
  .object({
    page: yup.number().typeError('page doit être un nombre.').integer().min(1).default(1),
    pageSize: yup
      .number()
      .typeError('pageSize doit être un nombre.')
      .integer()
      .min(1)
      .max(LIMITS.pageSizeMax, `pageSize ne doit pas dépasser ${LIMITS.pageSizeMax}.`)
      .default(LIMITS.pageSizeDefault),
    category: yup.string().trim().matches(SLUG_RE, 'category doit être un slug valide.'),
    type: yup.string().oneOf([...DISCUSSION_TYPES]),
    status: yup.string().oneOf(['all', 'unanswered', 'solved']).default('all'),
    sort: yup
      .string()
      .oneOf(['recent', 'oldest'], 'sort doit valoir « recent » ou « oldest ».')
      .default('recent'),
    q: yup.string().trim().max(LIMITS.searchMax, `La recherche ne doit pas dépasser ${LIMITS.searchMax} caractères.`),
  })
  .noUnknown(true, 'Paramètre non autorisé : ${unknown}.');

export const listRepliesQuerySchema = yup
  .object({
    discussion: nonBlank('discussion').matches(DOCUMENT_ID_RE, 'discussion est invalide.'),
    page: yup.number().integer().min(1).default(1),
    pageSize: yup.number().integer().min(1).max(100).default(50),
  })
  .noUnknown(true, 'Paramètre non autorisé : ${unknown}.');

export interface CreateDiscussionInput {
  title: string;
  content: string;
  type: DiscussionType;
  category: string;
}
export interface CreateReplyInput {
  content: string;
  discussion: string;
}
export interface ListDiscussionsQuery {
  page: number;
  pageSize: number;
  category?: string;
  type?: DiscussionType;
  status: 'all' | 'unanswered' | 'solved';
  sort: 'recent' | 'oldest';
  q?: string;
}
export interface ListRepliesQuery {
  discussion: string;
  page: number;
  pageSize: number;
}

/**
 * Valide puis normalise une entrée.
 * - Les champs inconnus sont refusés explicitement (en mode non strict, yup se contenterait
 *   de les supprimer en silence) : un client qui envoie `replyCount` ou `isSolved` est prévenu.
 * - strict: false pour appliquer les transformations (trim, conversion des nombres).
 */
const run = async <T>(schema: any, value: unknown, message?: string): Promise<T> => {
  if (value && typeof value === 'object' && !Array.isArray(value)) {
    const known = new Set(Object.keys(schema.fields));
    const unknown = Object.keys(value).filter((key) => !known.has(key));
    if (unknown.length) {
      throw new ValidationError(message ?? 'Requête invalide.', {
        errors: unknown.map((key) => ({
          path: [key],
          message: `Champ non autorisé : ${key}.`,
          name: 'ValidationError',
          value: null,
        })),
      });
    }
  }
  return validateYupSchema(schema, { strict: false, abortEarly: false })(value, message) as Promise<T>;
};

export const validateCreateDiscussion = (data: unknown) =>
  run<CreateDiscussionInput>(createDiscussionSchema, data, 'La discussion contient des erreurs.');
export const validateCreateReply = (data: unknown) =>
  run<CreateReplyInput>(createReplySchema, data, 'La réponse contient des erreurs.');
export const validateAcceptReply = (data: unknown) => run<{ reply: string }>(acceptReplySchema, data);
export const validateListDiscussionsQuery = (query: unknown) =>
  run<ListDiscussionsQuery>(listDiscussionsQuerySchema, query ?? {}, 'Paramètres de recherche invalides.');
export const validateListRepliesQuery = (query: unknown) =>
  run<ListRepliesQuery>(listRepliesQuerySchema, query ?? {}, 'Paramètres invalides.');

/**
 * Le corps des requêtes d'écriture suit la convention Strapi : { data: { ... } }.
 */
export function extractData(body: unknown): Record<string, unknown> {
  const data = (body as { data?: unknown } | undefined)?.data;
  if (!data || typeof data !== 'object' || Array.isArray(data)) {
    throw new ValidationError('Le corps de la requête doit contenir un objet « data ».');
  }
  return { ...(data as Record<string, unknown>) };
}

/** Erreur de validation ciblant un champ précis, au même format que les erreurs yup. */
export function fieldError(path: string, message: string, summary = message) {
  return new ValidationError(summary, { errors: [{ path: [path], message, name: 'ValidationError', value: null }] });
}
