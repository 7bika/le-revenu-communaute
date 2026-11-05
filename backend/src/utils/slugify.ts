/**
 * Transforme un titre en segment d'URL lisible :
 * « J'ai 25 ans et 10 000 € de côté ! » -> « j-ai-25-ans-et-10-000-eur-de-cote »
 */
export function slugify(input: string, maxLength = 80): string {
  const slug = input
    .replace(/€/g, ' eur ')
    .replace(/%/g, ' pourcent ')
    .replace(/&/g, ' et ')
    .normalize('NFD')
    .replace(/[̀-ͯ]/g, '')
    .replace(/[œŒ]/g, 'oe')
    .replace(/[æÆ]/g, 'ae')
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '');

  if (slug.length <= maxLength) return slug || 'discussion';
  const cut = slug.slice(0, maxLength);
  // On coupe sur la fin d'un mot quand c'est possible
  const lastDash = cut.lastIndexOf('-');
  return (lastDash > maxLength / 2 ? cut.slice(0, lastDash) : cut).replace(/-+$/g, '');
}
