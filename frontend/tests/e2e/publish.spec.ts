import { expect, test, type Page } from '@playwright/test';

async function loginAs(page: Page, email: string, redirect = '/') {
  await page.goto(`/connexion?redirect=${encodeURIComponent(redirect)}`);
  await page.getByLabel('Adresse e-mail').fill(email);
  await page.getByLabel('Mot de passe').fill('Demo1234!');
  await page.getByRole('button', { name: 'Se connecter' }).click();
}

test.describe('Publication', () => {
  test('un visiteur ne peut pas publier : redirection vers la connexion', async ({ page }) => {
    await page.goto('/discussions/ouvrir-un-pea-avec-5-000-eur-par-ou-commencer');
    await expect(page.getByRole('link', { name: 'Se connecter pour répondre' })).toBeVisible();
    await expect(page.getByRole('form', { name: 'Répondre à la discussion' })).toHaveCount(0);

    await page.goto('/nouvelle-discussion?espace=bourse');
    await expect(page).toHaveURL(/\/connexion\?redirect=/);
  });

  test('mauvais mot de passe : message d’erreur', async ({ page }) => {
    await page.goto('/connexion');
    await page.getByLabel('Adresse e-mail').fill('camille.b@demo.lerevenu.fr');
    await page.getByLabel('Mot de passe').fill('mauvais');
    await page.getByRole('button', { name: 'Se connecter' }).click();
    await expect(page.getByRole('alert').filter({ hasText: 'incorrect' })).toHaveText('Adresse e-mail ou mot de passe incorrect.');
  });

  test('créer une discussion puis y répondre', async ({ page }) => {
    const stamp = Date.now().toString(36);
    const title = `Test e2e ${stamp} : PEA ou assurance-vie ?`;

    await loginAs(page, 'camille.b@demo.lerevenu.fr', '/nouvelle-discussion?espace=epargne');
    await expect(page).toHaveURL(/\/nouvelle-discussion/);
    await expect(page.getByTestId('current-user')).toHaveText('Camille');
    await expect(page.getByLabel('Espace')).toHaveValue(/.+/); // espace présélectionné

    // Erreurs de validation
    await page.getByLabel('Titre').fill('Trop');
    await page.getByRole('button', { name: 'Publier' }).click();
    await expect(page.getByText('Le titre doit contenir au moins 10 caractères.')).toBeVisible();
    await expect(page.getByText('Le contenu est obligatoire.')).toBeVisible();

    // Saisie valide
    await page.getByLabel('Lancer une discussion').check({ force: true });
    await page.getByLabel('Titre').fill(title);
    await page.getByLabel('Détails').fill('Je dispose de **20 000 €** :\n- horizon 10 ans\n- prêt à accepter un peu de risque');
    await page.getByRole('button', { name: 'Publier' }).click();

    // Redirection vers la nouvelle discussion (URL propre)
    await expect(page).toHaveURL(new RegExp(`/discussions/test-e2e-${stamp}-pea-ou-assurance-vie$`));
    await expect(page.getByRole('heading', { level: 1 })).toHaveText(title);
    await expect(page.locator('strong', { hasText: '20 000 €' })).toBeVisible();
    await expect(page.getByRole('heading', { name: 'Aucune réponse pour l’instant' })).toBeVisible();

    // Réponse
    await page.getByLabel('Votre réponse').fill('Merci pour vos retours, je complète ma question.');
    await page.getByRole('button', { name: 'Publier ma réponse' }).click();
    await expect(page.getByRole('heading', { name: '1 réponse' })).toBeVisible();
    await expect(page.getByTestId('reply')).toContainText('Merci pour vos retours');
    await expect(page.getByLabel('Votre réponse')).toHaveValue('');

    // La discussion apparaît en tête du fil
    await page.goto('/');
    await expect(page.getByTestId('discussion-card').filter({ visible: true }).first()).toContainText(title);
  });

  test('l’auteur d’une question choisit la meilleure réponse', async ({ page, browser }) => {
    const stamp = Date.now().toString(36);
    await loginAs(page, 'camille.b@demo.lerevenu.fr', '/nouvelle-discussion?espace=impots');
    await page.getByLabel('Titre').fill(`Question e2e ${stamp} sur la flat tax`);
    await page.getByLabel('Détails').fill('Flat tax ou barème pour mes dividendes ?');
    await page.getByRole('button', { name: 'Publier' }).click();
    await expect(page).toHaveURL(/\/discussions\/question-e2e-/);
    const url = page.url();

    // Un autre membre répond
    const other = await browser.newPage();
    await loginAs(other, 'vincent.etf@demo.lerevenu.fr', new URL(url).pathname);
    await other.getByLabel('Votre réponse').fill('Comparez avec votre TMI : sous 30 %, le barème est souvent plus favorable.');
    await other.getByRole('button', { name: 'Publier ma réponse' }).click();
    await expect(other.getByTestId('reply')).toHaveCount(1);
    // Il ne voit pas le bouton réservé à l'auteur
    await expect(other.getByRole('button', { name: 'Choisir comme meilleure réponse' })).toHaveCount(0);
    await other.close();

    await page.reload();
    await page.getByRole('button', { name: 'Choisir comme meilleure réponse' }).click();
    await expect(page.getByTestId('reply').getByText('Meilleure réponse')).toBeVisible();
    await expect(page.getByText('Résolu', { exact: true }).first()).toBeVisible();
  });
});
