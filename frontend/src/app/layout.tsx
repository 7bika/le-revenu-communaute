import type { Metadata, Viewport } from 'next';
import '@fontsource/playfair-display/700.css';
import '@fontsource/playfair-display/900.css';
import '@fontsource/inter/400.css';
import '@fontsource/inter/500.css';
import '@fontsource/inter/600.css';
import '@fontsource/inter/700.css';
import './globals.css';
import { Header } from '@/components/Header';
import { MobileNav } from '@/components/MobileNav';
import { SiteBar } from '@/components/SiteBar';

export const metadata: Metadata = {
  title: { default: 'Communauté Le Revenu', template: '%s · Communauté Le Revenu' },
  description:
    'Posez vos questions d’argent, partagez vos expériences et échangez avec la rédaction du Revenu : Bourse, épargne, impôts, retraite, transmission.',
};

export const viewport: Viewport = {
  themeColor: [
    { media: '(prefers-color-scheme: light)', color: '#f5f5f7' },
    { media: '(prefers-color-scheme: dark)', color: '#161618' },
  ],
};

export default function RootLayout({ children }: Readonly<{ children: React.ReactNode }>) {
  return (
    <html lang="fr">
      <body>
        <a href="#contenu" className="sr-only focus:not-sr-only focus:fixed focus:top-2 focus:left-2 focus:z-50 focus:rounded-lg focus:bg-surface focus:px-3 focus:py-2">
          Aller au contenu
        </a>
        <SiteBar />
        <Header />
        <div className="mx-auto max-w-[1260px] px-4">{children}</div>
        <MobileNav />
      </body>
    </html>
  );
}
