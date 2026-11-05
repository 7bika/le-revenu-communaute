/** Contexte Koa reçu par les policies (le type Core.PolicyContext de Strapi ne déclare pas `state`). */
export interface PolicyContext {
  state: { user?: { id: number; documentId: string } };
  params?: Record<string, string>;
  request: { body?: any };
}
