import { expect, test } from '@playwright/test';

// Next.js conserve la page précédente masquée (React Activity) : on ne compte que les cartes visibles.
const visibleCards = (page: import('@playwright/test').Page) => page.getByTestId('discussion-card').filter({ visible: true });

test.describe('Affichage des discussions', () => {
  test('l’accueil liste les discussions issues de Strapi', async ({ page }) => {
    await page.goto('/');
    await expect(page.getByRole('heading', { name: 'La communauté des lecteurs du Revenu' })).toBeVisible();
    const cards = visibleCards(page);
    await expect(cards).toHaveCount(10);
    // Titre, catégorie, auteur, date et nombre de réponses
    const pea = cards.filter({ hasText: 'Ouvrir un PEA avec 5 000 €' });
    await expect(pea).toHaveCount(0); // plus ancienne : pas en première page
    await expect(cards.first().locator('time')).toBeVisible();
    await expect(page.getByRole('navigation', { name: 'Pagination' })).toBeVisible();
  });

  test('filtre par catégorie et tri par date', async ({ page, isMobile }) => {
    await page.goto('/');
    if (isMobile) {
      await page.getByRole('navigation', { name: 'Espaces' }).getByRole('link', { name: 'Bourse & actions' }).click();
    } else {
      await page.getByRole('navigation', { name: 'Navigation principale' }).getByRole('link', { name: 'Bourse & actions' }).click();
    }
    await expect(page).toHaveURL(/\/espaces\/bourse$/);
    await expect(page.getByRole('heading', { level: 1, name: 'Bourse & actions' })).toBeVisible();
    const categories = visibleCards(page).getByRole('link', { name: 'Bourse & actions' });
    const count = await categories.count();
    expect(count).toBeGreaterThan(0);
    await expect(visibleCards(page)).toHaveCount(count);

    const firstRecent = await visibleCards(page).first().getByRole('heading').innerText();
    await page.getByRole('link', { name: 'Anciennes' }).click();
    await expect(page).toHaveURL(/tri=anciennes/);
    await expect(visibleCards(page).last().getByRole('heading')).toHaveText(firstRecent);
  });

  test('navigation vers le détail d’une discussion', async ({ page }) => {
    await page.goto('/espaces/bourse?tri=anciennes');
    await page.getByRole('link', { name: 'Ouvrir un PEA avec 5 000 € : par où commencer ?' }).click();
    await expect(page).toHaveURL(/\/discussions\/ouvrir-un-pea-avec-5-000-eur-par-ou-commencer$/);
    await expect(page.getByRole('heading', { level: 1 })).toHaveText('Ouvrir un PEA avec 5 000 € : par où commencer ?');
    await expect(page.getByRole('heading', { name: '4 réponses' })).toBeVisible();
    await expect(page.getByTestId('reply')).toHaveCount(4);
    await expect(page.getByText('Meilleure réponse').first()).toBeVisible();
  });

  test('recherche de discussions', async ({ page }) => {
    await page.goto('/?q=SCPI');
    await expect(page.getByRole('status').filter({ hasText: 'pour « SCPI »' })).toBeVisible();
    await expect(visibleCards(page).first()).toContainText(/SCPI/);
  });

  test('page introuvable', async ({ page }) => {
    await page.goto('/discussions/cette-discussion-n-existe-pas');
    await expect(page.getByRole('heading', { name: 'Page introuvable' })).toBeVisible();
  });
});
