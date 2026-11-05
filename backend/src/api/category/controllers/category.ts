import { factories } from '@strapi/strapi';

// Contrôleur natif : find/findOne avec filtres, tri, champs et pagination standards de Strapi.
export default factories.createCoreController('api::category.category');
