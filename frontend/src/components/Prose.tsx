import { Fragment, type ReactNode } from 'react';

/**
 * Mise en forme légère du texte saisi par les membres, sans HTML brut (pas de risque XSS) :
 * paragraphes (ligne vide), listes (« - »), gras (**…**) et mentions (@pseudo).
 */
function inline(text: string, key: string): ReactNode[] {
  return text.split(/(\*\*[^*]+\*\*|(?:^|(?<=[\s(]))@[A-Za-z0-9_-]+(?:\.[A-Za-z0-9_-]+)*)/g).map((part, i) => {
    if (!part) return null;
    if (part.startsWith('**') && part.endsWith('**') && part.length > 4) {
      return <strong key={`${key}-${i}`}>{part.slice(2, -2)}</strong>;
    }
    if (/^@[A-Za-z0-9_-]+(?:\.[A-Za-z0-9_-]+)*$/.test(part)) {
      return (
        <span key={`${key}-${i}`} className="mention">
          {part}
        </span>
      );
    }
    return <Fragment key={`${key}-${i}`}>{part}</Fragment>;
  });
}

function withBreaks(lines: string[], key: string) {
  return lines.map((line, i) => (
    <Fragment key={`${key}-l${i}`}>
      {i > 0 && <br />}
      {inline(line, `${key}-l${i}`)}
    </Fragment>
  ));
}

export function Prose({ text, className = '' }: { text: string; className?: string }) {
  const blocks = text.trim().split(/\n{2,}/);
  return (
    <div className={`prose-lr ${className}`}>
      {blocks.map((block, b) => {
        const lines = block.split('\n');
        const items = lines.filter((l) => /^- /.test(l));
        const rest = lines.filter((l) => !/^- /.test(l));
        return (
          <Fragment key={b}>
            {rest.length > 0 && <p>{withBreaks(rest, `b${b}`)}</p>}
            {items.length > 0 && (
              <ul>
                {items.map((item, i) => (
                  <li key={i}>{inline(item.slice(2), `b${b}-i${i}`)}</li>
                ))}
              </ul>
            )}
          </Fragment>
        );
      })}
    </div>
  );
}
