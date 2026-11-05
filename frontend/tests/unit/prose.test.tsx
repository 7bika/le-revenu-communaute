import { describe, expect, test } from 'vitest';
import { renderToStaticMarkup } from 'react-dom/server';
import { Prose } from '@/components/Prose';

const html = (text: string) => renderToStaticMarkup(<Prose text={text} />);

describe('mise en forme du texte des membres', () => {
  test('paragraphes, gras, listes et mentions', () => {
    const out = html('Bonjour **tout le monde**\n\n- PEA\n- Assurance-vie\n\nMerci @Vincent_ETF.');
    expect(out).toContain('<strong>tout le monde</strong>');
    expect(out).toContain('<ul><li>PEA</li><li>Assurance-vie</li></ul>');
    expect(out).toContain('<span class="mention">@Vincent_ETF</span>.');
  });

  test('le HTML saisi est échappé (pas d’injection)', () => {
    const out = html('<img src=x onerror=alert(1)> <script>alert(1)</script>');
    expect(out).not.toContain('<img');
    expect(out).not.toContain('<script>');
    expect(out).toContain('&lt;script&gt;');
  });
});
