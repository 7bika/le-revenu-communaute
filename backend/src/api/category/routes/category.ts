import { factories } from '@strapi/strapi';

/** Lecture seule via les endpoints natifs : les espaces sont gérés dans le back-office. */
export default factories.createCoreRouter('api::category.category', {
  only: ['find', 'findOne'],
});
