/**
 * Formats d'affichage (français) : dates relatives comme dans la maquette, pluriels.
 */
const dateFmt = new Intl.DateTimeFormat('fr-FR', { day: 'numeric', month: 'long', year: 'numeric' });
const dateTimeFmt = new Intl.DateTimeFormat('fr-FR', {
  day: 'numeric',
  month: 'long',
  year: 'numeric',
  hour: '2-digit',
  minute: '2-digit',
  timeZone: 'Europe/Paris',
});

export function timeAgo(iso: string, now: number = Date.now()): string {
  const minutes = (now - new Date(iso).getTime()) / 60_000;
  if (minutes < 1) return 'à l’instant';
  if (minutes < 60) return `il y a ${Math.round(minutes)} min`;
  const hours = Math.round(minutes / 60);
  if (hours < 24) return `il y a ${hours} h`;
  const days = Math.round(hours / 24);
  if (days === 1) return 'hier';
  if (days < 30) return `il y a ${days} j`;
  return `le ${dateFmt.format(new Date(iso))}`;
}

/** Publié il y a moins de `hours` heures (étiquette « Nouveau »). */
export const isWithinHours = (iso: string, hours: number, now: number = Date.now()) =>
  now - new Date(iso).getTime() < hours * 3600_000;

export const fullDate = (iso: string) => dateTimeFmt.format(new Date(iso));

export const plural = (n: number, singular: string, pluralForm = `${singular}s`) =>
  `${n} ${n > 1 ? pluralForm : singular}`;

export function initials(name: string, role?: string): string {
  if (role === 'redaction') return 'R';
  return name
    .split(/\s+/)
    .filter(Boolean)
    .map((w) => w[0])
    .slice(0, 2)
    .join('')
    .toUpperCase();
}
