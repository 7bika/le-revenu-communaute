--
-- PostgreSQL database dump
--

\restrict yEw1ACAXbmbqyPuKnDEW7g5ygJtj2kL11IAWaQ20PavVpsRsZeFXgKcLl8LnVR7

-- Dumped from database version 16.15 (Ubuntu 16.15-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.15 (Ubuntu 16.15-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.upload_folders DROP CONSTRAINT IF EXISTS upload_folders_updated_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.upload_folders_parent_lnk DROP CONSTRAINT IF EXISTS upload_folders_parent_lnk_ifk;
ALTER TABLE IF EXISTS ONLY public.upload_folders_parent_lnk DROP CONSTRAINT IF EXISTS upload_folders_parent_lnk_fk;
ALTER TABLE IF EXISTS ONLY public.upload_folders DROP CONSTRAINT IF EXISTS upload_folders_created_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.up_users DROP CONSTRAINT IF EXISTS up_users_updated_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.up_users_role_lnk DROP CONSTRAINT IF EXISTS up_users_role_lnk_ifk;
ALTER TABLE IF EXISTS ONLY public.up_users_role_lnk DROP CONSTRAINT IF EXISTS up_users_role_lnk_fk;
ALTER TABLE IF EXISTS ONLY public.up_users DROP CONSTRAINT IF EXISTS up_users_created_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.up_roles DROP CONSTRAINT IF EXISTS up_roles_updated_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.up_roles DROP CONSTRAINT IF EXISTS up_roles_created_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.up_permissions DROP CONSTRAINT IF EXISTS up_permissions_updated_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.up_permissions_role_lnk DROP CONSTRAINT IF EXISTS up_permissions_role_lnk_ifk;
ALTER TABLE IF EXISTS ONLY public.up_permissions_role_lnk DROP CONSTRAINT IF EXISTS up_permissions_role_lnk_fk;
ALTER TABLE IF EXISTS ONLY public.up_permissions DROP CONSTRAINT IF EXISTS up_permissions_created_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.strapi_workflows DROP CONSTRAINT IF EXISTS strapi_workflows_updated_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.strapi_workflows_stages_workflow_lnk DROP CONSTRAINT IF EXISTS strapi_workflows_stages_workflow_lnk_ifk;
ALTER TABLE IF EXISTS ONLY public.strapi_workflows_stages_workflow_lnk DROP CONSTRAINT IF EXISTS strapi_workflows_stages_workflow_lnk_fk;
ALTER TABLE IF EXISTS ONLY public.strapi_workflows_stages DROP CONSTRAINT IF EXISTS strapi_workflows_stages_updated_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.strapi_workflows_stages_permissions_lnk DROP CONSTRAINT IF EXISTS strapi_workflows_stages_permissions_lnk_ifk;
ALTER TABLE IF EXISTS ONLY public.strapi_workflows_stages_permissions_lnk DROP CONSTRAINT IF EXISTS strapi_workflows_stages_permissions_lnk_fk;
ALTER TABLE IF EXISTS ONLY public.strapi_workflows_stages DROP CONSTRAINT IF EXISTS strapi_workflows_stages_created_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.strapi_workflows_stage_required_to_publish_lnk DROP CONSTRAINT IF EXISTS strapi_workflows_stage_required_to_publish_lnk_ifk;
ALTER TABLE IF EXISTS ONLY public.strapi_workflows_stage_required_to_publish_lnk DROP CONSTRAINT IF EXISTS strapi_workflows_stage_required_to_publish_lnk_fk;
ALTER TABLE IF EXISTS ONLY public.strapi_workflows DROP CONSTRAINT IF EXISTS strapi_workflows_created_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.strapi_transfer_tokens DROP CONSTRAINT IF EXISTS strapi_transfer_tokens_updated_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.strapi_transfer_tokens DROP CONSTRAINT IF EXISTS strapi_transfer_tokens_created_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.strapi_transfer_token_permissions DROP CONSTRAINT IF EXISTS strapi_transfer_token_permissions_updated_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.strapi_transfer_token_permissions_token_lnk DROP CONSTRAINT IF EXISTS strapi_transfer_token_permissions_token_lnk_ifk;
ALTER TABLE IF EXISTS ONLY public.strapi_transfer_token_permissions_token_lnk DROP CONSTRAINT IF EXISTS strapi_transfer_token_permissions_token_lnk_fk;
ALTER TABLE IF EXISTS ONLY public.strapi_transfer_token_permissions DROP CONSTRAINT IF EXISTS strapi_transfer_token_permissions_created_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.strapi_sessions DROP CONSTRAINT IF EXISTS strapi_sessions_updated_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.strapi_sessions DROP CONSTRAINT IF EXISTS strapi_sessions_created_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.strapi_releases DROP CONSTRAINT IF EXISTS strapi_releases_updated_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.strapi_releases DROP CONSTRAINT IF EXISTS strapi_releases_created_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.strapi_release_actions DROP CONSTRAINT IF EXISTS strapi_release_actions_updated_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.strapi_release_actions_release_lnk DROP CONSTRAINT IF EXISTS strapi_release_actions_release_lnk_ifk;
ALTER TABLE IF EXISTS ONLY public.strapi_release_actions_release_lnk DROP CONSTRAINT IF EXISTS strapi_release_actions_release_lnk_fk;
ALTER TABLE IF EXISTS ONLY public.strapi_release_actions DROP CONSTRAINT IF EXISTS strapi_release_actions_created_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.strapi_history_versions DROP CONSTRAINT IF EXISTS strapi_history_versions_created_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.strapi_api_tokens DROP CONSTRAINT IF EXISTS strapi_api_tokens_updated_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.strapi_api_tokens DROP CONSTRAINT IF EXISTS strapi_api_tokens_created_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.strapi_api_tokens_admin_user_owner_lnk DROP CONSTRAINT IF EXISTS strapi_api_tokens_admin_user_owner_lnk_ifk;
ALTER TABLE IF EXISTS ONLY public.strapi_api_tokens_admin_user_owner_lnk DROP CONSTRAINT IF EXISTS strapi_api_tokens_admin_user_owner_lnk_fk;
ALTER TABLE IF EXISTS ONLY public.strapi_api_token_permissions DROP CONSTRAINT IF EXISTS strapi_api_token_permissions_updated_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.strapi_api_token_permissions_token_lnk DROP CONSTRAINT IF EXISTS strapi_api_token_permissions_token_lnk_ifk;
ALTER TABLE IF EXISTS ONLY public.strapi_api_token_permissions_token_lnk DROP CONSTRAINT IF EXISTS strapi_api_token_permissions_token_lnk_fk;
ALTER TABLE IF EXISTS ONLY public.strapi_api_token_permissions DROP CONSTRAINT IF EXISTS strapi_api_token_permissions_created_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.replies DROP CONSTRAINT IF EXISTS replies_updated_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.replies_discussion_lnk DROP CONSTRAINT IF EXISTS replies_discussion_lnk_ifk;
ALTER TABLE IF EXISTS ONLY public.replies_discussion_lnk DROP CONSTRAINT IF EXISTS replies_discussion_lnk_fk;
ALTER TABLE IF EXISTS ONLY public.replies DROP CONSTRAINT IF EXISTS replies_created_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.replies_author_lnk DROP CONSTRAINT IF EXISTS replies_author_lnk_ifk;
ALTER TABLE IF EXISTS ONLY public.replies_author_lnk DROP CONSTRAINT IF EXISTS replies_author_lnk_fk;
ALTER TABLE IF EXISTS ONLY public.i18n_locale DROP CONSTRAINT IF EXISTS i18n_locale_updated_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.i18n_locale DROP CONSTRAINT IF EXISTS i18n_locale_created_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.files DROP CONSTRAINT IF EXISTS files_updated_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.files_related_mph DROP CONSTRAINT IF EXISTS files_related_mph_fk;
ALTER TABLE IF EXISTS ONLY public.files_folder_lnk DROP CONSTRAINT IF EXISTS files_folder_lnk_ifk;
ALTER TABLE IF EXISTS ONLY public.files_folder_lnk DROP CONSTRAINT IF EXISTS files_folder_lnk_fk;
ALTER TABLE IF EXISTS ONLY public.files DROP CONSTRAINT IF EXISTS files_created_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.discussions DROP CONSTRAINT IF EXISTS discussions_updated_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.discussions DROP CONSTRAINT IF EXISTS discussions_created_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.discussions_category_lnk DROP CONSTRAINT IF EXISTS discussions_category_lnk_ifk;
ALTER TABLE IF EXISTS ONLY public.discussions_category_lnk DROP CONSTRAINT IF EXISTS discussions_category_lnk_fk;
ALTER TABLE IF EXISTS ONLY public.discussions_author_lnk DROP CONSTRAINT IF EXISTS discussions_author_lnk_ifk;
ALTER TABLE IF EXISTS ONLY public.discussions_author_lnk DROP CONSTRAINT IF EXISTS discussions_author_lnk_fk;
ALTER TABLE IF EXISTS ONLY public.categories DROP CONSTRAINT IF EXISTS categories_updated_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.categories DROP CONSTRAINT IF EXISTS categories_created_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.admin_users DROP CONSTRAINT IF EXISTS admin_users_updated_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.admin_users_roles_lnk DROP CONSTRAINT IF EXISTS admin_users_roles_lnk_ifk;
ALTER TABLE IF EXISTS ONLY public.admin_users_roles_lnk DROP CONSTRAINT IF EXISTS admin_users_roles_lnk_fk;
ALTER TABLE IF EXISTS ONLY public.admin_users DROP CONSTRAINT IF EXISTS admin_users_created_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.admin_roles DROP CONSTRAINT IF EXISTS admin_roles_updated_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.admin_roles DROP CONSTRAINT IF EXISTS admin_roles_created_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.admin_permissions DROP CONSTRAINT IF EXISTS admin_permissions_updated_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.admin_permissions_role_lnk DROP CONSTRAINT IF EXISTS admin_permissions_role_lnk_ifk;
ALTER TABLE IF EXISTS ONLY public.admin_permissions_role_lnk DROP CONSTRAINT IF EXISTS admin_permissions_role_lnk_fk;
ALTER TABLE IF EXISTS ONLY public.admin_permissions DROP CONSTRAINT IF EXISTS admin_permissions_created_by_id_fk;
ALTER TABLE IF EXISTS ONLY public.admin_permissions_api_token_lnk DROP CONSTRAINT IF EXISTS admin_permissions_api_token_lnk_ifk;
ALTER TABLE IF EXISTS ONLY public.admin_permissions_api_token_lnk DROP CONSTRAINT IF EXISTS admin_permissions_api_token_lnk_fk;
DROP INDEX IF EXISTS public.upload_folders_updated_by_id_fk;
DROP INDEX IF EXISTS public.upload_folders_parent_lnk_oifk;
DROP INDEX IF EXISTS public.upload_folders_parent_lnk_ifk;
DROP INDEX IF EXISTS public.upload_folders_parent_lnk_fk;
DROP INDEX IF EXISTS public.upload_folders_documents_idx;
DROP INDEX IF EXISTS public.upload_folders_created_by_id_fk;
DROP INDEX IF EXISTS public.upload_files_updated_at_index;
DROP INDEX IF EXISTS public.upload_files_size_index;
DROP INDEX IF EXISTS public.upload_files_name_index;
DROP INDEX IF EXISTS public.upload_files_folder_path_index;
DROP INDEX IF EXISTS public.upload_files_ext_index;
DROP INDEX IF EXISTS public.upload_files_created_at_index;
DROP INDEX IF EXISTS public.up_users_updated_by_id_fk;
DROP INDEX IF EXISTS public.up_users_role_lnk_oifk;
DROP INDEX IF EXISTS public.up_users_role_lnk_ifk;
DROP INDEX IF EXISTS public.up_users_role_lnk_fk;
DROP INDEX IF EXISTS public.up_users_documents_idx;
DROP INDEX IF EXISTS public.up_users_created_by_id_fk;
DROP INDEX IF EXISTS public.up_roles_updated_by_id_fk;
DROP INDEX IF EXISTS public.up_roles_documents_idx;
DROP INDEX IF EXISTS public.up_roles_created_by_id_fk;
DROP INDEX IF EXISTS public.up_permissions_updated_by_id_fk;
DROP INDEX IF EXISTS public.up_permissions_role_lnk_oifk;
DROP INDEX IF EXISTS public.up_permissions_role_lnk_ifk;
DROP INDEX IF EXISTS public.up_permissions_role_lnk_fk;
DROP INDEX IF EXISTS public.up_permissions_documents_idx;
DROP INDEX IF EXISTS public.up_permissions_created_by_id_fk;
DROP INDEX IF EXISTS public.strapi_workflows_updated_by_id_fk;
DROP INDEX IF EXISTS public.strapi_workflows_stages_workflow_lnk_oifk;
DROP INDEX IF EXISTS public.strapi_workflows_stages_workflow_lnk_ifk;
DROP INDEX IF EXISTS public.strapi_workflows_stages_workflow_lnk_fk;
DROP INDEX IF EXISTS public.strapi_workflows_stages_updated_by_id_fk;
DROP INDEX IF EXISTS public.strapi_workflows_stages_permissions_lnk_ofk;
DROP INDEX IF EXISTS public.strapi_workflows_stages_permissions_lnk_ifk;
DROP INDEX IF EXISTS public.strapi_workflows_stages_permissions_lnk_fk;
DROP INDEX IF EXISTS public.strapi_workflows_stages_documents_idx;
DROP INDEX IF EXISTS public.strapi_workflows_stages_created_by_id_fk;
DROP INDEX IF EXISTS public.strapi_workflows_stage_required_to_publish_lnk_ifk;
DROP INDEX IF EXISTS public.strapi_workflows_stage_required_to_publish_lnk_fk;
DROP INDEX IF EXISTS public.strapi_workflows_documents_idx;
DROP INDEX IF EXISTS public.strapi_workflows_created_by_id_fk;
DROP INDEX IF EXISTS public.strapi_transfer_tokens_updated_by_id_fk;
DROP INDEX IF EXISTS public.strapi_transfer_tokens_documents_idx;
DROP INDEX IF EXISTS public.strapi_transfer_tokens_created_by_id_fk;
DROP INDEX IF EXISTS public.strapi_transfer_token_permissions_updated_by_id_fk;
DROP INDEX IF EXISTS public.strapi_transfer_token_permissions_token_lnk_oifk;
DROP INDEX IF EXISTS public.strapi_transfer_token_permissions_token_lnk_ifk;
DROP INDEX IF EXISTS public.strapi_transfer_token_permissions_token_lnk_fk;
DROP INDEX IF EXISTS public.strapi_transfer_token_permissions_documents_idx;
DROP INDEX IF EXISTS public.strapi_transfer_token_permissions_created_by_id_fk;
DROP INDEX IF EXISTS public.strapi_sessions_updated_by_id_fk;
DROP INDEX IF EXISTS public.strapi_sessions_documents_idx;
DROP INDEX IF EXISTS public.strapi_sessions_created_by_id_fk;
DROP INDEX IF EXISTS public.strapi_releases_updated_by_id_fk;
DROP INDEX IF EXISTS public.strapi_releases_documents_idx;
DROP INDEX IF EXISTS public.strapi_releases_created_by_id_fk;
DROP INDEX IF EXISTS public.strapi_release_actions_updated_by_id_fk;
DROP INDEX IF EXISTS public.strapi_release_actions_release_lnk_oifk;
DROP INDEX IF EXISTS public.strapi_release_actions_release_lnk_ifk;
DROP INDEX IF EXISTS public.strapi_release_actions_release_lnk_fk;
DROP INDEX IF EXISTS public.strapi_release_actions_documents_idx;
DROP INDEX IF EXISTS public.strapi_release_actions_created_by_id_fk;
DROP INDEX IF EXISTS public.strapi_history_versions_created_by_id_fk;
DROP INDEX IF EXISTS public.strapi_api_tokens_updated_by_id_fk;
DROP INDEX IF EXISTS public.strapi_api_tokens_documents_idx;
DROP INDEX IF EXISTS public.strapi_api_tokens_created_by_id_fk;
DROP INDEX IF EXISTS public.strapi_api_tokens_admin_user_owner_lnk_oifk;
DROP INDEX IF EXISTS public.strapi_api_tokens_admin_user_owner_lnk_ifk;
DROP INDEX IF EXISTS public.strapi_api_tokens_admin_user_owner_lnk_fk;
DROP INDEX IF EXISTS public.strapi_api_token_permissions_updated_by_id_fk;
DROP INDEX IF EXISTS public.strapi_api_token_permissions_token_lnk_oifk;
DROP INDEX IF EXISTS public.strapi_api_token_permissions_token_lnk_ifk;
DROP INDEX IF EXISTS public.strapi_api_token_permissions_token_lnk_fk;
DROP INDEX IF EXISTS public.strapi_api_token_permissions_documents_idx;
DROP INDEX IF EXISTS public.strapi_api_token_permissions_created_by_id_fk;
DROP INDEX IF EXISTS public.replies_updated_by_id_fk;
DROP INDEX IF EXISTS public.replies_documents_idx;
DROP INDEX IF EXISTS public.replies_discussion_lnk_oifk;
DROP INDEX IF EXISTS public.replies_discussion_lnk_ifk;
DROP INDEX IF EXISTS public.replies_discussion_lnk_fk;
DROP INDEX IF EXISTS public.replies_created_by_id_fk;
DROP INDEX IF EXISTS public.replies_created_at_idx;
DROP INDEX IF EXISTS public.replies_author_lnk_ifk;
DROP INDEX IF EXISTS public.replies_author_lnk_fk;
DROP INDEX IF EXISTS public.i18n_locale_updated_by_id_fk;
DROP INDEX IF EXISTS public.i18n_locale_documents_idx;
DROP INDEX IF EXISTS public.i18n_locale_created_by_id_fk;
DROP INDEX IF EXISTS public.files_updated_by_id_fk;
DROP INDEX IF EXISTS public.files_related_mph_oidx;
DROP INDEX IF EXISTS public.files_related_mph_idix;
DROP INDEX IF EXISTS public.files_related_mph_fk;
DROP INDEX IF EXISTS public.files_folder_lnk_oifk;
DROP INDEX IF EXISTS public.files_folder_lnk_ifk;
DROP INDEX IF EXISTS public.files_folder_lnk_fk;
DROP INDEX IF EXISTS public.files_documents_idx;
DROP INDEX IF EXISTS public.files_created_by_id_fk;
DROP INDEX IF EXISTS public.discussions_updated_by_id_fk;
DROP INDEX IF EXISTS public.discussions_slug_uniq;
DROP INDEX IF EXISTS public.discussions_reply_count_idx;
DROP INDEX IF EXISTS public.discussions_documents_idx;
DROP INDEX IF EXISTS public.discussions_created_by_id_fk;
DROP INDEX IF EXISTS public.discussions_created_at_idx;
DROP INDEX IF EXISTS public.discussions_category_lnk_oifk;
DROP INDEX IF EXISTS public.discussions_category_lnk_ifk;
DROP INDEX IF EXISTS public.discussions_category_lnk_fk;
DROP INDEX IF EXISTS public.discussions_author_lnk_ifk;
DROP INDEX IF EXISTS public.discussions_author_lnk_fk;
DROP INDEX IF EXISTS public.categories_updated_by_id_fk;
DROP INDEX IF EXISTS public.categories_slug_uniq;
DROP INDEX IF EXISTS public.categories_documents_idx;
DROP INDEX IF EXISTS public.categories_created_by_id_fk;
DROP INDEX IF EXISTS public.admin_users_updated_by_id_fk;
DROP INDEX IF EXISTS public.admin_users_roles_lnk_oifk;
DROP INDEX IF EXISTS public.admin_users_roles_lnk_ofk;
DROP INDEX IF EXISTS public.admin_users_roles_lnk_ifk;
DROP INDEX IF EXISTS public.admin_users_roles_lnk_fk;
DROP INDEX IF EXISTS public.admin_users_documents_idx;
DROP INDEX IF EXISTS public.admin_users_created_by_id_fk;
DROP INDEX IF EXISTS public.admin_roles_updated_by_id_fk;
DROP INDEX IF EXISTS public.admin_roles_documents_idx;
DROP INDEX IF EXISTS public.admin_roles_created_by_id_fk;
DROP INDEX IF EXISTS public.admin_permissions_updated_by_id_fk;
DROP INDEX IF EXISTS public.admin_permissions_role_lnk_oifk;
DROP INDEX IF EXISTS public.admin_permissions_role_lnk_ifk;
DROP INDEX IF EXISTS public.admin_permissions_role_lnk_fk;
DROP INDEX IF EXISTS public.admin_permissions_documents_idx;
DROP INDEX IF EXISTS public.admin_permissions_created_by_id_fk;
DROP INDEX IF EXISTS public.admin_permissions_api_token_lnk_oifk;
DROP INDEX IF EXISTS public.admin_permissions_api_token_lnk_ifk;
DROP INDEX IF EXISTS public.admin_permissions_api_token_lnk_fk;
ALTER TABLE IF EXISTS ONLY public.upload_folders DROP CONSTRAINT IF EXISTS upload_folders_pkey;
ALTER TABLE IF EXISTS ONLY public.upload_folders DROP CONSTRAINT IF EXISTS upload_folders_path_index;
ALTER TABLE IF EXISTS ONLY public.upload_folders DROP CONSTRAINT IF EXISTS upload_folders_path_id_index;
ALTER TABLE IF EXISTS ONLY public.upload_folders_parent_lnk DROP CONSTRAINT IF EXISTS upload_folders_parent_lnk_uq;
ALTER TABLE IF EXISTS ONLY public.upload_folders_parent_lnk DROP CONSTRAINT IF EXISTS upload_folders_parent_lnk_pkey;
ALTER TABLE IF EXISTS ONLY public.up_users_role_lnk DROP CONSTRAINT IF EXISTS up_users_role_lnk_uq;
ALTER TABLE IF EXISTS ONLY public.up_users_role_lnk DROP CONSTRAINT IF EXISTS up_users_role_lnk_pkey;
ALTER TABLE IF EXISTS ONLY public.up_users DROP CONSTRAINT IF EXISTS up_users_pkey;
ALTER TABLE IF EXISTS ONLY public.up_roles DROP CONSTRAINT IF EXISTS up_roles_pkey;
ALTER TABLE IF EXISTS ONLY public.up_permissions_role_lnk DROP CONSTRAINT IF EXISTS up_permissions_role_lnk_uq;
ALTER TABLE IF EXISTS ONLY public.up_permissions_role_lnk DROP CONSTRAINT IF EXISTS up_permissions_role_lnk_pkey;
ALTER TABLE IF EXISTS ONLY public.up_permissions DROP CONSTRAINT IF EXISTS up_permissions_pkey;
ALTER TABLE IF EXISTS ONLY public.strapi_workflows_stages_workflow_lnk DROP CONSTRAINT IF EXISTS strapi_workflows_stages_workflow_lnk_uq;
ALTER TABLE IF EXISTS ONLY public.strapi_workflows_stages_workflow_lnk DROP CONSTRAINT IF EXISTS strapi_workflows_stages_workflow_lnk_pkey;
ALTER TABLE IF EXISTS ONLY public.strapi_workflows_stages DROP CONSTRAINT IF EXISTS strapi_workflows_stages_pkey;
ALTER TABLE IF EXISTS ONLY public.strapi_workflows_stages_permissions_lnk DROP CONSTRAINT IF EXISTS strapi_workflows_stages_permissions_lnk_uq;
ALTER TABLE IF EXISTS ONLY public.strapi_workflows_stages_permissions_lnk DROP CONSTRAINT IF EXISTS strapi_workflows_stages_permissions_lnk_pkey;
ALTER TABLE IF EXISTS ONLY public.strapi_workflows_stage_required_to_publish_lnk DROP CONSTRAINT IF EXISTS strapi_workflows_stage_required_to_publish_lnk_uq;
ALTER TABLE IF EXISTS ONLY public.strapi_workflows_stage_required_to_publish_lnk DROP CONSTRAINT IF EXISTS strapi_workflows_stage_required_to_publish_lnk_pkey;
ALTER TABLE IF EXISTS ONLY public.strapi_workflows DROP CONSTRAINT IF EXISTS strapi_workflows_pkey;
ALTER TABLE IF EXISTS ONLY public.strapi_webhooks DROP CONSTRAINT IF EXISTS strapi_webhooks_pkey;
ALTER TABLE IF EXISTS ONLY public.strapi_transfer_tokens DROP CONSTRAINT IF EXISTS strapi_transfer_tokens_pkey;
ALTER TABLE IF EXISTS ONLY public.strapi_transfer_token_permissions_token_lnk DROP CONSTRAINT IF EXISTS strapi_transfer_token_permissions_token_lnk_uq;
ALTER TABLE IF EXISTS ONLY public.strapi_transfer_token_permissions_token_lnk DROP CONSTRAINT IF EXISTS strapi_transfer_token_permissions_token_lnk_pkey;
ALTER TABLE IF EXISTS ONLY public.strapi_transfer_token_permissions DROP CONSTRAINT IF EXISTS strapi_transfer_token_permissions_pkey;
ALTER TABLE IF EXISTS ONLY public.strapi_sessions DROP CONSTRAINT IF EXISTS strapi_sessions_pkey;
ALTER TABLE IF EXISTS ONLY public.strapi_releases DROP CONSTRAINT IF EXISTS strapi_releases_pkey;
ALTER TABLE IF EXISTS ONLY public.strapi_release_actions_release_lnk DROP CONSTRAINT IF EXISTS strapi_release_actions_release_lnk_uq;
ALTER TABLE IF EXISTS ONLY public.strapi_release_actions_release_lnk DROP CONSTRAINT IF EXISTS strapi_release_actions_release_lnk_pkey;
ALTER TABLE IF EXISTS ONLY public.strapi_release_actions DROP CONSTRAINT IF EXISTS strapi_release_actions_pkey;
ALTER TABLE IF EXISTS ONLY public.strapi_migrations DROP CONSTRAINT IF EXISTS strapi_migrations_pkey;
ALTER TABLE IF EXISTS ONLY public.strapi_migrations_internal DROP CONSTRAINT IF EXISTS strapi_migrations_internal_pkey;
ALTER TABLE IF EXISTS ONLY public.strapi_history_versions DROP CONSTRAINT IF EXISTS strapi_history_versions_pkey;
ALTER TABLE IF EXISTS ONLY public.strapi_database_schema DROP CONSTRAINT IF EXISTS strapi_database_schema_pkey;
ALTER TABLE IF EXISTS ONLY public.strapi_core_store_settings DROP CONSTRAINT IF EXISTS strapi_core_store_settings_pkey;
ALTER TABLE IF EXISTS ONLY public.strapi_api_tokens DROP CONSTRAINT IF EXISTS strapi_api_tokens_pkey;
ALTER TABLE IF EXISTS ONLY public.strapi_api_tokens_admin_user_owner_lnk DROP CONSTRAINT IF EXISTS strapi_api_tokens_admin_user_owner_lnk_uq;
ALTER TABLE IF EXISTS ONLY public.strapi_api_tokens_admin_user_owner_lnk DROP CONSTRAINT IF EXISTS strapi_api_tokens_admin_user_owner_lnk_pkey;
ALTER TABLE IF EXISTS ONLY public.strapi_api_token_permissions_token_lnk DROP CONSTRAINT IF EXISTS strapi_api_token_permissions_token_lnk_uq;
ALTER TABLE IF EXISTS ONLY public.strapi_api_token_permissions_token_lnk DROP CONSTRAINT IF EXISTS strapi_api_token_permissions_token_lnk_pkey;
ALTER TABLE IF EXISTS ONLY public.strapi_api_token_permissions DROP CONSTRAINT IF EXISTS strapi_api_token_permissions_pkey;
ALTER TABLE IF EXISTS ONLY public.strapi_ai_metadata_jobs DROP CONSTRAINT IF EXISTS strapi_ai_metadata_jobs_pkey;
ALTER TABLE IF EXISTS ONLY public.strapi_ai_localization_jobs DROP CONSTRAINT IF EXISTS strapi_ai_localization_jobs_pkey;
ALTER TABLE IF EXISTS ONLY public.replies DROP CONSTRAINT IF EXISTS replies_pkey;
ALTER TABLE IF EXISTS ONLY public.replies_discussion_lnk DROP CONSTRAINT IF EXISTS replies_discussion_lnk_uq;
ALTER TABLE IF EXISTS ONLY public.replies_discussion_lnk DROP CONSTRAINT IF EXISTS replies_discussion_lnk_pkey;
ALTER TABLE IF EXISTS ONLY public.replies_author_lnk DROP CONSTRAINT IF EXISTS replies_author_lnk_uq;
ALTER TABLE IF EXISTS ONLY public.replies_author_lnk DROP CONSTRAINT IF EXISTS replies_author_lnk_pkey;
ALTER TABLE IF EXISTS ONLY public.i18n_locale DROP CONSTRAINT IF EXISTS i18n_locale_pkey;
ALTER TABLE IF EXISTS ONLY public.files_related_mph DROP CONSTRAINT IF EXISTS files_related_mph_pkey;
ALTER TABLE IF EXISTS ONLY public.files DROP CONSTRAINT IF EXISTS files_pkey;
ALTER TABLE IF EXISTS ONLY public.files_folder_lnk DROP CONSTRAINT IF EXISTS files_folder_lnk_uq;
ALTER TABLE IF EXISTS ONLY public.files_folder_lnk DROP CONSTRAINT IF EXISTS files_folder_lnk_pkey;
ALTER TABLE IF EXISTS ONLY public.discussions DROP CONSTRAINT IF EXISTS discussions_pkey;
ALTER TABLE IF EXISTS ONLY public.discussions_category_lnk DROP CONSTRAINT IF EXISTS discussions_category_lnk_uq;
ALTER TABLE IF EXISTS ONLY public.discussions_category_lnk DROP CONSTRAINT IF EXISTS discussions_category_lnk_pkey;
ALTER TABLE IF EXISTS ONLY public.discussions_author_lnk DROP CONSTRAINT IF EXISTS discussions_author_lnk_uq;
ALTER TABLE IF EXISTS ONLY public.discussions_author_lnk DROP CONSTRAINT IF EXISTS discussions_author_lnk_pkey;
ALTER TABLE IF EXISTS ONLY public.categories DROP CONSTRAINT IF EXISTS categories_pkey;
ALTER TABLE IF EXISTS ONLY public.admin_users_roles_lnk DROP CONSTRAINT IF EXISTS admin_users_roles_lnk_uq;
ALTER TABLE IF EXISTS ONLY public.admin_users_roles_lnk DROP CONSTRAINT IF EXISTS admin_users_roles_lnk_pkey;
ALTER TABLE IF EXISTS ONLY public.admin_users DROP CONSTRAINT IF EXISTS admin_users_pkey;
ALTER TABLE IF EXISTS ONLY public.admin_roles DROP CONSTRAINT IF EXISTS admin_roles_pkey;
ALTER TABLE IF EXISTS ONLY public.admin_permissions_role_lnk DROP CONSTRAINT IF EXISTS admin_permissions_role_lnk_uq;
ALTER TABLE IF EXISTS ONLY public.admin_permissions_role_lnk DROP CONSTRAINT IF EXISTS admin_permissions_role_lnk_pkey;
ALTER TABLE IF EXISTS ONLY public.admin_permissions DROP CONSTRAINT IF EXISTS admin_permissions_pkey;
ALTER TABLE IF EXISTS ONLY public.admin_permissions_api_token_lnk DROP CONSTRAINT IF EXISTS admin_permissions_api_token_lnk_uq;
ALTER TABLE IF EXISTS ONLY public.admin_permissions_api_token_lnk DROP CONSTRAINT IF EXISTS admin_permissions_api_token_lnk_pkey;
ALTER TABLE IF EXISTS public.upload_folders_parent_lnk ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.upload_folders ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.up_users_role_lnk ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.up_users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.up_roles ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.up_permissions_role_lnk ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.up_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.strapi_workflows_stages_workflow_lnk ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.strapi_workflows_stages_permissions_lnk ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.strapi_workflows_stages ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.strapi_workflows_stage_required_to_publish_lnk ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.strapi_workflows ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.strapi_webhooks ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.strapi_transfer_tokens ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.strapi_transfer_token_permissions_token_lnk ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.strapi_transfer_token_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.strapi_sessions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.strapi_releases ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.strapi_release_actions_release_lnk ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.strapi_release_actions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.strapi_migrations_internal ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.strapi_migrations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.strapi_history_versions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.strapi_database_schema ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.strapi_core_store_settings ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.strapi_api_tokens_admin_user_owner_lnk ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.strapi_api_tokens ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.strapi_api_token_permissions_token_lnk ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.strapi_api_token_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.strapi_ai_metadata_jobs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.strapi_ai_localization_jobs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.replies_discussion_lnk ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.replies_author_lnk ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.replies ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.i18n_locale ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.files_related_mph ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.files_folder_lnk ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.files ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.discussions_category_lnk ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.discussions_author_lnk ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.discussions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.categories ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.admin_users_roles_lnk ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.admin_users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.admin_roles ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.admin_permissions_role_lnk ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.admin_permissions_api_token_lnk ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.admin_permissions ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.upload_folders_parent_lnk_id_seq;
DROP TABLE IF EXISTS public.upload_folders_parent_lnk;
DROP SEQUENCE IF EXISTS public.upload_folders_id_seq;
DROP TABLE IF EXISTS public.upload_folders;
DROP SEQUENCE IF EXISTS public.up_users_role_lnk_id_seq;
DROP TABLE IF EXISTS public.up_users_role_lnk;
DROP SEQUENCE IF EXISTS public.up_users_id_seq;
DROP TABLE IF EXISTS public.up_users;
DROP SEQUENCE IF EXISTS public.up_roles_id_seq;
DROP TABLE IF EXISTS public.up_roles;
DROP SEQUENCE IF EXISTS public.up_permissions_role_lnk_id_seq;
DROP TABLE IF EXISTS public.up_permissions_role_lnk;
DROP SEQUENCE IF EXISTS public.up_permissions_id_seq;
DROP TABLE IF EXISTS public.up_permissions;
DROP SEQUENCE IF EXISTS public.strapi_workflows_stages_workflow_lnk_id_seq;
DROP TABLE IF EXISTS public.strapi_workflows_stages_workflow_lnk;
DROP SEQUENCE IF EXISTS public.strapi_workflows_stages_permissions_lnk_id_seq;
DROP TABLE IF EXISTS public.strapi_workflows_stages_permissions_lnk;
DROP SEQUENCE IF EXISTS public.strapi_workflows_stages_id_seq;
DROP TABLE IF EXISTS public.strapi_workflows_stages;
DROP SEQUENCE IF EXISTS public.strapi_workflows_stage_required_to_publish_lnk_id_seq;
DROP TABLE IF EXISTS public.strapi_workflows_stage_required_to_publish_lnk;
DROP SEQUENCE IF EXISTS public.strapi_workflows_id_seq;
DROP TABLE IF EXISTS public.strapi_workflows;
DROP SEQUENCE IF EXISTS public.strapi_webhooks_id_seq;
DROP TABLE IF EXISTS public.strapi_webhooks;
DROP SEQUENCE IF EXISTS public.strapi_transfer_tokens_id_seq;
DROP TABLE IF EXISTS public.strapi_transfer_tokens;
DROP SEQUENCE IF EXISTS public.strapi_transfer_token_permissions_token_lnk_id_seq;
DROP TABLE IF EXISTS public.strapi_transfer_token_permissions_token_lnk;
DROP SEQUENCE IF EXISTS public.strapi_transfer_token_permissions_id_seq;
DROP TABLE IF EXISTS public.strapi_transfer_token_permissions;
DROP SEQUENCE IF EXISTS public.strapi_sessions_id_seq;
DROP TABLE IF EXISTS public.strapi_sessions;
DROP SEQUENCE IF EXISTS public.strapi_releases_id_seq;
DROP TABLE IF EXISTS public.strapi_releases;
DROP SEQUENCE IF EXISTS public.strapi_release_actions_release_lnk_id_seq;
DROP TABLE IF EXISTS public.strapi_release_actions_release_lnk;
DROP SEQUENCE IF EXISTS public.strapi_release_actions_id_seq;
DROP TABLE IF EXISTS public.strapi_release_actions;
DROP SEQUENCE IF EXISTS public.strapi_migrations_internal_id_seq;
DROP TABLE IF EXISTS public.strapi_migrations_internal;
DROP SEQUENCE IF EXISTS public.strapi_migrations_id_seq;
DROP TABLE IF EXISTS public.strapi_migrations;
DROP SEQUENCE IF EXISTS public.strapi_history_versions_id_seq;
DROP TABLE IF EXISTS public.strapi_history_versions;
DROP SEQUENCE IF EXISTS public.strapi_database_schema_id_seq;
DROP TABLE IF EXISTS public.strapi_database_schema;
DROP SEQUENCE IF EXISTS public.strapi_core_store_settings_id_seq;
DROP TABLE IF EXISTS public.strapi_core_store_settings;
DROP SEQUENCE IF EXISTS public.strapi_api_tokens_id_seq;
DROP SEQUENCE IF EXISTS public.strapi_api_tokens_admin_user_owner_lnk_id_seq;
DROP TABLE IF EXISTS public.strapi_api_tokens_admin_user_owner_lnk;
DROP TABLE IF EXISTS public.strapi_api_tokens;
DROP SEQUENCE IF EXISTS public.strapi_api_token_permissions_token_lnk_id_seq;
DROP TABLE IF EXISTS public.strapi_api_token_permissions_token_lnk;
DROP SEQUENCE IF EXISTS public.strapi_api_token_permissions_id_seq;
DROP TABLE IF EXISTS public.strapi_api_token_permissions;
DROP SEQUENCE IF EXISTS public.strapi_ai_metadata_jobs_id_seq;
DROP TABLE IF EXISTS public.strapi_ai_metadata_jobs;
DROP SEQUENCE IF EXISTS public.strapi_ai_localization_jobs_id_seq;
DROP TABLE IF EXISTS public.strapi_ai_localization_jobs;
DROP SEQUENCE IF EXISTS public.replies_id_seq;
DROP SEQUENCE IF EXISTS public.replies_discussion_lnk_id_seq;
DROP TABLE IF EXISTS public.replies_discussion_lnk;
DROP SEQUENCE IF EXISTS public.replies_author_lnk_id_seq;
DROP TABLE IF EXISTS public.replies_author_lnk;
DROP TABLE IF EXISTS public.replies;
DROP SEQUENCE IF EXISTS public.i18n_locale_id_seq;
DROP TABLE IF EXISTS public.i18n_locale;
DROP SEQUENCE IF EXISTS public.files_related_mph_id_seq;
DROP TABLE IF EXISTS public.files_related_mph;
DROP SEQUENCE IF EXISTS public.files_id_seq;
DROP SEQUENCE IF EXISTS public.files_folder_lnk_id_seq;
DROP TABLE IF EXISTS public.files_folder_lnk;
DROP TABLE IF EXISTS public.files;
DROP SEQUENCE IF EXISTS public.discussions_id_seq;
DROP SEQUENCE IF EXISTS public.discussions_category_lnk_id_seq;
DROP TABLE IF EXISTS public.discussions_category_lnk;
DROP SEQUENCE IF EXISTS public.discussions_author_lnk_id_seq;
DROP TABLE IF EXISTS public.discussions_author_lnk;
DROP TABLE IF EXISTS public.discussions;
DROP SEQUENCE IF EXISTS public.categories_id_seq;
DROP TABLE IF EXISTS public.categories;
DROP SEQUENCE IF EXISTS public.admin_users_roles_lnk_id_seq;
DROP TABLE IF EXISTS public.admin_users_roles_lnk;
DROP SEQUENCE IF EXISTS public.admin_users_id_seq;
DROP TABLE IF EXISTS public.admin_users;
DROP SEQUENCE IF EXISTS public.admin_roles_id_seq;
DROP TABLE IF EXISTS public.admin_roles;
DROP SEQUENCE IF EXISTS public.admin_permissions_role_lnk_id_seq;
DROP TABLE IF EXISTS public.admin_permissions_role_lnk;
DROP SEQUENCE IF EXISTS public.admin_permissions_id_seq;
DROP SEQUENCE IF EXISTS public.admin_permissions_api_token_lnk_id_seq;
DROP TABLE IF EXISTS public.admin_permissions_api_token_lnk;
DROP TABLE IF EXISTS public.admin_permissions;
-- *not* dropping schema, since initdb creates it
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

-- *not* creating schema, since initdb creates it


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    action_parameters jsonb,
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: admin_permissions_api_token_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin_permissions_api_token_lnk (
    id integer NOT NULL,
    permission_id integer,
    api_token_id integer,
    permission_ord double precision
);


--
-- Name: admin_permissions_api_token_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admin_permissions_api_token_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_permissions_api_token_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_permissions_api_token_lnk_id_seq OWNED BY public.admin_permissions_api_token_lnk.id;


--
-- Name: admin_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;


--
-- Name: admin_permissions_role_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin_permissions_role_lnk (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_ord double precision
);


--
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admin_permissions_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_permissions_role_lnk_id_seq OWNED BY public.admin_permissions_role_lnk.id;


--
-- Name: admin_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: admin_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin_users (
    id integer NOT NULL,
    document_id character varying(255),
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    reset_password_token_expires_at timestamp(6) without time zone,
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: admin_users_roles_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin_users_roles_lnk (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    role_ord double precision,
    user_ord double precision
);


--
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admin_users_roles_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_users_roles_lnk_id_seq OWNED BY public.admin_users_roles_lnk.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    slug character varying(255),
    description text,
    color character varying(255),
    icon character varying(255),
    "position" integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: discussions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.discussions (
    id integer NOT NULL,
    document_id character varying(255),
    title character varying(255),
    slug character varying(255),
    content text,
    type character varying(255),
    reply_count integer,
    last_activity_at timestamp(6) without time zone,
    is_solved boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: discussions_author_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.discussions_author_lnk (
    id integer NOT NULL,
    discussion_id integer,
    user_id integer
);


--
-- Name: discussions_author_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.discussions_author_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: discussions_author_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.discussions_author_lnk_id_seq OWNED BY public.discussions_author_lnk.id;


--
-- Name: discussions_category_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.discussions_category_lnk (
    id integer NOT NULL,
    discussion_id integer,
    category_id integer,
    discussion_ord double precision
);


--
-- Name: discussions_category_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.discussions_category_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: discussions_category_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.discussions_category_lnk_id_seq OWNED BY public.discussions_category_lnk.id;


--
-- Name: discussions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.discussions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: discussions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.discussions_id_seq OWNED BY public.discussions.id;


--
-- Name: files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.files (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    alternative_text text,
    caption text,
    focal_point jsonb,
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url text,
    preview_url text,
    provider character varying(255),
    provider_metadata jsonb,
    folder_path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: files_folder_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.files_folder_lnk (
    id integer NOT NULL,
    file_id integer,
    folder_id integer,
    file_ord double precision
);


--
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.files_folder_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.files_folder_lnk_id_seq OWNED BY public.files_folder_lnk.id;


--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- Name: files_related_mph; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.files_related_mph (
    id integer NOT NULL,
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" double precision
);


--
-- Name: files_related_mph_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.files_related_mph_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: files_related_mph_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.files_related_mph_id_seq OWNED BY public.files_related_mph.id;


--
-- Name: i18n_locale; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: i18n_locale_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: i18n_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;


--
-- Name: replies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.replies (
    id integer NOT NULL,
    document_id character varying(255),
    content text,
    is_accepted boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: replies_author_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.replies_author_lnk (
    id integer NOT NULL,
    reply_id integer,
    user_id integer
);


--
-- Name: replies_author_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.replies_author_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: replies_author_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.replies_author_lnk_id_seq OWNED BY public.replies_author_lnk.id;


--
-- Name: replies_discussion_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.replies_discussion_lnk (
    id integer NOT NULL,
    reply_id integer,
    discussion_id integer,
    reply_ord double precision
);


--
-- Name: replies_discussion_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.replies_discussion_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: replies_discussion_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.replies_discussion_lnk_id_seq OWNED BY public.replies_discussion_lnk.id;


--
-- Name: replies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.replies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: replies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.replies_id_seq OWNED BY public.replies.id;


--
-- Name: strapi_ai_localization_jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_ai_localization_jobs (
    id integer NOT NULL,
    content_type character varying(255) NOT NULL,
    related_document_id character varying(255) NOT NULL,
    source_locale character varying(255) NOT NULL,
    target_locales jsonb NOT NULL,
    status character varying(255) NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


--
-- Name: strapi_ai_localization_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_ai_localization_jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_ai_localization_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_ai_localization_jobs_id_seq OWNED BY public.strapi_ai_localization_jobs.id;


--
-- Name: strapi_ai_metadata_jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_ai_metadata_jobs (
    id integer NOT NULL,
    status character varying(255) NOT NULL,
    created_at timestamp(6) without time zone,
    completed_at timestamp(6) without time zone
);


--
-- Name: strapi_ai_metadata_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_ai_metadata_jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_ai_metadata_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_ai_metadata_jobs_id_seq OWNED BY public.strapi_ai_metadata_jobs.id;


--
-- Name: strapi_api_token_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_api_token_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_api_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNED BY public.strapi_api_token_permissions.id;


--
-- Name: strapi_api_token_permissions_token_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_api_token_permissions_token_lnk (
    id integer NOT NULL,
    api_token_permission_id integer,
    api_token_id integer,
    api_token_permission_ord double precision
);


--
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq OWNED BY public.strapi_api_token_permissions_token_lnk.id;


--
-- Name: strapi_api_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    kind character varying(255),
    type character varying(255),
    access_key character varying(255),
    encrypted_key text,
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: strapi_api_tokens_admin_user_owner_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_api_tokens_admin_user_owner_lnk (
    id integer NOT NULL,
    api_token_id integer,
    user_id integer,
    api_token_ord double precision
);


--
-- Name: strapi_api_tokens_admin_user_owner_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_api_tokens_admin_user_owner_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_api_tokens_admin_user_owner_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_api_tokens_admin_user_owner_lnk_id_seq OWNED BY public.strapi_api_tokens_admin_user_owner_lnk.id;


--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;


--
-- Name: strapi_core_store_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;


--
-- Name: strapi_database_schema; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);


--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;


--
-- Name: strapi_history_versions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_history_versions (
    id integer NOT NULL,
    content_type character varying(255) NOT NULL,
    related_document_id character varying(255),
    locale character varying(255),
    status character varying(255),
    data jsonb,
    schema jsonb,
    created_at timestamp(6) without time zone,
    created_by_id integer
);


--
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_history_versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_history_versions_id_seq OWNED BY public.strapi_history_versions.id;


--
-- Name: strapi_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;


--
-- Name: strapi_migrations_internal; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_migrations_internal (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


--
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_migrations_internal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_migrations_internal_id_seq OWNED BY public.strapi_migrations_internal.id;


--
-- Name: strapi_release_actions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_release_actions (
    id integer NOT NULL,
    document_id character varying(255),
    type character varying(255),
    content_type character varying(255),
    entry_document_id character varying(255),
    locale character varying(255),
    is_entry_valid boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_release_actions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_release_actions_id_seq OWNED BY public.strapi_release_actions.id;


--
-- Name: strapi_release_actions_release_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_release_actions_release_lnk (
    id integer NOT NULL,
    release_action_id integer,
    release_id integer,
    release_action_ord double precision
);


--
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_release_actions_release_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_release_actions_release_lnk_id_seq OWNED BY public.strapi_release_actions_release_lnk.id;


--
-- Name: strapi_releases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_releases (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    released_at timestamp(6) without time zone,
    scheduled_at timestamp(6) without time zone,
    timezone character varying(255),
    status character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: strapi_releases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_releases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_releases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_releases_id_seq OWNED BY public.strapi_releases.id;


--
-- Name: strapi_sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_sessions (
    id integer NOT NULL,
    document_id character varying(255),
    user_id character varying(255),
    session_id character varying(255),
    child_id character varying(255),
    device_id character varying(255),
    origin character varying(255),
    expires_at timestamp(6) without time zone,
    absolute_expires_at timestamp(6) without time zone,
    status character varying(255),
    type character varying(255),
    metadata jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: strapi_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_sessions_id_seq OWNED BY public.strapi_sessions.id;


--
-- Name: strapi_transfer_token_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_transfer_token_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNED BY public.strapi_transfer_token_permissions.id;


--
-- Name: strapi_transfer_token_permissions_token_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_transfer_token_permissions_token_lnk (
    id integer NOT NULL,
    transfer_token_permission_id integer,
    transfer_token_id integer,
    transfer_token_permission_ord double precision
);


--
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq OWNED BY public.strapi_transfer_token_permissions_token_lnk.id;


--
-- Name: strapi_transfer_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_transfer_tokens (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_transfer_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNED BY public.strapi_transfer_tokens.id;


--
-- Name: strapi_webhooks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    content_type_events jsonb,
    enabled boolean
);


--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;


--
-- Name: strapi_workflows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_workflows (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    content_types jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: strapi_workflows_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_workflows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_workflows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_workflows_id_seq OWNED BY public.strapi_workflows.id;


--
-- Name: strapi_workflows_stage_required_to_publish_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_workflows_stage_required_to_publish_lnk (
    id integer NOT NULL,
    workflow_id integer,
    workflow_stage_id integer
);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_workflows_stage_required_to_publish_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq OWNED BY public.strapi_workflows_stage_required_to_publish_lnk.id;


--
-- Name: strapi_workflows_stages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_workflows_stages (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    color character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_workflows_stages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_workflows_stages_id_seq OWNED BY public.strapi_workflows_stages.id;


--
-- Name: strapi_workflows_stages_permissions_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_workflows_stages_permissions_lnk (
    id integer NOT NULL,
    workflow_stage_id integer,
    permission_id integer,
    permission_ord double precision
);


--
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq OWNED BY public.strapi_workflows_stages_permissions_lnk.id;


--
-- Name: strapi_workflows_stages_workflow_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strapi_workflows_stages_workflow_lnk (
    id integer NOT NULL,
    workflow_stage_id integer,
    workflow_id integer,
    workflow_stage_ord double precision
);


--
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq OWNED BY public.strapi_workflows_stages_workflow_lnk.id;


--
-- Name: up_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: up_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: up_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;


--
-- Name: up_permissions_role_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.up_permissions_role_lnk (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_ord double precision
);


--
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.up_permissions_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.up_permissions_role_lnk_id_seq OWNED BY public.up_permissions_role_lnk.id;


--
-- Name: up_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.up_roles (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: up_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: up_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;


--
-- Name: up_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.up_users (
    id integer NOT NULL,
    document_id character varying(255),
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    display_name character varying(255),
    bio text,
    avatar_color character varying(255),
    community_role character varying(255),
    is_subscriber boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: up_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: up_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;


--
-- Name: up_users_role_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.up_users_role_lnk (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    user_ord double precision
);


--
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.up_users_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.up_users_role_lnk_id_seq OWNED BY public.up_users_role_lnk.id;


--
-- Name: upload_folders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.upload_folders (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    path_id integer,
    path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


--
-- Name: upload_folders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.upload_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: upload_folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.upload_folders_id_seq OWNED BY public.upload_folders.id;


--
-- Name: upload_folders_parent_lnk; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.upload_folders_parent_lnk (
    id integer NOT NULL,
    folder_id integer,
    inv_folder_id integer,
    folder_ord double precision
);


--
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.upload_folders_parent_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.upload_folders_parent_lnk_id_seq OWNED BY public.upload_folders_parent_lnk.id;


--
-- Name: admin_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);


--
-- Name: admin_permissions_api_token_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions_api_token_lnk ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_api_token_lnk_id_seq'::regclass);


--
-- Name: admin_permissions_role_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_role_lnk_id_seq'::regclass);


--
-- Name: admin_roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: admin_users_roles_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users_roles_lnk ALTER COLUMN id SET DEFAULT nextval('public.admin_users_roles_lnk_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: discussions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discussions ALTER COLUMN id SET DEFAULT nextval('public.discussions_id_seq'::regclass);


--
-- Name: discussions_author_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discussions_author_lnk ALTER COLUMN id SET DEFAULT nextval('public.discussions_author_lnk_id_seq'::regclass);


--
-- Name: discussions_category_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discussions_category_lnk ALTER COLUMN id SET DEFAULT nextval('public.discussions_category_lnk_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- Name: files_folder_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files_folder_lnk ALTER COLUMN id SET DEFAULT nextval('public.files_folder_lnk_id_seq'::regclass);


--
-- Name: files_related_mph id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files_related_mph ALTER COLUMN id SET DEFAULT nextval('public.files_related_mph_id_seq'::regclass);


--
-- Name: i18n_locale id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);


--
-- Name: replies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.replies ALTER COLUMN id SET DEFAULT nextval('public.replies_id_seq'::regclass);


--
-- Name: replies_author_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.replies_author_lnk ALTER COLUMN id SET DEFAULT nextval('public.replies_author_lnk_id_seq'::regclass);


--
-- Name: replies_discussion_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.replies_discussion_lnk ALTER COLUMN id SET DEFAULT nextval('public.replies_discussion_lnk_id_seq'::regclass);


--
-- Name: strapi_ai_localization_jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_ai_localization_jobs ALTER COLUMN id SET DEFAULT nextval('public.strapi_ai_localization_jobs_id_seq'::regclass);


--
-- Name: strapi_ai_metadata_jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_ai_metadata_jobs ALTER COLUMN id SET DEFAULT nextval('public.strapi_ai_metadata_jobs_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions_token_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_token_lnk_id_seq'::regclass);


--
-- Name: strapi_api_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);


--
-- Name: strapi_api_tokens_admin_user_owner_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_tokens_admin_user_owner_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_admin_user_owner_lnk_id_seq'::regclass);


--
-- Name: strapi_core_store_settings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);


--
-- Name: strapi_database_schema id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);


--
-- Name: strapi_history_versions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_history_versions ALTER COLUMN id SET DEFAULT nextval('public.strapi_history_versions_id_seq'::regclass);


--
-- Name: strapi_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);


--
-- Name: strapi_migrations_internal id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_migrations_internal ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_internal_id_seq'::regclass);


--
-- Name: strapi_release_actions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_release_actions ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_id_seq'::regclass);


--
-- Name: strapi_release_actions_release_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_release_lnk_id_seq'::regclass);


--
-- Name: strapi_releases id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_releases ALTER COLUMN id SET DEFAULT nextval('public.strapi_releases_id_seq'::regclass);


--
-- Name: strapi_sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_sessions ALTER COLUMN id SET DEFAULT nextval('public.strapi_sessions_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions_token_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_token_lnk_id_seq'::regclass);


--
-- Name: strapi_transfer_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_tokens_id_seq'::regclass);


--
-- Name: strapi_webhooks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);


--
-- Name: strapi_workflows id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_id_seq'::regclass);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stage_required_to_publish_lnk_id_seq'::regclass);


--
-- Name: strapi_workflows_stages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_id_seq'::regclass);


--
-- Name: strapi_workflows_stages_permissions_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_permissions_lnk_id_seq'::regclass);


--
-- Name: strapi_workflows_stages_workflow_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_workflow_lnk_id_seq'::regclass);


--
-- Name: up_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);


--
-- Name: up_permissions_role_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_permissions_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_role_lnk_id_seq'::regclass);


--
-- Name: up_roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);


--
-- Name: up_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);


--
-- Name: up_users_role_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_users_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.up_users_role_lnk_id_seq'::regclass);


--
-- Name: upload_folders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_id_seq'::regclass);


--
-- Name: upload_folders_parent_lnk id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders_parent_lnk ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_parent_lnk_id_seq'::regclass);


--
-- Data for Name: admin_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.admin_permissions (id, document_id, action, action_parameters, subject, properties, conditions, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	lzzjzx8of43ut5x5a8dvsax0	plugin::content-manager.explorer.create	{}	api::category.category	{"fields": ["name", "slug", "description", "color", "icon", "position", "discussions"]}	[]	2026-11-05 17:21:53.289	2026-11-05 17:21:53.289	2026-11-05 17:21:53.289	\N	\N	\N
2	jecvf4pigkcd2a2cxiujzd9r	plugin::content-manager.explorer.create	{}	api::discussion.discussion	{"fields": ["title", "slug", "content", "type", "author", "category", "replies", "replyCount", "lastActivityAt", "isSolved"]}	[]	2026-11-05 17:21:53.293	2026-11-05 17:21:53.293	2026-11-05 17:21:53.293	\N	\N	\N
3	dicoadmyiszsyhums5b4v82a	plugin::content-manager.explorer.create	{}	api::reply.reply	{"fields": ["content", "author", "discussion", "isAccepted"]}	[]	2026-11-05 17:21:53.296	2026-11-05 17:21:53.296	2026-11-05 17:21:53.296	\N	\N	\N
4	yteqe7qaqtowk9gku3wq22gk	plugin::content-manager.explorer.read	{}	api::category.category	{"fields": ["name", "slug", "description", "color", "icon", "position", "discussions"]}	[]	2026-11-05 17:21:53.302	2026-11-05 17:21:53.302	2026-11-05 17:21:53.302	\N	\N	\N
5	d49l24poemgpa7pgsnteb1dr	plugin::content-manager.explorer.read	{}	api::discussion.discussion	{"fields": ["title", "slug", "content", "type", "author", "category", "replies", "replyCount", "lastActivityAt", "isSolved"]}	[]	2026-11-05 17:21:53.305	2026-11-05 17:21:53.305	2026-11-05 17:21:53.305	\N	\N	\N
6	qdb1a5rzylwke3t126bdq8ey	plugin::content-manager.explorer.read	{}	api::reply.reply	{"fields": ["content", "author", "discussion", "isAccepted"]}	[]	2026-11-05 17:21:53.308	2026-11-05 17:21:53.308	2026-11-05 17:21:53.308	\N	\N	\N
7	spdar9of0hn1qiccxbqi4pgs	plugin::content-manager.explorer.update	{}	api::category.category	{"fields": ["name", "slug", "description", "color", "icon", "position", "discussions"]}	[]	2026-11-05 17:21:53.311	2026-11-05 17:21:53.311	2026-11-05 17:21:53.311	\N	\N	\N
8	wsn1gtmn6ynooj9ioplv1nmm	plugin::content-manager.explorer.update	{}	api::discussion.discussion	{"fields": ["title", "slug", "content", "type", "author", "category", "replies", "replyCount", "lastActivityAt", "isSolved"]}	[]	2026-11-05 17:21:53.314	2026-11-05 17:21:53.314	2026-11-05 17:21:53.314	\N	\N	\N
9	d10z5lgqssctxtzpde9vwv25	plugin::content-manager.explorer.update	{}	api::reply.reply	{"fields": ["content", "author", "discussion", "isAccepted"]}	[]	2026-11-05 17:21:53.316	2026-11-05 17:21:53.316	2026-11-05 17:21:53.316	\N	\N	\N
10	d3qh3ld75cjzi8n376xohi0b	plugin::content-manager.explorer.delete	{}	api::category.category	{}	[]	2026-11-05 17:21:53.319	2026-11-05 17:21:53.319	2026-11-05 17:21:53.319	\N	\N	\N
11	j0jxjmmo6i5yoh1pm707faip	plugin::content-manager.explorer.delete	{}	api::discussion.discussion	{}	[]	2026-11-05 17:21:53.321	2026-11-05 17:21:53.321	2026-11-05 17:21:53.322	\N	\N	\N
12	rg5mdlijmxy12wpg9wxjnry5	plugin::content-manager.explorer.delete	{}	api::reply.reply	{}	[]	2026-11-05 17:21:53.324	2026-11-05 17:21:53.324	2026-11-05 17:21:53.324	\N	\N	\N
13	ssl7bf7lhst23jn23uja5tu9	plugin::content-manager.explorer.publish	{}	api::category.category	{}	[]	2026-11-05 17:21:53.327	2026-11-05 17:21:53.327	2026-11-05 17:21:53.327	\N	\N	\N
14	vd3xxdt1crbjnagfx6li9cbj	plugin::content-manager.explorer.publish	{}	api::discussion.discussion	{}	[]	2026-11-05 17:21:53.329	2026-11-05 17:21:53.329	2026-11-05 17:21:53.329	\N	\N	\N
15	ba5cp36kovkr0ygsxc97polu	plugin::content-manager.explorer.publish	{}	api::reply.reply	{}	[]	2026-11-05 17:21:53.332	2026-11-05 17:21:53.332	2026-11-05 17:21:53.332	\N	\N	\N
16	wk3ci3rxvzq1hcu5q30rzm3j	plugin::upload.read	{}	\N	{}	[]	2026-11-05 17:21:53.334	2026-11-05 17:21:53.334	2026-11-05 17:21:53.334	\N	\N	\N
17	tkanjm29qgbp3j7s6jklwej7	plugin::upload.configure-view	{}	\N	{}	[]	2026-11-05 17:21:53.337	2026-11-05 17:21:53.337	2026-11-05 17:21:53.337	\N	\N	\N
18	ikq815ijkmg1zf4e2njk9abe	plugin::upload.assets.create	{}	\N	{}	[]	2026-11-05 17:21:53.339	2026-11-05 17:21:53.339	2026-11-05 17:21:53.339	\N	\N	\N
19	lh6hxx10w0012q5agy2uya38	plugin::upload.assets.update	{}	\N	{}	[]	2026-11-05 17:21:53.342	2026-11-05 17:21:53.342	2026-11-05 17:21:53.342	\N	\N	\N
20	o570jasddov3a6xv9ik1hizv	plugin::upload.assets.download	{}	\N	{}	[]	2026-11-05 17:21:53.344	2026-11-05 17:21:53.344	2026-11-05 17:21:53.344	\N	\N	\N
21	xct1lijy22w08w6e7pvdcoso	plugin::upload.assets.copy-link	{}	\N	{}	[]	2026-11-05 17:21:53.347	2026-11-05 17:21:53.347	2026-11-05 17:21:53.347	\N	\N	\N
22	sppqx2romp2wvi2bmks3xevi	plugin::content-manager.explorer.create	{}	api::category.category	{"fields": ["name", "slug", "description", "color", "icon", "position", "discussions"]}	["admin::is-creator"]	2026-11-05 17:21:53.35	2026-11-05 17:21:53.35	2026-11-05 17:21:53.35	\N	\N	\N
23	wojzu6dz1bbk2lwgmzq1g7w1	plugin::content-manager.explorer.create	{}	api::discussion.discussion	{"fields": ["title", "slug", "content", "type", "author", "category", "replies", "replyCount", "lastActivityAt", "isSolved"]}	["admin::is-creator"]	2026-11-05 17:21:53.352	2026-11-05 17:21:53.352	2026-11-05 17:21:53.353	\N	\N	\N
24	fmfyu98skpz8fnrq36ebry6x	plugin::content-manager.explorer.create	{}	api::reply.reply	{"fields": ["content", "author", "discussion", "isAccepted"]}	["admin::is-creator"]	2026-11-05 17:21:53.355	2026-11-05 17:21:53.355	2026-11-05 17:21:53.355	\N	\N	\N
25	ziclk8use5wgja7f7v0luta4	plugin::content-manager.explorer.read	{}	api::category.category	{"fields": ["name", "slug", "description", "color", "icon", "position", "discussions"]}	["admin::is-creator"]	2026-11-05 17:21:53.358	2026-11-05 17:21:53.358	2026-11-05 17:21:53.358	\N	\N	\N
26	ol8nojsgxcn0q1lhuly879vd	plugin::content-manager.explorer.read	{}	api::discussion.discussion	{"fields": ["title", "slug", "content", "type", "author", "category", "replies", "replyCount", "lastActivityAt", "isSolved"]}	["admin::is-creator"]	2026-11-05 17:21:53.36	2026-11-05 17:21:53.36	2026-11-05 17:21:53.36	\N	\N	\N
27	cjdyg75l54f3m15b3laxgcya	plugin::content-manager.explorer.read	{}	api::reply.reply	{"fields": ["content", "author", "discussion", "isAccepted"]}	["admin::is-creator"]	2026-11-05 17:21:53.363	2026-11-05 17:21:53.363	2026-11-05 17:21:53.363	\N	\N	\N
28	aub5ybjbzjxmlksjmgjgvspq	plugin::content-manager.explorer.update	{}	api::category.category	{"fields": ["name", "slug", "description", "color", "icon", "position", "discussions"]}	["admin::is-creator"]	2026-11-05 17:21:53.365	2026-11-05 17:21:53.365	2026-11-05 17:21:53.365	\N	\N	\N
29	jb6fxdqccv5sad7nyhx0wyvg	plugin::content-manager.explorer.update	{}	api::discussion.discussion	{"fields": ["title", "slug", "content", "type", "author", "category", "replies", "replyCount", "lastActivityAt", "isSolved"]}	["admin::is-creator"]	2026-11-05 17:21:53.369	2026-11-05 17:21:53.369	2026-11-05 17:21:53.369	\N	\N	\N
30	iyz0twscpg3tgarpl8kf5cxz	plugin::content-manager.explorer.update	{}	api::reply.reply	{"fields": ["content", "author", "discussion", "isAccepted"]}	["admin::is-creator"]	2026-11-05 17:21:53.372	2026-11-05 17:21:53.372	2026-11-05 17:21:53.372	\N	\N	\N
31	ky9aywzj6a41qwv66a2jzrqg	plugin::content-manager.explorer.delete	{}	api::category.category	{}	["admin::is-creator"]	2026-11-05 17:21:53.374	2026-11-05 17:21:53.374	2026-11-05 17:21:53.374	\N	\N	\N
32	p5c432s3reai47nhx0564ix6	plugin::content-manager.explorer.delete	{}	api::discussion.discussion	{}	["admin::is-creator"]	2026-11-05 17:21:53.377	2026-11-05 17:21:53.377	2026-11-05 17:21:53.377	\N	\N	\N
33	ca0vocssik3sdga5ylvfzxn3	plugin::content-manager.explorer.delete	{}	api::reply.reply	{}	["admin::is-creator"]	2026-11-05 17:21:53.38	2026-11-05 17:21:53.38	2026-11-05 17:21:53.38	\N	\N	\N
34	aerfq5feb8yzp44s8aa3jf4d	plugin::upload.read	{}	\N	{}	["admin::is-creator"]	2026-11-05 17:21:53.384	2026-11-05 17:21:53.384	2026-11-05 17:21:53.384	\N	\N	\N
35	mfqqgq94c3ys5kwpv299a92m	plugin::upload.configure-view	{}	\N	{}	[]	2026-11-05 17:21:53.387	2026-11-05 17:21:53.387	2026-11-05 17:21:53.387	\N	\N	\N
36	d1zfr1wlaiw11np3ajpkwab3	plugin::upload.assets.create	{}	\N	{}	[]	2026-11-05 17:21:53.389	2026-11-05 17:21:53.389	2026-11-05 17:21:53.389	\N	\N	\N
37	pn6os496ytb9oqx83l0pyx95	plugin::upload.assets.update	{}	\N	{}	["admin::is-creator"]	2026-11-05 17:21:53.392	2026-11-05 17:21:53.392	2026-11-05 17:21:53.392	\N	\N	\N
123	k3vjjeeijsbt5l93ew78wgk3	admin::api-tokens.create	{}	\N	{}	[]	2026-11-05 17:21:53.629	2026-11-05 17:21:53.629	2026-11-05 17:21:53.629	\N	\N	\N
38	vg18hca6bo9kyndxjrtfsxad	plugin::upload.assets.download	{}	\N	{}	[]	2026-11-05 17:21:53.394	2026-11-05 17:21:53.394	2026-11-05 17:21:53.394	\N	\N	\N
39	r3x4oezcfit3opvfym4f5lcn	plugin::upload.assets.copy-link	{}	\N	{}	[]	2026-11-05 17:21:53.397	2026-11-05 17:21:53.397	2026-11-05 17:21:53.397	\N	\N	\N
40	kqd7a4uc2sv2ru1i5mqqruh1	plugin::content-manager.explorer.create	{}	api::category.category	{"fields": ["name", "slug", "description", "color", "icon", "position", "discussions"]}	[]	2026-11-05 17:21:53.415	2026-11-05 17:21:53.415	2026-11-05 17:21:53.415	\N	\N	\N
41	nrcrgae625nmdv1n8130u3wl	plugin::content-manager.explorer.create	{}	api::discussion.discussion	{"fields": ["title", "slug", "content", "type", "author", "category", "replies", "replyCount", "lastActivityAt", "isSolved"]}	[]	2026-11-05 17:21:53.419	2026-11-05 17:21:53.419	2026-11-05 17:21:53.419	\N	\N	\N
42	caqicoa0nin3pqgz2j2iml87	plugin::content-manager.explorer.create	{}	api::reply.reply	{"fields": ["content", "author", "discussion", "isAccepted"]}	[]	2026-11-05 17:21:53.421	2026-11-05 17:21:53.421	2026-11-05 17:21:53.421	\N	\N	\N
43	yf7jkurwfnr9xy7h27rs3ybr	plugin::content-manager.explorer.create	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "displayName", "bio", "avatarColor", "communityRole", "isSubscriber"]}	[]	2026-11-05 17:21:53.423	2026-11-05 17:21:53.423	2026-11-05 17:21:53.423	\N	\N	\N
44	sy14cgbt8m4fqu5kk14mid7f	plugin::content-manager.explorer.read	{}	api::category.category	{"fields": ["name", "slug", "description", "color", "icon", "position", "discussions"]}	[]	2026-11-05 17:21:53.425	2026-11-05 17:21:53.425	2026-11-05 17:21:53.425	\N	\N	\N
45	cy3ujiig02omglty9jk9ur9o	plugin::content-manager.explorer.read	{}	api::discussion.discussion	{"fields": ["title", "slug", "content", "type", "author", "category", "replies", "replyCount", "lastActivityAt", "isSolved"]}	[]	2026-11-05 17:21:53.427	2026-11-05 17:21:53.427	2026-11-05 17:21:53.427	\N	\N	\N
46	zw0p7ys7rn4vbor4bxsx1iny	plugin::content-manager.explorer.read	{}	api::reply.reply	{"fields": ["content", "author", "discussion", "isAccepted"]}	[]	2026-11-05 17:21:53.43	2026-11-05 17:21:53.43	2026-11-05 17:21:53.43	\N	\N	\N
47	ospw74ghk9y1gmufpwwhpmgm	plugin::content-manager.explorer.read	{}	plugin::upload.file	{"fields": ["name", "alternativeText", "caption", "focalPoint", "width", "height", "formats", "hash", "ext", "mime", "size", "url", "previewUrl", "provider", "provider_metadata", "related", "folder", "folderPath"]}	[]	2026-11-05 17:21:53.432	2026-11-05 17:21:53.432	2026-11-05 17:21:53.432	\N	\N	\N
48	x3q9oeg2m76edm6k4qnvu7vk	plugin::content-manager.explorer.read	{}	plugin::upload.folder	{"fields": ["name", "pathId", "parent", "children", "files", "path"]}	[]	2026-11-05 17:21:53.434	2026-11-05 17:21:53.434	2026-11-05 17:21:53.434	\N	\N	\N
49	o626a0do9u17phuesri25qtl	plugin::content-manager.explorer.read	{}	plugin::i18n.locale	{"fields": ["name", "code"]}	[]	2026-11-05 17:21:53.438	2026-11-05 17:21:53.438	2026-11-05 17:21:53.438	\N	\N	\N
50	tkp43s18dyns7fhtfo5ee541	plugin::content-manager.explorer.read	{}	plugin::content-releases.release	{"fields": ["name", "releasedAt", "scheduledAt", "timezone", "status", "actions"]}	[]	2026-11-05 17:21:53.44	2026-11-05 17:21:53.44	2026-11-05 17:21:53.44	\N	\N	\N
51	qx25nwyhsqjluftd9cp4rxwa	plugin::content-manager.explorer.read	{}	plugin::content-releases.release-action	{"fields": ["type", "contentType", "entryDocumentId", "release", "isEntryValid"]}	[]	2026-11-05 17:21:53.443	2026-11-05 17:21:53.443	2026-11-05 17:21:53.443	\N	\N	\N
52	yorpyagmlmabr566bo0x8iek	plugin::content-manager.explorer.read	{}	plugin::review-workflows.workflow	{"fields": ["name", "stages", "stageRequiredToPublish", "contentTypes"]}	[]	2026-11-05 17:21:53.445	2026-11-05 17:21:53.445	2026-11-05 17:21:53.445	\N	\N	\N
53	d8efvfb3v3fygex10taa7575	plugin::content-manager.explorer.read	{}	plugin::review-workflows.workflow-stage	{"fields": ["name", "color", "workflow", "permissions"]}	[]	2026-11-05 17:21:53.448	2026-11-05 17:21:53.448	2026-11-05 17:21:53.448	\N	\N	\N
54	rwf04c478rpvuhaysk34choq	plugin::content-manager.explorer.read	{}	plugin::users-permissions.permission	{"fields": ["action", "role"]}	[]	2026-11-05 17:21:53.451	2026-11-05 17:21:53.451	2026-11-05 17:21:53.451	\N	\N	\N
55	xcshpfukr35e54mmbhlrrsyk	plugin::content-manager.explorer.read	{}	plugin::users-permissions.role	{"fields": ["name", "description", "type", "permissions", "users"]}	[]	2026-11-05 17:21:53.453	2026-11-05 17:21:53.453	2026-11-05 17:21:53.453	\N	\N	\N
56	hbvc6gn50saeqiad0n1fzwje	plugin::content-manager.explorer.read	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "displayName", "bio", "avatarColor", "communityRole", "isSubscriber"]}	[]	2026-11-05 17:21:53.456	2026-11-05 17:21:53.456	2026-11-05 17:21:53.456	\N	\N	\N
57	afb75nqv7zimpnsfq49pv59u	plugin::content-manager.explorer.read	{}	admin::permission	{"fields": ["action", "actionParameters", "subject", "properties", "conditions", "role", "apiToken"]}	[]	2026-11-05 17:21:53.458	2026-11-05 17:21:53.458	2026-11-05 17:21:53.459	\N	\N	\N
58	f8pcrb7h2io70fa7lh949x6a	plugin::content-manager.explorer.read	{}	admin::user	{"fields": ["firstname", "lastname", "username", "email", "password", "resetPasswordToken", "resetPasswordTokenExpiresAt", "registrationToken", "isActive", "roles", "apiTokens", "blocked", "preferedLanguage"]}	[]	2026-11-05 17:21:53.461	2026-11-05 17:21:53.461	2026-11-05 17:21:53.461	\N	\N	\N
59	nzjzeyyigtouznzvhhipehcq	plugin::content-manager.explorer.read	{}	admin::role	{"fields": ["name", "code", "description", "users", "permissions"]}	[]	2026-11-05 17:21:53.463	2026-11-05 17:21:53.463	2026-11-05 17:21:53.464	\N	\N	\N
60	cha67c4r2wwhatb6sd8eldhj	plugin::content-manager.explorer.read	{}	admin::api-token	{"fields": ["name", "description", "kind", "type", "accessKey", "encryptedKey", "lastUsedAt", "permissions", "adminPermissions", "adminUserOwner", "expiresAt", "lifespan"]}	[]	2026-11-05 17:21:53.466	2026-11-05 17:21:53.466	2026-11-05 17:21:53.466	\N	\N	\N
61	b1wtnbab4thpz04qpj2miz2s	plugin::content-manager.explorer.read	{}	admin::api-token-permission	{"fields": ["action", "token"]}	[]	2026-11-05 17:21:53.468	2026-11-05 17:21:53.468	2026-11-05 17:21:53.469	\N	\N	\N
62	ocj2fa30xg4fetfp9c2y2pwu	plugin::content-manager.explorer.read	{}	admin::transfer-token	{"fields": ["name", "description", "accessKey", "lastUsedAt", "permissions", "expiresAt", "lifespan"]}	[]	2026-11-05 17:21:53.471	2026-11-05 17:21:53.471	2026-11-05 17:21:53.471	\N	\N	\N
63	srzx2tys81mwo05ciy8u0x2e	plugin::content-manager.explorer.read	{}	admin::transfer-token-permission	{"fields": ["action", "token"]}	[]	2026-11-05 17:21:53.473	2026-11-05 17:21:53.473	2026-11-05 17:21:53.473	\N	\N	\N
64	uxopi53wkh8sagpbdt3408aq	plugin::content-manager.explorer.read	{}	admin::session	{"fields": ["userId", "sessionId", "childId", "deviceId", "origin", "expiresAt", "absoluteExpiresAt", "status", "type", "metadata"]}	[]	2026-11-05 17:21:53.476	2026-11-05 17:21:53.476	2026-11-05 17:21:53.476	\N	\N	\N
65	e1jgxwgk49p91wrx9au8hfmm	plugin::content-manager.explorer.update	{}	api::category.category	{"fields": ["name", "slug", "description", "color", "icon", "position", "discussions"]}	[]	2026-11-05 17:21:53.479	2026-11-05 17:21:53.479	2026-11-05 17:21:53.479	\N	\N	\N
66	fgurmgvu7lxhitnnz27x2rce	plugin::content-manager.explorer.update	{}	api::discussion.discussion	{"fields": ["title", "slug", "content", "type", "author", "category", "replies", "replyCount", "lastActivityAt", "isSolved"]}	[]	2026-11-05 17:21:53.481	2026-11-05 17:21:53.481	2026-11-05 17:21:53.481	\N	\N	\N
67	mbzwaqw59thhjaqurxd7erj2	plugin::content-manager.explorer.update	{}	api::reply.reply	{"fields": ["content", "author", "discussion", "isAccepted"]}	[]	2026-11-05 17:21:53.484	2026-11-05 17:21:53.484	2026-11-05 17:21:53.484	\N	\N	\N
68	w5id1jawb9ff92103mxgqa0v	plugin::content-manager.explorer.update	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "displayName", "bio", "avatarColor", "communityRole", "isSubscriber"]}	[]	2026-11-05 17:21:53.488	2026-11-05 17:21:53.488	2026-11-05 17:21:53.488	\N	\N	\N
69	tfenzfq1h122e9ugx9pr86n8	plugin::content-manager.explorer.delete	{}	api::category.category	{}	[]	2026-11-05 17:21:53.49	2026-11-05 17:21:53.49	2026-11-05 17:21:53.491	\N	\N	\N
70	zay77fg8knfcvnaei74udr56	plugin::content-manager.explorer.delete	{}	api::discussion.discussion	{}	[]	2026-11-05 17:21:53.495	2026-11-05 17:21:53.495	2026-11-05 17:21:53.495	\N	\N	\N
71	jefo0qygruf48y71netyf0d5	plugin::content-manager.explorer.delete	{}	api::reply.reply	{}	[]	2026-11-05 17:21:53.498	2026-11-05 17:21:53.498	2026-11-05 17:21:53.498	\N	\N	\N
72	byi3wszxwwgo050y22hsu8uv	plugin::content-manager.explorer.delete	{}	plugin::users-permissions.user	{}	[]	2026-11-05 17:21:53.501	2026-11-05 17:21:53.501	2026-11-05 17:21:53.501	\N	\N	\N
73	p38qxydw9kv15e1600f4v3yt	plugin::content-manager.explorer.publish	{}	api::category.category	{}	[]	2026-11-05 17:21:53.504	2026-11-05 17:21:53.504	2026-11-05 17:21:53.504	\N	\N	\N
74	k5osce5syuv3nn7qassj1yr9	plugin::content-manager.explorer.publish	{}	api::discussion.discussion	{}	[]	2026-11-05 17:21:53.506	2026-11-05 17:21:53.506	2026-11-05 17:21:53.507	\N	\N	\N
75	bcqydjsn40ywgwtwt8ya12z1	plugin::content-manager.explorer.publish	{}	api::reply.reply	{}	[]	2026-11-05 17:21:53.508	2026-11-05 17:21:53.508	2026-11-05 17:21:53.509	\N	\N	\N
76	bwz31bld6i28e679s0uis137	plugin::content-manager.explorer.publish	{}	plugin::users-permissions.user	{}	[]	2026-11-05 17:21:53.511	2026-11-05 17:21:53.511	2026-11-05 17:21:53.511	\N	\N	\N
77	n1mhvn35fj95pppeb9kjnn6d	plugin::content-manager.single-types.configure-view	{}	\N	{}	[]	2026-11-05 17:21:53.513	2026-11-05 17:21:53.513	2026-11-05 17:21:53.513	\N	\N	\N
78	p6lzrfxn2w2y86uhq5d5gma8	plugin::content-manager.collection-types.configure-view	{}	\N	{}	[]	2026-11-05 17:21:53.515	2026-11-05 17:21:53.515	2026-11-05 17:21:53.515	\N	\N	\N
79	f4owd4l5jtuhr13tzjh7fwfq	plugin::content-manager.components.configure-layout	{}	\N	{}	[]	2026-11-05 17:21:53.517	2026-11-05 17:21:53.517	2026-11-05 17:21:53.517	\N	\N	\N
80	b7qhzhheq49ys0f6y12rt0cz	plugin::content-type-builder.read	{}	\N	{}	[]	2026-11-05 17:21:53.522	2026-11-05 17:21:53.522	2026-11-05 17:21:53.522	\N	\N	\N
81	d0jogrw57igkbg770a7pl1qn	plugin::email.settings.read	{}	\N	{}	[]	2026-11-05 17:21:53.525	2026-11-05 17:21:53.525	2026-11-05 17:21:53.525	\N	\N	\N
82	vdxoniiqf5l9lr1bccj5v3tm	plugin::upload.read	{}	\N	{}	[]	2026-11-05 17:21:53.527	2026-11-05 17:21:53.527	2026-11-05 17:21:53.527	\N	\N	\N
83	lhsse39itudv8dk8f9oqxplj	plugin::upload.assets.create	{}	\N	{}	[]	2026-11-05 17:21:53.531	2026-11-05 17:21:53.531	2026-11-05 17:21:53.531	\N	\N	\N
84	me1xwjsw1xemx31w710fe5dt	plugin::upload.assets.update	{}	\N	{}	[]	2026-11-05 17:21:53.533	2026-11-05 17:21:53.533	2026-11-05 17:21:53.533	\N	\N	\N
85	zwgjsz2z24mqltq6mjayf1s2	plugin::upload.assets.download	{}	\N	{}	[]	2026-11-05 17:21:53.536	2026-11-05 17:21:53.536	2026-11-05 17:21:53.536	\N	\N	\N
86	gncl5c4e4fdszjctsygr3oan	plugin::upload.assets.copy-link	{}	\N	{}	[]	2026-11-05 17:21:53.538	2026-11-05 17:21:53.538	2026-11-05 17:21:53.538	\N	\N	\N
87	a35cdbdensn8cn5hluzykxdt	plugin::upload.configure-view	{}	\N	{}	[]	2026-11-05 17:21:53.54	2026-11-05 17:21:53.54	2026-11-05 17:21:53.54	\N	\N	\N
88	hjemwjpg15nfyisywii6xrxy	plugin::upload.settings.read	{}	\N	{}	[]	2026-11-05 17:21:53.542	2026-11-05 17:21:53.542	2026-11-05 17:21:53.542	\N	\N	\N
89	bndr4bpzmufpjt2gewurxiae	plugin::i18n.locale.create	{}	\N	{}	[]	2026-11-05 17:21:53.544	2026-11-05 17:21:53.544	2026-11-05 17:21:53.544	\N	\N	\N
90	zw8t1txcyt39a2gxpmjg092x	plugin::i18n.locale.read	{}	\N	{}	[]	2026-11-05 17:21:53.546	2026-11-05 17:21:53.546	2026-11-05 17:21:53.546	\N	\N	\N
91	lnvbvmcsno80sxxxh1q2qvix	plugin::i18n.locale.update	{}	\N	{}	[]	2026-11-05 17:21:53.548	2026-11-05 17:21:53.548	2026-11-05 17:21:53.548	\N	\N	\N
92	bu586tsj0ir0q0452dw3d8up	plugin::i18n.locale.delete	{}	\N	{}	[]	2026-11-05 17:21:53.55	2026-11-05 17:21:53.55	2026-11-05 17:21:53.55	\N	\N	\N
93	z9wxsjtlctixltrpbd7li6uh	plugin::users-permissions.roles.create	{}	\N	{}	[]	2026-11-05 17:21:53.552	2026-11-05 17:21:53.552	2026-11-05 17:21:53.552	\N	\N	\N
94	nycb9vr52ijihk46kp3lom9u	plugin::users-permissions.roles.read	{}	\N	{}	[]	2026-11-05 17:21:53.554	2026-11-05 17:21:53.554	2026-11-05 17:21:53.554	\N	\N	\N
95	ur3rc7f2hppiwlkll63wvc78	plugin::users-permissions.roles.update	{}	\N	{}	[]	2026-11-05 17:21:53.556	2026-11-05 17:21:53.556	2026-11-05 17:21:53.556	\N	\N	\N
96	bbvekemzzlzu8781r68ff17h	plugin::users-permissions.roles.delete	{}	\N	{}	[]	2026-11-05 17:21:53.561	2026-11-05 17:21:53.561	2026-11-05 17:21:53.561	\N	\N	\N
97	ctdba5408eqxnjmml7z5mcav	plugin::users-permissions.providers.read	{}	\N	{}	[]	2026-11-05 17:21:53.563	2026-11-05 17:21:53.563	2026-11-05 17:21:53.563	\N	\N	\N
98	g5gp9y0p9svhj92moak6hb65	plugin::users-permissions.providers.update	{}	\N	{}	[]	2026-11-05 17:21:53.565	2026-11-05 17:21:53.565	2026-11-05 17:21:53.565	\N	\N	\N
99	n61ondtv1litj1knhv3ty5r2	plugin::users-permissions.email-templates.read	{}	\N	{}	[]	2026-11-05 17:21:53.567	2026-11-05 17:21:53.567	2026-11-05 17:21:53.567	\N	\N	\N
100	s2gpx6ggu8e58thejl51i4a7	plugin::users-permissions.email-templates.update	{}	\N	{}	[]	2026-11-05 17:21:53.569	2026-11-05 17:21:53.569	2026-11-05 17:21:53.57	\N	\N	\N
101	hb0s4jrpurc1vqip42hyw7pt	plugin::users-permissions.advanced-settings.read	{}	\N	{}	[]	2026-11-05 17:21:53.573	2026-11-05 17:21:53.573	2026-11-05 17:21:53.573	\N	\N	\N
102	lqy7pit83rhggm84ileuhpkr	plugin::users-permissions.advanced-settings.update	{}	\N	{}	[]	2026-11-05 17:21:53.575	2026-11-05 17:21:53.575	2026-11-05 17:21:53.575	\N	\N	\N
103	pg9lransx2lznmiy8oc7k27l	admin::marketplace.read	{}	\N	{}	[]	2026-11-05 17:21:53.577	2026-11-05 17:21:53.577	2026-11-05 17:21:53.577	\N	\N	\N
104	dlbmupswy23lolgvlsa31afd	admin::webhooks.create	{}	\N	{}	[]	2026-11-05 17:21:53.58	2026-11-05 17:21:53.58	2026-11-05 17:21:53.58	\N	\N	\N
105	vv9bfv3158qzvqzwp7uxzdj9	admin::webhooks.read	{}	\N	{}	[]	2026-11-05 17:21:53.583	2026-11-05 17:21:53.583	2026-11-05 17:21:53.583	\N	\N	\N
106	tpfufsclwqj8iqi6ptvmma5a	admin::webhooks.update	{}	\N	{}	[]	2026-11-05 17:21:53.586	2026-11-05 17:21:53.586	2026-11-05 17:21:53.586	\N	\N	\N
107	pvfjb3660f2r6iflmho3g5jo	admin::webhooks.delete	{}	\N	{}	[]	2026-11-05 17:21:53.589	2026-11-05 17:21:53.589	2026-11-05 17:21:53.589	\N	\N	\N
108	dm32k1dbnwdpgxw4r9x90vzs	admin::users.create	{}	\N	{}	[]	2026-11-05 17:21:53.594	2026-11-05 17:21:53.594	2026-11-05 17:21:53.594	\N	\N	\N
109	uekex0arylth9ucr64twjbgc	admin::users.read	{}	\N	{}	[]	2026-11-05 17:21:53.596	2026-11-05 17:21:53.596	2026-11-05 17:21:53.596	\N	\N	\N
110	m83ik63zwqdshp75i93asy3d	admin::users.update	{}	\N	{}	[]	2026-11-05 17:21:53.598	2026-11-05 17:21:53.598	2026-11-05 17:21:53.598	\N	\N	\N
111	cutnahhvaznu6kusjz2skmi1	admin::users.delete	{}	\N	{}	[]	2026-11-05 17:21:53.6	2026-11-05 17:21:53.6	2026-11-05 17:21:53.6	\N	\N	\N
112	ykeiu6tfsvubsrmivh840w2n	admin::roles.create	{}	\N	{}	[]	2026-11-05 17:21:53.602	2026-11-05 17:21:53.602	2026-11-05 17:21:53.602	\N	\N	\N
113	f80xdqxmrlbbn3xd1el44sdw	admin::roles.read	{}	\N	{}	[]	2026-11-05 17:21:53.604	2026-11-05 17:21:53.604	2026-11-05 17:21:53.604	\N	\N	\N
114	s5dbq9ohzfelgpnhx8ul33gg	admin::roles.update	{}	\N	{}	[]	2026-11-05 17:21:53.606	2026-11-05 17:21:53.606	2026-11-05 17:21:53.606	\N	\N	\N
115	pqc7snsnqg6788g445w6mrt1	admin::roles.delete	{}	\N	{}	[]	2026-11-05 17:21:53.609	2026-11-05 17:21:53.609	2026-11-05 17:21:53.609	\N	\N	\N
116	eauapvxebu13qjzcxelefwo0	admin::api-tokens.access	{}	\N	{}	[]	2026-11-05 17:21:53.612	2026-11-05 17:21:53.612	2026-11-05 17:21:53.612	\N	\N	\N
117	oalfud7p6doab2ffw0ifn3a9	admin::admin-tokens.access	{}	\N	{}	[]	2026-11-05 17:21:53.614	2026-11-05 17:21:53.614	2026-11-05 17:21:53.614	\N	\N	\N
118	eppr1sx6hdld28u2viz9omhe	admin::admin-tokens.create	{}	\N	{}	[]	2026-11-05 17:21:53.619	2026-11-05 17:21:53.619	2026-11-05 17:21:53.619	\N	\N	\N
119	a7qchnx604lk9y80pdvkq2kj	admin::admin-tokens.read	{}	\N	{}	[]	2026-11-05 17:21:53.621	2026-11-05 17:21:53.621	2026-11-05 17:21:53.621	\N	\N	\N
120	g6r8yf75jlilciyizsvf8aq6	admin::admin-tokens.update	{}	\N	{}	[]	2026-11-05 17:21:53.623	2026-11-05 17:21:53.623	2026-11-05 17:21:53.623	\N	\N	\N
121	az5zlbcd8nbqp6wf3e0zrt2e	admin::admin-tokens.regenerate	{}	\N	{}	[]	2026-11-05 17:21:53.625	2026-11-05 17:21:53.625	2026-11-05 17:21:53.625	\N	\N	\N
122	fgfrcic7zppesd92ggx14f74	admin::admin-tokens.delete	{}	\N	{}	[]	2026-11-05 17:21:53.627	2026-11-05 17:21:53.627	2026-11-05 17:21:53.627	\N	\N	\N
124	bip12a1kxjq06j6wyri0rdyw	admin::api-tokens.read	{}	\N	{}	[]	2026-11-05 17:21:53.631	2026-11-05 17:21:53.631	2026-11-05 17:21:53.631	\N	\N	\N
125	asc68fh3ejy4ke62rhuk9zu0	admin::api-tokens.update	{}	\N	{}	[]	2026-11-05 17:21:53.633	2026-11-05 17:21:53.633	2026-11-05 17:21:53.633	\N	\N	\N
126	jf9vu0bi6ovkfv3l5fthjefz	admin::api-tokens.regenerate	{}	\N	{}	[]	2026-11-05 17:21:53.635	2026-11-05 17:21:53.635	2026-11-05 17:21:53.635	\N	\N	\N
127	w3uk4s5wti4e8j4e1c9xzweb	admin::api-tokens.delete	{}	\N	{}	[]	2026-11-05 17:21:53.636	2026-11-05 17:21:53.636	2026-11-05 17:21:53.637	\N	\N	\N
128	oh2sx1nawbkb17hhf5hb7bva	admin::project-settings.update	{}	\N	{}	[]	2026-11-05 17:21:53.638	2026-11-05 17:21:53.638	2026-11-05 17:21:53.639	\N	\N	\N
129	oms3v5m6isw9z0b1jwq44ehe	admin::project-settings.read	{}	\N	{}	[]	2026-11-05 17:21:53.641	2026-11-05 17:21:53.641	2026-11-05 17:21:53.641	\N	\N	\N
130	mnm4tznadnfojmg9ew3o30re	admin::debug-dump.read	{}	\N	{}	[]	2026-11-05 17:21:53.643	2026-11-05 17:21:53.643	2026-11-05 17:21:53.643	\N	\N	\N
131	yxrbqz5sz8ytj22ps0mwzzgz	admin::transfer.tokens.access	{}	\N	{}	[]	2026-11-05 17:21:53.646	2026-11-05 17:21:53.646	2026-11-05 17:21:53.646	\N	\N	\N
132	i3seslsk9n8808pyaja04548	admin::transfer.tokens.create	{}	\N	{}	[]	2026-11-05 17:21:53.649	2026-11-05 17:21:53.649	2026-11-05 17:21:53.649	\N	\N	\N
133	u0r5l1j9lub5gudoccke5vpt	admin::transfer.tokens.read	{}	\N	{}	[]	2026-11-05 17:21:53.651	2026-11-05 17:21:53.651	2026-11-05 17:21:53.651	\N	\N	\N
134	y4z5n7c679ptu5minw6adc7i	admin::transfer.tokens.update	{}	\N	{}	[]	2026-11-05 17:21:53.653	2026-11-05 17:21:53.653	2026-11-05 17:21:53.653	\N	\N	\N
135	hn6salfl8lez7wbf5uzhisqe	admin::transfer.tokens.regenerate	{}	\N	{}	[]	2026-11-05 17:21:53.655	2026-11-05 17:21:53.655	2026-11-05 17:21:53.655	\N	\N	\N
136	u426qtfjsg8ot3sm5npku3xp	admin::transfer.tokens.delete	{}	\N	{}	[]	2026-11-05 17:21:53.658	2026-11-05 17:21:53.658	2026-11-05 17:21:53.658	\N	\N	\N
\.


--
-- Data for Name: admin_permissions_api_token_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.admin_permissions_api_token_lnk (id, permission_id, api_token_id, permission_ord) FROM stdin;
\.


--
-- Data for Name: admin_permissions_role_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.admin_permissions_role_lnk (id, permission_id, role_id, permission_ord) FROM stdin;
1	1	2	1
2	2	2	2
3	3	2	3
4	4	2	4
5	5	2	5
6	6	2	6
7	7	2	7
8	8	2	8
9	9	2	9
10	10	2	10
11	11	2	11
12	12	2	12
13	13	2	13
14	14	2	14
15	15	2	15
16	16	2	16
17	17	2	17
18	18	2	18
19	19	2	19
20	20	2	20
21	21	2	21
22	22	3	1
23	23	3	2
24	24	3	3
25	25	3	4
26	26	3	5
27	27	3	6
28	28	3	7
29	29	3	8
30	30	3	9
31	31	3	10
32	32	3	11
33	33	3	12
34	34	3	13
35	35	3	14
36	36	3	15
37	37	3	16
38	38	3	17
39	39	3	18
40	40	1	1
41	41	1	2
42	42	1	3
43	43	1	4
44	44	1	5
45	45	1	6
46	46	1	7
47	47	1	8
48	48	1	9
49	49	1	10
50	50	1	11
51	51	1	12
52	52	1	13
53	53	1	14
54	54	1	15
55	55	1	16
56	56	1	17
57	57	1	18
58	58	1	19
59	59	1	20
60	60	1	21
61	61	1	22
62	62	1	23
63	63	1	24
64	64	1	25
65	65	1	26
66	66	1	27
67	67	1	28
68	68	1	29
69	69	1	30
70	70	1	31
71	71	1	32
72	72	1	33
73	73	1	34
74	74	1	35
75	75	1	36
76	76	1	37
77	77	1	38
78	78	1	39
79	79	1	40
80	80	1	41
81	81	1	42
82	82	1	43
83	83	1	44
84	84	1	45
85	85	1	46
86	86	1	47
87	87	1	48
88	88	1	49
89	89	1	50
90	90	1	51
91	91	1	52
92	92	1	53
93	93	1	54
94	94	1	55
95	95	1	56
96	96	1	57
97	97	1	58
98	98	1	59
99	99	1	60
100	100	1	61
101	101	1	62
102	102	1	63
103	103	1	64
104	104	1	65
105	105	1	66
106	106	1	67
107	107	1	68
108	108	1	69
109	109	1	70
110	110	1	71
111	111	1	72
112	112	1	73
113	113	1	74
114	114	1	75
115	115	1	76
116	116	1	77
117	117	1	78
118	118	1	79
119	119	1	80
120	120	1	81
121	121	1	82
122	122	1	83
123	123	1	84
124	124	1	85
125	125	1	86
126	126	1	87
127	127	1	88
128	128	1	89
129	129	1	90
130	130	1	91
131	131	1	92
132	132	1	93
133	133	1	94
134	134	1	95
135	135	1	96
136	136	1	97
\.


--
-- Data for Name: admin_roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.admin_roles (id, document_id, name, code, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	m4t6bgsq96828yd7y3gre2cx	Super Admin	strapi-super-admin	Super Admins can access and manage all features and settings.	2026-11-05 17:21:53.278	2026-11-05 17:21:53.278	2026-11-05 17:21:53.278	\N	\N	\N
2	gaskvr5780k8qamy7nhk2edr	Editor	strapi-editor	Editors can manage and publish contents including those of other users.	2026-11-05 17:21:53.283	2026-11-05 17:21:53.283	2026-11-05 17:21:53.283	\N	\N	\N
3	ujmetupqyrhk8sucidknpxut	Author	strapi-author	Authors can manage the content they have created.	2026-11-05 17:21:53.285	2026-11-05 17:21:53.285	2026-11-05 17:21:53.285	\N	\N	\N
\.


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.admin_users (id, document_id, firstname, lastname, username, email, password, reset_password_token, reset_password_token_expires_at, registration_token, is_active, blocked, prefered_language, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	ain7iegwch8jipto6w63fx4j	Admin	Le Revenu	\N	admin@lerevenu.local	$2a$10$sMaL5NNTYA0BdmY91G0K8eIR0b0Nn3YiIb6VRK.MuPLiY4/cWmyu2	\N	\N	\N	t	f	\N	2026-11-05 17:21:53.83	2026-11-05 17:21:53.83	2026-11-05 17:21:53.831	\N	\N	\N
\.


--
-- Data for Name: admin_users_roles_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.admin_users_roles_lnk (id, user_id, role_id, role_ord, user_ord) FROM stdin;
1	1	1	1	1
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.categories (id, document_id, name, slug, description, color, icon, "position", created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	fk923koor0j96tsspo16sdwc	Bourse & actions	bourse	Actions, ETF, PEA, compte-titres : stratégies et retours d'expérience.	#007aff	candles	0	2026-11-05 17:21:53.849	2026-11-05 17:21:53.849	2026-11-05 17:21:53.845	\N	\N	\N
2	tjsobj9wf1sknawyetwrtp9t	Économie	economie	Conjoncture, taux, inflation, emploi : l'actualité économique en France, en Europe et dans le monde.	#3d5a80	globe	1	2026-11-05 17:21:53.853	2026-11-05 17:21:53.853	2026-11-05 17:21:53.851	\N	\N	\N
3	v1ti4f4w8b6yhb13ikb9a0mu	Épargne & placements	epargne	Livrets, fonds euros, obligations, comptes à terme.	#34c759	piggy	2	2026-11-05 17:21:53.856	2026-11-05 17:21:53.856	2026-11-05 17:21:53.855	\N	\N	\N
4	zzznjzklr2cnkzvwynkd83pv	Assurance-vie	assurance-vie	Choisir son contrat, arbitrer, transmettre.	#30b0c7	umbrella	3	2026-11-05 17:21:53.859	2026-11-05 17:21:53.859	2026-11-05 17:21:53.857	\N	\N	\N
5	yp0ckqgqh3bb7rnj6dw7zp61	Immobilier & SCPI	immobilier	Résidence principale, locatif, SCPI, crédit immobilier.	#ff9500	building	4	2026-11-05 17:21:53.861	2026-11-05 17:21:53.861	2026-11-05 17:21:53.86	\N	\N	\N
6	fh6abdtotcsd87g12d0kw6py	Impôts & fiscalité	impots	Déclaration, niches fiscales, IFI : payer le juste impôt.	#5856d6	receipt	5	2026-11-05 17:21:53.867	2026-11-05 17:21:53.867	2026-11-05 17:21:53.864	\N	\N	\N
7	s3mup72vf5ha3hjgx02kadjy	Retraite	retraite	PER, rachat de trimestres, cumul emploi-retraite.	#ff2d55	armchair	6	2026-11-05 17:21:53.87	2026-11-05 17:21:53.87	2026-11-05 17:21:53.868	\N	\N	\N
8	arzhzelboucj51hf6l993aez	Famille & transmission	transmission	Donation, succession, protection du conjoint.	#af52de	family	7	2026-11-05 17:21:53.872	2026-11-05 17:21:53.872	2026-11-05 17:21:53.871	\N	\N	\N
9	hdj07t4pmy34s0jsa1jj2ikr	Or, cryptos & alternatifs	alternatifs	Or physique, cryptoactifs, forêts, private equity.	#00c7be	gem	8	2026-11-05 17:21:53.877	2026-11-05 17:21:53.877	2026-11-05 17:21:53.874	\N	\N	\N
10	s86heln762mssbibqnkvwas3	Budget & conso	budget	Banques, crédits, assurances, bons plans.	#8e8e93	wallet	9	2026-11-05 17:21:53.88	2026-11-05 17:21:53.88	2026-11-05 17:21:53.879	\N	\N	\N
11	svgjtobnpqrxeuge89d8jl6s	Le Café du Revenu	cafe	Présentations, discussions libres, idées pour la rédaction.	#a2845e	coffee	10	2026-11-05 17:21:53.883	2026-11-05 17:21:53.883	2026-11-05 17:21:53.881	\N	\N	\N
\.


--
-- Data for Name: discussions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.discussions (id, document_id, title, slug, content, type, reply_count, last_activity_at, is_solved, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	zui8cc2wufci7pz6odj7lgsh	Bienvenue dans la Communauté du Revenu ! Présentez-vous ici	bienvenue-dans-la-communaute-du-revenu-presentez-vous-ici	Bonjour à toutes et à tous,\n\nCet espace est le vôtre : posez vos questions, partagez vos expériences, aidez les autres membres. Les journalistes du Revenu passent chaque jour et répondent aux questions les plus utiles.\n\n**Pour bien démarrer :**\n- Présentez-vous en une phrase en réponse à ce message\n- Choisissez les espaces qui vous intéressent\n- Marquez « Utile » les réponses qui vous aident : c'est ce qui fait remonter les meilleures contributions\n\nBienvenue !	discussion	4	2026-11-03 09:21:55.189	f	2026-10-27 17:21:55.153	2026-10-27 17:21:55.153	2026-10-27 17:21:55.153	\N	\N	\N
2	f5olcrwpik2w7zdz3vwmhd9q	Question de la semaine : quel est le meilleur conseil d'argent que vous ayez reçu ?	question-de-la-semaine-quel-est-le-meilleur-conseil-d-argent-que-vous-ayez-recu	Chaque semaine, la rédaction pose une question à la communauté. Les réponses les plus inspirantes pourront être reprises, avec votre accord, dans la newsletter.\n\nAlors : quel conseil d'argent a changé votre vie ? Qui vous l'a donné ?	discussion	5	2026-11-05 10:47:55.228	f	2026-11-04 11:21:55.191	2026-11-04 11:21:55.191	2026-11-04 11:21:55.191	\N	\N	\N
3	dj85tiaj4vhz1r3a67vuro6k	Sondage de la semaine : quel est votre placement prioritaire pour les 12 prochains mois ?	sondage-de-la-semaine-quel-est-votre-placement-prioritaire-pour-les-12	Votez puis expliquez votre choix en commentaire : les résultats seront commentés dans le prochain numéro.\n\n- Assurance-vie\n- Actions / PEA\n- Immobilier / SCPI\n- Livrets et épargne sans risque\n- Or\n- Rembourser mes crédits	discussion	3	2026-11-05 10:59:55.25	f	2026-11-04 21:21:55.229	2026-11-04 21:21:55.229	2026-11-04 21:21:55.229	\N	\N	\N
4	wpg1rw0p1s1vyx67av5wbtok	Ouvrir un PEA avec 5 000 € : par où commencer ?	ouvrir-un-pea-avec-5-000-eur-par-ou-commencer	Bonjour, je viens d'ouvrir un PEA en ligne et j'ai 5 000 € à y placer. Je ne connais pas grand-chose aux actions.\n\nVaut-il mieux tout investir d'un coup ou étaler ? Et sur quoi : des ETF, quelques actions ?	question	4	2026-11-05 04:23:55.28	t	2026-11-03 15:21:55.252	2026-11-03 15:21:55.252	2026-11-03 15:21:55.252	\N	\N	\N
5	ncf9hqr9bhbe2nssstmqije8	J'ai 25 ans et 10 000 € de côté : je fais quoi ?	j-ai-25-ans-et-10-000-eur-de-cote-je-fais-quoi	Premier CDI depuis un an, j'ai réussi à mettre 10 000 € de côté sur un livret. Pas de projet immobilier avant quatre ou cinq ans.\n\nJe me sens un peu perdu entre PEA, assurance-vie, PER… Comment auriez-vous réparti à mon âge ?	question	4	2026-11-05 13:43:55.313	f	2026-11-05 03:21:55.281	2026-11-05 03:21:55.281	2026-11-05 03:21:55.281	\N	\N	\N
6	gh7sreg5v967y71skbthddgq	Assurance-vie après 70 ans : est-ce encore intéressant ?	assurance-vie-apres-70-ans-est-ce-encore-interessant	J'ai 71 ans et je me demande s'il est encore utile de verser sur une assurance-vie, notamment pour la transmission à mes petits-enfants. On m'a dit que la fiscalité était moins avantageuse après 70 ans ?	question	3	2026-11-04 18:26:55.342	t	2026-11-02 17:21:55.314	2026-11-02 17:21:55.314	2026-11-02 17:21:55.314	\N	\N	\N
7	hno960upfsvlm22nd37j61yz	SCPI : vous avez renforcé ces derniers mois ou vous attendez ?	scpi-vous-avez-renforce-ces-derniers-mois-ou-vous-attendez	Après les baisses de prix de parts de certaines SCPI, je vois deux écoles autour de moi : ceux qui en profitent pour renforcer et ceux qui ne veulent plus en entendre parler.\n\nEt vous, comment avez-vous réagi ?	discussion	3	2026-11-05 05:54:55.368	f	2026-11-04 05:21:55.344	2026-11-04 05:21:55.344	2026-11-04 05:21:55.344	\N	\N	\N
8	tegroscin88hlqz83pqfeuyo	Frais réels ou abattement de 10 % : comment savoir ce qui est le plus avantageux ?	frais-reels-ou-abattement-de-10-pourcent-comment-savoir-ce-qui-est-le-plus	Je fais 35 km aller-retour par jour en voiture pour aller travailler. Est-ce que je devrais passer aux frais réels ?	question	2	2026-11-04 01:49:55.393	t	2026-11-01 17:21:55.37	2026-11-01 17:21:55.37	2026-11-01 17:21:55.37	\N	\N	\N
9	ymp8dfaqbdzmm9uzaaqpqt6e	Donation aux enfants : faut-il le faire maintenant ou attendre ?	donation-aux-enfants-faut-il-le-faire-maintenant-ou-attendre	Nos enfants ont 19, 22 et 25 ans. Nous pensons à leur donner une partie de notre épargne pour les aider à démarrer. Est-ce le bon moment ? Quels pièges éviter ?	question	3	2026-11-05 04:37:55.422	f	2026-11-04 01:21:55.395	2026-11-04 01:21:55.395	2026-11-04 01:21:55.395	\N	\N	\N
10	zrle9u4ejpuwa4mf3hhw9m2u	PER : vos retours d'expérience après quelques années ?	per-vos-retours-d-experience-apres-quelques-annees	J'ai ouvert un PER il y a trois ans pour la déduction fiscale. Je m'interroge sur les frais et la sortie. Vos retours ?	discussion	3	2026-11-04 22:16:55.455	f	2026-11-03 05:21:55.425	2026-11-03 05:21:55.425	2026-11-03 05:21:55.425	\N	\N	\N
11	c7bfhhcsue1rve5uklliozro	Combien de lignes avez-vous dans votre PEA ?	combien-de-lignes-avez-vous-dans-votre-pea	Petit sondage par curiosité. Moi j'en ai 14, et je me demande si ce n'est pas trop !\n\n- 1 à 3\n- 4 à 10\n- 11 à 20\n- Plus de 20	discussion	2	2026-11-04 08:25:55.479	f	2026-11-02 09:21:55.457	2026-11-02 09:21:55.457	2026-11-02 09:21:55.457	\N	\N	\N
12	jdr3e3dvgq3esarrh4gm3h69	Or physique : pièces ou lingots, que privilégiez-vous ?	or-physique-pieces-ou-lingots-que-privilegiez-vous	Je commence à acheter un peu d'or physique. Pièces ou petits lingots ? Et où les stockez-vous ?	discussion	2	2026-11-03 20:03:55.502	f	2026-11-01 03:21:55.481	2026-11-01 03:21:55.481	2026-11-01 03:21:55.481	\N	\N	\N
13	k3slhhulywxmzr8y8uxv7f3c	Changer de banque : vos retours sur la mobilité bancaire ?	changer-de-banque-vos-retours-sur-la-mobilite-bancaire	Je veux quitter ma banque traditionnelle pour une banque en ligne. Le service de mobilité fonctionne-t-il vraiment bien ?	question	1	2026-11-05 12:41:55.516	f	2026-11-05 09:21:55.503	2026-11-05 09:21:55.503	2026-11-05 09:21:55.503	\N	\N	\N
14	vxkvb1ucuy6zhiuc8kz7phjl	Quel sujet aimeriez-vous voir traité par la rédaction ?	quel-sujet-aimeriez-vous-voir-traite-par-la-redaction	La rédaction lit ce forum, profitons-en ! Moi j'aimerais un dossier complet sur la succession dans les familles recomposées.	discussion	3	2026-11-05 09:05:55.548	f	2026-11-04 15:21:55.518	2026-11-04 15:21:55.518	2026-11-04 15:21:55.518	\N	\N	\N
15	bxuxnzq4brap1aqgbzmnra0z	Location meublée : micro-BIC ou régime réel ?	location-meublee-micro-bic-ou-regime-reel	Je loue un studio meublé depuis deux mois. Je ne sais pas quel régime choisir pour ma première déclaration. Comment avez-vous fait votre choix ?	question	0	2026-11-05 12:21:55.549	f	2026-11-05 12:21:55.549	2026-11-05 12:21:55.549	2026-11-05 12:21:55.549	\N	\N	\N
16	sm8kmbkqylqry1037vlicnew	Dividendes sur un compte-titres : flat tax ou barème ?	dividendes-sur-un-compte-titres-flat-tax-ou-bareme	Je perçois des dividendes sur un compte-titres ordinaire. Flat tax ou barème progressif : qu'avez-vous choisi et pourquoi ?	question	0	2026-11-05 14:21:55.561	f	2026-11-05 14:21:55.561	2026-11-05 14:21:55.561	2026-11-05 14:21:55.561	\N	\N	\N
17	rdr6iwzjryygp01eazdbydze	Rachat de trimestres : est-ce que ça vaut vraiment le coup ?	rachat-de-trimestres-est-ce-que-ca-vaut-vraiment-le-coup	Une amie a racheté des trimestres pour partir plus tôt. Le coût m'a paru énorme. Quelqu'un a fait le calcul ?	question	1	2026-11-02 13:31:55.602	f	2026-10-31 07:21:55.572	2026-10-31 07:21:55.572	2026-10-31 07:21:55.572	\N	\N	\N
18	heeyvwtqub1jrhxiwac87dht	Fonds euros : quelle part gardez-vous dans votre contrat ?	fonds-euros-quelle-part-gardez-vous-dans-votre-contrat	Suite à l'article du Revenu sur les rendements des fonds euros, je me demande quelle part vous conservez en fonds euros et en unités de compte.	discussion	3	2026-11-05 11:37:55.64	f	2026-11-04 23:21:55.603	2026-11-04 23:21:55.603	2026-11-04 23:21:55.603	\N	\N	\N
19	gseefxj59wkcpeazrrt6068z	Crédit immobilier : renégocier ou faire racheter son prêt ?	credit-immobilier-renegocier-ou-faire-racheter-son-pret	Mon taux actuel est plus élevé que les offres du moment. Vaut-il mieux renégocier avec ma banque ou passer par un rachat de crédit ? Vos expériences ?	question	0	2026-11-05 15:21:55.642	f	2026-11-05 15:21:55.642	2026-11-05 15:21:55.642	2026-11-05 15:21:55.642	\N	\N	\N
20	j9h2t494s8g1oo0m2fgte9k9	Taux de la BCE : suivez-vous ses décisions pour vos placements ?	taux-de-la-bce-suivez-vous-ses-decisions-pour-vos-placements	Je découvre que les décisions de la Banque centrale européenne pèsent à la fois sur les crédits immobiliers, la rémunération de l'épargne et les marchés. Est-ce que vous les suivez, et est-ce qu'elles changent vos choix ?	discussion	2	2026-11-05 05:49:55.666	f	2026-11-04 13:21:55.648	2026-11-04 13:21:55.648	2026-11-04 13:21:55.648	\N	\N	\N
\.


--
-- Data for Name: discussions_author_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.discussions_author_lnk (id, discussion_id, user_id) FROM stdin;
1	1	1
2	2	1
3	3	1
4	4	12
5	5	14
6	6	4
7	7	8
8	8	13
9	9	5
10	10	9
11	11	3
12	12	10
13	13	6
14	14	7
15	15	15
16	16	11
17	17	4
18	18	2
19	19	8
20	20	9
\.


--
-- Data for Name: discussions_category_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.discussions_category_lnk (id, discussion_id, category_id, discussion_ord) FROM stdin;
1	1	11	1
2	2	11	2
3	3	3	1
4	4	1	1
5	5	3	2
6	6	4	1
7	7	5	1
8	8	6	1
9	9	8	1
10	10	7	1
11	11	1	2
12	12	9	1
13	13	10	1
14	14	11	3
15	15	6	2
16	16	1	3
17	17	7	2
18	18	4	2
19	19	5	2
20	20	2	1
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.files (id, document_id, name, alternative_text, caption, focal_point, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: files_folder_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.files_folder_lnk (id, file_id, folder_id, file_ord) FROM stdin;
\.


--
-- Data for Name: files_related_mph; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.files_related_mph (id, file_id, related_id, related_type, field, "order") FROM stdin;
\.


--
-- Data for Name: i18n_locale; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.i18n_locale (id, document_id, name, code, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	wksxvfuvejqegp1khgr1qmg3	English (en)	en	2026-11-05 17:21:53.203	2026-11-05 17:21:53.203	2026-11-05 17:21:53.204	\N	\N	\N
\.


--
-- Data for Name: replies; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.replies (id, document_id, content, is_accepted, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	sp1jhsp59a0kkhfcswbusn7b	Bonjour ! Abonnée au magazine depuis 6 ans, ravie de pouvoir enfin échanger avec d'autres lecteurs.	f	2026-10-29 09:21:55.171	2026-10-29 09:21:55.171	2026-10-29 09:21:55.171	\N	\N	\N
2	x0dyrkjmhvogry8d8bwfa6j1	Salut tout le monde, Hugo, 25 ans. Premier CDI et premier salaire à placer : je suis là pour apprendre !	f	2026-10-31 01:21:55.177	2026-10-31 01:21:55.177	2026-10-31 01:21:55.177	\N	\N	\N
3	z9p6zesyp6byyzwbxybkf4ug	Bienvenue aux jeunes ! N'hésitez pas à poser des questions, même basiques. On est tous passés par là.	f	2026-11-01 17:21:55.183	2026-11-01 17:21:55.183	2026-11-01 17:21:55.183	\N	\N	\N
4	iylhce2xxm7erb5cwsl49qpx	Hello, Hélène. Je viens de mettre un studio en location meublée et j'ai mille questions sur la fiscalité.	f	2026-11-03 09:21:55.189	2026-11-03 09:21:55.189	2026-11-03 09:21:55.189	\N	\N	\N
5	dzwhp1ljn849ky1a8o4kn8io	Mon père : « N'investis jamais l'argent dont tu auras besoin dans les cinq ans. » Ça m'a évité bien des ventes en catastrophe.	f	2026-11-04 16:02:55.204	2026-11-04 16:02:55.204	2026-11-04 16:02:55.204	\N	\N	\N
6	u2yor5g28hxfx1s1am5qq0er	« Le temps passé sur le marché compte plus que le moment où on y entre. » Investir tous les mois, sans se poser de questions.	f	2026-11-04 20:43:55.21	2026-11-04 20:43:55.21	2026-11-04 20:43:55.21	\N	\N	\N
7	vd1u6hyzv34ssy7oi3c1wook	Faire le tour de ses contrats une fois par an. J'économise plusieurs centaines d'euros par an sur mes assurances grâce à ça.	f	2026-11-05 01:25:55.217	2026-11-05 01:25:55.217	2026-11-05 01:25:55.217	\N	\N	\N
8	of125vo3k2iig6kpcfimc56e	Ma notaire : « Une succession se prépare de son vivant, pas après. » On a tout réorganisé ensuite.	f	2026-11-05 06:06:55.222	2026-11-05 06:06:55.222	2026-11-05 06:06:55.222	\N	\N	\N
9	jenqz7lw4ku0muon6mjrz55l	Se constituer une épargne de précaution avant d'investir. Simple, mais je ne l'aurais pas fait spontanément.	f	2026-11-05 10:47:55.228	2026-11-05 10:47:55.228	2026-11-05 10:47:55.228	\N	\N	\N
10	ulzais5vsdec7x6kyxsrh1ac	PEA sans hésiter, versement programmé chaque mois sur un ETF monde.	f	2026-11-05 01:54:55.24	2026-11-05 01:54:55.24	2026-11-05 01:54:55.24	\N	\N	\N
11	pikmlzcv1sdfxe2ia9c1psv7	Assurance-vie, pour la souplesse et la transmission.	f	2026-11-05 06:26:55.245	2026-11-05 06:26:55.245	2026-11-05 06:26:55.245	\N	\N	\N
12	c9uvxkee12g38d0rfvbsxfwc	Un peu d'or, comme toujours. Ça ne rapporte rien mais ça rassure !	f	2026-11-05 10:59:55.25	2026-11-05 10:59:55.25	2026-11-05 10:59:55.25	\N	\N	\N
13	fd1dboehslek2mijt3e3mhue	Première chose : vous avez bien une épargne de précaution à côté ? Le PEA, c'est de l'argent qu'on oublie au moins cinq ans.	f	2026-11-04 00:37:55.262	2026-11-04 00:37:55.262	2026-11-04 00:37:55.262	\N	\N	\N
14	e0hy3bdvnrpnudu39fuxf9um	Mon expérience : pour débuter, un ETF éligible au PEA qui réplique un indice mondial fait très bien le travail. Une seule ligne, des frais faibles, une large diversification.\n\nPour l'entrée : investir une partie maintenant puis programmer un versement mensuel. On lisse son point d'entrée et on prend l'habitude.\n\nRappel utile : le PEA est plafonné à 150 000 € de versements, et après cinq ans les gains sont exonérés d'impôt sur le revenu (les prélèvements sociaux restent dus).	t	2026-11-04 09:52:55.268	2026-11-04 09:52:55.268	2026-11-04 09:52:55.268	\N	\N	\N
15	a7jmxmi1qh09gyyc17wezpse	Merci beaucoup, c'est très clair ! Oui, j'ai trois mois de salaire sur un livret à côté.	f	2026-11-04 19:08:55.274	2026-11-04 19:08:55.274	2026-11-04 19:08:55.274	\N	\N	\N
16	uhlox7ia1l5g5qhbpdq2j3ml	Très bonne réponse de @Vincent_ETF. Nous avons consacré un dossier aux ETF : comparez surtout les frais courants et la taille du fonds avant de choisir. Et gardez la tête froide les jours de baisse : c'est là que la régularité paie.	f	2026-11-05 04:23:55.28	2026-11-05 04:23:55.28	2026-11-05 04:23:55.28	\N	\N	\N
17	fllpa888c8rqpdgbls2xgpsb	Garde déjà trois à six mois de dépenses sur ton livret. Le reste peut travailler.	f	2026-11-05 05:57:55.293	2026-11-05 05:57:55.293	2026-11-05 05:57:55.293	\N	\N	\N
18	fy8ze8cj3nttmbqsclt72oqj	À 25 ans, ouvrir un PEA et une assurance-vie tôt, même avec peu, c'est surtout prendre date pour la fiscalité. L'antériorité compte.	f	2026-11-05 08:32:55.299	2026-11-05 08:32:55.299	2026-11-05 08:32:55.299	\N	\N	\N
19	hp2sidydg6pm09tc2330862k	Le PER peut attendre à mon avis : l'argent est bloqué jusqu'à la retraite (sauf achat de la résidence principale) et l'avantage fiscal est faible si ton taux d'imposition est bas.	f	2026-11-05 11:08:55.305	2026-11-05 11:08:55.305	2026-11-05 11:08:55.305	\N	\N	\N
20	wua3myz9f6pkwnv7aovqup6q	Pareil que les autres. Et surtout : automatise tes versements, c'est ce qui fait la différence sur vingt ans.	f	2026-11-05 13:43:55.313	2026-11-05 13:43:55.313	2026-11-05 13:43:55.313	\N	\N	\N
21	vl2l6grapinxwz0r3pyqw7ja	Oui, mais ça reste souvent intéressant. Pour les versements après 70 ans, l'abattement est de 30 500 € au total (tous bénéficiaires confondus) et il ne porte que sur les primes versées : les gains, eux, sont exonérés de droits de succession. Sur une longue durée, ça peut peser lourd.	t	2026-11-03 09:43:55.33	2026-11-03 09:43:55.33	2026-11-03 09:43:55.33	\N	\N	\N
22	d2eqc2hlq2tgboyvdurtkkhq	Merci ! Je ne savais pas que les gains étaient exonérés. Je vais en parler à mon conseiller.	f	2026-11-04 02:05:55.336	2026-11-04 02:05:55.336	2026-11-04 02:05:55.336	\N	\N	\N
23	br4th2mr3h2ygpvxhpbt03rc	Précision utile : pour les primes versées avant 70 ans, l'abattement est de 152 500 € par bénéficiaire. Les deux régimes peuvent se combiner sur un même contrat.	f	2026-11-04 18:26:55.342	2026-11-04 18:26:55.342	2026-11-04 18:26:55.342	\N	\N	\N
24	los61t1shjbk5fpzt7jakx7i	J'attends. J'ai été échaudée par les délais de revente sur une de mes SCPI.	f	2026-11-04 13:32:55.356	2026-11-04 13:32:55.356	2026-11-04 13:32:55.356	\N	\N	\N
25	tud2jda14caetiul6fuub8mt	J'ai renforcé, mais uniquement sur des SCPI récentes, sans immobilier de bureaux acheté au plus haut.	f	2026-11-04 21:43:55.362	2026-11-04 21:43:55.362	2026-11-04 21:43:55.362	\N	\N	\N
26	b2nhen9hq0sutt8zfro9svrf	C'est aussi mon approche. Je regarde maintenant de près le taux d'occupation et la diversification géographique.	f	2026-11-05 05:54:55.368	2026-11-05 05:54:55.368	2026-11-05 05:54:55.368	\N	\N	\N
27	zyvdvt2zzyupqk3pherajlu7	Faites le calcul simplement : additionnez vos frais (barème kilométrique selon la puissance de la voiture, repas, etc.) et comparez avec 10 % de votre salaire. Si vos frais dépassent, les frais réels sont gagnants. Attention : il faut garder les justificatifs.	t	2026-11-02 21:35:55.386	2026-11-02 21:35:55.386	2026-11-02 21:35:55.386	\N	\N	\N
28	opi4pwx8b9o1aa72sj15y7cw	Je viens de faire le calcul et je gagne quelques centaines d'euros. Merci !	f	2026-11-04 01:49:55.393	2026-11-04 01:49:55.393	2026-11-04 01:49:55.393	\N	\N	\N
29	afl76m3my2upekz01dexyq2a	Chaque parent peut donner 100 000 € par enfant en franchise de droits, et cet abattement se renouvelle tous les quinze ans. Plus on commence tôt, plus on peut en profiter plusieurs fois.	f	2026-11-04 10:26:55.408	2026-11-04 10:26:55.408	2026-11-04 10:26:55.408	\N	\N	\N
30	uxbep01mjqf1gpdm16s87opc	Le piège classique : donner trop et se retrouver juste soi-même. Gardez de quoi vivre confortablement !	f	2026-11-04 19:32:55.416	2026-11-04 19:32:55.416	2026-11-04 19:32:55.416	\N	\N	\N
31	p69x3g97j11a6zukt4cfjhi0	J'ajoute un point de forme : une donation qui porte sur un bien immobilier passe obligatoirement devant notaire. Pour une somme d'argent, un don manuel suffit, mais il doit être déclaré à l'administration fiscale.	f	2026-11-05 04:37:55.422	2026-11-05 04:37:55.422	2026-11-05 04:37:55.422	\N	\N	\N
32	jozkb27ytnrnaq107b3lx5yf	Le point clé pour moi : les frais. Un PER en ligne avec des ETF, c'est très différent d'un PER bancaire avec 3 % de frais d'entrée.	f	2026-11-03 18:59:55.439	2026-11-03 18:59:55.439	2026-11-03 18:59:55.439	\N	\N	\N
33	n661gq109glmxncoh8rvoir0	Pensez aussi à la fiscalité à la sortie : ce que vous déduisez aujourd'hui sera imposé plus tard.	f	2026-11-04 08:37:55.447	2026-11-04 08:37:55.447	2026-11-04 08:37:55.447	\N	\N	\N
34	lews688npf7wrcd2yh67j1b3	Un point que je vois souvent négligé : si vous avez déduit vos versements, la part de capital correspondante sera imposée à la sortie, et les gains aussi. Comparez votre taux marginal d'imposition actuel avec celui que vous anticipez à la retraite : c'est lui qui dit si la déduction est vraiment avantageuse.	f	2026-11-04 22:16:55.455	2026-11-04 22:16:55.455	2026-11-04 22:16:55.455	\N	\N	\N
35	wuhhvbwxbpmmz4p9c3m20apm	Une seule ligne ici : un ETF monde. Ennuyeux mais efficace.	f	2026-11-03 08:53:55.473	2026-11-03 08:53:55.473	2026-11-03 08:53:55.473	\N	\N	\N
36	k9mukb8iqudb3usx7uxt5636	Une vingtaine, toutes à dividendes. Je suis tout l'inverse de Vincent !	f	2026-11-04 08:25:55.479	2026-11-04 08:25:55.479	2026-11-04 08:25:55.479	\N	\N	\N
37	bwiic82fsrpsujmyur0z1nbn	Pièces, pour pouvoir revendre par petites quantités si besoin.	f	2026-11-02 11:42:55.493	2026-11-02 11:42:55.493	2026-11-02 11:42:55.493	\N	\N	\N
38	bsabacryffxo8kvrltcvm2zo	Attention aux frais de garde et à la prime à l'achat, ça varie beaucoup d'un vendeur à l'autre.	f	2026-11-03 20:03:55.502	2026-11-03 20:03:55.502	2026-11-03 20:03:55.502	\N	\N	\N
39	zvvq0sp1kru2qku4ecuykq4t	Très bien chez moi, tous les prélèvements ont été transférés en quelques semaines. Gardez l'ancien compte ouvert un mois ou deux par sécurité.	f	2026-11-05 12:41:55.516	2026-11-05 12:41:55.516	2026-11-05 12:41:55.516	\N	\N	\N
40	sg2jfmx2cw36npm2kiz1n5c7	Un comparatif des SCPI par type d'actifs, avec le recul sur les dernières années.	f	2026-11-04 21:16:55.534	2026-11-04 21:16:55.534	2026-11-04 21:16:55.534	\N	\N	\N
41	r018rs88hgcyp2sk0q7apojv	Un guide pas à pas de la déclaration en location meublée !	f	2026-11-05 03:10:55.541	2026-11-05 03:10:55.541	2026-11-05 03:10:55.541	\N	\N	\N
42	gzagnfe8aqw22w5mco1qwyqg	Merci pour ces idées, nous les notons toutes. Les familles recomposées sont justement au programme d'un prochain numéro.	f	2026-11-05 09:05:55.548	2026-11-05 09:05:55.548	2026-11-05 09:05:55.548	\N	\N	\N
43	calbul4j4jl0msio07licr3i	Ça dépend énormément de votre situation. Demandez une simulation à votre caisse de retraite : elle calcule le coût et le gain de pension. Le rachat est déductible du revenu imposable, ce qui adoucit l'addition.	f	2026-11-02 13:31:55.602	2026-11-02 13:31:55.602	2026-11-02 13:31:55.602	\N	\N	\N
44	opt26skyx8rgile7uer5jg61	Environ 60 % en fonds euros, à mon âge je privilégie la sécurité.	f	2026-11-05 03:26:55.628	2026-11-05 03:26:55.628	2026-11-05 03:26:55.628	\N	\N	\N
45	ftn0082hnqqalkvydwyq9fxy	Autour de 35 % chez moi, le reste en unités de compte diversifiées. Je rééquilibre une fois par an.	f	2026-11-05 07:32:55.633	2026-11-05 07:32:55.633	2026-11-05 07:32:55.633	\N	\N	\N
46	ngvnhvgz0337tda0cjljxx4c	20 % seulement, j'ai un horizon long.	f	2026-11-05 11:37:55.64	2026-11-05 11:37:55.64	2026-11-05 11:37:55.64	\N	\N	\N
47	s8gtn58orirwep1z2qgu1wli	Je les suis de loin : j'investis tous les mois quoi qu'il arrive. Je regarde surtout l'effet sur les fonds euros, qui réagissent avec retard aux variations de taux.	f	2026-11-04 21:35:55.66	2026-11-04 21:35:55.66	2026-11-04 21:35:55.66	\N	\N	\N
48	mwdo8ua7h0nvimzmjivq4ce6	Moi, c'est pour les livrets et les comptes à terme : leur rémunération finit toujours par suivre le mouvement.	f	2026-11-05 05:49:55.666	2026-11-05 05:49:55.666	2026-11-05 05:49:55.666	\N	\N	\N
\.


--
-- Data for Name: replies_author_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.replies_author_lnk (id, reply_id, user_id) FROM stdin;
1	1	7
2	2	14
3	3	3
4	4	15
5	5	3
6	6	2
7	7	6
8	8	5
9	9	14
10	10	2
11	11	4
12	12	10
13	13	3
14	14	2
15	15	12
16	16	1
17	17	6
18	18	2
19	19	3
20	20	7
21	21	5
22	22	4
23	23	1
24	24	15
25	25	3
26	26	8
27	27	9
28	28	13
29	29	4
30	30	3
31	31	18
32	32	2
33	33	4
34	34	17
35	35	2
36	36	11
37	37	3
38	38	6
39	39	7
40	40	8
41	41	15
42	42	1
43	43	9
44	44	4
45	45	16
46	46	12
47	47	2
48	48	4
\.


--
-- Data for Name: replies_discussion_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.replies_discussion_lnk (id, reply_id, discussion_id, reply_ord) FROM stdin;
1	1	1	1
2	2	1	2
3	3	1	3
4	4	1	4
5	5	2	1
6	6	2	2
7	7	2	3
8	8	2	4
9	9	2	5
10	10	3	1
11	11	3	2
12	12	3	3
13	13	4	1
14	14	4	2
15	15	4	3
16	16	4	4
17	17	5	1
18	18	5	2
19	19	5	3
20	20	5	4
21	21	6	1
22	22	6	2
23	23	6	3
24	24	7	1
25	25	7	2
26	26	7	3
27	27	8	1
28	28	8	2
29	29	9	1
30	30	9	2
31	31	9	3
32	32	10	1
33	33	10	2
34	34	10	3
35	35	11	1
36	36	11	2
37	37	12	1
38	38	12	2
39	39	13	1
40	40	14	1
41	41	14	2
42	42	14	3
43	43	17	1
44	44	18	1
45	45	18	2
46	46	18	3
47	47	20	1
48	48	20	2
\.


--
-- Data for Name: strapi_ai_localization_jobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_ai_localization_jobs (id, content_type, related_document_id, source_locale, target_locales, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: strapi_ai_metadata_jobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_ai_metadata_jobs (id, status, created_at, completed_at) FROM stdin;
\.


--
-- Data for Name: strapi_api_token_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_api_token_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_api_token_permissions_token_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_api_token_permissions_token_lnk (id, api_token_permission_id, api_token_id, api_token_permission_ord) FROM stdin;
\.


--
-- Data for Name: strapi_api_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_api_tokens (id, document_id, name, description, kind, type, access_key, encrypted_key, last_used_at, expires_at, lifespan, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	e8keyfcj0aztvt942ageyr9a	Read Only	A default API token with read-only permissions, only used for accessing resources	content-api	read-only	8f914632a16c59f81ec1e5ed78f275c6491bbf617112b6bc76a24be62354c68e1687678fc8a10c02d536ade406176f2df14133a8bed84a5770c57b9a70e53c44	v1:51d59cfcc4ab95371e1b27e0fb579700:bf13dca9894d9e504366bd6ebccc1661a345e1b3b184a8ef690b2025b5eecec69379679a16b5276b15ca3daa194bdd42692e308769110488c1baafda7ed847085751fd2307ecad7c253668762977b1cf0eaf176f94523201b3d57fb1a2af8cb086e59f5255c9859aa321fe4f5d2f31232d804d49451e54251610277a2c40aa07bec83f86608ae2accbd3dbca13315b3aef88f585a77f8938e4f17c38f9dd70364686f2a0e4b8d3c62b6d33bc39850f87a292a066fe0ac52a4386f643c0070172d29098023bf9893a032abc6be20cc876e66a4067ab0497939cb1261e7607b1a4cf8de8743ebde301689b71842fd290a14f70a97e4f5efecb30403d30ab584af1:705b2dd3a20b46968f67dc3e0d5ff92d	\N	\N	\N	2026-11-05 17:21:53.695	2026-11-05 17:21:53.695	2026-11-05 17:21:53.696	\N	\N	\N
2	olix5jbjp6fkvjgwckvmy95i	Full Access	A default API token with full access permissions, used for accessing or modifying resources	content-api	full-access	f78ca4917eb9bc813e3e3c0b929811f7ee645beddc3bccef76ab4a521e3c86e9e7e79f4bb6253dc4f88f923593d05c9c5d33394a739b2a8dca2a55d48399f6f1	v1:ab023d3a0efa7a650ecbcb0adb4bc363:2441a51b807feab759e2d95e96d33dda4587b8cebe908a3c268abe96788450c0436f60154d2fc0ed9883c35bc375f8663bdafaf77b8e83c2c4a5de8d91360c1577781efa4e6f6b5eaeb571965f1b3676a59acf293f8d548ed24264d26bb1d5616bc1382664bea74e3269cc664a5982ee3911635e93e87db8c6b19b287170c30baba2c08fbf49366101781256da7ff1abcce70e91de0a73178d7efd297f3375315352432fd2c6cdff0f0ae17f3a48e25f5a9d281d0cc17cfad49ab2bfdddbbc9345218fdba286762b5a9a4e5eb71f27300f3ec05caf49218d0c85acaa9a5c7f4b3ed08fd90ec9699ff9eced3828f4a16d940649901e3af81029f92254750b182e:86d159d39f21f1ed3600c2081e3d0bea	\N	\N	\N	2026-11-05 17:21:53.701	2026-11-05 17:21:53.701	2026-11-05 17:21:53.701	\N	\N	\N
\.


--
-- Data for Name: strapi_api_tokens_admin_user_owner_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_api_tokens_admin_user_owner_lnk (id, api_token_id, user_id, api_token_ord) FROM stdin;
\.


--
-- Data for Name: strapi_core_store_settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_core_store_settings (id, key, value, type, environment, tag) FROM stdin;
1	strapi_unidirectional-join-table-repair-ran	true	boolean	\N	\N
2	strapi_content_types_schema	{"api::category.category":{"kind":"collectionType","collectionName":"categories","info":{"singularName":"category","pluralName":"categories","displayName":"Category","description":"Espace thématique de la communauté (Bourse, Retraite, Impôts…)"},"options":{"draftAndPublish":false},"attributes":{"name":{"type":"string","required":true,"unique":true,"maxLength":60},"slug":{"type":"uid","targetField":"name","required":true},"description":{"type":"text","maxLength":500},"color":{"type":"string","regex":"^#[0-9a-fA-F]{6}$","default":"#8e8e93"},"icon":{"type":"string","maxLength":30,"default":"msg"},"position":{"type":"integer","default":0},"discussions":{"type":"relation","relation":"oneToMany","target":"api::discussion.discussion","mappedBy":"category"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::category.category","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"categories"}}},"apiName":"category","globalId":"Category","uid":"api::category.category","modelType":"contentType","__schema__":{"collectionName":"categories","info":{"singularName":"category","pluralName":"categories","displayName":"Category","description":"Espace thématique de la communauté (Bourse, Retraite, Impôts…)"},"options":{"draftAndPublish":false},"attributes":{"name":{"type":"string","required":true,"unique":true,"maxLength":60},"slug":{"type":"uid","targetField":"name","required":true},"description":{"type":"text","maxLength":500},"color":{"type":"string","regex":"^#[0-9a-fA-F]{6}$","default":"#8e8e93"},"icon":{"type":"string","maxLength":30,"default":"msg"},"position":{"type":"integer","default":0},"discussions":{"type":"relation","relation":"oneToMany","target":"api::discussion.discussion","mappedBy":"category"}},"kind":"collectionType"},"modelName":"category","actions":{},"lifecycles":{}},"api::discussion.discussion":{"kind":"collectionType","collectionName":"discussions","info":{"singularName":"discussion","pluralName":"discussions","displayName":"Discussion","description":"Question ou discussion publiée par un membre"},"options":{"draftAndPublish":false},"attributes":{"title":{"type":"string","required":true,"minLength":10,"maxLength":150},"slug":{"type":"uid","required":true},"content":{"type":"text","required":true,"maxLength":10000},"type":{"type":"enumeration","enum":["question","discussion"],"default":"question","required":true},"author":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.user"},"category":{"type":"relation","relation":"manyToOne","target":"api::category.category","inversedBy":"discussions"},"replies":{"type":"relation","relation":"oneToMany","target":"api::reply.reply","mappedBy":"discussion"},"replyCount":{"type":"integer","default":0,"min":0},"lastActivityAt":{"type":"datetime"},"isSolved":{"type":"boolean","default":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::discussion.discussion","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"discussions"}}},"apiName":"discussion","globalId":"Discussion","uid":"api::discussion.discussion","modelType":"contentType","__schema__":{"collectionName":"discussions","info":{"singularName":"discussion","pluralName":"discussions","displayName":"Discussion","description":"Question ou discussion publiée par un membre"},"options":{"draftAndPublish":false},"attributes":{"title":{"type":"string","required":true,"minLength":10,"maxLength":150},"slug":{"type":"uid","required":true},"content":{"type":"text","required":true,"maxLength":10000},"type":{"type":"enumeration","enum":["question","discussion"],"default":"question","required":true},"author":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.user"},"category":{"type":"relation","relation":"manyToOne","target":"api::category.category","inversedBy":"discussions"},"replies":{"type":"relation","relation":"oneToMany","target":"api::reply.reply","mappedBy":"discussion"},"replyCount":{"type":"integer","default":0,"min":0},"lastActivityAt":{"type":"datetime"},"isSolved":{"type":"boolean","default":false}},"kind":"collectionType"},"modelName":"discussion","actions":{},"lifecycles":{}},"api::reply.reply":{"kind":"collectionType","collectionName":"replies","info":{"singularName":"reply","pluralName":"replies","displayName":"Reply","description":"Réponse d'un membre à une discussion"},"options":{"draftAndPublish":false},"attributes":{"content":{"type":"text","required":true,"minLength":2,"maxLength":5000},"author":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.user"},"discussion":{"type":"relation","relation":"manyToOne","target":"api::discussion.discussion","inversedBy":"replies"},"isAccepted":{"type":"boolean","default":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::reply.reply","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"replies"}}},"apiName":"reply","globalId":"Reply","uid":"api::reply.reply","modelType":"contentType","__schema__":{"collectionName":"replies","info":{"singularName":"reply","pluralName":"replies","displayName":"Reply","description":"Réponse d'un membre à une discussion"},"options":{"draftAndPublish":false},"attributes":{"content":{"type":"text","required":true,"minLength":2,"maxLength":5000},"author":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.user"},"discussion":{"type":"relation","relation":"manyToOne","target":"api::discussion.discussion","inversedBy":"replies"},"isAccepted":{"type":"boolean","default":false}},"kind":"collectionType"},"modelName":"reply","actions":{},"lifecycles":{}},"plugin::upload.file":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"text","configurable":false},"caption":{"type":"text","configurable":false},"focalPoint":{"type":"json","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"text","configurable":false,"required":true},"previewUrl":{"type":"text","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","minLength":1,"required":true,"private":true,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"files"}}},"indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null}],"plugin":"upload","globalId":"UploadFile","uid":"plugin::upload.file","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"text","configurable":false},"caption":{"type":"text","configurable":false},"focalPoint":{"type":"json","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"text","configurable":false,"required":true},"previewUrl":{"type":"text","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","minLength":1,"required":true,"private":true,"searchable":false}},"indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null}],"kind":"collectionType"},"modelName":"file"},"plugin::upload.folder":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","minLength":1,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"upload_folders"}}},"indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"}],"plugin":"upload","globalId":"UploadFolder","uid":"plugin::upload.folder","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","minLength":1,"required":true}},"indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"}],"kind":"collectionType"},"modelName":"folder"},"plugin::i18n.locale":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::i18n.locale","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"i18n_locale"}}},"plugin":"i18n","collectionName":"i18n_locale","globalId":"I18NLocale","uid":"plugin::i18n.locale","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"i18n_locale","info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false}},"kind":"collectionType"},"modelName":"locale"},"plugin::content-releases.release":{"collectionName":"strapi_releases","info":{"singularName":"release","pluralName":"releases","displayName":"Release"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"releasedAt":{"type":"datetime"},"scheduledAt":{"type":"datetime"},"timezone":{"type":"string"},"status":{"type":"enumeration","enum":["ready","blocked","failed","done","empty"],"required":true},"actions":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","mappedBy":"release"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_releases"}}},"plugin":"content-releases","globalId":"ContentReleasesRelease","uid":"plugin::content-releases.release","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_releases","info":{"singularName":"release","pluralName":"releases","displayName":"Release"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"releasedAt":{"type":"datetime"},"scheduledAt":{"type":"datetime"},"timezone":{"type":"string"},"status":{"type":"enumeration","enum":["ready","blocked","failed","done","empty"],"required":true},"actions":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","mappedBy":"release"}},"kind":"collectionType"},"modelName":"release"},"plugin::content-releases.release-action":{"collectionName":"strapi_release_actions","info":{"singularName":"release-action","pluralName":"release-actions","displayName":"Release Action"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"type":{"type":"enumeration","enum":["publish","unpublish"],"required":true},"contentType":{"type":"string","required":true},"entryDocumentId":{"type":"string"},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"release":{"type":"relation","relation":"manyToOne","target":"plugin::content-releases.release","inversedBy":"actions"},"isEntryValid":{"type":"boolean"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_release_actions"}}},"plugin":"content-releases","globalId":"ContentReleasesReleaseAction","uid":"plugin::content-releases.release-action","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_release_actions","info":{"singularName":"release-action","pluralName":"release-actions","displayName":"Release Action"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"type":{"type":"enumeration","enum":["publish","unpublish"],"required":true},"contentType":{"type":"string","required":true},"entryDocumentId":{"type":"string"},"locale":{"type":"string"},"release":{"type":"relation","relation":"manyToOne","target":"plugin::content-releases.release","inversedBy":"actions"},"isEntryValid":{"type":"boolean"}},"kind":"collectionType"},"modelName":"release-action"},"plugin::review-workflows.workflow":{"collectionName":"strapi_workflows","info":{"name":"Workflow","description":"","singularName":"workflow","pluralName":"workflows","displayName":"Workflow"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true,"unique":true},"stages":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToMany","mappedBy":"workflow"},"stageRequiredToPublish":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToOne","required":false},"contentTypes":{"type":"json","required":true,"default":"[]"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::review-workflows.workflow","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_workflows"}}},"plugin":"review-workflows","globalId":"ReviewWorkflowsWorkflow","uid":"plugin::review-workflows.workflow","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_workflows","info":{"name":"Workflow","description":"","singularName":"workflow","pluralName":"workflows","displayName":"Workflow"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true,"unique":true},"stages":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToMany","mappedBy":"workflow"},"stageRequiredToPublish":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToOne","required":false},"contentTypes":{"type":"json","required":true,"default":"[]"}},"kind":"collectionType"},"modelName":"workflow"},"plugin::review-workflows.workflow-stage":{"collectionName":"strapi_workflows_stages","info":{"name":"Workflow Stage","description":"","singularName":"workflow-stage","pluralName":"workflow-stages","displayName":"Stages"},"options":{"version":"1.1.0","draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false},"color":{"type":"string","configurable":false,"default":"#4945FF"},"workflow":{"type":"relation","target":"plugin::review-workflows.workflow","relation":"manyToOne","inversedBy":"stages","configurable":false},"permissions":{"type":"relation","target":"admin::permission","relation":"manyToMany","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::review-workflows.workflow-stage","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_workflows_stages"}}},"plugin":"review-workflows","globalId":"ReviewWorkflowsWorkflowStage","uid":"plugin::review-workflows.workflow-stage","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_workflows_stages","info":{"name":"Workflow Stage","description":"","singularName":"workflow-stage","pluralName":"workflow-stages","displayName":"Stages"},"options":{"version":"1.1.0"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false},"color":{"type":"string","configurable":false,"default":"#4945FF"},"workflow":{"type":"relation","target":"plugin::review-workflows.workflow","relation":"manyToOne","inversedBy":"stages","configurable":false},"permissions":{"type":"relation","target":"admin::permission","relation":"manyToMany","configurable":false}},"kind":"collectionType"},"modelName":"workflow-stage"},"plugin::users-permissions.permission":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_permissions"}}},"plugin":"users-permissions","globalId":"UsersPermissionsPermission","uid":"plugin::users-permissions.permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false}},"kind":"collectionType"},"modelName":"permission","options":{"draftAndPublish":false}},"plugin::users-permissions.role":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.role","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_roles"}}},"plugin":"users-permissions","globalId":"UsersPermissionsRole","uid":"plugin::users-permissions.role","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false}},"kind":"collectionType"},"modelName":"role","options":{"draftAndPublish":false}},"plugin::users-permissions.user":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"displayName":{"type":"string","maxLength":40},"bio":{"type":"text","maxLength":280},"avatarColor":{"type":"string","regex":"^#[0-9a-fA-F]{6}$","default":"#6e6e73"},"communityRole":{"type":"enumeration","enum":["member","redaction","expert"],"default":"member"},"isSubscriber":{"type":"boolean","default":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_users"}}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"confirmationToken":{"hidden":true},"provider":{"hidden":true}}},"plugin":"users-permissions","globalId":"UsersPermissionsUser","kind":"collectionType","__filename__":"schema.json","uid":"plugin::users-permissions.user","modelType":"contentType","__schema__":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"displayName":{"type":"string","maxLength":40},"bio":{"type":"text","maxLength":280},"avatarColor":{"type":"string","regex":"^#[0-9a-fA-F]{6}$","default":"#6e6e73"},"communityRole":{"type":"enumeration","enum":["member","redaction","expert"],"default":"member"},"isSubscriber":{"type":"boolean","default":false}},"kind":"collectionType"},"modelName":"user"},"admin::permission":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role","required":false},"apiToken":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"adminPermissions","target":"admin::api-token","required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_permissions"}}},"plugin":"admin","globalId":"AdminPermission","uid":"admin::permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role","required":false},"apiToken":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"adminPermissions","target":"admin::api-token","required":false}},"kind":"collectionType"},"modelName":"permission"},"admin::user":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"resetPasswordTokenExpiresAt":{"type":"datetime","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"apiTokens":{"configurable":false,"private":true,"type":"relation","relation":"oneToMany","mappedBy":"adminUserOwner","target":"admin::api-token"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::user","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_users"}}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"registrationToken":{"hidden":true}}},"plugin":"admin","globalId":"AdminUser","uid":"admin::user","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"resetPasswordTokenExpiresAt":{"type":"datetime","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"apiTokens":{"configurable":false,"private":true,"type":"relation","relation":"oneToMany","mappedBy":"adminUserOwner","target":"admin::api-token"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false}},"kind":"collectionType"},"modelName":"user","options":{"draftAndPublish":false}},"admin::role":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::role","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_roles"}}},"plugin":"admin","globalId":"AdminRole","uid":"admin::role","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"}},"kind":"collectionType"},"modelName":"role"},"admin::api-token":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"kind":{"type":"enumeration","enum":["content-api","admin"],"configurable":false,"required":true,"default":"content-api"},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":false,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"encryptedKey":{"type":"text","minLength":1,"configurable":false,"required":false,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"adminPermissions":{"type":"relation","target":"admin::permission","relation":"oneToMany","mappedBy":"apiToken","configurable":false,"required":false},"adminUserOwner":{"type":"relation","target":"admin::user","relation":"manyToOne","inversedBy":"apiTokens","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::api-token","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_api_tokens"}}},"plugin":"admin","globalId":"AdminApiToken","uid":"admin::api-token","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"kind":{"type":"enumeration","enum":["content-api","admin"],"configurable":false,"required":true,"default":"content-api"},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":false,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"encryptedKey":{"type":"text","minLength":1,"configurable":false,"required":false,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"adminPermissions":{"type":"relation","target":"admin::permission","relation":"oneToMany","mappedBy":"apiToken","configurable":false,"required":false},"adminUserOwner":{"type":"relation","target":"admin::user","relation":"manyToOne","inversedBy":"apiTokens","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelName":"api-token"},"admin::api-token-permission":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::api-token-permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_api_token_permissions"}}},"plugin":"admin","globalId":"AdminApiTokenPermission","uid":"admin::api-token-permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"}},"kind":"collectionType"},"modelName":"api-token-permission"},"admin::transfer-token":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::transfer-token","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_transfer_tokens"}}},"plugin":"admin","globalId":"AdminTransferToken","uid":"admin::transfer-token","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelName":"transfer-token"},"admin::transfer-token-permission":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::transfer-token-permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_transfer_token_permissions"}}},"plugin":"admin","globalId":"AdminTransferTokenPermission","uid":"admin::transfer-token-permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"}},"kind":"collectionType"},"modelName":"transfer-token-permission"},"admin::session":{"collectionName":"strapi_sessions","info":{"name":"Session","description":"Session Manager storage","singularName":"session","pluralName":"sessions","displayName":"Session"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false},"i18n":{"localized":false}},"attributes":{"userId":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"sessionId":{"type":"string","unique":true,"required":true,"configurable":false,"private":true,"searchable":false},"childId":{"type":"string","configurable":false,"private":true,"searchable":false},"deviceId":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"origin":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"expiresAt":{"type":"datetime","required":true,"configurable":false,"private":true,"searchable":false},"absoluteExpiresAt":{"type":"datetime","configurable":false,"private":true,"searchable":false},"status":{"type":"string","configurable":false,"private":true,"searchable":false},"type":{"type":"string","configurable":false,"private":true,"searchable":false},"metadata":{"type":"json","configurable":false,"private":true,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::session","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_sessions"}}},"plugin":"admin","globalId":"AdminSession","uid":"admin::session","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_sessions","info":{"name":"Session","description":"Session Manager storage","singularName":"session","pluralName":"sessions","displayName":"Session"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false},"i18n":{"localized":false}},"attributes":{"userId":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"sessionId":{"type":"string","unique":true,"required":true,"configurable":false,"private":true,"searchable":false},"childId":{"type":"string","configurable":false,"private":true,"searchable":false},"deviceId":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"origin":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"expiresAt":{"type":"datetime","required":true,"configurable":false,"private":true,"searchable":false},"absoluteExpiresAt":{"type":"datetime","configurable":false,"private":true,"searchable":false},"status":{"type":"string","configurable":false,"private":true,"searchable":false},"type":{"type":"string","configurable":false,"private":true,"searchable":false},"metadata":{"type":"json","configurable":false,"private":true,"searchable":false}},"kind":"collectionType"},"modelName":"session"}}	object	\N	\N
3	plugin_content_manager_configuration_content_types::api::discussion.discussion	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"content":{"edit":{"label":"content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"content","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"author":{"edit":{"label":"author","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"author","searchable":true,"sortable":true}},"category":{"edit":{"label":"category","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"category","searchable":true,"sortable":true}},"replies":{"edit":{"label":"replies","description":"","placeholder":"","visible":true,"editable":true,"mainField":"documentId"},"list":{"label":"replies","searchable":false,"sortable":false}},"replyCount":{"edit":{"label":"replyCount","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"replyCount","searchable":true,"sortable":true}},"lastActivityAt":{"edit":{"label":"lastActivityAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastActivityAt","searchable":true,"sortable":true}},"isSolved":{"edit":{"label":"isSolved","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isSolved","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","slug","content"],"edit":[[{"name":"title","size":6},{"name":"slug","size":6}],[{"name":"content","size":6},{"name":"type","size":6}],[{"name":"author","size":6},{"name":"category","size":6}],[{"name":"replies","size":6},{"name":"replyCount","size":4}],[{"name":"lastActivityAt","size":6},{"name":"isSolved","size":4}]]},"uid":"api::discussion.discussion"}	object	\N	\N
4	plugin_content_manager_configuration_content_types::api::category.category	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"color":{"edit":{"label":"color","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"color","searchable":true,"sortable":true}},"icon":{"edit":{"label":"icon","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"icon","searchable":true,"sortable":true}},"position":{"edit":{"label":"position","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"position","searchable":true,"sortable":true}},"discussions":{"edit":{"label":"discussions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"discussions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","slug","description"],"edit":[[{"name":"name","size":6},{"name":"slug","size":6}],[{"name":"description","size":6},{"name":"color","size":6}],[{"name":"icon","size":6},{"name":"position","size":4}],[{"name":"discussions","size":6}]]},"uid":"api::category.category"}	object	\N	\N
5	plugin_content_manager_configuration_content_types::api::reply.reply	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"documentId","defaultSortBy":"documentId","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"content":{"edit":{"label":"content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"content","searchable":true,"sortable":true}},"author":{"edit":{"label":"author","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"author","searchable":true,"sortable":true}},"discussion":{"edit":{"label":"discussion","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"discussion","searchable":true,"sortable":true}},"isAccepted":{"edit":{"label":"isAccepted","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isAccepted","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","content","author","discussion"],"edit":[[{"name":"content","size":6},{"name":"author","size":6}],[{"name":"discussion","size":6},{"name":"isAccepted","size":4}]]},"uid":"api::reply.reply"}	object	\N	\N
6	plugin_content_manager_configuration_content_types::plugin::upload.file	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"alternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"alternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"caption","searchable":true,"sortable":true}},"focalPoint":{"edit":{"label":"focalPoint","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"focalPoint","searchable":false,"sortable":false}},"width":{"edit":{"label":"width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"width","searchable":true,"sortable":true}},"height":{"edit":{"label":"height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"size","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"previewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"previewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider_metadata","searchable":false,"sortable":false}},"folder":{"edit":{"label":"folder","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"folder","searchable":true,"sortable":true}},"folderPath":{"edit":{"label":"folderPath","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"folderPath","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6}],[{"name":"focalPoint","size":12}],[{"name":"width","size":4},{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}],[{"name":"folder","size":6},{"name":"folderPath","size":6}]]},"uid":"plugin::upload.file"}	object	\N	\N
7	plugin_content_manager_configuration_content_types::plugin::upload.folder	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"pathId":{"edit":{"label":"pathId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"pathId","searchable":true,"sortable":true}},"parent":{"edit":{"label":"parent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"parent","searchable":true,"sortable":true}},"children":{"edit":{"label":"children","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"children","searchable":false,"sortable":false}},"files":{"edit":{"label":"files","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"files","searchable":false,"sortable":false}},"path":{"edit":{"label":"path","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"path","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","pathId","parent"],"edit":[[{"name":"name","size":6},{"name":"pathId","size":4}],[{"name":"parent","size":6},{"name":"children","size":6}],[{"name":"files","size":6},{"name":"path","size":6}]]},"uid":"plugin::upload.folder"}	object	\N	\N
8	plugin_content_manager_configuration_content_types::plugin::i18n.locale	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","createdAt"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]},"uid":"plugin::i18n.locale"}	object	\N	\N
9	plugin_content_manager_configuration_content_types::plugin::content-releases.release-action	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"contentType","defaultSortBy":"contentType","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"contentType":{"edit":{"label":"contentType","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"contentType","searchable":true,"sortable":true}},"entryDocumentId":{"edit":{"label":"entryDocumentId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"entryDocumentId","searchable":true,"sortable":true}},"release":{"edit":{"label":"release","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"release","searchable":true,"sortable":true}},"isEntryValid":{"edit":{"label":"isEntryValid","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isEntryValid","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","type","contentType","entryDocumentId"],"edit":[[{"name":"type","size":6},{"name":"contentType","size":6}],[{"name":"entryDocumentId","size":6},{"name":"release","size":6}],[{"name":"isEntryValid","size":4}]]},"uid":"plugin::content-releases.release-action"}	object	\N	\N
13	plugin_content_manager_configuration_content_types::plugin::users-permissions.user	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"confirmationToken":{"edit":{"label":"confirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"confirmationToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"displayName":{"edit":{"label":"displayName","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"displayName","searchable":true,"sortable":true}},"bio":{"edit":{"label":"bio","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"bio","searchable":true,"sortable":true}},"avatarColor":{"edit":{"label":"avatarColor","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"avatarColor","searchable":true,"sortable":true}},"communityRole":{"edit":{"label":"communityRole","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"communityRole","searchable":true,"sortable":true}},"isSubscriber":{"edit":{"label":"isSubscriber","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isSubscriber","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","confirmed"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4},{"name":"role","size":6}],[{"name":"displayName","size":6},{"name":"bio","size":6}],[{"name":"avatarColor","size":6},{"name":"communityRole","size":6}],[{"name":"isSubscriber","size":4}]]},"uid":"plugin::users-permissions.user"}	object	\N	\N
16	plugin_content_manager_configuration_content_types::admin::role	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6},{"name":"users","size":6}],[{"name":"permissions","size":6}]]},"uid":"admin::role"}	object	\N	\N
10	plugin_content_manager_configuration_content_types::plugin::users-permissions.permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","role","createdAt"],"edit":[[{"name":"action","size":6},{"name":"role","size":6}]]},"uid":"plugin::users-permissions.permission"}	object	\N	\N
11	plugin_content_manager_configuration_content_types::plugin::review-workflows.workflow-stage	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"color":{"edit":{"label":"color","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"color","searchable":true,"sortable":true}},"workflow":{"edit":{"label":"workflow","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"workflow","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","color","workflow"],"edit":[[{"name":"name","size":6},{"name":"color","size":6}],[{"name":"workflow","size":6},{"name":"permissions","size":6}]]},"uid":"plugin::review-workflows.workflow-stage"}	object	\N	\N
12	plugin_content_manager_configuration_content_types::plugin::users-permissions.role	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"users","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"permissions","size":6}],[{"name":"users","size":6}]]},"uid":"plugin::users-permissions.role"}	object	\N	\N
17	plugin_content_manager_configuration_content_types::plugin::content-releases.release	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"releasedAt":{"edit":{"label":"releasedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"releasedAt","searchable":true,"sortable":true}},"scheduledAt":{"edit":{"label":"scheduledAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"scheduledAt","searchable":true,"sortable":true}},"timezone":{"edit":{"label":"timezone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"timezone","searchable":true,"sortable":true}},"status":{"edit":{"label":"status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"status","searchable":true,"sortable":true}},"actions":{"edit":{"label":"actions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"contentType"},"list":{"label":"actions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","releasedAt","scheduledAt"],"edit":[[{"name":"name","size":6},{"name":"releasedAt","size":6}],[{"name":"scheduledAt","size":6},{"name":"timezone","size":6}],[{"name":"status","size":6},{"name":"actions","size":6}]]},"uid":"plugin::content-releases.release"}	object	\N	\N
18	plugin_content_manager_configuration_content_types::admin::api-token	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"kind":{"edit":{"label":"kind","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"kind","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"encryptedKey":{"edit":{"label":"encryptedKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"encryptedKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"adminPermissions":{"edit":{"label":"adminPermissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"adminPermissions","searchable":false,"sortable":false}},"adminUserOwner":{"edit":{"label":"adminUserOwner","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"adminUserOwner","searchable":true,"sortable":true}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","kind"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"kind","size":6},{"name":"type","size":6}],[{"name":"accessKey","size":6},{"name":"encryptedKey","size":6}],[{"name":"lastUsedAt","size":6},{"name":"permissions","size":6}],[{"name":"adminPermissions","size":6},{"name":"adminUserOwner","size":6}],[{"name":"expiresAt","size":6},{"name":"lifespan","size":4}]]},"uid":"admin::api-token"}	object	\N	\N
19	plugin_content_manager_configuration_content_types::admin::api-token-permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]},"uid":"admin::api-token-permission"}	object	\N	\N
14	plugin_content_manager_configuration_content_types::admin::permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"actionParameters":{"edit":{"label":"actionParameters","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"actionParameters","searchable":false,"sortable":false}},"subject":{"edit":{"label":"subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"apiToken":{"edit":{"label":"apiToken","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"apiToken","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"edit":[[{"name":"action","size":6}],[{"name":"actionParameters","size":12}],[{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}],[{"name":"role","size":6},{"name":"apiToken","size":6}]]},"uid":"admin::permission"}	object	\N	\N
15	plugin_content_manager_configuration_content_types::admin::user	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"resetPasswordTokenExpiresAt":{"edit":{"label":"resetPasswordTokenExpiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"resetPasswordTokenExpiresAt","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"registrationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"registrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"roles","searchable":false,"sortable":false}},"apiTokens":{"edit":{"label":"apiTokens","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"apiTokens","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"preferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"preferedLanguage","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"resetPasswordTokenExpiresAt","size":6}],[{"name":"isActive","size":4},{"name":"roles","size":6}],[{"name":"apiTokens","size":6},{"name":"blocked","size":4}],[{"name":"preferedLanguage","size":6}]]},"uid":"admin::user"}	object	\N	\N
20	plugin_content_manager_configuration_content_types::plugin::review-workflows.workflow	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"stages":{"edit":{"label":"stages","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"stages","searchable":false,"sortable":false}},"stageRequiredToPublish":{"edit":{"label":"stageRequiredToPublish","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"stageRequiredToPublish","searchable":true,"sortable":true}},"contentTypes":{"edit":{"label":"contentTypes","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"contentTypes","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","stages","stageRequiredToPublish"],"edit":[[{"name":"name","size":6},{"name":"stages","size":6}],[{"name":"stageRequiredToPublish","size":6}],[{"name":"contentTypes","size":12}]]},"uid":"plugin::review-workflows.workflow"}	object	\N	\N
21	plugin_content_manager_configuration_content_types::admin::transfer-token	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","accessKey"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"accessKey","size":6},{"name":"lastUsedAt","size":6}],[{"name":"permissions","size":6},{"name":"expiresAt","size":6}],[{"name":"lifespan","size":4}]]},"uid":"admin::transfer-token"}	object	\N	\N
27	plugin_i18n_default_locale	"en"	string	\N	\N
28	plugin_users-permissions_grant	{"email":{"icon":"envelope","enabled":true},"discord":{"icon":"discord","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/discord/callback","scope":["identify","email"]},"facebook":{"icon":"facebook-square","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/facebook/callback","scope":["email"]},"google":{"icon":"google","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/google/callback","scope":["email"]},"github":{"icon":"github","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/github/callback","scope":["user","user:email"]},"microsoft":{"icon":"windows","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/microsoft/callback","scope":["user.read"]},"twitter":{"icon":"twitter","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/twitter/callback"},"instagram":{"icon":"instagram","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/instagram/callback","scope":["user_profile"]},"vk":{"icon":"vk","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/vk/callback","scope":["email"]},"twitch":{"icon":"twitch","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/twitch/callback","scope":["user:read:email"]},"linkedin":{"icon":"linkedin","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"]},"cognito":{"icon":"aws","enabled":false,"key":"","secret":"","subdomain":"my.subdomain.com","callback":"api/auth/cognito/callback","scope":["email","openid","profile"]},"reddit":{"icon":"reddit","enabled":false,"key":"","secret":"","callback":"api/auth/reddit/callback","scope":["identity"]},"auth0":{"icon":"","enabled":false,"key":"","secret":"","subdomain":"my-tenant.eu","callback":"api/auth/auth0/callback","scope":["openid","email","profile"]},"cas":{"icon":"book","enabled":false,"key":"","secret":"","callback":"api/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas"},"patreon":{"icon":"","enabled":false,"key":"","secret":"","callback":"api/auth/patreon/callback","scope":["identity","identity[email]"]},"keycloak":{"icon":"","enabled":false,"key":"","secret":"","subdomain":"myKeycloakProvider.com/realms/myrealm","callback":"api/auth/keycloak/callback","scope":["openid","email","profile"]}}	object	\N	\N
29	plugin_users-permissions_email	{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}	object	\N	\N
30	plugin_users-permissions_advanced	{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated"}	object	\N	\N
22	plugin_content_manager_configuration_content_types::admin::transfer-token-permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]},"uid":"admin::transfer-token-permission"}	object	\N	\N
24	plugin_upload_settings	{"sizeOptimization":true,"responsiveDimensions":true,"autoOrientation":false,"aiMetadata":true}	object	\N	\N
25	plugin_upload_view_configuration	{"pageSize":10,"sort":"createdAt:DESC"}	object	\N	\N
26	plugin_upload_metrics	{"weeklySchedule":"8 22 17 * * 4","lastWeeklyUpdate":1793895728008}	object	\N	\N
23	plugin_content_manager_configuration_content_types::admin::session	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"relationOpenMode":"modal","mainField":"userId","defaultSortBy":"userId","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"userId":{"edit":{"label":"userId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"userId","searchable":true,"sortable":true}},"sessionId":{"edit":{"label":"sessionId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"sessionId","searchable":true,"sortable":true}},"childId":{"edit":{"label":"childId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"childId","searchable":true,"sortable":true}},"deviceId":{"edit":{"label":"deviceId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"deviceId","searchable":true,"sortable":true}},"origin":{"edit":{"label":"origin","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"origin","searchable":true,"sortable":true}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"absoluteExpiresAt":{"edit":{"label":"absoluteExpiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"absoluteExpiresAt","searchable":true,"sortable":true}},"status":{"edit":{"label":"status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"status","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"metadata":{"edit":{"label":"metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metadata","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","userId","sessionId","childId"],"edit":[[{"name":"userId","size":6},{"name":"sessionId","size":6}],[{"name":"childId","size":6},{"name":"deviceId","size":6}],[{"name":"origin","size":6},{"name":"expiresAt","size":6}],[{"name":"absoluteExpiresAt","size":6},{"name":"status","size":6}],[{"name":"type","size":6}],[{"name":"metadata","size":12}]]},"uid":"admin::session"}	object	\N	\N
31	core_admin_auth	{"providers":{"autoRegister":false,"defaultRole":null,"ssoLockedRoles":null}}	object	\N	\N
\.


--
-- Data for Name: strapi_database_schema; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_database_schema (id, schema, "time", hash) FROM stdin;
1	{"tables":[{"name":"categories","indexes":[{"name":"categories_documents_idx","columns":["document_id","locale","published_at"]},{"name":"categories_created_by_id_fk","columns":["created_by_id"]},{"name":"categories_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"categories_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"categories_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"color","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"icon","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"position","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"discussions","indexes":[{"name":"discussions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"discussions_created_by_id_fk","columns":["created_by_id"]},{"name":"discussions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"discussions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"discussions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reply_count","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_activity_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_solved","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"replies","indexes":[{"name":"replies_documents_idx","columns":["document_id","locale","published_at"]},{"name":"replies_created_by_id_fk","columns":["created_by_id"]},{"name":"replies_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"replies_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"replies_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_accepted","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"files","indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null},{"name":"files_documents_idx","columns":["document_id","locale","published_at"]},{"name":"files_created_by_id_fk","columns":["created_by_id"]},{"name":"files_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"files_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"files_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alternative_text","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"caption","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"focal_point","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"formats","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hash","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mime","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preview_url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider_metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"folder_path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"upload_folders","indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"},{"name":"upload_folders_documents_idx","columns":["document_id","locale","published_at"]},{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"]},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"i18n_locale","indexes":[{"name":"i18n_locale_documents_idx","columns":["document_id","locale","published_at"]},{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"]},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_releases","indexes":[{"name":"strapi_releases_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_releases_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_releases_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_releases_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_releases_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"released_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"scheduled_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"timezone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_release_actions","indexes":[{"name":"strapi_release_actions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_release_actions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_release_actions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_release_actions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_release_actions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"entry_document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_entry_valid","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows","indexes":[{"name":"strapi_workflows_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_workflows_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_workflows_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_workflows_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_workflows_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content_types","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_workflows_stages","indexes":[{"name":"strapi_workflows_stages_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_workflows_stages_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_workflows_stages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_workflows_stages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_workflows_stages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"color","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_permissions","indexes":[{"name":"up_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_roles","indexes":[{"name":"up_roles_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_users","indexes":[{"name":"up_users_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_users_created_by_id_fk","columns":["created_by_id"]},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"display_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"bio","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"avatar_color","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"community_role","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_subscriber","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions","indexes":[{"name":"admin_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action_parameters","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"properties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"conditions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_users","indexes":[{"name":"admin_users_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_users_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token_expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"prefered_language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_roles","indexes":[{"name":"admin_roles_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_api_tokens","indexes":[{"name":"strapi_api_tokens_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"kind","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"encrypted_key","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_api_token_permissions","indexes":[{"name":"strapi_api_token_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_transfer_tokens","indexes":[{"name":"strapi_transfer_tokens_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_transfer_token_permissions","indexes":[{"name":"strapi_transfer_token_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_sessions","indexes":[{"name":"strapi_sessions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_sessions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_sessions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_sessions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_sessions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"user_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"session_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"child_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"device_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"origin","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"absolute_expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_core_store_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"environment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tag","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_webhooks","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content_type_events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_history_versions","indexes":[{"name":"strapi_history_versions_created_by_id_fk","columns":["created_by_id"]}],"foreignKeys":[{"name":"strapi_history_versions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"content_type","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"related_document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"data","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"schema","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_ai_metadata_jobs","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"completed_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_ai_localization_jobs","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"content_type","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"related_document_id","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"source_locale","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"target_locales","type":"jsonb","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"discussions_author_lnk","indexes":[{"name":"discussions_author_lnk_fk","columns":["discussion_id"]},{"name":"discussions_author_lnk_ifk","columns":["user_id"]},{"name":"discussions_author_lnk_uq","columns":["discussion_id","user_id"],"type":"unique"}],"foreignKeys":[{"name":"discussions_author_lnk_fk","columns":["discussion_id"],"referencedColumns":["id"],"referencedTable":"discussions","onDelete":"CASCADE"},{"name":"discussions_author_lnk_ifk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"discussion_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"discussions_category_lnk","indexes":[{"name":"discussions_category_lnk_fk","columns":["discussion_id"]},{"name":"discussions_category_lnk_ifk","columns":["category_id"]},{"name":"discussions_category_lnk_uq","columns":["discussion_id","category_id"],"type":"unique"},{"name":"discussions_category_lnk_oifk","columns":["discussion_ord"]}],"foreignKeys":[{"name":"discussions_category_lnk_fk","columns":["discussion_id"],"referencedColumns":["id"],"referencedTable":"discussions","onDelete":"CASCADE"},{"name":"discussions_category_lnk_ifk","columns":["category_id"],"referencedColumns":["id"],"referencedTable":"categories","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"discussion_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"category_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"discussion_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"replies_author_lnk","indexes":[{"name":"replies_author_lnk_fk","columns":["reply_id"]},{"name":"replies_author_lnk_ifk","columns":["user_id"]},{"name":"replies_author_lnk_uq","columns":["reply_id","user_id"],"type":"unique"}],"foreignKeys":[{"name":"replies_author_lnk_fk","columns":["reply_id"],"referencedColumns":["id"],"referencedTable":"replies","onDelete":"CASCADE"},{"name":"replies_author_lnk_ifk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"reply_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"replies_discussion_lnk","indexes":[{"name":"replies_discussion_lnk_fk","columns":["reply_id"]},{"name":"replies_discussion_lnk_ifk","columns":["discussion_id"]},{"name":"replies_discussion_lnk_uq","columns":["reply_id","discussion_id"],"type":"unique"},{"name":"replies_discussion_lnk_oifk","columns":["reply_ord"]}],"foreignKeys":[{"name":"replies_discussion_lnk_fk","columns":["reply_id"],"referencedColumns":["id"],"referencedTable":"replies","onDelete":"CASCADE"},{"name":"replies_discussion_lnk_ifk","columns":["discussion_id"],"referencedColumns":["id"],"referencedTable":"discussions","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"reply_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"discussion_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"reply_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_related_mph","indexes":[{"name":"files_related_mph_fk","columns":["file_id"]},{"name":"files_related_mph_oidx","columns":["order"]},{"name":"files_related_mph_idix","columns":["related_id"]}],"foreignKeys":[{"name":"files_related_mph_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_folder_lnk","indexes":[{"name":"files_folder_lnk_fk","columns":["file_id"]},{"name":"files_folder_lnk_ifk","columns":["folder_id"]},{"name":"files_folder_lnk_uq","columns":["file_id","folder_id"],"type":"unique"},{"name":"files_folder_lnk_oifk","columns":["file_ord"]}],"foreignKeys":[{"name":"files_folder_lnk_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"},{"name":"files_folder_lnk_ifk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"file_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders_parent_lnk","indexes":[{"name":"upload_folders_parent_lnk_fk","columns":["folder_id"]},{"name":"upload_folders_parent_lnk_ifk","columns":["inv_folder_id"]},{"name":"upload_folders_parent_lnk_uq","columns":["folder_id","inv_folder_id"],"type":"unique"},{"name":"upload_folders_parent_lnk_oifk","columns":["folder_ord"]}],"foreignKeys":[{"name":"upload_folders_parent_lnk_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"},{"name":"upload_folders_parent_lnk_ifk","columns":["inv_folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_release_actions_release_lnk","indexes":[{"name":"strapi_release_actions_release_lnk_fk","columns":["release_action_id"]},{"name":"strapi_release_actions_release_lnk_ifk","columns":["release_id"]},{"name":"strapi_release_actions_release_lnk_uq","columns":["release_action_id","release_id"],"type":"unique"},{"name":"strapi_release_actions_release_lnk_oifk","columns":["release_action_ord"]}],"foreignKeys":[{"name":"strapi_release_actions_release_lnk_fk","columns":["release_action_id"],"referencedColumns":["id"],"referencedTable":"strapi_release_actions","onDelete":"CASCADE"},{"name":"strapi_release_actions_release_lnk_ifk","columns":["release_id"],"referencedColumns":["id"],"referencedTable":"strapi_releases","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"release_action_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"release_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"release_action_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows_stage_required_to_publish_lnk","indexes":[{"name":"strapi_workflows_stage_required_to_publish_lnk_fk","columns":["workflow_id"]},{"name":"strapi_workflows_stage_required_to_publish_lnk_ifk","columns":["workflow_stage_id"]},{"name":"strapi_workflows_stage_required_to_publish_lnk_uq","columns":["workflow_id","workflow_stage_id"],"type":"unique"}],"foreignKeys":[{"name":"strapi_workflows_stage_required_to_publish_lnk_fk","columns":["workflow_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows","onDelete":"CASCADE"},{"name":"strapi_workflows_stage_required_to_publish_lnk_ifk","columns":["workflow_stage_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows_stages","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"workflow_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"workflow_stage_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows_stages_workflow_lnk","indexes":[{"name":"strapi_workflows_stages_workflow_lnk_fk","columns":["workflow_stage_id"]},{"name":"strapi_workflows_stages_workflow_lnk_ifk","columns":["workflow_id"]},{"name":"strapi_workflows_stages_workflow_lnk_uq","columns":["workflow_stage_id","workflow_id"],"type":"unique"},{"name":"strapi_workflows_stages_workflow_lnk_oifk","columns":["workflow_stage_ord"]}],"foreignKeys":[{"name":"strapi_workflows_stages_workflow_lnk_fk","columns":["workflow_stage_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows_stages","onDelete":"CASCADE"},{"name":"strapi_workflows_stages_workflow_lnk_ifk","columns":["workflow_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"workflow_stage_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"workflow_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"workflow_stage_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows_stages_permissions_lnk","indexes":[{"name":"strapi_workflows_stages_permissions_lnk_fk","columns":["workflow_stage_id"]},{"name":"strapi_workflows_stages_permissions_lnk_ifk","columns":["permission_id"]},{"name":"strapi_workflows_stages_permissions_lnk_uq","columns":["workflow_stage_id","permission_id"],"type":"unique"},{"name":"strapi_workflows_stages_permissions_lnk_ofk","columns":["permission_ord"]}],"foreignKeys":[{"name":"strapi_workflows_stages_permissions_lnk_fk","columns":["workflow_stage_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows_stages","onDelete":"CASCADE"},{"name":"strapi_workflows_stages_permissions_lnk_ifk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"workflow_stage_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions_role_lnk","indexes":[{"name":"up_permissions_role_lnk_fk","columns":["permission_id"]},{"name":"up_permissions_role_lnk_ifk","columns":["role_id"]},{"name":"up_permissions_role_lnk_uq","columns":["permission_id","role_id"],"type":"unique"},{"name":"up_permissions_role_lnk_oifk","columns":["permission_ord"]}],"foreignKeys":[{"name":"up_permissions_role_lnk_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"up_permissions","onDelete":"CASCADE"},{"name":"up_permissions_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_role_lnk","indexes":[{"name":"up_users_role_lnk_fk","columns":["user_id"]},{"name":"up_users_role_lnk_ifk","columns":["role_id"]},{"name":"up_users_role_lnk_uq","columns":["user_id","role_id"],"type":"unique"},{"name":"up_users_role_lnk_oifk","columns":["user_ord"]}],"foreignKeys":[{"name":"up_users_role_lnk_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_permissions_role_lnk","indexes":[{"name":"admin_permissions_role_lnk_fk","columns":["permission_id"]},{"name":"admin_permissions_role_lnk_ifk","columns":["role_id"]},{"name":"admin_permissions_role_lnk_uq","columns":["permission_id","role_id"],"type":"unique"},{"name":"admin_permissions_role_lnk_oifk","columns":["permission_ord"]}],"foreignKeys":[{"name":"admin_permissions_role_lnk_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_permissions_api_token_lnk","indexes":[{"name":"admin_permissions_api_token_lnk_fk","columns":["permission_id"]},{"name":"admin_permissions_api_token_lnk_ifk","columns":["api_token_id"]},{"name":"admin_permissions_api_token_lnk_uq","columns":["permission_id","api_token_id"],"type":"unique"},{"name":"admin_permissions_api_token_lnk_oifk","columns":["permission_ord"]}],"foreignKeys":[{"name":"admin_permissions_api_token_lnk_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_api_token_lnk_ifk","columns":["api_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users_roles_lnk","indexes":[{"name":"admin_users_roles_lnk_fk","columns":["user_id"]},{"name":"admin_users_roles_lnk_ifk","columns":["role_id"]},{"name":"admin_users_roles_lnk_uq","columns":["user_id","role_id"],"type":"unique"},{"name":"admin_users_roles_lnk_ofk","columns":["role_ord"]},{"name":"admin_users_roles_lnk_oifk","columns":["user_ord"]}],"foreignKeys":[{"name":"admin_users_roles_lnk_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"},{"name":"admin_users_roles_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_tokens_admin_user_owner_lnk","indexes":[{"name":"strapi_api_tokens_admin_user_owner_lnk_fk","columns":["api_token_id"]},{"name":"strapi_api_tokens_admin_user_owner_lnk_ifk","columns":["user_id"]},{"name":"strapi_api_tokens_admin_user_owner_lnk_uq","columns":["api_token_id","user_id"],"type":"unique"},{"name":"strapi_api_tokens_admin_user_owner_lnk_oifk","columns":["api_token_ord"]}],"foreignKeys":[{"name":"strapi_api_tokens_admin_user_owner_lnk_fk","columns":["api_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_tokens","onDelete":"CASCADE"},{"name":"strapi_api_tokens_admin_user_owner_lnk_ifk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"api_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions_token_lnk","indexes":[{"name":"strapi_api_token_permissions_token_lnk_fk","columns":["api_token_permission_id"]},{"name":"strapi_api_token_permissions_token_lnk_ifk","columns":["api_token_id"]},{"name":"strapi_api_token_permissions_token_lnk_uq","columns":["api_token_permission_id","api_token_id"],"type":"unique"},{"name":"strapi_api_token_permissions_token_lnk_oifk","columns":["api_token_permission_ord"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_token_lnk_fk","columns":["api_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_token_permissions","onDelete":"CASCADE"},{"name":"strapi_api_token_permissions_token_lnk_ifk","columns":["api_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"api_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions_token_lnk","indexes":[{"name":"strapi_transfer_token_permissions_token_lnk_fk","columns":["transfer_token_permission_id"]},{"name":"strapi_transfer_token_permissions_token_lnk_ifk","columns":["transfer_token_id"]},{"name":"strapi_transfer_token_permissions_token_lnk_uq","columns":["transfer_token_permission_id","transfer_token_id"],"type":"unique"},{"name":"strapi_transfer_token_permissions_token_lnk_oifk","columns":["transfer_token_permission_ord"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_token_lnk_fk","columns":["transfer_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_token_permissions","onDelete":"CASCADE"},{"name":"strapi_transfer_token_permissions_token_lnk_ifk","columns":["transfer_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"transfer_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]}]}	2026-11-05 17:21:52.898	dcdd0805ad3e6cf216f2de5384d6ae71d403b0123c87e939a341759a12f99893
\.


--
-- Data for Name: strapi_history_versions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_history_versions (id, content_type, related_document_id, locale, status, data, schema, created_at, created_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_migrations (id, name, "time") FROM stdin;
\.


--
-- Data for Name: strapi_migrations_internal; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_migrations_internal (id, name, "time") FROM stdin;
1	5.0.0-rename-identifiers-longer-than-max-length	2026-11-05 17:21:52.595
2	5.0.0-02-created-document-id	2026-11-05 17:21:52.627
3	5.0.0-03-created-locale	2026-11-05 17:21:52.647
4	5.0.0-04-created-published-at	2026-11-05 17:21:52.664
5	5.0.0-05-drop-slug-fields-index	2026-11-05 17:21:52.681
6	5.0.0-06-add-document-id-indexes	2026-11-05 17:21:52.682
7	core::5.0.0-discard-drafts	2026-11-05 17:21:52.707
8	admin::migrate-prefered-language-dk-to-da	2026-11-05 17:21:52.709
9	upload::unsign-richtext-and-blocks-urls	2026-11-05 17:21:52.71
\.


--
-- Data for Name: strapi_release_actions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_release_actions (id, document_id, type, content_type, entry_document_id, locale, is_entry_valid, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_release_actions_release_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_release_actions_release_lnk (id, release_action_id, release_id, release_action_ord) FROM stdin;
\.


--
-- Data for Name: strapi_releases; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_releases (id, document_id, name, released_at, scheduled_at, timezone, status, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_sessions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_sessions (id, document_id, user_id, session_id, child_id, device_id, origin, expires_at, absolute_expires_at, status, type, metadata, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	c9f2whjdw9thpzykbmvsvpu0	1	5551b3ba38e726ff61d0cd71e8ae8d71	\N	68d6a8e4-651d-4aca-9dad-868bf4044e80	admin	2026-11-05 19:22:09.349	2026-12-05 17:22:09.349	active	session	{"loginAt": "2026-11-05T16:22:09.349Z"}	2026-11-05 17:22:09.349	2026-11-05 17:22:09.349	2026-11-05 17:22:09.35	\N	\N	\N
\.


--
-- Data for Name: strapi_transfer_token_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_transfer_token_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_token_permissions_token_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_transfer_token_permissions_token_lnk (id, transfer_token_permission_id, transfer_token_id, transfer_token_permission_ord) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_transfer_tokens (id, document_id, name, description, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_webhooks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_webhooks (id, name, url, headers, events, content_type_events, enabled) FROM stdin;
\.


--
-- Data for Name: strapi_workflows; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_workflows (id, document_id, name, content_types, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_workflows_stage_required_to_publish_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_workflows_stage_required_to_publish_lnk (id, workflow_id, workflow_stage_id) FROM stdin;
\.


--
-- Data for Name: strapi_workflows_stages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_workflows_stages (id, document_id, name, color, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_workflows_stages_permissions_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_workflows_stages_permissions_lnk (id, workflow_stage_id, permission_id, permission_ord) FROM stdin;
\.


--
-- Data for Name: strapi_workflows_stages_workflow_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strapi_workflows_stages_workflow_lnk (id, workflow_stage_id, workflow_id, workflow_stage_ord) FROM stdin;
\.


--
-- Data for Name: up_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.up_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	u88qcbx4ey3glea88jfyqmk8	plugin::users-permissions.auth.logout	2026-11-05 17:21:53.235	2026-11-05 17:21:53.235	2026-11-05 17:21:53.236	\N	\N	\N
2	rlfudhxsevotcfsakz5urlub	plugin::users-permissions.auth.getSessions	2026-11-05 17:21:53.235	2026-11-05 17:21:53.235	2026-11-05 17:21:53.236	\N	\N	\N
3	vymlzw126b0bbmru74jxoj3u	plugin::users-permissions.auth.revokeSession	2026-11-05 17:21:53.235	2026-11-05 17:21:53.235	2026-11-05 17:21:53.236	\N	\N	\N
4	n4b5ivf8yt05xe4t2ge9iyh6	plugin::users-permissions.user.me	2026-11-05 17:21:53.235	2026-11-05 17:21:53.235	2026-11-05 17:21:53.236	\N	\N	\N
5	d3v44nsebqi58lwlr832b5qo	plugin::users-permissions.auth.changePassword	2026-11-05 17:21:53.235	2026-11-05 17:21:53.235	2026-11-05 17:21:53.237	\N	\N	\N
6	bo1a1g262qtyvy75jje2jnv7	plugin::users-permissions.auth.callback	2026-11-05 17:21:53.253	2026-11-05 17:21:53.253	2026-11-05 17:21:53.253	\N	\N	\N
7	jrstle39m20x8uzucwddfqzd	plugin::users-permissions.auth.connect	2026-11-05 17:21:53.253	2026-11-05 17:21:53.253	2026-11-05 17:21:53.254	\N	\N	\N
8	qd69rskc6spkhr4iz7dubx7t	plugin::users-permissions.auth.forgotPassword	2026-11-05 17:21:53.253	2026-11-05 17:21:53.253	2026-11-05 17:21:53.254	\N	\N	\N
9	ztev5dz9srviqb1vtbn2nuxj	plugin::users-permissions.auth.resetPassword	2026-11-05 17:21:53.253	2026-11-05 17:21:53.253	2026-11-05 17:21:53.254	\N	\N	\N
10	eoryd73t1yra4y7czqi8aqe1	plugin::users-permissions.auth.register	2026-11-05 17:21:53.253	2026-11-05 17:21:53.253	2026-11-05 17:21:53.254	\N	\N	\N
11	wy4ym5c768u0jdyue540fksz	plugin::users-permissions.auth.emailConfirmation	2026-11-05 17:21:53.253	2026-11-05 17:21:53.253	2026-11-05 17:21:53.254	\N	\N	\N
12	d0wwes2hhl3rcewzk9jemwy1	plugin::users-permissions.auth.sendEmailConfirmation	2026-11-05 17:21:53.253	2026-11-05 17:21:53.253	2026-11-05 17:21:53.254	\N	\N	\N
13	s57kujkxl9vfm9zulsoitz9s	plugin::users-permissions.auth.refresh	2026-11-05 17:21:53.253	2026-11-05 17:21:53.253	2026-11-05 17:21:53.254	\N	\N	\N
14	fc51p6h2irirvu7wiocxn840	api::category.category.find	2026-11-05 17:21:53.709	2026-11-05 17:21:53.709	2026-11-05 17:21:53.709	\N	\N	\N
15	muegppaifh3k0wj2mj61p9a8	api::category.category.findOne	2026-11-05 17:21:53.711	2026-11-05 17:21:53.711	2026-11-05 17:21:53.711	\N	\N	\N
16	lh73j31r5f5968nqegewqqhh	api::discussion.discussion.find	2026-11-05 17:21:53.713	2026-11-05 17:21:53.713	2026-11-05 17:21:53.713	\N	\N	\N
17	e3rzmtnyll8i8ivjt9wtuo6k	api::discussion.discussion.findOne	2026-11-05 17:21:53.716	2026-11-05 17:21:53.716	2026-11-05 17:21:53.716	\N	\N	\N
18	s21jfemip0pjxpk6tmtqr4o0	api::discussion.discussion.findBySlug	2026-11-05 17:21:53.718	2026-11-05 17:21:53.718	2026-11-05 17:21:53.718	\N	\N	\N
19	oseld13y780wx21a254d1jzf	api::reply.reply.find	2026-11-05 17:21:53.721	2026-11-05 17:21:53.721	2026-11-05 17:21:53.721	\N	\N	\N
20	xq4qlahhy9i6qb8914lq64i2	api::category.category.find	2026-11-05 17:21:53.725	2026-11-05 17:21:53.725	2026-11-05 17:21:53.725	\N	\N	\N
21	y5q5z0juw6xctq6wbgco2h34	api::category.category.findOne	2026-11-05 17:21:53.73	2026-11-05 17:21:53.73	2026-11-05 17:21:53.73	\N	\N	\N
22	s6p4878dxvblak3bx9hrhuv5	api::discussion.discussion.find	2026-11-05 17:21:53.732	2026-11-05 17:21:53.732	2026-11-05 17:21:53.732	\N	\N	\N
23	tdhfsen8a392szk31cs9v2iy	api::discussion.discussion.findOne	2026-11-05 17:21:53.737	2026-11-05 17:21:53.737	2026-11-05 17:21:53.737	\N	\N	\N
24	kl0gzxjhmyo7kqr2vbfpk3om	api::discussion.discussion.findBySlug	2026-11-05 17:21:53.739	2026-11-05 17:21:53.739	2026-11-05 17:21:53.739	\N	\N	\N
25	ohlymqr316btm2u94clzbae0	api::reply.reply.find	2026-11-05 17:21:53.741	2026-11-05 17:21:53.741	2026-11-05 17:21:53.741	\N	\N	\N
26	fpiiivw3trh2jp9zu3kikk3b	api::discussion.discussion.create	2026-11-05 17:21:53.743	2026-11-05 17:21:53.743	2026-11-05 17:21:53.743	\N	\N	\N
27	twcqkdrzmtspyqcdv6245qh7	api::discussion.discussion.acceptReply	2026-11-05 17:21:53.749	2026-11-05 17:21:53.749	2026-11-05 17:21:53.749	\N	\N	\N
28	rk9cukil9rprzakje0vhlmxv	api::reply.reply.create	2026-11-05 17:21:53.751	2026-11-05 17:21:53.751	2026-11-05 17:21:53.752	\N	\N	\N
\.


--
-- Data for Name: up_permissions_role_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.up_permissions_role_lnk (id, permission_id, role_id, permission_ord) FROM stdin;
1	2	1	1
2	1	1	1
3	3	1	1
4	4	1	1
5	5	1	1
6	8	2	1
7	6	2	1
8	7	2	1
9	11	2	2
10	10	2	2
11	9	2	2
12	12	2	2
13	13	2	2
14	14	2	3
15	15	2	4
16	16	2	5
17	17	2	6
18	18	2	7
19	19	2	8
20	20	1	2
21	21	1	3
22	22	1	4
23	23	1	5
24	24	1	6
25	25	1	7
26	26	1	8
27	27	1	9
28	28	1	10
\.


--
-- Data for Name: up_roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.up_roles (id, document_id, name, description, type, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	fb3slnpnq5xr755pp639f4uu	Authenticated	Default role given to authenticated user.	authenticated	2026-11-05 17:21:53.229	2026-11-05 17:21:53.229	2026-11-05 17:21:53.23	\N	\N	\N
2	xij1qdcrimjkvkgkrwp9e76q	Public	Default role given to unauthenticated user.	public	2026-11-05 17:21:53.232	2026-11-05 17:21:53.232	2026-11-05 17:21:53.232	\N	\N	\N
\.


--
-- Data for Name: up_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.up_users (id, document_id, username, email, provider, password, reset_password_token, confirmation_token, confirmed, blocked, display_name, bio, avatar_color, community_role, is_subscriber, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	yqg5yu9it99ny4tylu7r5gnk	LaRedaction	laredaction@demo.lerevenu.fr	local	$2a$10$bwaeU3/YeDAnKVxj41ehtOFIi/KkNsDV4HQVFKnfgxqBfGO/w5Sty	\N	\N	t	f	La rédaction du Revenu	Les journalistes du Revenu, présents chaque semaine pour répondre à vos questions.	#eb0f0f	redaction	f	2026-11-05 17:21:53.952	2026-11-05 17:21:53.952	2026-11-05 17:21:53.885	\N	\N	\N
2	cbsc3m9o5qag675eseztk6l3	Vincent_ETF	vincent.etf@demo.lerevenu.fr	local	$2a$10$Ro9dtR0QZnxZRBScw17OGuctkQ63XojCql6QhR2iUoU1jx6xRuetq	\N	\N	t	f	Vincent	Ingénieur, investisseur passif depuis 2015. Fan des ETF monde.	#5856d6	member	t	2026-11-05 17:21:54.023	2026-11-05 17:21:54.023	2026-11-05 17:21:53.957	\N	\N	\N
3	ui8df5itwqzw3acgseltcj4w	PapyBoursier	papyboursier@demo.lerevenu.fr	local	$2a$10$daMCh3Wrktm4p9H4WSLlg.vboGqzUdPkAvLKFOAoDBtM/XjOB76gu	\N	\N	t	f	Papy Boursier	40 ans de Bourse, des erreurs et quelques réussites.	#c93400	member	t	2026-11-05 17:21:54.094	2026-11-05 17:21:54.094	2026-11-05 17:21:54.027	\N	\N	\N
4	uhs95rgzp6ewqhlrkmmizg3z	Odile.Retraite	odile.retraite@demo.lerevenu.fr	local	$2a$10$UdhF5IOi3TofIFHxYBUpZeTXqYRDzkj5dr1HUC651B30SZ8RDRmk.	\N	\N	t	f	Odile	Jeune retraitée, je gère mon patrimoine en famille.	#0a7f99	member	f	2026-11-05 17:21:54.164	2026-11-05 17:21:54.164	2026-11-05 17:21:54.098	\N	\N	\N
5	f0q4mc66yzeo059osp425j6w	Nadia.Patrimoine	nadia.patrimoine@demo.lerevenu.fr	local	$2a$10$YrvkF8Z.4YTcg8EdKf/0GeyazM6U.zzQWyjuNRkr.7v6epcuGcNaG	\N	\N	t	f	Nadia	Mère de trois enfants, je prépare la transmission sereinement.	#d30f45	member	t	2026-11-05 17:21:54.235	2026-11-05 17:21:54.235	2026-11-05 17:21:54.167	\N	\N	\N
6	tua73sp2jcf7lj2rqzevclgl	Claire_Nantes	claire.nantes@demo.lerevenu.fr	local	$2a$10$UQxoESApSCFWPTtvmIf2wuU6G6lBbIu7TpyXOUtuYMT.kFI200stK	\N	\N	t	f	Claire	Je compare tout avant de signer.	#6e6e73	member	f	2026-11-05 17:21:54.304	2026-11-05 17:21:54.304	2026-11-05 17:21:54.238	\N	\N	\N
7	joxs3c1ymynvn49o644tubr6	Sophie.Invest	sophie.invest@demo.lerevenu.fr	local	$2a$10$Eb1HbugTR9SIbMlN8pvSpuOm2awlPOULPjvGisFqHdU5dnxua8idy	\N	\N	t	f	Sophie	Abonnée au Revenu, curieuse de tout ce qui touche à l'argent.	#5856d6	member	t	2026-11-05 17:21:54.377	2026-11-05 17:21:54.377	2026-11-05 17:21:54.31	\N	\N	\N
8	y62lyerjjde7uglgmrpnbjs9	Karim_Immo	karim.immo@demo.lerevenu.fr	local	$2a$10$lNBaWoIsy36jleWWQnv47eZ4VKMlXEW64oLQ4i7zXqUI7M9eeX0iC	\N	\N	t	f	Karim	Investisseur immobilier, 3 biens locatifs et quelques SCPI.	#c93400	member	f	2026-11-05 17:21:54.449	2026-11-05 17:21:54.449	2026-11-05 17:21:54.382	\N	\N	\N
9	v6rtnf4nsrj51gq9p643bkx8	Bertrand59	bertrand59@demo.lerevenu.fr	local	$2a$10$/xVyOVipaJiwy2LH8KPK0.uLVc2/UtoaKY2gllTyebMd8iLAPYotG	\N	\N	t	f	Bertrand	Cadre dans le Nord, je prépare ma retraite.	#6e6e73	member	f	2026-11-05 17:21:54.519	2026-11-05 17:21:54.519	2026-11-05 17:21:54.452	\N	\N	\N
10	ixxc24wjiztkk69sncdbigr2	Marc_Lyon	marc.lyon@demo.lerevenu.fr	local	$2a$10$Ku4aQWHsXXGejcGd7pvxL.R5dfHQ.7kAmOW.7whaK0nuDifev77hu	\N	\N	t	f	Marc	Passionné d'or et d'histoire monétaire.	#0a7f99	member	f	2026-11-05 17:21:54.588	2026-11-05 17:21:54.588	2026-11-05 17:21:54.523	\N	\N	\N
11	rwqa316zjku1psrpybw20ojc	LeRentier	lerentier@demo.lerevenu.fr	local	$2a$10$Lqkdew6pM8FIBDX26RggYe0ghzZovbBXIiVz1tHXllg/PJK17960e	\N	\N	t	f	Le Rentier	Stratégie dividendes, patience et réinvestissement.	#5856d6	member	f	2026-11-05 17:21:54.657	2026-11-05 17:21:54.657	2026-11-05 17:21:54.592	\N	\N	\N
12	z5fu3gw1a4nhnsby0a9b21xs	Thomas_PEA	thomas.pea@demo.lerevenu.fr	local	$2a$10$.5k1oAWI7Lfb3P6V2yJgFObCSZsAEipb2YaQOKnpwOtNgbRS1ETgC	\N	\N	t	f	Thomas	32 ans, je débute en Bourse.	#c93400	member	f	2026-11-05 17:21:54.73	2026-11-05 17:21:54.73	2026-11-05 17:21:54.664	\N	\N	\N
13	wbuppc3uuujz27rtx5ukz3vx	Julie_Toulouse	julie.toulouse@demo.lerevenu.fr	local	$2a$10$IFClJ/d7yV2vZmspulNEeulFrAyX2iEdlC.m1fFoeCgh20uabgvl.	\N	\N	t	f	Julie	Salariée, j'optimise ma fiscalité sans prise de tête.	#5856d6	member	f	2026-11-05 17:21:54.799	2026-11-05 17:21:54.799	2026-11-05 17:21:54.734	\N	\N	\N
14	nk11gu3jd8e3ngkkxv7ovp3y	JeuneEpargnant	jeuneepargnant@demo.lerevenu.fr	local	$2a$10$Fk71wg9gd.FkFXpmUVc5BuoAT1rjsBqa6ISiJJv1ovV7It9IOikqK	\N	\N	t	f	Hugo	25 ans, premier CDI, je veux bien démarrer.	#0a7f99	member	f	2026-11-05 17:21:54.868	2026-11-05 17:21:54.868	2026-11-05 17:21:54.802	\N	\N	\N
15	a1cb15w7phj3kgttulepsa88	Helene_R	helene.r@demo.lerevenu.fr	local	$2a$10$buNPOZtlvKOHo3WPequ6beGe/smIKlqkkazsUBM6efFm2kqzXQG2u	\N	\N	t	f	Hélène	Je loue un studio meublé et découvre la fiscalité qui va avec.	#6e6e73	member	f	2026-11-05 17:21:54.938	2026-11-05 17:21:54.938	2026-11-05 17:21:54.872	\N	\N	\N
16	dt46q3rjrv1ryjr1s19rn5of	Camille_B	camille.b@demo.lerevenu.fr	local	$2a$10$kKuyC7T/dcbICRe4ZFx24O8MMGEmlMD4HhjgxTDJZYgc5vMlA0pPy	\N	\N	t	f	Camille	Cadre, 41 ans. Je prépare ma retraite et celle de mes parents.	#d30f45	member	t	2026-11-05 17:21:55.011	2026-11-05 17:21:55.011	2026-11-05 17:21:54.945	\N	\N	\N
17	ivmbl7lz4l3l78cigdllige4	Sandrine_CGP	sandrine.cgp@demo.lerevenu.fr	local	$2a$10$oNv5dk.AH1UDdbM6ppJ4.e8MN9pWxc2It3Li6dpS4ha.tEwPMRl9K	\N	\N	t	f	Sandrine Morel	CGP indépendante depuis quinze ans. Je partage ici à titre informatif, sans démarchage.	#0a7f99	expert	f	2026-11-05 17:21:55.081	2026-11-05 17:21:55.081	2026-11-05 17:21:55.015	\N	\N	\N
18	z0z2cb8ctk7gpg3amedrri62	Me_Garnier	me.garnier@demo.lerevenu.fr	local	$2a$10$nCwii47TlIL8yQWIPfQR9.DJCSiJm21q9pHUf.tPyciorLvU3531C	\N	\N	t	f	Maître Garnier	Notaire en région lyonnaise. Successions, donations, régimes matrimoniaux.	#5856d6	expert	f	2026-11-05 17:21:55.15	2026-11-05 17:21:55.15	2026-11-05 17:21:55.085	\N	\N	\N
\.


--
-- Data for Name: up_users_role_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.up_users_role_lnk (id, user_id, role_id, user_ord) FROM stdin;
1	1	1	1
2	2	1	2
3	3	1	3
4	4	1	4
5	5	1	5
6	6	1	6
7	7	1	7
8	8	1	8
9	9	1	9
10	10	1	10
11	11	1	11
12	12	1	12
13	13	1	13
14	14	1	14
15	15	1	15
16	16	1	16
17	17	1	17
18	18	1	18
\.


--
-- Data for Name: upload_folders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.upload_folders (id, document_id, name, path_id, path, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: upload_folders_parent_lnk; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.upload_folders_parent_lnk (id, folder_id, inv_folder_id, folder_ord) FROM stdin;
\.


--
-- Name: admin_permissions_api_token_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_permissions_api_token_lnk_id_seq', 1, false);


--
-- Name: admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_permissions_id_seq', 136, true);


--
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_permissions_role_lnk_id_seq', 136, true);


--
-- Name: admin_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 1, true);


--
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_users_roles_lnk_id_seq', 1, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categories_id_seq', 11, true);


--
-- Name: discussions_author_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.discussions_author_lnk_id_seq', 20, true);


--
-- Name: discussions_category_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.discussions_category_lnk_id_seq', 20, true);


--
-- Name: discussions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.discussions_id_seq', 20, true);


--
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.files_folder_lnk_id_seq', 1, false);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.files_id_seq', 1, false);


--
-- Name: files_related_mph_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.files_related_mph_id_seq', 1, false);


--
-- Name: i18n_locale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.i18n_locale_id_seq', 1, true);


--
-- Name: replies_author_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.replies_author_lnk_id_seq', 48, true);


--
-- Name: replies_discussion_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.replies_discussion_lnk_id_seq', 48, true);


--
-- Name: replies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.replies_id_seq', 48, true);


--
-- Name: strapi_ai_localization_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_ai_localization_jobs_id_seq', 1, false);


--
-- Name: strapi_ai_metadata_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_ai_metadata_jobs_id_seq', 1, false);


--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_id_seq', 1, false);


--
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_token_lnk_id_seq', 1, false);


--
-- Name: strapi_api_tokens_admin_user_owner_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_api_tokens_admin_user_owner_lnk_id_seq', 1, false);


--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 2, true);


--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 31, true);


--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 1, true);


--
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_history_versions_id_seq', 1, false);


--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);


--
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_migrations_internal_id_seq', 9, true);


--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_release_actions_id_seq', 1, false);


--
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_release_actions_release_lnk_id_seq', 1, false);


--
-- Name: strapi_releases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_releases_id_seq', 1, false);


--
-- Name: strapi_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_sessions_id_seq', 1, true);


--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_id_seq', 1, false);


--
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_token_lnk_id_seq', 1, false);


--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_transfer_tokens_id_seq', 1, false);


--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);


--
-- Name: strapi_workflows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_workflows_id_seq', 1, false);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_workflows_stage_required_to_publish_lnk_id_seq', 1, false);


--
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_id_seq', 1, false);


--
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_permissions_lnk_id_seq', 1, false);


--
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_workflow_lnk_id_seq', 1, false);


--
-- Name: up_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.up_permissions_id_seq', 28, true);


--
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.up_permissions_role_lnk_id_seq', 28, true);


--
-- Name: up_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.up_roles_id_seq', 2, true);


--
-- Name: up_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.up_users_id_seq', 18, true);


--
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.up_users_role_lnk_id_seq', 18, true);


--
-- Name: upload_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.upload_folders_id_seq', 1, false);


--
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.upload_folders_parent_lnk_id_seq', 1, false);


--
-- Name: admin_permissions_api_token_lnk admin_permissions_api_token_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions_api_token_lnk
    ADD CONSTRAINT admin_permissions_api_token_lnk_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_api_token_lnk admin_permissions_api_token_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions_api_token_lnk
    ADD CONSTRAINT admin_permissions_api_token_lnk_uq UNIQUE (permission_id, api_token_id);


--
-- Name: admin_permissions admin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_uq UNIQUE (permission_id, role_id);


--
-- Name: admin_roles admin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_uq UNIQUE (user_id, role_id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: discussions_author_lnk discussions_author_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discussions_author_lnk
    ADD CONSTRAINT discussions_author_lnk_pkey PRIMARY KEY (id);


--
-- Name: discussions_author_lnk discussions_author_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discussions_author_lnk
    ADD CONSTRAINT discussions_author_lnk_uq UNIQUE (discussion_id, user_id);


--
-- Name: discussions_category_lnk discussions_category_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discussions_category_lnk
    ADD CONSTRAINT discussions_category_lnk_pkey PRIMARY KEY (id);


--
-- Name: discussions_category_lnk discussions_category_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discussions_category_lnk
    ADD CONSTRAINT discussions_category_lnk_uq UNIQUE (discussion_id, category_id);


--
-- Name: discussions discussions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discussions
    ADD CONSTRAINT discussions_pkey PRIMARY KEY (id);


--
-- Name: files_folder_lnk files_folder_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_pkey PRIMARY KEY (id);


--
-- Name: files_folder_lnk files_folder_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_uq UNIQUE (file_id, folder_id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: files_related_mph files_related_mph_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files_related_mph
    ADD CONSTRAINT files_related_mph_pkey PRIMARY KEY (id);


--
-- Name: i18n_locale i18n_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);


--
-- Name: replies_author_lnk replies_author_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.replies_author_lnk
    ADD CONSTRAINT replies_author_lnk_pkey PRIMARY KEY (id);


--
-- Name: replies_author_lnk replies_author_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.replies_author_lnk
    ADD CONSTRAINT replies_author_lnk_uq UNIQUE (reply_id, user_id);


--
-- Name: replies_discussion_lnk replies_discussion_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.replies_discussion_lnk
    ADD CONSTRAINT replies_discussion_lnk_pkey PRIMARY KEY (id);


--
-- Name: replies_discussion_lnk replies_discussion_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.replies_discussion_lnk
    ADD CONSTRAINT replies_discussion_lnk_uq UNIQUE (reply_id, discussion_id);


--
-- Name: replies replies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.replies
    ADD CONSTRAINT replies_pkey PRIMARY KEY (id);


--
-- Name: strapi_ai_localization_jobs strapi_ai_localization_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_ai_localization_jobs
    ADD CONSTRAINT strapi_ai_localization_jobs_pkey PRIMARY KEY (id);


--
-- Name: strapi_ai_metadata_jobs strapi_ai_metadata_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_ai_metadata_jobs
    ADD CONSTRAINT strapi_ai_metadata_jobs_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_uq UNIQUE (api_token_permission_id, api_token_id);


--
-- Name: strapi_api_tokens_admin_user_owner_lnk strapi_api_tokens_admin_user_owner_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_tokens_admin_user_owner_lnk
    ADD CONSTRAINT strapi_api_tokens_admin_user_owner_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_tokens_admin_user_owner_lnk strapi_api_tokens_admin_user_owner_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_tokens_admin_user_owner_lnk
    ADD CONSTRAINT strapi_api_tokens_admin_user_owner_lnk_uq UNIQUE (api_token_id, user_id);


--
-- Name: strapi_api_tokens strapi_api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_core_store_settings strapi_core_store_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);


--
-- Name: strapi_database_schema strapi_database_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);


--
-- Name: strapi_history_versions strapi_history_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_history_versions
    ADD CONSTRAINT strapi_history_versions_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations_internal strapi_migrations_internal_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_migrations_internal
    ADD CONSTRAINT strapi_migrations_internal_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations strapi_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions strapi_release_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_uq UNIQUE (release_action_id, release_id);


--
-- Name: strapi_releases strapi_releases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_pkey PRIMARY KEY (id);


--
-- Name: strapi_sessions strapi_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_sessions
    ADD CONSTRAINT strapi_sessions_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_uq UNIQUE (transfer_token_permission_id, transfer_token_id);


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_webhooks strapi_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows strapi_workflows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_uq UNIQUE (workflow_id, workflow_stage_id);


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_uq UNIQUE (workflow_stage_id, permission_id);


--
-- Name: strapi_workflows_stages strapi_workflows_stages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_uq UNIQUE (workflow_stage_id, workflow_id);


--
-- Name: up_permissions up_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_uq UNIQUE (permission_id, role_id);


--
-- Name: up_roles up_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);


--
-- Name: up_users up_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_lnk up_users_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_lnk up_users_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_uq UNIQUE (user_id, role_id);


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_pkey PRIMARY KEY (id);


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_uq UNIQUE (folder_id, inv_folder_id);


--
-- Name: upload_folders upload_folders_path_id_index; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_id_index UNIQUE (path_id);


--
-- Name: upload_folders upload_folders_path_index; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_index UNIQUE (path);


--
-- Name: upload_folders upload_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_api_token_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_permissions_api_token_lnk_fk ON public.admin_permissions_api_token_lnk USING btree (permission_id);


--
-- Name: admin_permissions_api_token_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_permissions_api_token_lnk_ifk ON public.admin_permissions_api_token_lnk USING btree (api_token_id);


--
-- Name: admin_permissions_api_token_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_permissions_api_token_lnk_oifk ON public.admin_permissions_api_token_lnk USING btree (permission_ord);


--
-- Name: admin_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);


--
-- Name: admin_permissions_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_permissions_documents_idx ON public.admin_permissions USING btree (document_id, locale, published_at);


--
-- Name: admin_permissions_role_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_permissions_role_lnk_fk ON public.admin_permissions_role_lnk USING btree (permission_id);


--
-- Name: admin_permissions_role_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_permissions_role_lnk_ifk ON public.admin_permissions_role_lnk USING btree (role_id);


--
-- Name: admin_permissions_role_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_permissions_role_lnk_oifk ON public.admin_permissions_role_lnk USING btree (permission_ord);


--
-- Name: admin_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);


--
-- Name: admin_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);


--
-- Name: admin_roles_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_roles_documents_idx ON public.admin_roles USING btree (document_id, locale, published_at);


--
-- Name: admin_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);


--
-- Name: admin_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);


--
-- Name: admin_users_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_users_documents_idx ON public.admin_users USING btree (document_id, locale, published_at);


--
-- Name: admin_users_roles_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_users_roles_lnk_fk ON public.admin_users_roles_lnk USING btree (user_id);


--
-- Name: admin_users_roles_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_users_roles_lnk_ifk ON public.admin_users_roles_lnk USING btree (role_id);


--
-- Name: admin_users_roles_lnk_ofk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_users_roles_lnk_ofk ON public.admin_users_roles_lnk USING btree (role_ord);


--
-- Name: admin_users_roles_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_users_roles_lnk_oifk ON public.admin_users_roles_lnk USING btree (user_ord);


--
-- Name: admin_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);


--
-- Name: categories_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX categories_created_by_id_fk ON public.categories USING btree (created_by_id);


--
-- Name: categories_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX categories_documents_idx ON public.categories USING btree (document_id, locale, published_at);


--
-- Name: categories_slug_uniq; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX categories_slug_uniq ON public.categories USING btree (slug);


--
-- Name: categories_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX categories_updated_by_id_fk ON public.categories USING btree (updated_by_id);


--
-- Name: discussions_author_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX discussions_author_lnk_fk ON public.discussions_author_lnk USING btree (discussion_id);


--
-- Name: discussions_author_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX discussions_author_lnk_ifk ON public.discussions_author_lnk USING btree (user_id);


--
-- Name: discussions_category_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX discussions_category_lnk_fk ON public.discussions_category_lnk USING btree (discussion_id);


--
-- Name: discussions_category_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX discussions_category_lnk_ifk ON public.discussions_category_lnk USING btree (category_id);


--
-- Name: discussions_category_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX discussions_category_lnk_oifk ON public.discussions_category_lnk USING btree (discussion_ord);


--
-- Name: discussions_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX discussions_created_at_idx ON public.discussions USING btree (created_at DESC, id DESC);


--
-- Name: discussions_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX discussions_created_by_id_fk ON public.discussions USING btree (created_by_id);


--
-- Name: discussions_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX discussions_documents_idx ON public.discussions USING btree (document_id, locale, published_at);


--
-- Name: discussions_reply_count_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX discussions_reply_count_idx ON public.discussions USING btree (reply_count);


--
-- Name: discussions_slug_uniq; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX discussions_slug_uniq ON public.discussions USING btree (slug);


--
-- Name: discussions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX discussions_updated_by_id_fk ON public.discussions USING btree (updated_by_id);


--
-- Name: files_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);


--
-- Name: files_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX files_documents_idx ON public.files USING btree (document_id, locale, published_at);


--
-- Name: files_folder_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX files_folder_lnk_fk ON public.files_folder_lnk USING btree (file_id);


--
-- Name: files_folder_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX files_folder_lnk_ifk ON public.files_folder_lnk USING btree (folder_id);


--
-- Name: files_folder_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX files_folder_lnk_oifk ON public.files_folder_lnk USING btree (file_ord);


--
-- Name: files_related_mph_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX files_related_mph_fk ON public.files_related_mph USING btree (file_id);


--
-- Name: files_related_mph_idix; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX files_related_mph_idix ON public.files_related_mph USING btree (related_id);


--
-- Name: files_related_mph_oidx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX files_related_mph_oidx ON public.files_related_mph USING btree ("order");


--
-- Name: files_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);


--
-- Name: i18n_locale_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);


--
-- Name: i18n_locale_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX i18n_locale_documents_idx ON public.i18n_locale USING btree (document_id, locale, published_at);


--
-- Name: i18n_locale_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);


--
-- Name: replies_author_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX replies_author_lnk_fk ON public.replies_author_lnk USING btree (reply_id);


--
-- Name: replies_author_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX replies_author_lnk_ifk ON public.replies_author_lnk USING btree (user_id);


--
-- Name: replies_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX replies_created_at_idx ON public.replies USING btree (created_at, id);


--
-- Name: replies_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX replies_created_by_id_fk ON public.replies USING btree (created_by_id);


--
-- Name: replies_discussion_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX replies_discussion_lnk_fk ON public.replies_discussion_lnk USING btree (reply_id);


--
-- Name: replies_discussion_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX replies_discussion_lnk_ifk ON public.replies_discussion_lnk USING btree (discussion_id);


--
-- Name: replies_discussion_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX replies_discussion_lnk_oifk ON public.replies_discussion_lnk USING btree (reply_ord);


--
-- Name: replies_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX replies_documents_idx ON public.replies USING btree (document_id, locale, published_at);


--
-- Name: replies_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX replies_updated_by_id_fk ON public.replies USING btree (updated_by_id);


--
-- Name: strapi_api_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_token_permissions_created_by_id_fk ON public.strapi_api_token_permissions USING btree (created_by_id);


--
-- Name: strapi_api_token_permissions_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_token_permissions_documents_idx ON public.strapi_api_token_permissions USING btree (document_id, locale, published_at);


--
-- Name: strapi_api_token_permissions_token_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_token_permissions_token_lnk_fk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_permission_id);


--
-- Name: strapi_api_token_permissions_token_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_token_permissions_token_lnk_ifk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_id);


--
-- Name: strapi_api_token_permissions_token_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_token_permissions_token_lnk_oifk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_permission_ord);


--
-- Name: strapi_api_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_token_permissions_updated_by_id_fk ON public.strapi_api_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_api_tokens_admin_user_owner_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_tokens_admin_user_owner_lnk_fk ON public.strapi_api_tokens_admin_user_owner_lnk USING btree (api_token_id);


--
-- Name: strapi_api_tokens_admin_user_owner_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_tokens_admin_user_owner_lnk_ifk ON public.strapi_api_tokens_admin_user_owner_lnk USING btree (user_id);


--
-- Name: strapi_api_tokens_admin_user_owner_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_tokens_admin_user_owner_lnk_oifk ON public.strapi_api_tokens_admin_user_owner_lnk USING btree (api_token_ord);


--
-- Name: strapi_api_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);


--
-- Name: strapi_api_tokens_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_tokens_documents_idx ON public.strapi_api_tokens USING btree (document_id, locale, published_at);


--
-- Name: strapi_api_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);


--
-- Name: strapi_history_versions_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_history_versions_created_by_id_fk ON public.strapi_history_versions USING btree (created_by_id);


--
-- Name: strapi_release_actions_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_release_actions_created_by_id_fk ON public.strapi_release_actions USING btree (created_by_id);


--
-- Name: strapi_release_actions_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_release_actions_documents_idx ON public.strapi_release_actions USING btree (document_id, locale, published_at);


--
-- Name: strapi_release_actions_release_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_release_actions_release_lnk_fk ON public.strapi_release_actions_release_lnk USING btree (release_action_id);


--
-- Name: strapi_release_actions_release_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_release_actions_release_lnk_ifk ON public.strapi_release_actions_release_lnk USING btree (release_id);


--
-- Name: strapi_release_actions_release_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_release_actions_release_lnk_oifk ON public.strapi_release_actions_release_lnk USING btree (release_action_ord);


--
-- Name: strapi_release_actions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_release_actions_updated_by_id_fk ON public.strapi_release_actions USING btree (updated_by_id);


--
-- Name: strapi_releases_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_releases_created_by_id_fk ON public.strapi_releases USING btree (created_by_id);


--
-- Name: strapi_releases_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_releases_documents_idx ON public.strapi_releases USING btree (document_id, locale, published_at);


--
-- Name: strapi_releases_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_releases_updated_by_id_fk ON public.strapi_releases USING btree (updated_by_id);


--
-- Name: strapi_sessions_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_sessions_created_by_id_fk ON public.strapi_sessions USING btree (created_by_id);


--
-- Name: strapi_sessions_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_sessions_documents_idx ON public.strapi_sessions USING btree (document_id, locale, published_at);


--
-- Name: strapi_sessions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_sessions_updated_by_id_fk ON public.strapi_sessions USING btree (updated_by_id);


--
-- Name: strapi_transfer_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_transfer_token_permissions_created_by_id_fk ON public.strapi_transfer_token_permissions USING btree (created_by_id);


--
-- Name: strapi_transfer_token_permissions_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_transfer_token_permissions_documents_idx ON public.strapi_transfer_token_permissions USING btree (document_id, locale, published_at);


--
-- Name: strapi_transfer_token_permissions_token_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_fk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_permission_id);


--
-- Name: strapi_transfer_token_permissions_token_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_ifk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_id);


--
-- Name: strapi_transfer_token_permissions_token_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_oifk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_permission_ord);


--
-- Name: strapi_transfer_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_transfer_token_permissions_updated_by_id_fk ON public.strapi_transfer_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_transfer_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_transfer_tokens_created_by_id_fk ON public.strapi_transfer_tokens USING btree (created_by_id);


--
-- Name: strapi_transfer_tokens_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_transfer_tokens_documents_idx ON public.strapi_transfer_tokens USING btree (document_id, locale, published_at);


--
-- Name: strapi_transfer_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_transfer_tokens_updated_by_id_fk ON public.strapi_transfer_tokens USING btree (updated_by_id);


--
-- Name: strapi_workflows_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_created_by_id_fk ON public.strapi_workflows USING btree (created_by_id);


--
-- Name: strapi_workflows_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_documents_idx ON public.strapi_workflows USING btree (document_id, locale, published_at);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stage_required_to_publish_lnk_fk ON public.strapi_workflows_stage_required_to_publish_lnk USING btree (workflow_id);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stage_required_to_publish_lnk_ifk ON public.strapi_workflows_stage_required_to_publish_lnk USING btree (workflow_stage_id);


--
-- Name: strapi_workflows_stages_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stages_created_by_id_fk ON public.strapi_workflows_stages USING btree (created_by_id);


--
-- Name: strapi_workflows_stages_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stages_documents_idx ON public.strapi_workflows_stages USING btree (document_id, locale, published_at);


--
-- Name: strapi_workflows_stages_permissions_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_fk ON public.strapi_workflows_stages_permissions_lnk USING btree (workflow_stage_id);


--
-- Name: strapi_workflows_stages_permissions_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_ifk ON public.strapi_workflows_stages_permissions_lnk USING btree (permission_id);


--
-- Name: strapi_workflows_stages_permissions_lnk_ofk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_ofk ON public.strapi_workflows_stages_permissions_lnk USING btree (permission_ord);


--
-- Name: strapi_workflows_stages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stages_updated_by_id_fk ON public.strapi_workflows_stages USING btree (updated_by_id);


--
-- Name: strapi_workflows_stages_workflow_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_fk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_stage_id);


--
-- Name: strapi_workflows_stages_workflow_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_ifk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_id);


--
-- Name: strapi_workflows_stages_workflow_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_oifk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_stage_ord);


--
-- Name: strapi_workflows_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX strapi_workflows_updated_by_id_fk ON public.strapi_workflows USING btree (updated_by_id);


--
-- Name: up_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);


--
-- Name: up_permissions_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_permissions_documents_idx ON public.up_permissions USING btree (document_id, locale, published_at);


--
-- Name: up_permissions_role_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_permissions_role_lnk_fk ON public.up_permissions_role_lnk USING btree (permission_id);


--
-- Name: up_permissions_role_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_permissions_role_lnk_ifk ON public.up_permissions_role_lnk USING btree (role_id);


--
-- Name: up_permissions_role_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_permissions_role_lnk_oifk ON public.up_permissions_role_lnk USING btree (permission_ord);


--
-- Name: up_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);


--
-- Name: up_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);


--
-- Name: up_roles_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_roles_documents_idx ON public.up_roles USING btree (document_id, locale, published_at);


--
-- Name: up_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);


--
-- Name: up_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);


--
-- Name: up_users_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_users_documents_idx ON public.up_users USING btree (document_id, locale, published_at);


--
-- Name: up_users_role_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_users_role_lnk_fk ON public.up_users_role_lnk USING btree (user_id);


--
-- Name: up_users_role_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_users_role_lnk_ifk ON public.up_users_role_lnk USING btree (role_id);


--
-- Name: up_users_role_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_users_role_lnk_oifk ON public.up_users_role_lnk USING btree (user_ord);


--
-- Name: up_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);


--
-- Name: upload_files_created_at_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_files_created_at_index ON public.files USING btree (created_at);


--
-- Name: upload_files_ext_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_files_ext_index ON public.files USING btree (ext);


--
-- Name: upload_files_folder_path_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_files_folder_path_index ON public.files USING btree (folder_path);


--
-- Name: upload_files_name_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_files_name_index ON public.files USING btree (name);


--
-- Name: upload_files_size_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_files_size_index ON public.files USING btree (size);


--
-- Name: upload_files_updated_at_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_files_updated_at_index ON public.files USING btree (updated_at);


--
-- Name: upload_folders_created_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_folders_created_by_id_fk ON public.upload_folders USING btree (created_by_id);


--
-- Name: upload_folders_documents_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_folders_documents_idx ON public.upload_folders USING btree (document_id, locale, published_at);


--
-- Name: upload_folders_parent_lnk_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_folders_parent_lnk_fk ON public.upload_folders_parent_lnk USING btree (folder_id);


--
-- Name: upload_folders_parent_lnk_ifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_folders_parent_lnk_ifk ON public.upload_folders_parent_lnk USING btree (inv_folder_id);


--
-- Name: upload_folders_parent_lnk_oifk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_folders_parent_lnk_oifk ON public.upload_folders_parent_lnk USING btree (folder_ord);


--
-- Name: upload_folders_updated_by_id_fk; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX upload_folders_updated_by_id_fk ON public.upload_folders USING btree (updated_by_id);


--
-- Name: admin_permissions_api_token_lnk admin_permissions_api_token_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions_api_token_lnk
    ADD CONSTRAINT admin_permissions_api_token_lnk_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: admin_permissions_api_token_lnk admin_permissions_api_token_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions_api_token_lnk
    ADD CONSTRAINT admin_permissions_api_token_lnk_ifk FOREIGN KEY (api_token_id) REFERENCES public.strapi_api_tokens(id) ON DELETE CASCADE;


--
-- Name: admin_permissions admin_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_permissions admin_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users admin_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_users admin_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: categories categories_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: categories categories_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: discussions_author_lnk discussions_author_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discussions_author_lnk
    ADD CONSTRAINT discussions_author_lnk_fk FOREIGN KEY (discussion_id) REFERENCES public.discussions(id) ON DELETE CASCADE;


--
-- Name: discussions_author_lnk discussions_author_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discussions_author_lnk
    ADD CONSTRAINT discussions_author_lnk_ifk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: discussions_category_lnk discussions_category_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discussions_category_lnk
    ADD CONSTRAINT discussions_category_lnk_fk FOREIGN KEY (discussion_id) REFERENCES public.discussions(id) ON DELETE CASCADE;


--
-- Name: discussions_category_lnk discussions_category_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discussions_category_lnk
    ADD CONSTRAINT discussions_category_lnk_ifk FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: discussions discussions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discussions
    ADD CONSTRAINT discussions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: discussions discussions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discussions
    ADD CONSTRAINT discussions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files files_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files_folder_lnk files_folder_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files_folder_lnk files_folder_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_ifk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: files_related_mph files_related_mph_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files_related_mph
    ADD CONSTRAINT files_related_mph_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files files_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: replies_author_lnk replies_author_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.replies_author_lnk
    ADD CONSTRAINT replies_author_lnk_fk FOREIGN KEY (reply_id) REFERENCES public.replies(id) ON DELETE CASCADE;


--
-- Name: replies_author_lnk replies_author_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.replies_author_lnk
    ADD CONSTRAINT replies_author_lnk_ifk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: replies replies_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.replies
    ADD CONSTRAINT replies_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: replies_discussion_lnk replies_discussion_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.replies_discussion_lnk
    ADD CONSTRAINT replies_discussion_lnk_fk FOREIGN KEY (reply_id) REFERENCES public.replies(id) ON DELETE CASCADE;


--
-- Name: replies_discussion_lnk replies_discussion_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.replies_discussion_lnk
    ADD CONSTRAINT replies_discussion_lnk_ifk FOREIGN KEY (discussion_id) REFERENCES public.discussions(id) ON DELETE CASCADE;


--
-- Name: replies replies_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.replies
    ADD CONSTRAINT replies_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_fk FOREIGN KEY (api_token_permission_id) REFERENCES public.strapi_api_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_ifk FOREIGN KEY (api_token_id) REFERENCES public.strapi_api_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens_admin_user_owner_lnk strapi_api_tokens_admin_user_owner_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_tokens_admin_user_owner_lnk
    ADD CONSTRAINT strapi_api_tokens_admin_user_owner_lnk_fk FOREIGN KEY (api_token_id) REFERENCES public.strapi_api_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_api_tokens_admin_user_owner_lnk strapi_api_tokens_admin_user_owner_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_tokens_admin_user_owner_lnk
    ADD CONSTRAINT strapi_api_tokens_admin_user_owner_lnk_ifk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;


--
-- Name: strapi_api_tokens strapi_api_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_history_versions strapi_history_versions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_history_versions
    ADD CONSTRAINT strapi_history_versions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_release_actions strapi_release_actions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_fk FOREIGN KEY (release_action_id) REFERENCES public.strapi_release_actions(id) ON DELETE CASCADE;


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_ifk FOREIGN KEY (release_id) REFERENCES public.strapi_releases(id) ON DELETE CASCADE;


--
-- Name: strapi_release_actions strapi_release_actions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_releases strapi_releases_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_releases strapi_releases_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_sessions strapi_sessions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_sessions
    ADD CONSTRAINT strapi_sessions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_sessions strapi_sessions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_sessions
    ADD CONSTRAINT strapi_sessions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_fk FOREIGN KEY (transfer_token_permission_id) REFERENCES public.strapi_transfer_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_ifk FOREIGN KEY (transfer_token_id) REFERENCES public.strapi_transfer_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows strapi_workflows_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_fk FOREIGN KEY (workflow_id) REFERENCES public.strapi_workflows(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_ifk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages strapi_workflows_stages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_fk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_ifk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages strapi_workflows_stages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_fk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_ifk FOREIGN KEY (workflow_id) REFERENCES public.strapi_workflows(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows strapi_workflows_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions up_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_permissions up_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users up_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users_role_lnk up_users_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: up_users_role_lnk up_users_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_users up_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders upload_folders_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_ifk FOREIGN KEY (inv_folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders upload_folders_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict yEw1ACAXbmbqyPuKnDEW7g5ygJtj2kL11IAWaQ20PavVpsRsZeFXgKcLl8LnVR7

