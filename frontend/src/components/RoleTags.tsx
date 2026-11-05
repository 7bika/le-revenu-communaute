import { Icon } from './Icon';
import type { Author } from '@/lib/types';

/** Étiquettes affichées à côté du nom : Rédaction, Expertise vérifiée, Abonné. */
export function RoleTags({ author }: { author: Author | null }) {
  if (!author) return null;
  if (author.communityRole === 'redaction') {
    return (
      <span className="tag tag-redac">
        <Icon name="check" />
        Rédaction
      </span>
    );
  }
  return (
    <>
      {author.communityRole === 'expert' && (
        <span className="tag tag-pro">
          <Icon name="verified" />
          Expertise vérifiée
        </span>
      )}
      {author.isSubscriber && <span className="tag tag-sub">Abonné</span>}
    </>
  );
}
