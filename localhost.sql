-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 01 يوليو 2022 الساعة 22:11
-- إصدار الخادم: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `civil`
--

-- --------------------------------------------------------

--
-- بنية الجدول `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `batch_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `event`, `causer_id`, `causer_type`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'default', 'created', 1, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"name\":\"Superadmin\",\"email\":\"admin@example.com\",\"mobile\":null,\"alternate_num\":null,\"home_address\":null,\"current_address\":null,\"address\":null,\"skype\":null,\"linkedin\":null,\"facebook\":null,\"twitter\":null,\"birth_date\":null,\"guardian_name\":null,\"gender\":null,\"account_holder_name\":null,\"account_no\":null,\"bank_name\":null,\"bank_identifier_code\":null,\"branch_location\":null,\"tax_payer_id\":null,\"note\":null,\"password\":\"$2y$10$BHeoMwpJ8DADdfmTvaUjKuS4qFiFffoN3dQAG.Z06kgmSNnVGV4MG\",\"sticky_notes\":null,\"created_by\":null,\"last_login\":\"2022-04-07 19:10:28\",\"active\":\"2022-04-07 19:10:28\",\"activation_key\":\"efb4677a-4b92-4640-8b73-f14cb7da59f6\",\"id_card_number\":null,\"parent_id\":null,\"enginnering_type\":null,\"isActive\":0,\"user_type_log\":\"SITE_MANAGENMENT\",\"remember_token\":\"kXde818eNv\",\"created_at\":\"2022-04-07 19:10:28\",\"updated_at\":\"2022-04-07 19:10:28\"}}', NULL, '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(2, 'default', 'created', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"name\":\"B\",\"email\":\"office@gmail.com\",\"mobile\":null,\"alternate_num\":null,\"home_address\":null,\"current_address\":null,\"address\":null,\"skype\":null,\"linkedin\":null,\"facebook\":null,\"twitter\":null,\"birth_date\":null,\"guardian_name\":null,\"gender\":\"male\",\"account_holder_name\":null,\"account_no\":null,\"bank_name\":null,\"bank_identifier_code\":null,\"branch_location\":null,\"tax_payer_id\":null,\"note\":null,\"password\":\"$2y$10$q\\/rDl787QQJ8B.WylcfTz.LoeamXq8kd1ASmiGCa0RKUtYtA5D5yu\",\"sticky_notes\":null,\"created_by\":null,\"last_login\":null,\"active\":\"0000-00-00 00:00:00\",\"activation_key\":null,\"id_card_number\":123,\"parent_id\":null,\"enginnering_type\":null,\"isActive\":1,\"user_type_log\":\"ESTATE_OWNER\",\"remember_token\":null,\"created_at\":\"2022-04-07 19:19:22\",\"updated_at\":\"2022-04-07 19:19:22\"}}', NULL, '2022-04-08 02:19:22', '2022-04-08 02:19:22'),
(3, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"wwx3HgA3gu70fqdF01kikICzt2Ikck1NtYlGW4bjk8kB6Uk0GMkeukpK6mCy\"},\"old\":{\"remember_token\":null}}', NULL, '2022-04-08 02:19:35', '2022-04-08 02:19:35'),
(4, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-07 19:19:39\",\"updated_at\":\"2022-04-07 19:19:39\"},\"old\":{\"last_login\":null,\"updated_at\":\"2022-04-07 19:19:22\"}}', NULL, '2022-04-08 02:19:39', '2022-04-08 02:19:39'),
(5, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"ycKzFq3OkaoKsmz4vWsbjSULb9h23ZwNtPITnGpu1syAbUTZRZu3IGsXqvq8\"},\"old\":{\"remember_token\":\"wwx3HgA3gu70fqdF01kikICzt2Ikck1NtYlGW4bjk8kB6Uk0GMkeukpK6mCy\"}}', NULL, '2022-04-08 02:20:04', '2022-04-08 02:20:04'),
(6, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-07 19:20:14\",\"updated_at\":\"2022-04-07 19:20:14\"},\"old\":{\"last_login\":\"2022-04-07 19:10:28\",\"updated_at\":\"2022-04-07 19:10:28\"}}', NULL, '2022-04-08 02:20:14', '2022-04-08 02:20:14'),
(7, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', NULL, 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"NH91Sv0kxqnR0nEJklF7OAWxpEliXkaB6Lali0qhwaBdqo5IMOEXAiizzwxW\"},\"old\":{\"remember_token\":\"kXde818eNv\"}}', NULL, '2022-04-08 02:20:39', '2022-04-08 02:20:39'),
(8, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-07 19:20:49\",\"user_type_log\":\"ENGINEERING_OFFICE\",\"updated_at\":\"2022-04-07 19:20:49\"},\"old\":{\"last_login\":\"2022-04-07 19:19:39\",\"user_type_log\":\"ESTATE_OWNER\",\"updated_at\":\"2022-04-07 19:19:39\"}}', NULL, '2022-04-08 02:20:49', '2022-04-08 02:20:49'),
(9, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"YCsIevrMV1xb2osaVIKNj46JoxvchppOcKnI1VcUFVqcHxfMni6j4tsZIqCg\"},\"old\":{\"remember_token\":\"ycKzFq3OkaoKsmz4vWsbjSULb9h23ZwNtPITnGpu1syAbUTZRZu3IGsXqvq8\"}}', NULL, '2022-04-08 02:21:14', '2022-04-08 02:21:14'),
(10, 'default', 'created', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"name\":\"ewr\",\"email\":\"estate@gmail.com\",\"mobile\":null,\"alternate_num\":null,\"home_address\":null,\"current_address\":null,\"address\":null,\"skype\":null,\"linkedin\":null,\"facebook\":null,\"twitter\":null,\"birth_date\":null,\"guardian_name\":null,\"gender\":\"male\",\"account_holder_name\":null,\"account_no\":null,\"bank_name\":null,\"bank_identifier_code\":null,\"branch_location\":null,\"tax_payer_id\":null,\"note\":null,\"password\":\"$2y$10$495d9f8tqlscsB94y41CTuR67dmkf7ZJRI5.HLsvbt3n\\/VdUq2HLG\",\"sticky_notes\":null,\"created_by\":null,\"last_login\":null,\"active\":\"0000-00-00 00:00:00\",\"activation_key\":null,\"id_card_number\":123456,\"parent_id\":null,\"enginnering_type\":null,\"isActive\":1,\"user_type_log\":\"ESTATE_OWNER\",\"remember_token\":null,\"created_at\":\"2022-04-07 19:21:41\",\"updated_at\":\"2022-04-07 19:21:41\"}}', NULL, '2022-04-08 02:21:41', '2022-04-08 02:21:41'),
(11, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-07 19:21:46\",\"updated_at\":\"2022-04-07 19:21:46\"},\"old\":{\"last_login\":null,\"updated_at\":\"2022-04-07 19:21:41\"}}', NULL, '2022-04-08 02:21:46', '2022-04-08 02:21:46'),
(12, 'default', 'created', 1, 'App\\Project', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"name\":\"xxx\",\"customer_id\":3,\"location_id\":1,\"agency_id\":null,\"project_type\":\"normal\",\"total_rate\":null,\"price_per_hours\":null,\"estimated_hours\":null,\"estimated_cost\":null,\"status\":\"not_started\",\"authorization_request_number\":324,\"license_number\":32432,\"plot_number\":32432,\"cadastral_decision_number\":32434,\"lead_id\":null,\"start_date\":\"2022-04-02 00:00:00\",\"end_date\":\"2022-04-27 00:00:00\",\"description\":null,\"created_by\":3,\"favorite\":0,\"buiding_type\":null,\"role_number\":0,\"unit_number\":0,\"using\":null,\"build_rate\":\"34.00\",\"created_at\":\"2022-04-07 19:22:14\",\"updated_at\":\"2022-04-07 19:22:14\"}}', NULL, '2022-04-08 02:22:14', '2022-04-08 02:22:14'),
(13, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"9yq3XuwPfWjpkCjyqPsamkJoid6CTMaxToSXHncP789JXjPRLsCi2izauEvg\"},\"old\":{\"remember_token\":null}}', NULL, '2022-04-08 02:22:43', '2022-04-08 02:22:43'),
(14, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-07 19:22:52\",\"updated_at\":\"2022-04-07 19:22:52\"},\"old\":{\"last_login\":\"2022-04-07 19:20:49\",\"updated_at\":\"2022-04-07 19:20:49\"}}', NULL, '2022-04-08 02:22:52', '2022-04-08 02:22:52'),
(15, 'default', 'created', 4, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"name\":\"em1\",\"email\":\"em1@gmail.com\",\"mobile\":null,\"alternate_num\":null,\"home_address\":null,\"current_address\":null,\"address\":null,\"skype\":null,\"linkedin\":null,\"facebook\":null,\"twitter\":null,\"birth_date\":null,\"guardian_name\":null,\"gender\":null,\"account_holder_name\":null,\"account_no\":null,\"bank_name\":null,\"bank_identifier_code\":null,\"branch_location\":null,\"tax_payer_id\":null,\"note\":null,\"password\":\"$2y$10$5KWGr\\/P7NqFQH.RywcSB7eYze8MoPQzZYtmgctqXF9ifJLc0U5xOK\",\"sticky_notes\":null,\"created_by\":null,\"last_login\":null,\"active\":\"2022-04-07 00:00:00\",\"activation_key\":null,\"id_card_number\":12345678,\"parent_id\":2,\"enginnering_type\":\"\\\"civil_enginnering\\\"\",\"isActive\":1,\"user_type_log\":\"ENGINEERING_OFFICE\",\"remember_token\":null,\"created_at\":\"2022-04-07 19:26:39\",\"updated_at\":\"2022-04-07 19:26:39\",\"is_employee\":true}}', NULL, '2022-04-08 02:26:39', '2022-04-08 02:26:39'),
(16, 'default', 'created', 1, 'App\\ProjectTask', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"project_id\":1,\"task_id\":null,\"category_id\":1,\"subject\":\"ccvc\",\"hourly_rate\":\"0.00\",\"start_date\":\"2022-04-02 12:00:00\",\"due_date\":\"2022-04-25 12:05:00\",\"priority\":\"medium\",\"description\":\"<p>dsfdsfdsfds\\u0628\\u064a\\u062b\\u0635\\u0642\\u062b\\u0635\\u0642\\u062b\\u0635\\u0642\\u062b\\u0635\\u0642<\\/p>\",\"created_by\":2,\"show_to_customer\":1,\"is_completed\":0,\"created_at\":\"2022-04-07 19:27:30\",\"updated_at\":\"2022-04-07 19:27:30\"}}', NULL, '2022-04-08 02:27:30', '2022-04-08 02:27:30'),
(17, 'default', 'created', 5, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"name\":\"emp2\",\"email\":\"emp2@gmail.com\",\"mobile\":null,\"alternate_num\":null,\"home_address\":null,\"current_address\":null,\"address\":null,\"skype\":null,\"linkedin\":null,\"facebook\":null,\"twitter\":null,\"birth_date\":null,\"guardian_name\":null,\"gender\":null,\"account_holder_name\":null,\"account_no\":null,\"bank_name\":null,\"bank_identifier_code\":null,\"branch_location\":null,\"tax_payer_id\":null,\"note\":null,\"password\":\"$2y$10$Jd1KkYhykqlLOk.I5y7nKeEI89TKeFMoLEHX5AJcIPido0dwalQmG\",\"sticky_notes\":null,\"created_by\":null,\"last_login\":null,\"active\":\"2022-04-07 00:00:00\",\"activation_key\":null,\"id_card_number\":43543543,\"parent_id\":2,\"enginnering_type\":\"\\\"civil_enginnering\\\"\",\"isActive\":1,\"user_type_log\":\"ENGINEERING_OFFICE\",\"remember_token\":null,\"created_at\":\"2022-04-07 19:28:36\",\"updated_at\":\"2022-04-07 19:28:36\",\"is_employee\":true}}', NULL, '2022-04-08 02:28:36', '2022-04-08 02:28:36'),
(18, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"dSxJhwX4vwF5ab1B76t5uaLHH6hxNtdRYw5mKYqijaF4EntjCj5bj95hqoFv\"},\"old\":{\"remember_token\":\"YCsIevrMV1xb2osaVIKNj46JoxvchppOcKnI1VcUFVqcHxfMni6j4tsZIqCg\"}}', NULL, '2022-04-08 02:29:33', '2022-04-08 02:29:33'),
(19, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-07 19:29:41\",\"updated_at\":\"2022-04-07 19:29:41\"},\"old\":{\"last_login\":\"2022-04-07 19:21:46\",\"updated_at\":\"2022-04-07 19:21:46\"}}', NULL, '2022-04-08 02:29:41', '2022-04-08 02:29:41'),
(20, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"Nylhzqioz19z72t0VLTYgBgClI404YytThCBPyBr5RuOy0K5Ww6WRWMcUDCJ\"},\"old\":{\"remember_token\":\"9yq3XuwPfWjpkCjyqPsamkJoid6CTMaxToSXHncP789JXjPRLsCi2izauEvg\"}}', NULL, '2022-04-08 02:30:08', '2022-04-08 02:30:08'),
(21, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-07 19:30:18\",\"updated_at\":\"2022-04-07 19:30:18\"},\"old\":{\"last_login\":\"2022-04-07 19:22:52\",\"updated_at\":\"2022-04-07 19:22:52\"}}', NULL, '2022-04-08 02:30:18', '2022-04-08 02:30:18'),
(22, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"1KHOc5lu7eOD6V9IkHMmtcchkgZx4qiDkzxryLKBdfFtXNUaTgVZfYe5NYYW\"},\"old\":{\"remember_token\":\"dSxJhwX4vwF5ab1B76t5uaLHH6hxNtdRYw5mKYqijaF4EntjCj5bj95hqoFv\"}}', NULL, '2022-04-08 02:30:52', '2022-04-08 02:30:52'),
(23, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-07 19:30:58\",\"updated_at\":\"2022-04-07 19:30:58\"},\"old\":{\"last_login\":\"2022-04-07 19:30:18\",\"updated_at\":\"2022-04-07 19:30:18\"}}', NULL, '2022-04-08 02:30:58', '2022-04-08 02:30:58'),
(24, 'default', 'created', 2, 'App\\ProjectTask', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"project_id\":1,\"task_id\":null,\"category_id\":1,\"subject\":\"566\",\"hourly_rate\":\"0.00\",\"start_date\":null,\"due_date\":null,\"priority\":\"low\",\"description\":null,\"created_by\":2,\"show_to_customer\":0,\"is_completed\":0,\"created_at\":\"2022-04-07 19:31:18\",\"updated_at\":\"2022-04-07 19:31:18\"}}', NULL, '2022-04-08 02:31:18', '2022-04-08 02:31:18'),
(25, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"ScfvClnbA1UUxwrCgPmfFHHWQ4igaU2XGjO3A5N4ejI8DlPN1oCBIAppTJav\"},\"old\":{\"remember_token\":\"1KHOc5lu7eOD6V9IkHMmtcchkgZx4qiDkzxryLKBdfFtXNUaTgVZfYe5NYYW\"}}', NULL, '2022-04-08 02:31:21', '2022-04-08 02:31:21'),
(26, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-07 19:31:42\",\"updated_at\":\"2022-04-07 19:31:42\"},\"old\":{\"last_login\":null,\"updated_at\":\"2022-04-07 19:28:36\"}}', NULL, '2022-04-08 02:31:42', '2022-04-08 02:31:42'),
(27, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"4Ynoe89nq5JV5VIoipqhbauEa9wMo0Za04fb1C9TxvghCnABGq1sbsm4RCDs\"},\"old\":{\"remember_token\":null}}', NULL, '2022-04-08 02:31:54', '2022-04-08 02:31:54'),
(28, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-07 19:32:02\",\"updated_at\":\"2022-04-07 19:32:02\"},\"old\":{\"last_login\":\"2022-04-07 19:30:58\",\"updated_at\":\"2022-04-07 19:30:58\"}}', NULL, '2022-04-08 02:32:02', '2022-04-08 02:32:02'),
(29, 'default', 'created', 3, 'App\\ProjectTask', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"project_id\":1,\"task_id\":null,\"category_id\":1,\"subject\":\"rr\",\"hourly_rate\":\"0.00\",\"start_date\":null,\"due_date\":null,\"priority\":\"low\",\"description\":null,\"created_by\":2,\"show_to_customer\":0,\"is_completed\":0,\"created_at\":\"2022-04-07 20:10:14\",\"updated_at\":\"2022-04-07 20:10:14\"}}', NULL, '2022-04-08 03:10:14', '2022-04-08 03:10:14'),
(30, 'default', 'created', 4, 'App\\ProjectTask', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"project_id\":1,\"task_id\":null,\"category_id\":1,\"subject\":\"ewrew\",\"hourly_rate\":\"0.00\",\"start_date\":\"2022-04-02 12:00:00\",\"due_date\":\"2022-04-17 12:00:00\",\"priority\":\"medium\",\"description\":null,\"created_by\":2,\"show_to_customer\":0,\"is_completed\":0,\"created_at\":\"2022-04-07 20:15:09\",\"updated_at\":\"2022-04-07 20:15:09\"}}', NULL, '2022-04-08 03:15:09', '2022-04-08 03:15:09'),
(31, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"hOQ0U94e4CiLs10Ugl4TohXLvsc1FOA3SKGb8WLcjQYjq3dTUjFWgEutzchA\"},\"old\":{\"remember_token\":\"ScfvClnbA1UUxwrCgPmfFHHWQ4igaU2XGjO3A5N4ejI8DlPN1oCBIAppTJav\"}}', NULL, '2022-04-08 03:27:40', '2022-04-08 03:27:40'),
(32, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-07 20:30:46\",\"updated_at\":\"2022-04-07 20:30:46\"},\"old\":{\"last_login\":null,\"updated_at\":\"2022-04-07 19:26:39\"}}', NULL, '2022-04-08 03:30:46', '2022-04-08 03:30:46'),
(33, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"aB5teVjyxzkbYrFFnoXbr9EfhbXGKgBJh7h6jbqQAS8MjsM99j5qZGzqe6SD\"},\"old\":{\"remember_token\":null}}', NULL, '2022-04-08 03:35:51', '2022-04-08 03:35:51'),
(34, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-07 20:35:58\",\"updated_at\":\"2022-04-07 20:35:58\"},\"old\":{\"last_login\":\"2022-04-07 19:32:02\",\"updated_at\":\"2022-04-07 19:32:02\"}}', NULL, '2022-04-08 03:35:58', '2022-04-08 03:35:58'),
(35, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"JIG7eLmYYhOQzcUgb16Sa6EA9F8zvDdo6M0llbkn15X50jFrQqwHrJrcD5Ql\"},\"old\":{\"remember_token\":\"hOQ0U94e4CiLs10Ugl4TohXLvsc1FOA3SKGb8WLcjQYjq3dTUjFWgEutzchA\"}}', NULL, '2022-04-08 03:38:35', '2022-04-08 03:38:35'),
(36, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-14 14:24:02\",\"updated_at\":\"2022-04-14 14:24:02\"},\"old\":{\"last_login\":\"2022-04-07 20:35:58\",\"updated_at\":\"2022-04-07 20:35:58\"}}', NULL, '2022-04-14 21:24:02', '2022-04-14 21:24:02'),
(37, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-14 14:37:44\",\"updated_at\":\"2022-04-14 14:37:44\"},\"old\":{\"last_login\":\"2022-04-14 14:24:02\",\"updated_at\":\"2022-04-14 14:24:02\"}}', NULL, '2022-04-14 21:37:44', '2022-04-14 21:37:44'),
(38, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-14 14:44:12\",\"updated_at\":\"2022-04-14 14:44:12\"},\"old\":{\"last_login\":\"2022-04-07 19:20:14\",\"updated_at\":\"2022-04-07 19:20:14\"}}', NULL, '2022-04-14 21:44:12', '2022-04-14 21:44:12'),
(39, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', NULL, 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"gp4duc3mndIVnLurQhUbGyFtGKq9fIcLFS0PbWEyXhjYo4qyLZCtUOnoHkP2\"},\"old\":{\"remember_token\":\"NH91Sv0kxqnR0nEJklF7OAWxpEliXkaB6Lali0qhwaBdqo5IMOEXAiizzwxW\"}}', NULL, '2022-04-14 21:47:25', '2022-04-14 21:47:25'),
(40, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-14 14:47:33\",\"updated_at\":\"2022-04-14 14:47:33\"},\"old\":{\"last_login\":\"2022-04-14 14:37:44\",\"updated_at\":\"2022-04-14 14:37:44\"}}', NULL, '2022-04-14 21:47:33', '2022-04-14 21:47:33'),
(41, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"XLEoqY3AJ7LiPMBRQV5KPbOkl8OIsiMO16xDgTS6mPcXt5rGHBgvwHJiwYDx\"},\"old\":{\"remember_token\":\"JIG7eLmYYhOQzcUgb16Sa6EA9F8zvDdo6M0llbkn15X50jFrQqwHrJrcD5Ql\"}}', NULL, '2022-04-14 22:23:30', '2022-04-14 22:23:30'),
(42, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-14 15:23:36\",\"updated_at\":\"2022-04-14 15:23:36\"},\"old\":{\"last_login\":\"2022-04-14 14:47:33\",\"updated_at\":\"2022-04-14 14:47:33\"}}', NULL, '2022-04-14 22:23:36', '2022-04-14 22:23:36'),
(43, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"hGGsiitWKSylhBkjstAXy2f2Q96maBvBuoBuVFwOtMooth1EDtibtXKxxb2N\"},\"old\":{\"remember_token\":\"XLEoqY3AJ7LiPMBRQV5KPbOkl8OIsiMO16xDgTS6mPcXt5rGHBgvwHJiwYDx\"}}', NULL, '2022-04-14 22:23:56', '2022-04-14 22:23:56'),
(44, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-14 15:24:01\",\"updated_at\":\"2022-04-14 15:24:01\"},\"old\":{\"last_login\":\"2022-04-14 15:23:36\",\"updated_at\":\"2022-04-14 15:23:36\"}}', NULL, '2022-04-14 22:24:01', '2022-04-14 22:24:01'),
(45, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"JK3srfUa6Gj43CuekTHLS7pPW2l10my1D6zDdmaizirkEjsZVZTPCGNHOHyc\"},\"old\":{\"remember_token\":\"hGGsiitWKSylhBkjstAXy2f2Q96maBvBuoBuVFwOtMooth1EDtibtXKxxb2N\"}}', NULL, '2022-04-14 22:33:43', '2022-04-14 22:33:43'),
(46, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-14 15:33:49\",\"updated_at\":\"2022-04-14 15:33:49\"},\"old\":{\"last_login\":\"2022-04-07 19:29:41\",\"updated_at\":\"2022-04-07 19:29:41\"}}', NULL, '2022-04-14 22:33:49', '2022-04-14 22:33:49'),
(47, 'default', 'created', 2, 'App\\Project', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"name\":\"uu\",\"customer_id\":3,\"location_id\":2,\"agency_id\":null,\"project_type\":\"normal\",\"total_rate\":null,\"price_per_hours\":null,\"estimated_hours\":null,\"estimated_cost\":null,\"status\":\"not_started\",\"authorization_request_number\":null,\"license_number\":null,\"plot_number\":12,\"cadastral_decision_number\":null,\"lead_id\":null,\"start_date\":null,\"end_date\":null,\"description\":null,\"created_by\":3,\"favorite\":0,\"buiding_type\":null,\"role_number\":0,\"unit_number\":0,\"using\":null,\"build_rate\":\"12.00\",\"created_at\":\"2022-04-14 15:34:25\",\"updated_at\":\"2022-04-14 15:34:25\"}}', NULL, '2022-04-14 22:34:25', '2022-04-14 22:34:25'),
(48, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"BwHvJsD9QxWxt5tF4dSNvFI2JqQjXEmimC5uTZ5bbGKkdoFjQDLRlZ1XypUu\"},\"old\":{\"remember_token\":\"Nylhzqioz19z72t0VLTYgBgClI404YytThCBPyBr5RuOy0K5Ww6WRWMcUDCJ\"}}', NULL, '2022-04-14 22:34:52', '2022-04-14 22:34:52'),
(49, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-14 15:35:00\",\"updated_at\":\"2022-04-14 15:35:00\"},\"old\":{\"last_login\":\"2022-04-14 15:24:01\",\"updated_at\":\"2022-04-14 15:24:01\"}}', NULL, '2022-04-14 22:35:00', '2022-04-14 22:35:00'),
(50, 'default', 'created', 5, 'App\\ProjectTask', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"project_id\":2,\"task_id\":null,\"category_id\":2,\"subject\":\"cc\",\"hourly_rate\":\"0.00\",\"start_date\":\"2022-04-19 00:00:00\",\"due_date\":\"2022-04-26 18:34:00\",\"priority\":\"low\",\"description\":null,\"created_by\":2,\"show_to_customer\":1,\"is_completed\":0,\"created_at\":\"2022-04-14 15:37:19\",\"updated_at\":\"2022-04-14 15:37:19\"}}', NULL, '2022-04-14 22:37:19', '2022-04-14 22:37:19'),
(51, 'default', 'created', 6, 'App\\ProjectTask', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"project_id\":2,\"task_id\":null,\"category_id\":2,\"subject\":\"et\",\"hourly_rate\":\"0.00\",\"start_date\":\"2022-04-21 00:00:00\",\"due_date\":\"2022-04-26 00:00:00\",\"priority\":\"low\",\"description\":null,\"created_by\":2,\"show_to_customer\":0,\"is_completed\":0,\"created_at\":\"2022-04-14 15:43:44\",\"updated_at\":\"2022-04-14 15:43:44\"}}', NULL, '2022-04-14 22:43:44', '2022-04-14 22:43:44'),
(52, 'default', 'created', 7, 'App\\ProjectTask', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"project_id\":1,\"task_id\":null,\"category_id\":1,\"subject\":\"434\",\"hourly_rate\":\"0.00\",\"start_date\":\"2022-04-19 00:00:00\",\"due_date\":\"2022-04-26 18:34:00\",\"priority\":\"urgent\",\"description\":null,\"created_by\":2,\"show_to_customer\":0,\"is_completed\":0,\"created_at\":\"2022-04-14 15:44:34\",\"updated_at\":\"2022-04-14 15:44:34\"}}', NULL, '2022-04-14 22:44:34', '2022-04-14 22:44:34'),
(53, 'default', 'created', 8, 'App\\ProjectTask', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"project_id\":2,\"task_id\":null,\"category_id\":2,\"subject\":\"we\",\"hourly_rate\":\"0.00\",\"start_date\":\"2022-04-29 00:00:00\",\"due_date\":null,\"priority\":\"medium\",\"description\":null,\"created_by\":2,\"show_to_customer\":0,\"is_completed\":0,\"created_at\":\"2022-04-14 15:48:13\",\"updated_at\":\"2022-04-14 15:48:13\"}}', NULL, '2022-04-14 22:48:13', '2022-04-14 22:48:13'),
(54, 'default', 'created', 9, 'App\\ProjectTask', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"project_id\":1,\"task_id\":null,\"category_id\":1,\"subject\":\"wqe\",\"hourly_rate\":\"0.00\",\"start_date\":\"2022-04-13 00:00:00\",\"due_date\":\"2022-04-11 00:00:00\",\"priority\":\"medium\",\"description\":null,\"created_by\":2,\"show_to_customer\":0,\"is_completed\":0,\"created_at\":\"2022-04-14 15:48:46\",\"updated_at\":\"2022-04-14 15:48:46\"}}', NULL, '2022-04-14 22:48:46', '2022-04-14 22:48:46'),
(55, 'default', 'created', 10, 'App\\ProjectTask', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"project_id\":1,\"task_id\":null,\"category_id\":1,\"subject\":\"435\",\"hourly_rate\":\"0.00\",\"start_date\":\"2022-04-11 04:56:00\",\"due_date\":\"2022-04-17 00:00:00\",\"priority\":\"high\",\"description\":null,\"created_by\":2,\"show_to_customer\":0,\"is_completed\":0,\"created_at\":\"2022-04-14 15:49:42\",\"updated_at\":\"2022-04-14 15:49:42\"}}', NULL, '2022-04-14 22:49:42', '2022-04-14 22:49:42'),
(56, 'default', 'created', 11, 'App\\ProjectTask', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"project_id\":1,\"task_id\":null,\"category_id\":1,\"subject\":\"ete\",\"hourly_rate\":\"0.00\",\"start_date\":\"2022-04-18 19:55:00\",\"due_date\":\"2022-04-03 16:55:00\",\"priority\":\"medium\",\"description\":null,\"created_by\":2,\"show_to_customer\":0,\"is_completed\":0,\"created_at\":\"2022-04-14 15:51:18\",\"updated_at\":\"2022-04-14 15:51:18\"}}', NULL, '2022-04-14 22:51:18', '2022-04-14 22:51:18'),
(57, 'default', 'created', 12, 'App\\ProjectTask', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"project_id\":2,\"task_id\":null,\"category_id\":3,\"subject\":\"wewe\",\"hourly_rate\":\"0.00\",\"start_date\":\"2022-04-22 00:00:00\",\"due_date\":\"2022-04-26 00:00:00\",\"priority\":\"low\",\"description\":null,\"created_by\":2,\"show_to_customer\":1,\"is_completed\":0,\"created_at\":\"2022-04-14 15:52:03\",\"updated_at\":\"2022-04-14 15:52:03\"}}', NULL, '2022-04-14 22:52:03', '2022-04-14 22:52:03'),
(58, 'default', 'created', 13, 'App\\ProjectTask', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"project_id\":2,\"task_id\":null,\"category_id\":3,\"subject\":\"gret\",\"hourly_rate\":\"0.00\",\"start_date\":\"2022-04-18 00:00:00\",\"due_date\":\"2022-04-26 00:00:00\",\"priority\":\"medium\",\"description\":null,\"created_by\":2,\"show_to_customer\":0,\"is_completed\":0,\"created_at\":\"2022-04-14 15:53:05\",\"updated_at\":\"2022-04-14 15:53:05\"}}', NULL, '2022-04-14 22:53:05', '2022-04-14 22:53:05'),
(59, 'default', 'created', 6, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"name\":\"rrr\",\"email\":\"rr@gmail.com\",\"mobile\":null,\"alternate_num\":null,\"home_address\":null,\"current_address\":null,\"address\":null,\"skype\":null,\"linkedin\":null,\"facebook\":null,\"twitter\":null,\"birth_date\":null,\"guardian_name\":null,\"gender\":null,\"account_holder_name\":null,\"account_no\":null,\"bank_name\":null,\"bank_identifier_code\":null,\"branch_location\":null,\"tax_payer_id\":null,\"note\":null,\"password\":\"$2y$10$CYRx7qDQmsJT7BhwVra7G.82pHwNgx13CscK.UPKyCOd1hJX..xF6\",\"sticky_notes\":null,\"created_by\":null,\"last_login\":null,\"active\":\"2022-04-14 00:00:00\",\"activation_key\":null,\"id_card_number\":34234,\"parent_id\":2,\"enginnering_type\":\"\\\"civil_enginnering\\\"\",\"isActive\":1,\"user_type_log\":\"ENGINEERING_OFFICE\",\"remember_token\":null,\"created_at\":\"2022-04-14 16:11:01\",\"updated_at\":\"2022-04-14 16:11:01\",\"is_employee\":true}}', NULL, '2022-04-14 23:11:01', '2022-04-14 23:11:01'),
(60, 'default', 'created', 14, 'App\\ProjectTask', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"project_id\":2,\"task_id\":null,\"category_id\":3,\"subject\":\"2343\",\"hourly_rate\":\"0.00\",\"start_date\":\"2022-04-25 00:00:00\",\"due_date\":\"2022-04-26 00:00:00\",\"priority\":\"low\",\"description\":null,\"created_by\":2,\"show_to_customer\":0,\"is_completed\":0,\"created_at\":\"2022-04-14 16:11:29\",\"updated_at\":\"2022-04-14 16:11:29\"}}', NULL, '2022-04-14 23:11:29', '2022-04-14 23:11:29'),
(61, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"2sP1iozrGq6XeCMpJs7ejx7ocuKSqaIPg8OBScMf1V4IwDuNn23KkIr56780\"},\"old\":{\"remember_token\":\"JK3srfUa6Gj43CuekTHLS7pPW2l10my1D6zDdmaizirkEjsZVZTPCGNHOHyc\"}}', NULL, '2022-04-14 23:15:24', '2022-04-14 23:15:24'),
(62, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-14 16:15:31\",\"updated_at\":\"2022-04-14 16:15:31\"},\"old\":{\"last_login\":\"2022-04-14 15:33:49\",\"updated_at\":\"2022-04-14 15:33:49\"}}', NULL, '2022-04-14 23:15:31', '2022-04-14 23:15:31'),
(63, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"S916vf14InzGelBQyNwXueS9VUvnoNBPX3YGlrV2w0eTF6DHnK0mvmuR7m7m\"},\"old\":{\"remember_token\":\"BwHvJsD9QxWxt5tF4dSNvFI2JqQjXEmimC5uTZ5bbGKkdoFjQDLRlZ1XypUu\"}}', NULL, '2022-04-14 23:20:10', '2022-04-14 23:20:10'),
(64, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-14 16:20:18\",\"updated_at\":\"2022-04-14 16:20:18\"},\"old\":{\"last_login\":\"2022-04-14 15:35:00\",\"updated_at\":\"2022-04-14 15:35:00\"}}', NULL, '2022-04-14 23:20:18', '2022-04-14 23:20:18'),
(65, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-18 14:35:05\",\"updated_at\":\"2022-04-18 14:35:05\"},\"old\":{\"last_login\":\"2022-04-14 16:20:18\",\"updated_at\":\"2022-04-14 16:20:18\"}}', NULL, '2022-04-18 21:35:05', '2022-04-18 21:35:05'),
(66, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"RIoIc6klz4n6LV84Q5UaRtSJaHzFA2zwVVpL1SL3iTeLvsz78g9S5A9x6aqM\"},\"old\":{\"remember_token\":\"2sP1iozrGq6XeCMpJs7ejx7ocuKSqaIPg8OBScMf1V4IwDuNn23KkIr56780\"}}', NULL, '2022-04-18 21:56:18', '2022-04-18 21:56:18'),
(67, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-18 14:56:23\",\"updated_at\":\"2022-04-18 14:56:23\"},\"old\":{\"last_login\":\"2022-04-14 16:15:31\",\"updated_at\":\"2022-04-14 16:15:31\"}}', NULL, '2022-04-18 21:56:23', '2022-04-18 21:56:23'),
(68, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"y0R4rlH5imT8OyGUg4bQUaMA5JwyeuNkxYSHPZ0e2m34hFyBWlLSEI2mh4Ic\"},\"old\":{\"remember_token\":\"S916vf14InzGelBQyNwXueS9VUvnoNBPX3YGlrV2w0eTF6DHnK0mvmuR7m7m\"}}', NULL, '2022-04-18 21:57:00', '2022-04-18 21:57:00'),
(69, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-18 14:57:09\",\"updated_at\":\"2022-04-18 14:57:09\"},\"old\":{\"last_login\":\"2022-04-18 14:35:05\",\"updated_at\":\"2022-04-18 14:35:05\"}}', NULL, '2022-04-18 21:57:09', '2022-04-18 21:57:09'),
(70, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"KJF1CjzxATCBHXWI1gFnZLwOdxGeWFbWvbU4QMnCwC1vpaGo14nRoCyz4P7C\"},\"old\":{\"remember_token\":\"RIoIc6klz4n6LV84Q5UaRtSJaHzFA2zwVVpL1SL3iTeLvsz78g9S5A9x6aqM\"}}', NULL, '2022-04-18 22:30:00', '2022-04-18 22:30:00'),
(71, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-18 15:30:08\",\"updated_at\":\"2022-04-18 15:30:08\"},\"old\":{\"last_login\":\"2022-04-18 14:56:23\",\"updated_at\":\"2022-04-18 14:56:23\"}}', NULL, '2022-04-18 22:30:08', '2022-04-18 22:30:08'),
(72, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"s7k1tom9fzk75q0bzncn8u1vCH8rjnLbfJe2Mqy72QxavSAKMBHx9CvTlN2i\"},\"old\":{\"remember_token\":\"y0R4rlH5imT8OyGUg4bQUaMA5JwyeuNkxYSHPZ0e2m34hFyBWlLSEI2mh4Ic\"}}', NULL, '2022-04-18 22:30:30', '2022-04-18 22:30:30'),
(73, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-18 15:30:38\",\"updated_at\":\"2022-04-18 15:30:38\"},\"old\":{\"last_login\":\"2022-04-07 20:30:46\",\"updated_at\":\"2022-04-07 20:30:46\"}}', NULL, '2022-04-18 22:30:38', '2022-04-18 22:30:38'),
(74, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"1fZtN94V8iIcMkXHiN2QM3nWzNsyGxvvBn10bkysvn9rgSmsNROYFNFiFeQM\"},\"old\":{\"remember_token\":\"aB5teVjyxzkbYrFFnoXbr9EfhbXGKgBJh7h6jbqQAS8MjsM99j5qZGzqe6SD\"}}', NULL, '2022-04-18 23:17:47', '2022-04-18 23:17:47'),
(75, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-18 16:17:59\",\"updated_at\":\"2022-04-18 16:17:59\"},\"old\":{\"last_login\":\"2022-04-18 14:57:09\",\"updated_at\":\"2022-04-18 14:57:09\"}}', NULL, '2022-04-18 23:17:59', '2022-04-18 23:17:59'),
(76, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"BTWmwodtIzXouHZV2DurV9bwsHXC1FzvVHSpI1Bd3SN0EjQaubllkkp76Jl2\"},\"old\":{\"remember_token\":\"KJF1CjzxATCBHXWI1gFnZLwOdxGeWFbWvbU4QMnCwC1vpaGo14nRoCyz4P7C\"}}', NULL, '2022-04-18 23:18:30', '2022-04-18 23:18:30'),
(77, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-18 16:18:38\",\"updated_at\":\"2022-04-18 16:18:38\"},\"old\":{\"last_login\":\"2022-04-18 15:30:38\",\"updated_at\":\"2022-04-18 15:30:38\"}}', NULL, '2022-04-18 23:18:38', '2022-04-18 23:18:38'),
(78, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-19 14:41:07\",\"updated_at\":\"2022-04-19 14:41:07\"},\"old\":{\"last_login\":\"2022-04-19 01:30:08\",\"updated_at\":\"2022-04-19 01:30:08\"}}', NULL, '2022-04-19 11:41:07', '2022-04-19 11:41:07'),
(79, 'default', 'created', 3, 'App\\Project', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"name\":\"test\",\"customer_id\":3,\"location_id\":3,\"agency_id\":null,\"project_type\":\"normal\",\"total_rate\":null,\"price_per_hours\":null,\"estimated_hours\":null,\"estimated_cost\":null,\"status\":\"not_started\",\"authorization_request_number\":3,\"license_number\":3,\"plot_number\":5,\"cadastral_decision_number\":4,\"lead_id\":null,\"start_date\":\"2022-04-29 00:00:00\",\"end_date\":\"2022-04-20 00:00:00\",\"description\":null,\"created_by\":3,\"favorite\":0,\"buiding_type\":\"assembly\",\"role_number\":4,\"unit_number\":0,\"using\":\"support\",\"build_rate\":\"4.00\",\"created_at\":\"2022-04-19 14:42:13\",\"updated_at\":\"2022-04-19 14:42:13\"}}', NULL, '2022-04-19 11:42:13', '2022-04-19 11:42:13'),
(80, 'default', 'created', 1, 'App\\Note', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"notable_id\":3,\"notable_type\":\"App\\\\Project\",\"heading\":\"test\",\"description\":\"<p>fdsfsd<\\/p>\",\"created_by\":3,\"created_at\":\"2022-04-19 14:42:37\",\"updated_at\":\"2022-04-19 14:42:37\"}}', NULL, '2022-04-19 11:42:37', '2022-04-19 11:42:37'),
(81, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"EF4vmcmRq5vwZQKkgtvDXhKHil8s5YMqB1yyvSTEp0E5RFpvHU97aSeVlFK4\"},\"old\":{\"remember_token\":\"s7k1tom9fzk75q0bzncn8u1vCH8rjnLbfJe2Mqy72QxavSAKMBHx9CvTlN2i\"}}', NULL, '2022-04-19 11:53:12', '2022-04-19 11:53:12'),
(82, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-19 14:53:27\",\"updated_at\":\"2022-04-19 14:53:27\"},\"old\":{\"last_login\":\"2022-04-19 02:17:59\",\"updated_at\":\"2022-04-19 02:17:59\"}}', NULL, '2022-04-19 11:53:27', '2022-04-19 11:53:27'),
(83, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"kvXm6TZwcZrWslJOYhGpkACo9Qzyu4nBlD9QNY5wixP51wLN1vpYMF1Jq2V5\"},\"old\":{\"remember_token\":\"BTWmwodtIzXouHZV2DurV9bwsHXC1FzvVHSpI1Bd3SN0EjQaubllkkp76Jl2\"}}', NULL, '2022-04-19 12:00:21', '2022-04-19 12:00:21'),
(84, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-19 15:00:28\",\"updated_at\":\"2022-04-19 15:00:28\"},\"old\":{\"last_login\":\"2022-04-19 02:18:38\",\"updated_at\":\"2022-04-19 02:18:38\"}}', NULL, '2022-04-19 12:00:28', '2022-04-19 12:00:28'),
(85, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"aXXkbjtUywpXfWkVFazf3n4P5SEkPJGYsFTMFmia9agJVQ19IMPcq09AmJYC\"},\"old\":{\"remember_token\":\"1fZtN94V8iIcMkXHiN2QM3nWzNsyGxvvBn10bkysvn9rgSmsNROYFNFiFeQM\"}}', NULL, '2022-04-19 12:01:02', '2022-04-19 12:01:02'),
(86, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-19 15:01:14\",\"updated_at\":\"2022-04-19 15:01:14\"},\"old\":{\"last_login\":\"2022-04-19 14:53:27\",\"updated_at\":\"2022-04-19 14:53:27\"}}', NULL, '2022-04-19 12:01:14', '2022-04-19 12:01:14'),
(87, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"W02hU9yQyDZZIjoYKUsBQEu6TIPVPvKvE5Cxaq6gmwpKb0vlhrCkUiIwsTeU\"},\"old\":{\"remember_token\":\"kvXm6TZwcZrWslJOYhGpkACo9Qzyu4nBlD9QNY5wixP51wLN1vpYMF1Jq2V5\"}}', NULL, '2022-04-19 12:01:53', '2022-04-19 12:01:53'),
(88, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-19 15:02:00\",\"updated_at\":\"2022-04-19 15:02:00\"},\"old\":{\"last_login\":\"2022-04-19 15:00:28\",\"updated_at\":\"2022-04-19 15:00:28\"}}', NULL, '2022-04-19 12:02:00', '2022-04-19 12:02:00'),
(89, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"IwgGpzis62fczllCZGdHqtkaOCqgxlLpMr2sUmIGlci3sV8SYsOqTqBYqT7S\"},\"old\":{\"remember_token\":\"aXXkbjtUywpXfWkVFazf3n4P5SEkPJGYsFTMFmia9agJVQ19IMPcq09AmJYC\"}}', NULL, '2022-04-19 12:03:36', '2022-04-19 12:03:36'),
(90, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-19 15:03:49\",\"updated_at\":\"2022-04-19 15:03:49\"},\"old\":{\"last_login\":\"2022-04-19 15:01:14\",\"updated_at\":\"2022-04-19 15:01:14\"}}', NULL, '2022-04-19 12:03:49', '2022-04-19 12:03:49'),
(91, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"QaDSHk7MylXx3lqxG0bYgTp2TU6y6NjE12pC9mFEtVeoZU0NpkeD4ChVfNL2\"},\"old\":{\"remember_token\":\"W02hU9yQyDZZIjoYKUsBQEu6TIPVPvKvE5Cxaq6gmwpKb0vlhrCkUiIwsTeU\"}}', NULL, '2022-04-19 12:21:09', '2022-04-19 12:21:09'),
(92, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-19 15:21:17\",\"updated_at\":\"2022-04-19 15:21:17\"},\"old\":{\"last_login\":\"2022-04-19 15:02:00\",\"updated_at\":\"2022-04-19 15:02:00\"}}', NULL, '2022-04-19 12:21:17', '2022-04-19 12:21:17'),
(93, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"OukxMzCSpipuQ8ywTVVbHqsWzXXGtOi8YFLPc422szeEtWfXk4eNQbTmjYOK\"},\"old\":{\"remember_token\":\"IwgGpzis62fczllCZGdHqtkaOCqgxlLpMr2sUmIGlci3sV8SYsOqTqBYqT7S\"}}', NULL, '2022-04-19 12:23:21', '2022-04-19 12:23:21'),
(94, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-19 15:23:28\",\"updated_at\":\"2022-04-19 15:23:28\"},\"old\":{\"last_login\":\"2022-04-08 05:31:42\",\"updated_at\":\"2022-04-08 05:31:42\"}}', NULL, '2022-04-19 12:23:28', '2022-04-19 12:23:28'),
(95, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"smTUpQV1DQtWyl6wlfjLCzsGVaIiGDctYafnOBxeoEwOSNrRuxLR1r45kW09\"},\"old\":{\"remember_token\":\"4Ynoe89nq5JV5VIoipqhbauEa9wMo0Za04fb1C9TxvghCnABGq1sbsm4RCDs\"}}', NULL, '2022-04-19 12:33:32', '2022-04-19 12:33:32'),
(96, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-19 15:33:38\",\"updated_at\":\"2022-04-19 15:33:38\"},\"old\":{\"last_login\":\"2022-04-19 14:41:07\",\"updated_at\":\"2022-04-19 14:41:07\"}}', NULL, '2022-04-19 12:33:38', '2022-04-19 12:33:38'),
(97, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"A8WrSLnveRUUw9rskABkckcWh0AKTp2CxFE3mItzQsK8VWzswEEusHeXLgMb\"},\"old\":{\"remember_token\":\"EF4vmcmRq5vwZQKkgtvDXhKHil8s5YMqB1yyvSTEp0E5RFpvHU97aSeVlFK4\"}}', NULL, '2022-04-19 12:34:00', '2022-04-19 12:34:00'),
(98, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-19 15:34:09\",\"updated_at\":\"2022-04-19 15:34:09\"},\"old\":{\"last_login\":\"2022-04-19 15:03:49\",\"updated_at\":\"2022-04-19 15:03:49\"}}', NULL, '2022-04-19 12:34:09', '2022-04-19 12:34:09'),
(99, 'default', 'created', 2, 'App\\Note', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"notable_id\":3,\"notable_type\":\"App\\\\Project\",\"heading\":\"trt\",\"description\":\"<p>ret<\\/p>\",\"created_by\":2,\"created_at\":\"2022-04-19 15:35:37\",\"updated_at\":\"2022-04-19 15:35:37\"}}', NULL, '2022-04-19 12:35:37', '2022-04-19 12:35:37'),
(100, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"6DwfZIxMTP08dzDUqcrLL8LW4J7ssnZRS7YSz8YcD8rGmtbyQQZ5qyuH3tk8\"},\"old\":{\"remember_token\":\"QaDSHk7MylXx3lqxG0bYgTp2TU6y6NjE12pC9mFEtVeoZU0NpkeD4ChVfNL2\"}}', NULL, '2022-04-19 12:36:06', '2022-04-19 12:36:06'),
(101, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-19 15:36:12\",\"updated_at\":\"2022-04-19 15:36:12\"},\"old\":{\"last_login\":\"2022-04-19 15:33:38\",\"updated_at\":\"2022-04-19 15:33:38\"}}', NULL, '2022-04-19 12:36:12', '2022-04-19 12:36:12'),
(102, 'default', 'created', 4, 'App\\Project', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"name\":\"test\",\"customer_id\":3,\"location_id\":4,\"agency_id\":null,\"project_type\":\"normal\",\"total_rate\":null,\"price_per_hours\":null,\"estimated_hours\":null,\"estimated_cost\":null,\"status\":\"not_started\",\"authorization_request_number\":3,\"license_number\":3,\"plot_number\":null,\"cadastral_decision_number\":4,\"lead_id\":null,\"start_date\":\"2022-04-01 00:00:00\",\"end_date\":\"2022-04-27 00:00:00\",\"description\":null,\"created_by\":3,\"favorite\":0,\"buiding_type\":null,\"role_number\":1,\"unit_number\":0,\"using\":\"support\",\"build_rate\":\"4.00\",\"created_at\":\"2022-04-19 16:07:26\",\"updated_at\":\"2022-04-19 16:07:26\"}}', NULL, '2022-04-19 13:07:26', '2022-04-19 13:07:26'),
(103, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"EGtM0CRYljCn1I6yFgcSyKoXbAcaG1B8FcOdC5jgMH7eeo1fCtbpUkZX1geJ\"},\"old\":{\"remember_token\":\"A8WrSLnveRUUw9rskABkckcWh0AKTp2CxFE3mItzQsK8VWzswEEusHeXLgMb\"}}', NULL, '2022-04-19 13:11:03', '2022-04-19 13:11:03'),
(104, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-19 16:11:12\",\"updated_at\":\"2022-04-19 16:11:12\"},\"old\":{\"last_login\":\"2022-04-19 15:34:09\",\"updated_at\":\"2022-04-19 15:34:09\"}}', NULL, '2022-04-19 13:11:12', '2022-04-19 13:11:12'),
(105, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"yxYAci4h1h2wyXZ2MsvH5XNT5lkfwWNA6jKcmnw6ThJ1withLoXKAklAdfmZ\"},\"old\":{\"remember_token\":\"6DwfZIxMTP08dzDUqcrLL8LW4J7ssnZRS7YSz8YcD8rGmtbyQQZ5qyuH3tk8\"}}', NULL, '2022-04-19 13:11:41', '2022-04-19 13:11:41'),
(106, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-19 16:11:47\",\"updated_at\":\"2022-04-19 16:11:47\"},\"old\":{\"last_login\":\"2022-04-19 15:21:17\",\"updated_at\":\"2022-04-19 15:21:17\"}}', NULL, '2022-04-19 13:11:47', '2022-04-19 13:11:47'),
(107, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"7E1MOG0Im4XjzCh89CTe9x3TYdIsC4uCnCHvbddg65KX77VL5Q1TfBz96511\"},\"old\":{\"remember_token\":\"OukxMzCSpipuQ8ywTVVbHqsWzXXGtOi8YFLPc422szeEtWfXk4eNQbTmjYOK\"}}', NULL, '2022-04-19 13:12:20', '2022-04-19 13:12:20'),
(108, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-19 16:12:26\",\"updated_at\":\"2022-04-19 16:12:26\"},\"old\":{\"last_login\":\"2022-04-19 15:36:12\",\"updated_at\":\"2022-04-19 15:36:12\"}}', NULL, '2022-04-19 13:12:26', '2022-04-19 13:12:26'),
(109, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"vaxYsym8dclyxaMiF410lTew39VO04BF8rHXWSdNlx9HvhZvgPT0CMxWjxwH\"},\"old\":{\"remember_token\":\"EGtM0CRYljCn1I6yFgcSyKoXbAcaG1B8FcOdC5jgMH7eeo1fCtbpUkZX1geJ\"}}', NULL, '2022-04-19 13:12:52', '2022-04-19 13:12:52'),
(110, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-19 16:13:01\",\"updated_at\":\"2022-04-19 16:13:01\"},\"old\":{\"last_login\":\"2022-04-19 16:11:12\",\"updated_at\":\"2022-04-19 16:11:12\"}}', NULL, '2022-04-19 13:13:01', '2022-04-19 13:13:01'),
(111, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"GHLpkTGoqTq4583AzsGvLyEmZ5woYvWeJruIDKGGbzP27f4GK78BPdfR3IVH\"},\"old\":{\"remember_token\":\"yxYAci4h1h2wyXZ2MsvH5XNT5lkfwWNA6jKcmnw6ThJ1withLoXKAklAdfmZ\"}}', NULL, '2022-04-19 13:13:12', '2022-04-19 13:13:12'),
(112, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-19 16:13:17\",\"updated_at\":\"2022-04-19 16:13:17\"},\"old\":{\"last_login\":\"2022-04-19 16:12:26\",\"updated_at\":\"2022-04-19 16:12:26\"}}', NULL, '2022-04-19 13:13:17', '2022-04-19 13:13:17'),
(113, 'default', 'created', 3, 'App\\Note', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"notable_id\":4,\"notable_type\":\"App\\\\Project\",\"heading\":\"gfdg\",\"description\":null,\"created_by\":3,\"created_at\":\"2022-04-19 16:13:54\",\"updated_at\":\"2022-04-19 16:13:54\"}}', NULL, '2022-04-19 13:13:54', '2022-04-19 13:13:54'),
(114, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"waA1O6Z6MkPXyzvzdKmWmlWOnpTjqYjRTWGkBkX1uPxrc6vwpIVjwtMMNuTv\"},\"old\":{\"remember_token\":\"vaxYsym8dclyxaMiF410lTew39VO04BF8rHXWSdNlx9HvhZvgPT0CMxWjxwH\"}}', NULL, '2022-04-19 13:20:20', '2022-04-19 13:20:20'),
(115, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-19 16:20:30\",\"updated_at\":\"2022-04-19 16:20:30\"},\"old\":{\"last_login\":\"2022-04-19 16:13:01\",\"updated_at\":\"2022-04-19 16:13:01\"}}', NULL, '2022-04-19 13:20:30', '2022-04-19 13:20:30'),
(116, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"lDgLFRqHnK0YXc0TbuZlROCWSZIvvMcNyBama2xlP8oeqZFNqr5PsREZUmCG\"},\"old\":{\"remember_token\":\"GHLpkTGoqTq4583AzsGvLyEmZ5woYvWeJruIDKGGbzP27f4GK78BPdfR3IVH\"}}', NULL, '2022-04-19 13:20:38', '2022-04-19 13:20:38'),
(117, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-19 16:20:42\",\"updated_at\":\"2022-04-19 16:20:42\"},\"old\":{\"last_login\":\"2022-04-19 16:11:47\",\"updated_at\":\"2022-04-19 16:11:47\"}}', NULL, '2022-04-19 13:20:42', '2022-04-19 13:20:42'),
(118, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"AXKc9tJFDaCpSXrX8SH013VsHb55BNGyhpAItu4VRFvykLzIcs9pB0NHwAoB\"},\"old\":{\"remember_token\":\"7E1MOG0Im4XjzCh89CTe9x3TYdIsC4uCnCHvbddg65KX77VL5Q1TfBz96511\"}}', NULL, '2022-04-19 13:20:49', '2022-04-19 13:20:49'),
(119, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-19 16:20:55\",\"updated_at\":\"2022-04-19 16:20:55\"},\"old\":{\"last_login\":\"2022-04-19 16:13:17\",\"updated_at\":\"2022-04-19 16:13:17\"}}', NULL, '2022-04-19 13:20:55', '2022-04-19 13:20:55');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `event`, `causer_id`, `causer_type`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(120, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"QBk1Q77PAwk8GIsFnIcJkB6y1F1VH5UlGU5aUig6fDxQLeHovjDhkyrW4XMU\"},\"old\":{\"remember_token\":\"waA1O6Z6MkPXyzvzdKmWmlWOnpTjqYjRTWGkBkX1uPxrc6vwpIVjwtMMNuTv\"}}', NULL, '2022-04-19 13:21:41', '2022-04-19 13:21:41'),
(121, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-19 16:21:48\",\"updated_at\":\"2022-04-19 16:21:48\"},\"old\":{\"last_login\":\"2022-04-19 16:20:42\",\"updated_at\":\"2022-04-19 16:20:42\"}}', NULL, '2022-04-19 13:21:48', '2022-04-19 13:21:48'),
(122, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"KuauOjMxNdAxMzHhPhkGIgVJPc2R0bfU2p4fQXkT6yXIBVnIs4vswKZWzChh\"},\"old\":{\"remember_token\":\"AXKc9tJFDaCpSXrX8SH013VsHb55BNGyhpAItu4VRFvykLzIcs9pB0NHwAoB\"}}', NULL, '2022-04-19 13:22:35', '2022-04-19 13:22:35'),
(123, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-19 16:22:42\",\"updated_at\":\"2022-04-19 16:22:42\"},\"old\":{\"last_login\":\"2022-04-19 16:20:55\",\"updated_at\":\"2022-04-19 16:20:55\"}}', NULL, '2022-04-19 13:22:42', '2022-04-19 13:22:42'),
(124, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"TY2iSNXJkvZr7hb6T3kNwgAxjtDbN5aV9vw2iKChOdxPWyA8BH8s3U6RewMa\"},\"old\":{\"remember_token\":\"QBk1Q77PAwk8GIsFnIcJkB6y1F1VH5UlGU5aUig6fDxQLeHovjDhkyrW4XMU\"}}', NULL, '2022-04-19 13:23:24', '2022-04-19 13:23:24'),
(125, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-19 16:23:38\",\"updated_at\":\"2022-04-19 16:23:38\"},\"old\":{\"last_login\":\"2022-04-19 16:20:30\",\"updated_at\":\"2022-04-19 16:20:30\"}}', NULL, '2022-04-19 13:23:38', '2022-04-19 13:23:38'),
(126, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"NIn1KlNKFHZZHmerh0upkpNT3Uj0pTVsNPZT9bcgW2TNWH5xIymKn8Cxl6vu\"},\"old\":{\"remember_token\":\"lDgLFRqHnK0YXc0TbuZlROCWSZIvvMcNyBama2xlP8oeqZFNqr5PsREZUmCG\"}}', NULL, '2022-04-19 13:23:46', '2022-04-19 13:23:46'),
(127, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-19 16:23:58\",\"updated_at\":\"2022-04-19 16:23:58\"},\"old\":{\"last_login\":\"2022-04-19 16:21:48\",\"updated_at\":\"2022-04-19 16:21:48\"}}', NULL, '2022-04-19 13:23:58', '2022-04-19 13:23:58'),
(128, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-20 13:59:39\",\"updated_at\":\"2022-04-20 13:59:39\"},\"old\":{\"last_login\":\"2022-04-19 16:23:58\",\"updated_at\":\"2022-04-19 16:23:58\"}}', NULL, '2022-04-20 10:59:39', '2022-04-20 10:59:39'),
(129, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"2hdznuM3VNn84xBkVlMwLbUVp26H8NGwwOn56nYIkCngZAR3CWvvwrJSvmug\"},\"old\":{\"remember_token\":\"KuauOjMxNdAxMzHhPhkGIgVJPc2R0bfU2p4fQXkT6yXIBVnIs4vswKZWzChh\"}}', NULL, '2022-04-20 10:59:51', '2022-04-20 10:59:51'),
(130, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-20 13:59:56\",\"updated_at\":\"2022-04-20 13:59:56\"},\"old\":{\"last_login\":\"2022-04-19 16:22:42\",\"updated_at\":\"2022-04-19 16:22:42\"}}', NULL, '2022-04-20 10:59:56', '2022-04-20 10:59:56'),
(131, 'default', 'created', 5, 'App\\Project', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"name\":\"rt\",\"customer_id\":3,\"location_id\":5,\"agency_id\":null,\"project_type\":\"normal\",\"total_rate\":null,\"price_per_hours\":null,\"estimated_hours\":null,\"estimated_cost\":null,\"status\":\"not_started\",\"authorization_request_number\":null,\"license_number\":45,\"plot_number\":45,\"cadastral_decision_number\":45,\"lead_id\":null,\"start_date\":null,\"end_date\":null,\"description\":null,\"created_by\":3,\"favorite\":0,\"buiding_type\":null,\"role_number\":0,\"unit_number\":0,\"using\":null,\"build_rate\":\"45.00\",\"created_at\":\"2022-04-20 14:00:42\",\"updated_at\":\"2022-04-20 14:00:42\"}}', NULL, '2022-04-20 11:00:42', '2022-04-20 11:00:42'),
(132, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"8bySJPsMJ0KMMPCHbr6haDQKDS938tvPVkLe6AbWr4emfbBjgkReNoNPiSDO\"},\"old\":{\"remember_token\":\"TY2iSNXJkvZr7hb6T3kNwgAxjtDbN5aV9vw2iKChOdxPWyA8BH8s3U6RewMa\"}}', NULL, '2022-04-20 11:01:05', '2022-04-20 11:01:05'),
(133, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-20 14:01:12\",\"updated_at\":\"2022-04-20 14:01:12\"},\"old\":{\"last_login\":\"2022-04-19 16:23:38\",\"updated_at\":\"2022-04-19 16:23:38\"}}', NULL, '2022-04-20 11:01:12', '2022-04-20 11:01:12'),
(134, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"c4qxMXAV4fNXKnDYCZT8FaQL2QYFGd4UXcBRXIf9wgPLac0MbVQ4Cn9nARfz\"},\"old\":{\"remember_token\":\"NIn1KlNKFHZZHmerh0upkpNT3Uj0pTVsNPZT9bcgW2TNWH5xIymKn8Cxl6vu\"}}', NULL, '2022-04-20 11:01:39', '2022-04-20 11:01:39'),
(135, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-20 14:01:44\",\"updated_at\":\"2022-04-20 14:01:44\"},\"old\":{\"last_login\":\"2022-04-20 13:59:39\",\"updated_at\":\"2022-04-20 13:59:39\"}}', NULL, '2022-04-20 11:01:44', '2022-04-20 11:01:44'),
(136, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"Tgom8oaz2NHm6XEh58j2e0kke4t8jM51uo4KL1OWzj8XZTkZQZGkdbp28yfh\"},\"old\":{\"remember_token\":\"2hdznuM3VNn84xBkVlMwLbUVp26H8NGwwOn56nYIkCngZAR3CWvvwrJSvmug\"}}', NULL, '2022-04-20 11:02:02', '2022-04-20 11:02:02'),
(137, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-20 14:02:08\",\"updated_at\":\"2022-04-20 14:02:08\"},\"old\":{\"last_login\":\"2022-04-20 13:59:56\",\"updated_at\":\"2022-04-20 13:59:56\"}}', NULL, '2022-04-20 11:02:08', '2022-04-20 11:02:08'),
(138, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"zjmFRFlfkzhSdrs7njXbBjbjfCpuVnYbhtqR8LOayme2Wjk5Jt7RxzwJJ2tD\"},\"old\":{\"remember_token\":\"8bySJPsMJ0KMMPCHbr6haDQKDS938tvPVkLe6AbWr4emfbBjgkReNoNPiSDO\"}}', NULL, '2022-04-20 11:02:48', '2022-04-20 11:02:48'),
(139, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-20 14:02:54\",\"updated_at\":\"2022-04-20 14:02:54\"},\"old\":{\"last_login\":\"2022-04-20 14:01:44\",\"updated_at\":\"2022-04-20 14:01:44\"}}', NULL, '2022-04-20 11:02:54', '2022-04-20 11:02:54'),
(140, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 05:41:14\",\"updated_at\":\"2022-04-24 05:41:14\"},\"old\":{\"last_login\":\"2022-04-20 14:01:12\",\"updated_at\":\"2022-04-20 14:01:12\"}}', NULL, '2022-04-24 02:41:14', '2022-04-24 02:41:14'),
(141, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"prCNYPY9usy1DgJEkFJCu1UfDASo6N5ip1py9qTH9yHFoyhmYSMREPnX5y8S\"},\"old\":{\"remember_token\":\"c4qxMXAV4fNXKnDYCZT8FaQL2QYFGd4UXcBRXIf9wgPLac0MbVQ4Cn9nARfz\"}}', NULL, '2022-04-24 02:41:30', '2022-04-24 02:41:30'),
(142, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 05:41:35\",\"updated_at\":\"2022-04-24 05:41:35\"},\"old\":{\"last_login\":\"2022-04-20 14:02:54\",\"updated_at\":\"2022-04-20 14:02:54\"}}', NULL, '2022-04-24 02:41:35', '2022-04-24 02:41:35'),
(143, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"XlONJdt56kjdZjTWyBMYuX0pnFCCmZoyNsxTXxfRyN1ZvMbt0fBYDePqilk8\"},\"old\":{\"remember_token\":\"Tgom8oaz2NHm6XEh58j2e0kke4t8jM51uo4KL1OWzj8XZTkZQZGkdbp28yfh\"}}', NULL, '2022-04-24 03:23:17', '2022-04-24 03:23:17'),
(144, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 06:23:31\",\"updated_at\":\"2022-04-24 06:23:31\"},\"old\":{\"last_login\":\"2022-04-24 05:41:14\",\"updated_at\":\"2022-04-24 05:41:14\"}}', NULL, '2022-04-24 03:23:31', '2022-04-24 03:23:31'),
(145, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"yVXjUAadTZ4vxDMC9qsNfjpZtbCL0fmEbyPv5MRsLHBZ1RXXcRPboEltR6Dn\"},\"old\":{\"remember_token\":\"prCNYPY9usy1DgJEkFJCu1UfDASo6N5ip1py9qTH9yHFoyhmYSMREPnX5y8S\"}}', NULL, '2022-04-24 06:38:58', '2022-04-24 06:38:58'),
(146, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 09:42:41\",\"updated_at\":\"2022-04-24 09:42:41\"},\"old\":{\"last_login\":\"2022-04-20 14:02:08\",\"updated_at\":\"2022-04-20 14:02:08\"}}', NULL, '2022-04-24 06:42:41', '2022-04-24 06:42:41'),
(147, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"Yxw8zMKGILVX2X0gexig4Ms4zGfpJdO3HLgbBjPyPNY1RrqbzLyvRP3DwOGB\"},\"old\":{\"remember_token\":\"zjmFRFlfkzhSdrs7njXbBjbjfCpuVnYbhtqR8LOayme2Wjk5Jt7RxzwJJ2tD\"}}', NULL, '2022-04-24 07:21:08', '2022-04-24 07:21:08'),
(148, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 10:21:13\",\"updated_at\":\"2022-04-24 10:21:13\"},\"old\":{\"last_login\":\"2022-04-15 00:44:12\",\"updated_at\":\"2022-04-15 00:44:12\"}}', NULL, '2022-04-24 07:21:13', '2022-04-24 07:21:13'),
(149, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', NULL, 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"HIXXBAfTJb9nvBAb4MZn0bxxou6rfxOqoL1plqN7MBBqE0HZeMRiDbmhmll0\"},\"old\":{\"remember_token\":\"gp4duc3mndIVnLurQhUbGyFtGKq9fIcLFS0PbWEyXhjYo4qyLZCtUOnoHkP2\"}}', NULL, '2022-04-24 07:21:27', '2022-04-24 07:21:27'),
(150, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 10:21:32\",\"updated_at\":\"2022-04-24 10:21:32\"},\"old\":{\"last_login\":\"2022-04-24 09:42:41\",\"updated_at\":\"2022-04-24 09:42:41\"}}', NULL, '2022-04-24 07:21:32', '2022-04-24 07:21:32'),
(151, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"s43AHVf8eh661PpBIxgdbUhrbSdqKP29s9wVYVl5CQe0S2GEH7MHjWKBzeOO\"},\"old\":{\"remember_token\":\"Yxw8zMKGILVX2X0gexig4Ms4zGfpJdO3HLgbBjPyPNY1RrqbzLyvRP3DwOGB\"}}', NULL, '2022-04-24 07:34:22', '2022-04-24 07:34:22'),
(152, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 10:34:32\",\"updated_at\":\"2022-04-24 10:34:32\"},\"old\":{\"last_login\":\"2022-04-24 06:23:31\",\"updated_at\":\"2022-04-24 06:23:31\"}}', NULL, '2022-04-24 07:34:32', '2022-04-24 07:34:32'),
(153, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"TXYduzbsuPr0qYM0GbZHmyBimbJ17ErE4jdnXhDwL6LMcmY4w1TeZ6DnYPhr\"},\"old\":{\"remember_token\":\"yVXjUAadTZ4vxDMC9qsNfjpZtbCL0fmEbyPv5MRsLHBZ1RXXcRPboEltR6Dn\"}}', NULL, '2022-04-24 07:41:34', '2022-04-24 07:41:34'),
(154, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 10:41:39\",\"updated_at\":\"2022-04-24 10:41:39\"},\"old\":{\"last_login\":\"2022-04-24 10:21:32\",\"updated_at\":\"2022-04-24 10:21:32\"}}', NULL, '2022-04-24 07:41:39', '2022-04-24 07:41:39'),
(155, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"MeIC3sA7eUpByNFrct5R0tAEIpiW4rAeeVbvIfkWFArONnqJYPG2uYj9280d\"},\"old\":{\"remember_token\":\"s43AHVf8eh661PpBIxgdbUhrbSdqKP29s9wVYVl5CQe0S2GEH7MHjWKBzeOO\"}}', NULL, '2022-04-24 07:43:08', '2022-04-24 07:43:08'),
(156, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 10:43:20\",\"updated_at\":\"2022-04-24 10:43:20\"},\"old\":{\"last_login\":\"2022-04-24 10:34:32\",\"updated_at\":\"2022-04-24 10:34:32\"}}', NULL, '2022-04-24 07:43:20', '2022-04-24 07:43:20'),
(157, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"YF6TXpmuFJHD0smVeZRYphqhSjQLPOvKUEpXl9zjEJc2WdV9UWnWYDJ1x1Zb\"},\"old\":{\"remember_token\":\"TXYduzbsuPr0qYM0GbZHmyBimbJ17ErE4jdnXhDwL6LMcmY4w1TeZ6DnYPhr\"}}', NULL, '2022-04-24 07:46:01', '2022-04-24 07:46:01'),
(158, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 10:46:07\",\"updated_at\":\"2022-04-24 10:46:07\"},\"old\":{\"last_login\":\"2022-04-24 10:41:39\",\"updated_at\":\"2022-04-24 10:41:39\"}}', NULL, '2022-04-24 07:46:08', '2022-04-24 07:46:08'),
(159, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"u1H2WpdHek6KmwjRHjeZhZ5rvwGoQHjPABUtWkOwV0BUosBPBoFVoaem6w3a\"},\"old\":{\"remember_token\":\"MeIC3sA7eUpByNFrct5R0tAEIpiW4rAeeVbvIfkWFArONnqJYPG2uYj9280d\"}}', NULL, '2022-04-24 07:47:11', '2022-04-24 07:47:11'),
(160, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 10:47:26\",\"updated_at\":\"2022-04-24 10:47:26\"},\"old\":{\"last_login\":\"2022-04-24 10:43:20\",\"updated_at\":\"2022-04-24 10:43:20\"}}', NULL, '2022-04-24 07:47:26', '2022-04-24 07:47:26'),
(161, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"DAbs1NORi38GRKl7l5k2nJXQATjhNAmPxsMjmiQtn9leUAKIJMEwaBiL2Bd7\"},\"old\":{\"remember_token\":\"YF6TXpmuFJHD0smVeZRYphqhSjQLPOvKUEpXl9zjEJc2WdV9UWnWYDJ1x1Zb\"}}', NULL, '2022-04-24 08:04:58', '2022-04-24 08:04:58'),
(162, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 11:05:03\",\"updated_at\":\"2022-04-24 11:05:03\"},\"old\":{\"last_login\":\"2022-04-24 10:21:13\",\"updated_at\":\"2022-04-24 10:21:13\"}}', NULL, '2022-04-24 08:05:03', '2022-04-24 08:05:03'),
(163, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', NULL, 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"qqzVjjAIFkIRtJbxprB8qaQZ5e3RI4kGJSE0RVdDEhOp3KUUGzkxB4JHBFtu\"},\"old\":{\"remember_token\":\"HIXXBAfTJb9nvBAb4MZn0bxxou6rfxOqoL1plqN7MBBqE0HZeMRiDbmhmll0\"}}', NULL, '2022-04-24 08:06:21', '2022-04-24 08:06:21'),
(164, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 11:12:31\",\"updated_at\":\"2022-04-24 11:12:31\"},\"old\":{\"last_login\":\"2022-04-24 10:47:26\",\"updated_at\":\"2022-04-24 10:47:26\"}}', NULL, '2022-04-24 08:12:31', '2022-04-24 08:12:31'),
(165, 'default', 'updated', 6, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"active\":\"2022-04-24 00:00:00\",\"updated_at\":\"2022-04-24 11:19:50\",\"specialty_id\":2},\"old\":{\"active\":\"2022-04-14 10:00:00\",\"updated_at\":\"2022-04-15 02:11:01\",\"specialty_id\":null}}', NULL, '2022-04-24 08:19:50', '2022-04-24 08:19:50'),
(166, 'default', 'updated', 6, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"updated_at\":\"2022-04-24 11:21:37\",\"specialty_id\":3},\"old\":{\"updated_at\":\"2022-04-24 11:19:50\",\"specialty_id\":2}}', NULL, '2022-04-24 08:21:37', '2022-04-24 08:21:37'),
(167, 'default', 'created', 7, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"name\":\"emp3\",\"email\":\"emp3@gmail.com\",\"mobile\":null,\"alternate_num\":null,\"home_address\":null,\"current_address\":null,\"address\":null,\"skype\":null,\"linkedin\":null,\"facebook\":null,\"twitter\":null,\"birth_date\":null,\"guardian_name\":null,\"gender\":null,\"account_holder_name\":null,\"account_no\":null,\"bank_name\":null,\"bank_identifier_code\":null,\"branch_location\":null,\"tax_payer_id\":null,\"note\":null,\"password\":\"$2y$10$nWyOI5KX0IMSC6LRPZedfuUZg20gyAj82SK7ihRWHsFvPz7wUQZiq\",\"sticky_notes\":null,\"created_by\":null,\"last_login\":null,\"active\":\"2022-04-24 00:00:00\",\"activation_key\":null,\"id_card_number\":3213213,\"parent_id\":2,\"enginnering_type\":null,\"isActive\":1,\"user_type_log\":\"ENGINEERING_OFFICE\",\"remember_token\":null,\"created_at\":\"2022-04-24 11:23:20\",\"updated_at\":\"2022-04-24 11:23:20\",\"is_employee\":true,\"is_emp\":0,\"specialty_id\":2}}', NULL, '2022-04-24 08:23:20', '2022-04-24 08:23:20'),
(168, 'default', 'updated', 7, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"updated_at\":\"2022-04-24 11:23:34\",\"specialty_id\":3},\"old\":{\"updated_at\":\"2022-04-24 11:23:20\",\"specialty_id\":2}}', NULL, '2022-04-24 08:23:34', '2022-04-24 08:23:34'),
(169, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"HwlMoAzekx0t1QjQPaoSFIkslIyhfcrEefqxswr1oGeKqtMOZgL1QXdGaCsw\"},\"old\":{\"remember_token\":\"DAbs1NORi38GRKl7l5k2nJXQATjhNAmPxsMjmiQtn9leUAKIJMEwaBiL2Bd7\"}}', NULL, '2022-04-24 08:58:00', '2022-04-24 08:58:00'),
(170, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 11:58:05\",\"updated_at\":\"2022-04-24 11:58:05\"},\"old\":{\"last_login\":\"2022-04-24 10:46:07\",\"updated_at\":\"2022-04-24 10:46:07\"}}', NULL, '2022-04-24 08:58:05', '2022-04-24 08:58:05'),
(171, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"KdXZkxcGFjeHenGtT339qBZYQ3tRoYPbLmkod9rY2POHFzFzSfScpaRsCkzx\"},\"old\":{\"remember_token\":\"u1H2WpdHek6KmwjRHjeZhZ5rvwGoQHjPABUtWkOwV0BUosBPBoFVoaem6w3a\"}}', NULL, '2022-04-24 08:59:08', '2022-04-24 08:59:08'),
(172, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 11:59:25\",\"updated_at\":\"2022-04-24 11:59:25\"},\"old\":{\"last_login\":\"2022-04-24 11:12:31\",\"updated_at\":\"2022-04-24 11:12:31\"}}', NULL, '2022-04-24 08:59:25', '2022-04-24 08:59:25'),
(173, 'default', 'updated', 6, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"updated_at\":\"2022-04-24 12:38:17\",\"specialty_id\":2},\"old\":{\"updated_at\":\"2022-04-24 11:21:37\",\"specialty_id\":3}}', NULL, '2022-04-24 09:38:17', '2022-04-24 09:38:17'),
(174, 'default', 'updated', 6, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"updated_at\":\"2022-04-24 12:38:32\",\"specialty_id\":5},\"old\":{\"updated_at\":\"2022-04-24 12:38:17\",\"specialty_id\":2}}', NULL, '2022-04-24 09:38:32', '2022-04-24 09:38:32'),
(175, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"p2n9NrVKSDLFmrpRhY5UrtoHEaGL69dTmqhzZz3P8e8gKxONvpJfqJiYGRwG\"},\"old\":{\"remember_token\":\"HwlMoAzekx0t1QjQPaoSFIkslIyhfcrEefqxswr1oGeKqtMOZgL1QXdGaCsw\"}}', NULL, '2022-04-24 09:43:57', '2022-04-24 09:43:57'),
(176, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 12:44:03\",\"updated_at\":\"2022-04-24 12:44:03\"},\"old\":{\"last_login\":\"2022-04-24 11:58:05\",\"updated_at\":\"2022-04-24 11:58:05\"}}', NULL, '2022-04-24 09:44:03', '2022-04-24 09:44:03'),
(177, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"yPso6ESvdqcOViIAvWYYYUKgRlRi7fw07u19gSIYTWFWhpJfLsAlYCTQ78Z2\"},\"old\":{\"remember_token\":\"KdXZkxcGFjeHenGtT339qBZYQ3tRoYPbLmkod9rY2POHFzFzSfScpaRsCkzx\"}}', NULL, '2022-04-24 09:44:27', '2022-04-24 09:44:27'),
(178, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 12:44:48\",\"updated_at\":\"2022-04-24 12:44:48\"},\"old\":{\"last_login\":\"2022-04-24 11:59:25\",\"updated_at\":\"2022-04-24 11:59:25\"}}', NULL, '2022-04-24 09:44:48', '2022-04-24 09:44:48'),
(179, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"SyjHIeG40LdZDdf8ivmLQ2AfjTsmOHnhua31YEgI8D246WTvyyFF72soiuM9\"},\"old\":{\"remember_token\":\"p2n9NrVKSDLFmrpRhY5UrtoHEaGL69dTmqhzZz3P8e8gKxONvpJfqJiYGRwG\"}}', NULL, '2022-04-24 10:57:46', '2022-04-24 10:57:46'),
(180, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 13:57:52\",\"updated_at\":\"2022-04-24 13:57:52\"},\"old\":{\"last_login\":\"2022-04-24 12:44:03\",\"updated_at\":\"2022-04-24 12:44:03\"}}', NULL, '2022-04-24 10:57:52', '2022-04-24 10:57:52'),
(181, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"K6Jb26g1wIINmC1mnRMFGtU3827kuvCrTPzSpiSPiP3KXw0zQ0ITXtdfAsDb\"},\"old\":{\"remember_token\":\"yPso6ESvdqcOViIAvWYYYUKgRlRi7fw07u19gSIYTWFWhpJfLsAlYCTQ78Z2\"}}', NULL, '2022-04-24 10:58:34', '2022-04-24 10:58:34'),
(182, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 13:58:44\",\"updated_at\":\"2022-04-24 13:58:44\"},\"old\":{\"last_login\":\"2022-04-24 12:44:48\",\"updated_at\":\"2022-04-24 12:44:48\"}}', NULL, '2022-04-24 10:58:44', '2022-04-24 10:58:44'),
(183, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"MH165y7URXNU5IlrrcXtnPjlqHz79epJaOR5cEyZw03Kj1SGOQWWPCoiY5st\"},\"old\":{\"remember_token\":\"SyjHIeG40LdZDdf8ivmLQ2AfjTsmOHnhua31YEgI8D246WTvyyFF72soiuM9\"}}', NULL, '2022-04-24 11:11:24', '2022-04-24 11:11:24'),
(184, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 14:11:30\",\"updated_at\":\"2022-04-24 14:11:30\"},\"old\":{\"last_login\":\"2022-04-24 13:57:52\",\"updated_at\":\"2022-04-24 13:57:52\"}}', NULL, '2022-04-24 11:11:30', '2022-04-24 11:11:30'),
(185, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"xIZ8HtTa3GTboBuqn2CiBYTFxBgSuVbxYtQ2E5hnDrtIHbTHhhiSAHfI5eHc\"},\"old\":{\"remember_token\":\"K6Jb26g1wIINmC1mnRMFGtU3827kuvCrTPzSpiSPiP3KXw0zQ0ITXtdfAsDb\"}}', NULL, '2022-04-24 11:11:55', '2022-04-24 11:11:55'),
(186, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 14:12:10\",\"updated_at\":\"2022-04-24 14:12:10\"},\"old\":{\"last_login\":\"2022-04-24 13:58:44\",\"updated_at\":\"2022-04-24 13:58:44\"}}', NULL, '2022-04-24 11:12:10', '2022-04-24 11:12:10'),
(187, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"GJr15kCzGiTrNZHsY4opB6x00Waqx3VKpEgh4UZdxia6AtVLco5F4cZViuOm\"},\"old\":{\"remember_token\":\"MH165y7URXNU5IlrrcXtnPjlqHz79epJaOR5cEyZw03Kj1SGOQWWPCoiY5st\"}}', NULL, '2022-04-24 11:12:54', '2022-04-24 11:12:54'),
(188, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 14:13:01\",\"updated_at\":\"2022-04-24 14:13:01\"},\"old\":{\"last_login\":\"2022-04-24 14:11:30\",\"updated_at\":\"2022-04-24 14:11:30\"}}', NULL, '2022-04-24 11:13:01', '2022-04-24 11:13:01'),
(189, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"FXUmZdZxeira1gZevFGxA7n6B870x9c5xIf3HzzCXyZ0teyJZ7ecfsJUGUfE\"},\"old\":{\"remember_token\":\"xIZ8HtTa3GTboBuqn2CiBYTFxBgSuVbxYtQ2E5hnDrtIHbTHhhiSAHfI5eHc\"}}', NULL, '2022-04-24 11:13:25', '2022-04-24 11:13:25'),
(190, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 14:13:35\",\"updated_at\":\"2022-04-24 14:13:35\"},\"old\":{\"last_login\":\"2022-04-24 14:12:10\",\"updated_at\":\"2022-04-24 14:12:10\"}}', NULL, '2022-04-24 11:13:35', '2022-04-24 11:13:35'),
(191, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"x3GdzN4vA2ejWRc4wQTzcffFvs7bSpureBjNlLZnIAN0SrgRKDTWQXcYdEqK\"},\"old\":{\"remember_token\":\"GJr15kCzGiTrNZHsY4opB6x00Waqx3VKpEgh4UZdxia6AtVLco5F4cZViuOm\"}}', NULL, '2022-04-24 11:31:51', '2022-04-24 11:31:51'),
(192, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 14:31:59\",\"updated_at\":\"2022-04-24 14:31:59\"},\"old\":{\"last_login\":\"2022-04-24 14:13:01\",\"updated_at\":\"2022-04-24 14:13:01\"}}', NULL, '2022-04-24 11:31:59', '2022-04-24 11:31:59'),
(193, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"KHfL4C8Bl4LgpLSxnvqmdXGXgTIMVob7Emlp8NPxlw1jlDz76Fkti5ckOd4K\"},\"old\":{\"remember_token\":\"FXUmZdZxeira1gZevFGxA7n6B870x9c5xIf3HzzCXyZ0teyJZ7ecfsJUGUfE\"}}', NULL, '2022-04-24 12:14:30', '2022-04-24 12:14:30'),
(194, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 15:14:39\",\"updated_at\":\"2022-04-24 15:14:39\"},\"old\":{\"last_login\":\"2022-04-24 14:13:35\",\"updated_at\":\"2022-04-24 14:13:35\"}}', NULL, '2022-04-24 12:14:39', '2022-04-24 12:14:39'),
(195, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"OjcqC96wA6iAV4LvBDWGezsbtrpTxZfUIEU11ALUCDYHbjp72cHkuxUKQUwj\"},\"old\":{\"remember_token\":\"x3GdzN4vA2ejWRc4wQTzcffFvs7bSpureBjNlLZnIAN0SrgRKDTWQXcYdEqK\"}}', NULL, '2022-04-24 12:15:26', '2022-04-24 12:15:26'),
(196, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 15:15:31\",\"updated_at\":\"2022-04-24 15:15:31\"},\"old\":{\"last_login\":\"2022-04-24 14:31:59\",\"updated_at\":\"2022-04-24 14:31:59\"}}', NULL, '2022-04-24 12:15:31', '2022-04-24 12:15:31'),
(197, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"BOyz0ljTNvm5i6BLBG0VMyD0O30RUC4CU5fwu3OYgOVz6C9dnFPYW0k4SEQp\"},\"old\":{\"remember_token\":\"KHfL4C8Bl4LgpLSxnvqmdXGXgTIMVob7Emlp8NPxlw1jlDz76Fkti5ckOd4K\"}}', NULL, '2022-04-24 12:16:05', '2022-04-24 12:16:05'),
(198, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 15:16:27\",\"updated_at\":\"2022-04-24 15:16:27\"},\"old\":{\"last_login\":\"2022-04-24 15:15:31\",\"updated_at\":\"2022-04-24 15:15:31\"}}', NULL, '2022-04-24 12:16:27', '2022-04-24 12:16:27'),
(199, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"8IXKVIpI7s1EXt3tdl5dZAX7G4eqBQGCCJ2YvZUkWsCcr0zr6oCIeA3gq569\"},\"old\":{\"remember_token\":\"BOyz0ljTNvm5i6BLBG0VMyD0O30RUC4CU5fwu3OYgOVz6C9dnFPYW0k4SEQp\"}}', NULL, '2022-04-24 12:18:29', '2022-04-24 12:18:29'),
(200, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 15:18:39\",\"updated_at\":\"2022-04-24 15:18:39\"},\"old\":{\"last_login\":\"2022-04-24 15:14:39\",\"updated_at\":\"2022-04-24 15:14:39\"}}', NULL, '2022-04-24 12:18:39', '2022-04-24 12:18:39'),
(201, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"PISgGHua8oMMJFq2GAeLuwci33aV4vr1qsYnUAetiiLipDeVXNqoLj0oEHWl\"},\"old\":{\"remember_token\":\"OjcqC96wA6iAV4LvBDWGezsbtrpTxZfUIEU11ALUCDYHbjp72cHkuxUKQUwj\"}}', NULL, '2022-04-24 12:18:54', '2022-04-24 12:18:54'),
(202, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 15:19:00\",\"updated_at\":\"2022-04-24 15:19:00\"},\"old\":{\"last_login\":\"2022-04-24 05:41:35\",\"updated_at\":\"2022-04-24 05:41:35\"}}', NULL, '2022-04-24 12:19:00', '2022-04-24 12:19:00'),
(203, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"sk3mkYRew3OFgHgURBT1T4nLgHsqsMab9SQ9COLTvtWLnDvDMhgXjBCRxLwv\"},\"old\":{\"remember_token\":\"XlONJdt56kjdZjTWyBMYuX0pnFCCmZoyNsxTXxfRyN1ZvMbt0fBYDePqilk8\"}}', NULL, '2022-04-24 12:23:37', '2022-04-24 12:23:37'),
(204, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 15:23:42\",\"updated_at\":\"2022-04-24 15:23:42\"},\"old\":{\"last_login\":\"2022-04-24 15:16:27\",\"updated_at\":\"2022-04-24 15:16:27\"}}', NULL, '2022-04-24 12:23:42', '2022-04-24 12:23:42'),
(205, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"1hAIcZH3C6z4asUIq7yuUpBoQY96H8i5r3hqi99atpixkR0q1fNoCSgemMw6\"},\"old\":{\"remember_token\":\"8IXKVIpI7s1EXt3tdl5dZAX7G4eqBQGCCJ2YvZUkWsCcr0zr6oCIeA3gq569\"}}', NULL, '2022-04-24 12:24:12', '2022-04-24 12:24:12'),
(206, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 15:24:24\",\"updated_at\":\"2022-04-24 15:24:24\"},\"old\":{\"last_login\":\"2022-04-24 15:18:39\",\"updated_at\":\"2022-04-24 15:18:39\"}}', NULL, '2022-04-24 12:24:24', '2022-04-24 12:24:24'),
(207, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"gp5mApgz7Lu4QuCzEffyG6Yjd95J3GBWXbZhegbr9hMEgQVwcRjODZcFJXYz\"},\"old\":{\"remember_token\":\"PISgGHua8oMMJFq2GAeLuwci33aV4vr1qsYnUAetiiLipDeVXNqoLj0oEHWl\"}}', NULL, '2022-04-24 12:24:48', '2022-04-24 12:24:48'),
(208, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 15:24:56\",\"updated_at\":\"2022-04-24 15:24:56\"},\"old\":{\"last_login\":\"2022-04-24 15:23:42\",\"updated_at\":\"2022-04-24 15:23:42\"}}', NULL, '2022-04-24 12:24:56', '2022-04-24 12:24:56'),
(209, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"6aGaEpyepVSxWTUY3exZ0MUUHnXxhcGwdzzEumiAyl9k0bd1T2IBQWitR2fV\"},\"old\":{\"remember_token\":\"1hAIcZH3C6z4asUIq7yuUpBoQY96H8i5r3hqi99atpixkR0q1fNoCSgemMw6\"}}', NULL, '2022-04-24 12:25:49', '2022-04-24 12:25:49'),
(210, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 15:25:58\",\"updated_at\":\"2022-04-24 15:25:58\"},\"old\":{\"last_login\":\"2022-04-24 15:24:24\",\"updated_at\":\"2022-04-24 15:24:24\"}}', NULL, '2022-04-24 12:25:58', '2022-04-24 12:25:58'),
(211, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"Fr3sEGaukGSpdVEnoIFvlVRNChqfRXYQmeuEA0bSGrv4sWWr8JI6dktTDyvt\"},\"old\":{\"remember_token\":\"gp5mApgz7Lu4QuCzEffyG6Yjd95J3GBWXbZhegbr9hMEgQVwcRjODZcFJXYz\"}}', NULL, '2022-04-24 12:27:22', '2022-04-24 12:27:22'),
(212, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 15:28:25\",\"updated_at\":\"2022-04-24 15:28:25\"},\"old\":{\"last_login\":\"2022-04-24 15:24:56\",\"updated_at\":\"2022-04-24 15:24:56\"}}', NULL, '2022-04-24 12:28:25', '2022-04-24 12:28:25'),
(213, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"RWCJEaIcZkv821i5Df6vcvtTC8hvcrTRd6EAFMYuTvJVOYtu1N7lCDM3Bzu5\"},\"old\":{\"remember_token\":\"6aGaEpyepVSxWTUY3exZ0MUUHnXxhcGwdzzEumiAyl9k0bd1T2IBQWitR2fV\"}}', NULL, '2022-04-24 12:29:13', '2022-04-24 12:29:13'),
(214, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 15:29:27\",\"updated_at\":\"2022-04-24 15:29:27\"},\"old\":{\"last_login\":\"2022-04-24 15:25:58\",\"updated_at\":\"2022-04-24 15:25:58\"}}', NULL, '2022-04-24 12:29:27', '2022-04-24 12:29:27'),
(215, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"QDi0mgMXflXK1ibUWWiEBJJGyHLPH45btgFgqVZ7Pf9E0HfMlbrI6qFBxqQB\"},\"old\":{\"remember_token\":\"Fr3sEGaukGSpdVEnoIFvlVRNChqfRXYQmeuEA0bSGrv4sWWr8JI6dktTDyvt\"}}', NULL, '2022-04-24 12:30:58', '2022-04-24 12:30:58'),
(216, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 15:31:04\",\"updated_at\":\"2022-04-24 15:31:04\"},\"old\":{\"last_login\":\"2022-04-24 15:19:00\",\"updated_at\":\"2022-04-24 15:19:00\"}}', NULL, '2022-04-24 12:31:04', '2022-04-24 12:31:04'),
(217, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"xq1KlalVpO5S2wuSp7IzGRvhF70LSAETVbERoaMnDXX1dDeQugyPop8C5xUR\"},\"old\":{\"remember_token\":\"sk3mkYRew3OFgHgURBT1T4nLgHsqsMab9SQ9COLTvtWLnDvDMhgXjBCRxLwv\"}}', NULL, '2022-04-24 12:31:16', '2022-04-24 12:31:16'),
(218, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 15:31:26\",\"updated_at\":\"2022-04-24 15:31:26\"},\"old\":{\"last_login\":\"2022-04-24 15:28:25\",\"updated_at\":\"2022-04-24 15:28:25\"}}', NULL, '2022-04-24 12:31:26', '2022-04-24 12:31:26'),
(219, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"zyXY77Ra8QktbrCtVqNfv9YZBTbcllEc6r23xnEEtKmEucWK6aWzA3kOoC95\"},\"old\":{\"remember_token\":\"RWCJEaIcZkv821i5Df6vcvtTC8hvcrTRd6EAFMYuTvJVOYtu1N7lCDM3Bzu5\"}}', NULL, '2022-04-24 12:33:22', '2022-04-24 12:33:22'),
(220, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 15:33:32\",\"updated_at\":\"2022-04-24 15:33:32\"},\"old\":{\"last_login\":\"2022-04-24 15:29:27\",\"updated_at\":\"2022-04-24 15:29:27\"}}', NULL, '2022-04-24 12:33:33', '2022-04-24 12:33:33'),
(221, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"fkxtn5z21BVWhW7BLTpuxyxgc8HhS93gFSRrVx6l6LPwjLTGKxKH6EAFJa8k\"},\"old\":{\"remember_token\":\"QDi0mgMXflXK1ibUWWiEBJJGyHLPH45btgFgqVZ7Pf9E0HfMlbrI6qFBxqQB\"}}', NULL, '2022-04-24 12:34:02', '2022-04-24 12:34:02'),
(222, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 15:38:57\",\"updated_at\":\"2022-04-24 15:38:57\"},\"old\":{\"last_login\":\"2022-04-24 15:31:26\",\"updated_at\":\"2022-04-24 15:31:26\"}}', NULL, '2022-04-24 12:38:57', '2022-04-24 12:38:57'),
(223, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"5WbVk2fbfJjZoWMVw6rcgBCPkvEIMgSo3KOi0gqXqYQe52Zsw8sid5nXVSMl\"},\"old\":{\"remember_token\":\"zyXY77Ra8QktbrCtVqNfv9YZBTbcllEc6r23xnEEtKmEucWK6aWzA3kOoC95\"}}', NULL, '2022-04-24 12:39:25', '2022-04-24 12:39:25'),
(224, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 15:39:34\",\"updated_at\":\"2022-04-24 15:39:34\"},\"old\":{\"last_login\":\"2022-04-24 15:33:32\",\"updated_at\":\"2022-04-24 15:33:32\"}}', NULL, '2022-04-24 12:39:34', '2022-04-24 12:39:34'),
(225, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"oH2vY99PaW0obkuw235Uhr9c7zDPhEdiW51iMLxUiJShzDQg9mUftk6gz22X\"},\"old\":{\"remember_token\":\"fkxtn5z21BVWhW7BLTpuxyxgc8HhS93gFSRrVx6l6LPwjLTGKxKH6EAFJa8k\"}}', NULL, '2022-04-24 12:40:24', '2022-04-24 12:40:24'),
(226, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 15:40:31\",\"updated_at\":\"2022-04-24 15:40:31\"},\"old\":{\"last_login\":\"2022-04-24 15:38:57\",\"updated_at\":\"2022-04-24 15:38:57\"}}', NULL, '2022-04-24 12:40:31', '2022-04-24 12:40:31'),
(227, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"HuOAeurSVm7jtV1wdbhFYDfGOdTtOGPpxpXQz3i2OpAG3D2jJIg3jjbFrmMd\"},\"old\":{\"remember_token\":\"5WbVk2fbfJjZoWMVw6rcgBCPkvEIMgSo3KOi0gqXqYQe52Zsw8sid5nXVSMl\"}}', NULL, '2022-04-24 12:40:56', '2022-04-24 12:40:56'),
(228, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 15:41:07\",\"updated_at\":\"2022-04-24 15:41:07\"},\"old\":{\"last_login\":\"2022-04-24 15:39:34\",\"updated_at\":\"2022-04-24 15:39:34\"}}', NULL, '2022-04-24 12:41:07', '2022-04-24 12:41:07'),
(229, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"JeCG9myhBnoIz5joiKGAN5MprgSwaxiPal86KbosQrSSdPMrsDKYlMgZlgUl\"},\"old\":{\"remember_token\":\"oH2vY99PaW0obkuw235Uhr9c7zDPhEdiW51iMLxUiJShzDQg9mUftk6gz22X\"}}', NULL, '2022-04-24 12:42:37', '2022-04-24 12:42:37'),
(230, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 15:42:46\",\"updated_at\":\"2022-04-24 15:42:46\"},\"old\":{\"last_login\":\"2022-04-24 15:40:31\",\"updated_at\":\"2022-04-24 15:40:31\"}}', NULL, '2022-04-24 12:42:46', '2022-04-24 12:42:46'),
(231, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"sdODDLO5sLdABaJwSh3z8sIieZClSihf10js0t7Ucvu0xCggXJukjnfmMB41\"},\"old\":{\"remember_token\":\"HuOAeurSVm7jtV1wdbhFYDfGOdTtOGPpxpXQz3i2OpAG3D2jJIg3jjbFrmMd\"}}', NULL, '2022-04-24 12:43:17', '2022-04-24 12:43:17'),
(232, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 15:43:36\",\"updated_at\":\"2022-04-24 15:43:36\"},\"old\":{\"last_login\":\"2022-04-24 15:41:07\",\"updated_at\":\"2022-04-24 15:41:07\"}}', NULL, '2022-04-24 12:43:36', '2022-04-24 12:43:36'),
(233, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"bWWg3j85JrOPylhwV1Zu8wlFnJdfoYOvpj6xPXUSpbaTke31bladuLX9KQ2I\"},\"old\":{\"remember_token\":\"JeCG9myhBnoIz5joiKGAN5MprgSwaxiPal86KbosQrSSdPMrsDKYlMgZlgUl\"}}', NULL, '2022-04-24 12:47:26', '2022-04-24 12:47:26'),
(234, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 15:47:36\",\"updated_at\":\"2022-04-24 15:47:36\"},\"old\":{\"last_login\":\"2022-04-24 15:43:36\",\"updated_at\":\"2022-04-24 15:43:36\"}}', NULL, '2022-04-24 12:47:36', '2022-04-24 12:47:36'),
(235, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"RKCHPqQsouifl3R6chwqcF2hN9VEOhhLe5xKU3V6DWnmp8JSUz5EVKW7mbU1\"},\"old\":{\"remember_token\":\"bWWg3j85JrOPylhwV1Zu8wlFnJdfoYOvpj6xPXUSpbaTke31bladuLX9KQ2I\"}}', NULL, '2022-04-24 12:48:13', '2022-04-24 12:48:13'),
(236, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 15:48:18\",\"updated_at\":\"2022-04-24 15:48:18\"},\"old\":{\"last_login\":\"2022-04-24 15:42:46\",\"updated_at\":\"2022-04-24 15:42:46\"}}', NULL, '2022-04-24 12:48:18', '2022-04-24 12:48:18'),
(237, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"9Kt6nMJBzfuCX4lGQjxTCVjyQZEKu87viPVhLQzzT1Q4YSDvRo3P0GwSSQzu\"},\"old\":{\"remember_token\":\"sdODDLO5sLdABaJwSh3z8sIieZClSihf10js0t7Ucvu0xCggXJukjnfmMB41\"}}', NULL, '2022-04-24 12:49:10', '2022-04-24 12:49:10'),
(238, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 15:49:19\",\"updated_at\":\"2022-04-24 15:49:19\"},\"old\":{\"last_login\":\"2022-04-24 15:47:36\",\"updated_at\":\"2022-04-24 15:47:36\"}}', NULL, '2022-04-24 12:49:19', '2022-04-24 12:49:19'),
(239, 'default', 'created', 8, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"name\":\"emp5\",\"email\":\"emp5@gmail.com\",\"mobile\":null,\"alternate_num\":null,\"home_address\":null,\"current_address\":null,\"address\":null,\"skype\":null,\"linkedin\":null,\"facebook\":null,\"twitter\":null,\"birth_date\":null,\"guardian_name\":null,\"gender\":null,\"account_holder_name\":null,\"account_no\":null,\"bank_name\":null,\"bank_identifier_code\":null,\"branch_location\":null,\"tax_payer_id\":null,\"note\":null,\"password\":\"$2y$10$o70AYo3G86BjbSRohSFBhO90.kK1uTMReKTGOKRj5QXKWXcn7EdZu\",\"sticky_notes\":null,\"created_by\":null,\"last_login\":null,\"active\":\"2022-04-24 00:00:00\",\"activation_key\":null,\"id_card_number\":3443434,\"parent_id\":2,\"enginnering_type\":null,\"isActive\":1,\"user_type_log\":\"ENGINEERING_OFFICE\",\"remember_token\":null,\"created_at\":\"2022-04-24 15:50:13\",\"updated_at\":\"2022-04-24 15:50:13\",\"is_employee\":true,\"is_emp\":1,\"specialty_id\":6}}', NULL, '2022-04-24 12:50:13', '2022-04-24 12:50:13'),
(240, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"4x43a4eqF4RMTvfh8eC7XIYkuGjyQ98aXoPcfX0z1AAAqzOqmMr2apS2GDml\"},\"old\":{\"remember_token\":\"RKCHPqQsouifl3R6chwqcF2hN9VEOhhLe5xKU3V6DWnmp8JSUz5EVKW7mbU1\"}}', NULL, '2022-04-24 12:53:15', '2022-04-24 12:53:15'),
(241, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 15:53:20\",\"updated_at\":\"2022-04-24 15:53:20\"},\"old\":{\"last_login\":\"2022-04-24 15:48:18\",\"updated_at\":\"2022-04-24 15:48:18\"}}', NULL, '2022-04-24 12:53:20', '2022-04-24 12:53:20'),
(242, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"2nd9jjha97sgfMj5SURJxj3tH9YOJqKuaEoppbRDAQUtOYRRe0SG5159yO5y\"},\"old\":{\"remember_token\":\"9Kt6nMJBzfuCX4lGQjxTCVjyQZEKu87viPVhLQzzT1Q4YSDvRo3P0GwSSQzu\"}}', NULL, '2022-04-24 12:57:14', '2022-04-24 12:57:14'),
(243, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 15:57:26\",\"updated_at\":\"2022-04-24 15:57:26\"},\"old\":{\"last_login\":\"2022-04-24 15:49:19\",\"updated_at\":\"2022-04-24 15:49:19\"}}', NULL, '2022-04-24 12:57:26', '2022-04-24 12:57:26'),
(244, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"Gu7eBtVEUjy4yHv8uPj8NKbzJ0jty1461KIHKqCuUGvqTX1AlIdYD6SSlYp4\"},\"old\":{\"remember_token\":\"4x43a4eqF4RMTvfh8eC7XIYkuGjyQ98aXoPcfX0z1AAAqzOqmMr2apS2GDml\"}}', NULL, '2022-04-24 13:09:13', '2022-04-24 13:09:13'),
(245, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 16:09:19\",\"updated_at\":\"2022-04-24 16:09:19\"},\"old\":{\"last_login\":\"2022-04-24 15:31:04\",\"updated_at\":\"2022-04-24 15:31:04\"}}', NULL, '2022-04-24 13:09:19', '2022-04-24 13:09:19'),
(246, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"JIKJZh45pZftr6oXDXcKXjlQWwJeKa99CmZX5i11AfBcBwZRf4foyhMEBg4j\"},\"old\":{\"remember_token\":\"xq1KlalVpO5S2wuSp7IzGRvhF70LSAETVbERoaMnDXX1dDeQugyPop8C5xUR\"}}', NULL, '2022-04-24 13:54:00', '2022-04-24 13:54:00'),
(247, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 16:54:07\",\"updated_at\":\"2022-04-24 16:54:07\"},\"old\":{\"last_login\":\"2022-04-24 15:53:20\",\"updated_at\":\"2022-04-24 15:53:20\"}}', NULL, '2022-04-24 13:54:07', '2022-04-24 13:54:07'),
(248, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"vKHuEM12E6b0xPHCtfV5aiY0IMBD55dHgmOtDbkj6pGABCQ4wesCy7mKT5so\"},\"old\":{\"remember_token\":\"2nd9jjha97sgfMj5SURJxj3tH9YOJqKuaEoppbRDAQUtOYRRe0SG5159yO5y\"}}', NULL, '2022-04-24 13:59:09', '2022-04-24 13:59:09'),
(249, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 16:59:22\",\"updated_at\":\"2022-04-24 16:59:22\"},\"old\":{\"last_login\":\"2022-04-24 15:57:26\",\"updated_at\":\"2022-04-24 15:57:26\"}}', NULL, '2022-04-24 13:59:22', '2022-04-24 13:59:22'),
(250, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"KQKBxNqiVewmlFzEHrjSBo9A1mIQZ17c5mGuP0kxWdbBzSYLeRWRj8R1xl9j\"},\"old\":{\"remember_token\":\"Gu7eBtVEUjy4yHv8uPj8NKbzJ0jty1461KIHKqCuUGvqTX1AlIdYD6SSlYp4\"}}', NULL, '2022-04-24 13:59:51', '2022-04-24 13:59:51'),
(251, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 16:59:59\",\"updated_at\":\"2022-04-24 16:59:59\"},\"old\":{\"last_login\":\"2022-04-19 15:23:28\",\"updated_at\":\"2022-04-19 15:23:28\"}}', NULL, '2022-04-24 13:59:59', '2022-04-24 13:59:59'),
(252, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"DEWrs6Hq6t4lo7XH0mkNcBkzg1V7xX0c274KSyRKbrlSFhldIHx7yTzjwJ4R\"},\"old\":{\"remember_token\":\"smTUpQV1DQtWyl6wlfjLCzsGVaIiGDctYafnOBxeoEwOSNrRuxLR1r45kW09\"}}', NULL, '2022-04-24 14:00:27', '2022-04-24 14:00:27'),
(253, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 17:00:37\",\"updated_at\":\"2022-04-24 17:00:37\"},\"old\":{\"last_login\":\"2022-04-24 16:54:07\",\"updated_at\":\"2022-04-24 16:54:07\"}}', NULL, '2022-04-24 14:00:37', '2022-04-24 14:00:37'),
(254, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"betknfQIHB1VC3xUag4Zk0fsfXmH2wv8FDsEczc1NmP6qJHDom9DMATXIKo6\"},\"old\":{\"remember_token\":\"vKHuEM12E6b0xPHCtfV5aiY0IMBD55dHgmOtDbkj6pGABCQ4wesCy7mKT5so\"}}', NULL, '2022-04-24 14:01:13', '2022-04-24 14:01:13'),
(255, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 17:01:24\",\"updated_at\":\"2022-04-24 17:01:24\"},\"old\":{\"last_login\":\"2022-04-24 16:59:22\",\"updated_at\":\"2022-04-24 16:59:22\"}}', NULL, '2022-04-24 14:01:24', '2022-04-24 14:01:24'),
(256, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"BQjAvvQFQxiumMzNcDU90Q8v4ob5OrgEdtXg9gi6OPoACu4TBvIumCjC430s\"},\"old\":{\"remember_token\":\"KQKBxNqiVewmlFzEHrjSBo9A1mIQZ17c5mGuP0kxWdbBzSYLeRWRj8R1xl9j\"}}', NULL, '2022-04-24 14:01:42', '2022-04-24 14:01:42');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `event`, `causer_id`, `causer_type`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(257, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 17:02:36\",\"updated_at\":\"2022-04-24 17:02:36\"},\"old\":{\"last_login\":\"2022-04-24 17:00:37\",\"updated_at\":\"2022-04-24 17:00:37\"}}', NULL, '2022-04-24 14:02:36', '2022-04-24 14:02:36'),
(258, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"UrhSCoumhbQAw5ltj777ee7RZYNnihWP2ktgfgtfdEhUIVcwAGh1qzB9WNOe\"},\"old\":{\"remember_token\":\"betknfQIHB1VC3xUag4Zk0fsfXmH2wv8FDsEczc1NmP6qJHDom9DMATXIKo6\"}}', NULL, '2022-04-24 14:03:35', '2022-04-24 14:03:35'),
(259, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 17:03:45\",\"updated_at\":\"2022-04-24 17:03:45\"},\"old\":{\"last_login\":\"2022-04-24 17:01:24\",\"updated_at\":\"2022-04-24 17:01:24\"}}', NULL, '2022-04-24 14:03:45', '2022-04-24 14:03:45'),
(260, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"UneMCr99xvZoXaeYUH9xdKYTEWaFdPaY5WEJheB7gazvL19ZgsuzhHBNAMO5\"},\"old\":{\"remember_token\":\"BQjAvvQFQxiumMzNcDU90Q8v4ob5OrgEdtXg9gi6OPoACu4TBvIumCjC430s\"}}', NULL, '2022-04-24 14:20:27', '2022-04-24 14:20:27'),
(261, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 17:20:33\",\"updated_at\":\"2022-04-24 17:20:33\"},\"old\":{\"last_login\":\"2022-04-24 17:02:36\",\"updated_at\":\"2022-04-24 17:02:36\"}}', NULL, '2022-04-24 14:20:33', '2022-04-24 14:20:33'),
(262, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"5HuN26AGZVYbXpYdjTm6ZHw1EhCyaOmdD8ER9H4dZqf707ZJFhSQDfXtc6sM\"},\"old\":{\"remember_token\":\"UrhSCoumhbQAw5ltj777ee7RZYNnihWP2ktgfgtfdEhUIVcwAGh1qzB9WNOe\"}}', NULL, '2022-04-24 14:22:03', '2022-04-24 14:22:03'),
(263, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 17:22:11\",\"updated_at\":\"2022-04-24 17:22:11\"},\"old\":{\"last_login\":\"2022-04-24 17:03:45\",\"updated_at\":\"2022-04-24 17:03:45\"}}', NULL, '2022-04-24 14:22:11', '2022-04-24 14:22:11'),
(264, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"WzQhnJSnloRX3XUO77N06tUf4cOK83fYwViSwkMZpiZnoTNaIVXpO1ZE8D7k\"},\"old\":{\"remember_token\":\"UneMCr99xvZoXaeYUH9xdKYTEWaFdPaY5WEJheB7gazvL19ZgsuzhHBNAMO5\"}}', NULL, '2022-04-24 14:22:33', '2022-04-24 14:22:33'),
(265, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 17:22:38\",\"updated_at\":\"2022-04-24 17:22:38\"},\"old\":{\"last_login\":\"2022-04-24 17:20:33\",\"updated_at\":\"2022-04-24 17:20:33\"}}', NULL, '2022-04-24 14:22:38', '2022-04-24 14:22:38'),
(266, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"tvNd6XbfmgdNgdLYSFfD6pgjPNO4RPzQusVONOoU976w7CmJVyqDKezGbozl\"},\"old\":{\"remember_token\":\"5HuN26AGZVYbXpYdjTm6ZHw1EhCyaOmdD8ER9H4dZqf707ZJFhSQDfXtc6sM\"}}', NULL, '2022-04-24 14:23:47', '2022-04-24 14:23:47'),
(267, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 17:23:56\",\"updated_at\":\"2022-04-24 17:23:56\"},\"old\":{\"last_login\":\"2022-04-24 17:22:11\",\"updated_at\":\"2022-04-24 17:22:11\"}}', NULL, '2022-04-24 14:23:56', '2022-04-24 14:23:56'),
(268, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"qK1ACp0aSTxxDUgV14sXWXdcoQFYNDIHzfrRxVvA4hmlVCjAEcVopGIqZ1lz\"},\"old\":{\"remember_token\":\"WzQhnJSnloRX3XUO77N06tUf4cOK83fYwViSwkMZpiZnoTNaIVXpO1ZE8D7k\"}}', NULL, '2022-04-24 14:26:49', '2022-04-24 14:26:49'),
(269, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 17:26:55\",\"updated_at\":\"2022-04-24 17:26:55\"},\"old\":{\"last_login\":\"2022-04-24 17:22:38\",\"updated_at\":\"2022-04-24 17:22:38\"}}', NULL, '2022-04-24 14:26:55', '2022-04-24 14:26:55'),
(270, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"iana2UA9kfG5l9447WSm24U1oQ2qX55XmPUHUDyTHPfo1zRztaeAWRGsYlgL\"},\"old\":{\"remember_token\":\"tvNd6XbfmgdNgdLYSFfD6pgjPNO4RPzQusVONOoU976w7CmJVyqDKezGbozl\"}}', NULL, '2022-04-24 14:27:49', '2022-04-24 14:27:49'),
(271, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 17:27:58\",\"updated_at\":\"2022-04-24 17:27:58\"},\"old\":{\"last_login\":\"2022-04-24 17:23:56\",\"updated_at\":\"2022-04-24 17:23:56\"}}', NULL, '2022-04-24 14:27:58', '2022-04-24 14:27:58'),
(272, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"ftqgl3vyjGOPBzNodwThDI9HlupzakX86wKwTGHJ5jDLmi3pwHMHL8gqgugX\"},\"old\":{\"remember_token\":\"qK1ACp0aSTxxDUgV14sXWXdcoQFYNDIHzfrRxVvA4hmlVCjAEcVopGIqZ1lz\"}}', NULL, '2022-04-24 14:32:26', '2022-04-24 14:32:26'),
(273, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 17:33:59\",\"updated_at\":\"2022-04-24 17:33:59\"},\"old\":{\"last_login\":\"2022-04-24 17:27:58\",\"updated_at\":\"2022-04-24 17:27:58\"}}', NULL, '2022-04-24 14:33:59', '2022-04-24 14:33:59'),
(274, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 20:37:12\",\"updated_at\":\"2022-04-24 20:37:12\"},\"old\":{\"last_login\":\"2022-04-24 17:33:59\",\"updated_at\":\"2022-04-24 17:33:59\"}}', NULL, '2022-04-24 17:37:13', '2022-04-24 17:37:13'),
(275, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"p5pBi3hHjAFzW1nrfeWuoG0pcOJIQt2N4J7SvQa0wrQODWEFlDfrP9hCMdti\"},\"old\":{\"remember_token\":\"ftqgl3vyjGOPBzNodwThDI9HlupzakX86wKwTGHJ5jDLmi3pwHMHL8gqgugX\"}}', NULL, '2022-04-24 17:37:52', '2022-04-24 17:37:52'),
(276, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 20:37:59\",\"updated_at\":\"2022-04-24 20:37:59\"},\"old\":{\"last_login\":\"2022-04-24 17:26:55\",\"updated_at\":\"2022-04-24 17:26:55\"}}', NULL, '2022-04-24 17:37:59', '2022-04-24 17:37:59'),
(277, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"sUPHk167WMYOGcpJ7yeymE2poqZZmFNwvWMRwXU88uL5wQrt5VGfY63Gs1JL\"},\"old\":{\"remember_token\":\"iana2UA9kfG5l9447WSm24U1oQ2qX55XmPUHUDyTHPfo1zRztaeAWRGsYlgL\"}}', NULL, '2022-04-24 17:38:38', '2022-04-24 17:38:38'),
(278, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 20:38:46\",\"updated_at\":\"2022-04-24 20:38:46\"},\"old\":{\"last_login\":\"2022-04-24 20:37:12\",\"updated_at\":\"2022-04-24 20:37:12\"}}', NULL, '2022-04-24 17:38:46', '2022-04-24 17:38:46'),
(279, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"ZX7wrr97qZUl0ZXniBBqBNha0mPqhwSkJm3gAwtKTLEEjz1YebKBFeNMRHi1\"},\"old\":{\"remember_token\":\"p5pBi3hHjAFzW1nrfeWuoG0pcOJIQt2N4J7SvQa0wrQODWEFlDfrP9hCMdti\"}}', NULL, '2022-04-24 17:44:33', '2022-04-24 17:44:33'),
(280, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 20:44:42\",\"updated_at\":\"2022-04-24 20:44:42\"},\"old\":{\"last_login\":\"2022-04-24 20:37:59\",\"updated_at\":\"2022-04-24 20:37:59\"}}', NULL, '2022-04-24 17:44:42', '2022-04-24 17:44:42'),
(281, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"hncxmXwx49BFXndwDYObrWVBTM3g3pmCjzIxRiQBSVlkf8iY7kS82HfkO8US\"},\"old\":{\"remember_token\":\"sUPHk167WMYOGcpJ7yeymE2poqZZmFNwvWMRwXU88uL5wQrt5VGfY63Gs1JL\"}}', NULL, '2022-04-24 17:45:53', '2022-04-24 17:45:53'),
(282, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 20:46:00\",\"updated_at\":\"2022-04-24 20:46:00\"},\"old\":{\"last_login\":\"2022-04-24 20:38:46\",\"updated_at\":\"2022-04-24 20:38:46\"}}', NULL, '2022-04-24 17:46:00', '2022-04-24 17:46:00'),
(283, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"Hk4t2tZ0VXtDTvgxmYaiYSX9BlF8BObhNhNN6PJJdxuTD7Nuiar88OcQGW3L\"},\"old\":{\"remember_token\":\"ZX7wrr97qZUl0ZXniBBqBNha0mPqhwSkJm3gAwtKTLEEjz1YebKBFeNMRHi1\"}}', NULL, '2022-04-24 18:01:56', '2022-04-24 18:01:56'),
(284, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 21:02:02\",\"updated_at\":\"2022-04-24 21:02:02\"},\"old\":{\"last_login\":\"2022-04-24 16:09:19\",\"updated_at\":\"2022-04-24 16:09:19\"}}', NULL, '2022-04-24 18:02:02', '2022-04-24 18:02:02'),
(285, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"6p0s8S8pj3DSu1kegr4oNsL4QObeGs21W7CXJLcQHkvF6RR2gnjDmCfLVQkm\"},\"old\":{\"remember_token\":\"JIKJZh45pZftr6oXDXcKXjlQWwJeKa99CmZX5i11AfBcBwZRf4foyhMEBg4j\"}}', NULL, '2022-04-24 18:08:52', '2022-04-24 18:08:52'),
(286, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 21:08:59\",\"updated_at\":\"2022-04-24 21:08:59\"},\"old\":{\"last_login\":\"2022-04-24 20:44:42\",\"updated_at\":\"2022-04-24 20:44:42\"}}', NULL, '2022-04-24 18:08:59', '2022-04-24 18:08:59'),
(287, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"gwBviljSQw4wosfSCA9naAbypb03q4OEPTaFZcp0kDyUjI8cAmRraZFOiE5x\"},\"old\":{\"remember_token\":\"hncxmXwx49BFXndwDYObrWVBTM3g3pmCjzIxRiQBSVlkf8iY7kS82HfkO8US\"}}', NULL, '2022-04-24 18:09:49', '2022-04-24 18:09:49'),
(288, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 21:10:02\",\"updated_at\":\"2022-04-24 21:10:02\"},\"old\":{\"last_login\":\"2022-04-24 20:46:00\",\"updated_at\":\"2022-04-24 20:46:00\"}}', NULL, '2022-04-24 18:10:02', '2022-04-24 18:10:02'),
(289, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"ijPQdo2nqW1YKyLdefbHudUss34PPpq7MYsBeNjpOzPARfV4J4oc5G0cYz74\"},\"old\":{\"remember_token\":\"Hk4t2tZ0VXtDTvgxmYaiYSX9BlF8BObhNhNN6PJJdxuTD7Nuiar88OcQGW3L\"}}', NULL, '2022-04-24 18:10:25', '2022-04-24 18:10:25'),
(290, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 21:10:31\",\"updated_at\":\"2022-04-24 21:10:31\"},\"old\":{\"last_login\":\"2022-04-24 21:08:59\",\"updated_at\":\"2022-04-24 21:08:59\"}}', NULL, '2022-04-24 18:10:31', '2022-04-24 18:10:31'),
(291, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"hv1FCqmxDyRGw5oEVAAp17mOF2uTN2sR4Iw4ALn52cGgVbePsswXDmj6wWFR\"},\"old\":{\"remember_token\":\"gwBviljSQw4wosfSCA9naAbypb03q4OEPTaFZcp0kDyUjI8cAmRraZFOiE5x\"}}', NULL, '2022-04-24 18:10:53', '2022-04-24 18:10:53'),
(292, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 21:11:00\",\"updated_at\":\"2022-04-24 21:11:00\"},\"old\":{\"last_login\":\"2022-04-24 21:02:02\",\"updated_at\":\"2022-04-24 21:02:02\"}}', NULL, '2022-04-24 18:11:00', '2022-04-24 18:11:00'),
(293, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"zGkTmfL8R1n0AzsYKJy6sMf9iNeMCtFehLcslBkwXRk17rL3IyQFnjRazUp6\"},\"old\":{\"remember_token\":\"6p0s8S8pj3DSu1kegr4oNsL4QObeGs21W7CXJLcQHkvF6RR2gnjDmCfLVQkm\"}}', NULL, '2022-04-24 18:11:21', '2022-04-24 18:11:21'),
(294, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 21:11:27\",\"updated_at\":\"2022-04-24 21:11:27\"},\"old\":{\"last_login\":\"2022-04-24 21:10:31\",\"updated_at\":\"2022-04-24 21:10:31\"}}', NULL, '2022-04-24 18:11:27', '2022-04-24 18:11:27'),
(295, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"9tqa4OEkIDXj8KvcDHzYFf0nNL0Vtnhqno8Pun5BHfc62GkqEKVNJbzzCZIh\"},\"old\":{\"remember_token\":\"hv1FCqmxDyRGw5oEVAAp17mOF2uTN2sR4Iw4ALn52cGgVbePsswXDmj6wWFR\"}}', NULL, '2022-04-24 18:12:57', '2022-04-24 18:12:57'),
(296, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 21:13:06\",\"updated_at\":\"2022-04-24 21:13:06\"},\"old\":{\"last_login\":\"2022-04-24 21:10:02\",\"updated_at\":\"2022-04-24 21:10:02\"}}', NULL, '2022-04-24 18:13:06', '2022-04-24 18:13:06'),
(297, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"Ngq1eDoCkYO4bRzUxID4zRd66otQdnwXMcAYrw1OAwhte4Du8dZeffSmHa7w\"},\"old\":{\"remember_token\":\"ijPQdo2nqW1YKyLdefbHudUss34PPpq7MYsBeNjpOzPARfV4J4oc5G0cYz74\"}}', NULL, '2022-04-24 18:13:36', '2022-04-24 18:13:36'),
(298, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 21:14:06\",\"updated_at\":\"2022-04-24 21:14:06\"},\"old\":{\"last_login\":\"2022-04-24 21:11:27\",\"updated_at\":\"2022-04-24 21:11:27\"}}', NULL, '2022-04-24 18:14:06', '2022-04-24 18:14:06'),
(299, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"UG53ILYn1EWSw18sWvaHCtfa1vsHDRDoZIWCueIJ65vRTUvI1mzDEu12Ww9s\"},\"old\":{\"remember_token\":\"9tqa4OEkIDXj8KvcDHzYFf0nNL0Vtnhqno8Pun5BHfc62GkqEKVNJbzzCZIh\"}}', NULL, '2022-04-24 18:20:46', '2022-04-24 18:20:46'),
(300, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 21:20:54\",\"updated_at\":\"2022-04-24 21:20:54\"},\"old\":{\"last_login\":\"2022-04-24 21:13:06\",\"updated_at\":\"2022-04-24 21:13:06\"}}', NULL, '2022-04-24 18:20:54', '2022-04-24 18:20:54'),
(301, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"y8daYRfyGmpF6321BmjT9BLte9CwlEqXQ9ngciAnG3HJ9Z7mC1Cg3phk1MGP\"},\"old\":{\"remember_token\":\"Ngq1eDoCkYO4bRzUxID4zRd66otQdnwXMcAYrw1OAwhte4Du8dZeffSmHa7w\"}}', NULL, '2022-04-24 18:21:11', '2022-04-24 18:21:11'),
(302, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 21:21:19\",\"updated_at\":\"2022-04-24 21:21:19\"},\"old\":{\"last_login\":\"2022-04-24 21:20:54\",\"updated_at\":\"2022-04-24 21:20:54\"}}', NULL, '2022-04-24 18:21:19', '2022-04-24 18:21:19'),
(303, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"BW35EtyrqyjV5dR2B3pMx0qJapdQB34RipgMjHpWyojISz5GHOeBeQ0k0P0u\"},\"old\":{\"remember_token\":\"y8daYRfyGmpF6321BmjT9BLte9CwlEqXQ9ngciAnG3HJ9Z7mC1Cg3phk1MGP\"}}', NULL, '2022-04-24 18:21:31', '2022-04-24 18:21:31'),
(304, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 21:21:36\",\"updated_at\":\"2022-04-24 21:21:36\"},\"old\":{\"last_login\":\"2022-04-24 21:14:06\",\"updated_at\":\"2022-04-24 21:14:06\"}}', NULL, '2022-04-24 18:21:36', '2022-04-24 18:21:36'),
(305, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"ZTkDf6rFxNnUhdr82Dws2DOVdCV8T3nMYbpqOrGE3KieYnh58lSDH7gzX2gH\"},\"old\":{\"remember_token\":\"UG53ILYn1EWSw18sWvaHCtfa1vsHDRDoZIWCueIJ65vRTUvI1mzDEu12Ww9s\"}}', NULL, '2022-04-24 18:28:45', '2022-04-24 18:28:45'),
(306, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 21:28:53\",\"updated_at\":\"2022-04-24 21:28:53\"},\"old\":{\"last_login\":\"2022-04-24 21:21:19\",\"updated_at\":\"2022-04-24 21:21:19\"}}', NULL, '2022-04-24 18:28:53', '2022-04-24 18:28:53'),
(307, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"u04hWogpxpASMNcV6ze17lE9DPXbJmulLlsKJkveFtnG24q3mv7ZWJYEPugC\"},\"old\":{\"remember_token\":\"BW35EtyrqyjV5dR2B3pMx0qJapdQB34RipgMjHpWyojISz5GHOeBeQ0k0P0u\"}}', NULL, '2022-04-24 18:30:19', '2022-04-24 18:30:19'),
(308, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 21:31:33\",\"updated_at\":\"2022-04-24 21:31:33\"},\"old\":{\"last_login\":\"2022-04-24 21:28:53\",\"updated_at\":\"2022-04-24 21:28:53\"}}', NULL, '2022-04-24 18:31:33', '2022-04-24 18:31:33'),
(309, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"gku0d8B9xTJFFpzc31JpUOoGPDEWvy5CUdOeCxa4EPUF3m223J1WUqCpqUqx\"},\"old\":{\"remember_token\":\"u04hWogpxpASMNcV6ze17lE9DPXbJmulLlsKJkveFtnG24q3mv7ZWJYEPugC\"}}', NULL, '2022-04-24 18:31:39', '2022-04-24 18:31:39'),
(310, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 21:31:46\",\"updated_at\":\"2022-04-24 21:31:46\"},\"old\":{\"last_login\":\"2022-04-24 21:21:36\",\"updated_at\":\"2022-04-24 21:21:36\"}}', NULL, '2022-04-24 18:31:46', '2022-04-24 18:31:46'),
(311, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"7kb4fxRWgE6QijlmHG9xo0zVKGPFzs4Y1frB5k9APa8MKVtaoMW6MHlI2LTU\"},\"old\":{\"remember_token\":\"ZTkDf6rFxNnUhdr82Dws2DOVdCV8T3nMYbpqOrGE3KieYnh58lSDH7gzX2gH\"}}', NULL, '2022-04-24 18:44:27', '2022-04-24 18:44:27'),
(312, 'default', 'updated', 8, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 21:44:32\",\"updated_at\":\"2022-04-24 21:44:32\"},\"old\":{\"last_login\":null,\"updated_at\":\"2022-04-24 15:50:13\"}}', NULL, '2022-04-24 18:44:32', '2022-04-24 18:44:32'),
(313, 'default', 'updated', 8, 'App\\Components\\User\\Models\\User', NULL, 8, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"tMKTMLIOLvbHmjSuS2A6QfSgDPYfpdrgF3fajXlBHK43X8hN3qZ9amQnYkfM\"},\"old\":{\"remember_token\":null}}', NULL, '2022-04-24 18:44:47', '2022-04-24 18:44:47'),
(314, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 21:45:01\",\"updated_at\":\"2022-04-24 21:45:01\"},\"old\":{\"last_login\":\"2022-04-24 21:31:33\",\"updated_at\":\"2022-04-24 21:31:33\"}}', NULL, '2022-04-24 18:45:01', '2022-04-24 18:45:01'),
(315, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"vrttaXPE2KwVIbt58I1ZR9WW5O8xsfZJuepy3An65dE42kpihcem1J6vw3s5\"},\"old\":{\"remember_token\":\"gku0d8B9xTJFFpzc31JpUOoGPDEWvy5CUdOeCxa4EPUF3m223J1WUqCpqUqx\"}}', NULL, '2022-04-24 18:45:19', '2022-04-24 18:45:19'),
(316, 'default', 'updated', 8, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 21:45:24\",\"updated_at\":\"2022-04-24 21:45:24\"},\"old\":{\"last_login\":\"2022-04-24 21:44:32\",\"updated_at\":\"2022-04-24 21:44:32\"}}', NULL, '2022-04-24 18:45:24', '2022-04-24 18:45:24'),
(317, 'default', 'updated', 8, 'App\\Components\\User\\Models\\User', NULL, 8, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"das4Na185FQXtAO5xE1BpCKjuzjFteu2YVjkEecFqGLqidJMR3t7wTpCDY0D\"},\"old\":{\"remember_token\":\"tMKTMLIOLvbHmjSuS2A6QfSgDPYfpdrgF3fajXlBHK43X8hN3qZ9amQnYkfM\"}}', NULL, '2022-04-24 18:45:35', '2022-04-24 18:45:35'),
(318, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-24 21:46:36\",\"updated_at\":\"2022-04-24 21:46:36\"},\"old\":{\"last_login\":\"2022-04-24 21:45:01\",\"updated_at\":\"2022-04-24 21:45:01\"}}', NULL, '2022-04-24 18:46:36', '2022-04-24 18:46:36'),
(319, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-29 06:52:29\",\"updated_at\":\"2022-04-29 06:52:29\"},\"old\":{\"last_login\":\"2022-04-24 21:31:46\",\"updated_at\":\"2022-04-24 21:31:46\"}}', NULL, '2022-04-29 03:52:29', '2022-04-29 03:52:29'),
(320, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"qPR44XelvwwSXuA7fmIRZICrUieE3SiNJeL63PpT1Pj8aXpvG6Stx56z2TLp\"},\"old\":{\"remember_token\":\"7kb4fxRWgE6QijlmHG9xo0zVKGPFzs4Y1frB5k9APa8MKVtaoMW6MHlI2LTU\"}}', NULL, '2022-04-29 03:52:37', '2022-04-29 03:52:37'),
(321, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-29 06:52:51\",\"updated_at\":\"2022-04-29 06:52:51\"},\"old\":{\"last_login\":\"2022-04-24 21:46:36\",\"updated_at\":\"2022-04-24 21:46:36\"}}', NULL, '2022-04-29 03:52:51', '2022-04-29 03:52:51'),
(322, 'default', 'created', 15, 'App\\ProjectTask', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"project_id\":5,\"task_id\":null,\"category_id\":4,\"subject\":\"rr\",\"hourly_rate\":\"0.00\",\"start_date\":\"2022-04-12 17:34:00\",\"due_date\":\"2022-04-04 16:38:00\",\"priority\":\"medium\",\"description\":null,\"created_by\":2,\"show_to_customer\":1,\"is_completed\":0,\"created_at\":\"2022-04-29 06:53:49\",\"updated_at\":\"2022-04-29 06:53:49\"}}', NULL, '2022-04-29 03:53:49', '2022-04-29 03:53:49'),
(323, 'default', 'created', 4, 'App\\Note', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"notable_id\":15,\"notable_type\":\"App\\\\ProjectTask\",\"heading\":null,\"description\":\"test\",\"created_by\":2,\"created_at\":\"2022-04-29 07:20:16\",\"updated_at\":\"2022-04-29 07:20:16\"}}', NULL, '2022-04-29 04:20:16', '2022-04-29 04:20:16'),
(324, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"7k4mUIZv3KL8rHPHemmO6l7ewBWDYfrjA5BqW9BHcO71nyR2CVRqONDb9CcX\"},\"old\":{\"remember_token\":\"vrttaXPE2KwVIbt58I1ZR9WW5O8xsfZJuepy3An65dE42kpihcem1J6vw3s5\"}}', NULL, '2022-04-29 07:24:06', '2022-04-29 07:24:06'),
(325, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-29 10:24:12\",\"updated_at\":\"2022-04-29 10:24:12\"},\"old\":{\"last_login\":\"2022-04-29 06:52:29\",\"updated_at\":\"2022-04-29 06:52:29\"}}', NULL, '2022-04-29 07:24:12', '2022-04-29 07:24:12'),
(326, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-29 11:27:06\",\"updated_at\":\"2022-04-29 11:27:06\"},\"old\":{\"last_login\":\"2022-04-29 10:24:12\",\"updated_at\":\"2022-04-29 10:24:12\"}}', NULL, '2022-04-29 08:27:06', '2022-04-29 08:27:06'),
(327, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"JunBC67EIbJQ3Weuu38jKKCMZlGkhqOCFVvqItlfcrRFkZFdmQf6IlILSRHU\"},\"old\":{\"remember_token\":\"qPR44XelvwwSXuA7fmIRZICrUieE3SiNJeL63PpT1Pj8aXpvG6Stx56z2TLp\"}}', NULL, '2022-04-29 10:49:53', '2022-04-29 10:49:53'),
(328, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-29 13:49:59\",\"updated_at\":\"2022-04-29 13:49:59\"},\"old\":{\"last_login\":\"2022-04-24 21:11:00\",\"updated_at\":\"2022-04-24 21:11:00\"}}', NULL, '2022-04-29 10:49:59', '2022-04-29 10:49:59'),
(329, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"W2lYy0E98toi0uE0bMBzn2zHB2Yh6EraIBvk5BK1G5BdaprvWr0n7BkH0Ssm\"},\"old\":{\"remember_token\":\"zGkTmfL8R1n0AzsYKJy6sMf9iNeMCtFehLcslBkwXRk17rL3IyQFnjRazUp6\"}}', NULL, '2022-04-29 11:06:41', '2022-04-29 11:06:41'),
(330, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-29 14:06:53\",\"updated_at\":\"2022-04-29 14:06:53\"},\"old\":{\"last_login\":\"2022-04-29 06:52:51\",\"updated_at\":\"2022-04-29 06:52:51\"}}', NULL, '2022-04-29 11:06:53', '2022-04-29 11:06:53'),
(331, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"6XsflYTgovXwc56nrOrJ0ZMjrZP7PHpWQtGtBANvrSPcng5hPsFuQojQEmOk\"},\"old\":{\"remember_token\":\"7k4mUIZv3KL8rHPHemmO6l7ewBWDYfrjA5BqW9BHcO71nyR2CVRqONDb9CcX\"}}', NULL, '2022-04-29 11:08:57', '2022-04-29 11:08:57'),
(332, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-29 14:09:03\",\"updated_at\":\"2022-04-29 14:09:03\"},\"old\":{\"last_login\":\"2022-04-29 13:49:59\",\"updated_at\":\"2022-04-29 13:49:59\"}}', NULL, '2022-04-29 11:09:03', '2022-04-29 11:09:03'),
(333, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"JEfgr7nB6X2VSY7mOCqbLrQEf2kxOnFPN3eegYCLQDso8QPmlN4ldAY1lvy3\"},\"old\":{\"remember_token\":\"W2lYy0E98toi0uE0bMBzn2zHB2Yh6EraIBvk5BK1G5BdaprvWr0n7BkH0Ssm\"}}', NULL, '2022-04-29 11:17:32', '2022-04-29 11:17:32'),
(334, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-29 14:17:41\",\"updated_at\":\"2022-04-29 14:17:41\"},\"old\":{\"last_login\":\"2022-04-29 14:06:53\",\"updated_at\":\"2022-04-29 14:06:53\"}}', NULL, '2022-04-29 11:17:41', '2022-04-29 11:17:41'),
(335, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"wM42VrEzzOHOQQpwnACcSspUamPKWmzfKmcrE40S7l5hxtm1Wh3hHRA5tdrn\"},\"old\":{\"remember_token\":\"6XsflYTgovXwc56nrOrJ0ZMjrZP7PHpWQtGtBANvrSPcng5hPsFuQojQEmOk\"}}', NULL, '2022-04-29 11:22:05', '2022-04-29 11:22:05'),
(336, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-29 14:22:11\",\"updated_at\":\"2022-04-29 14:22:11\"},\"old\":{\"last_login\":\"2022-04-29 14:09:03\",\"updated_at\":\"2022-04-29 14:09:03\"}}', NULL, '2022-04-29 11:22:11', '2022-04-29 11:22:11'),
(337, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"ofhQW2gorbaoqPqrOQJogKB3mcBZFUIpwOsM7n4QU32iAso6wUT7miwkRIzS\"},\"old\":{\"remember_token\":\"JEfgr7nB6X2VSY7mOCqbLrQEf2kxOnFPN3eegYCLQDso8QPmlN4ldAY1lvy3\"}}', NULL, '2022-04-29 11:24:05', '2022-04-29 11:24:05'),
(338, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-29 14:24:16\",\"updated_at\":\"2022-04-29 14:24:16\"},\"old\":{\"last_login\":\"2022-04-29 14:17:41\",\"updated_at\":\"2022-04-29 14:17:41\"}}', NULL, '2022-04-29 11:24:16', '2022-04-29 11:24:16'),
(339, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-30 04:41:05\",\"updated_at\":\"2022-04-30 04:41:05\"},\"old\":{\"last_login\":\"2022-04-29 14:22:11\",\"updated_at\":\"2022-04-29 14:22:11\"}}', NULL, '2022-04-30 01:41:06', '2022-04-30 01:41:06'),
(340, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"pRWvTrgwMdCG8JmezEtFFOWmeLAaECJwyfatSu9KZDIlt9RGNKFSuMo0l8sB\"},\"old\":{\"remember_token\":\"ofhQW2gorbaoqPqrOQJogKB3mcBZFUIpwOsM7n4QU32iAso6wUT7miwkRIzS\"}}', NULL, '2022-04-30 01:41:44', '2022-04-30 01:41:44'),
(341, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-30 04:42:00\",\"updated_at\":\"2022-04-30 04:42:00\"},\"old\":{\"last_login\":\"2022-04-24 16:59:59\",\"updated_at\":\"2022-04-24 16:59:59\"}}', NULL, '2022-04-30 01:42:00', '2022-04-30 01:42:00'),
(342, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"O5dukBgu8AnmCNWPXzBZ4wmr5HNi7uDq9o94flKYYYk2OWklxmu80zX3OgYW\"},\"old\":{\"remember_token\":\"DEWrs6Hq6t4lo7XH0mkNcBkzg1V7xX0c274KSyRKbrlSFhldIHx7yTzjwJ4R\"}}', NULL, '2022-04-30 02:04:00', '2022-04-30 02:04:00'),
(343, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-30 05:04:12\",\"updated_at\":\"2022-04-30 05:04:12\"},\"old\":{\"last_login\":\"2022-04-29 14:24:16\",\"updated_at\":\"2022-04-29 14:24:16\"}}', NULL, '2022-04-30 02:04:12', '2022-04-30 02:04:12'),
(344, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"Urpnf20o2GGuTrLlVc3Cf1LDMB96yIqWTTgvhamWGgdyoMoFZrZ7vBFUd6DF\"},\"old\":{\"remember_token\":\"wM42VrEzzOHOQQpwnACcSspUamPKWmzfKmcrE40S7l5hxtm1Wh3hHRA5tdrn\"}}', NULL, '2022-04-30 02:08:52', '2022-04-30 02:08:52'),
(345, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-04-30 05:09:03\",\"updated_at\":\"2022-04-30 05:09:03\"},\"old\":{\"last_login\":\"2022-04-30 04:42:00\",\"updated_at\":\"2022-04-30 04:42:00\"}}', NULL, '2022-04-30 02:09:03', '2022-04-30 02:09:03'),
(346, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-02 07:23:16\",\"updated_at\":\"2022-05-02 07:23:16\"},\"old\":{\"last_login\":\"2022-04-30 05:04:12\",\"updated_at\":\"2022-04-30 05:04:12\"}}', NULL, '2022-05-02 04:23:17', '2022-05-02 04:23:17'),
(347, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"xgsMDHtkBhGKLbUaRQlSJ57fJLSfVvw33KDGtLZjBEotzePW60U5cn0ysBDC\"},\"old\":{\"remember_token\":\"Urpnf20o2GGuTrLlVc3Cf1LDMB96yIqWTTgvhamWGgdyoMoFZrZ7vBFUd6DF\"}}', NULL, '2022-05-02 04:23:36', '2022-05-02 04:23:36'),
(348, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-02 07:23:45\",\"updated_at\":\"2022-05-02 07:23:45\"},\"old\":{\"last_login\":\"2022-04-30 04:41:05\",\"updated_at\":\"2022-04-30 04:41:05\"}}', NULL, '2022-05-02 04:23:45', '2022-05-02 04:23:45'),
(349, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"T7lBL0vOADJLpWUmHXC1kepBkvj1VX6qX6pYxCvDkVSCWAtAz7YVNHKVnnMS\"},\"old\":{\"remember_token\":\"pRWvTrgwMdCG8JmezEtFFOWmeLAaECJwyfatSu9KZDIlt9RGNKFSuMo0l8sB\"}}', NULL, '2022-05-02 04:23:57', '2022-05-02 04:23:57'),
(350, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-02 07:24:03\",\"updated_at\":\"2022-05-02 07:24:03\"},\"old\":{\"last_login\":\"2022-04-30 05:09:03\",\"updated_at\":\"2022-04-30 05:09:03\"}}', NULL, '2022-05-02 04:24:03', '2022-05-02 04:24:03'),
(351, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-03 05:24:09\",\"updated_at\":\"2022-05-03 05:24:09\"},\"old\":{\"last_login\":\"2022-05-02 07:24:03\",\"updated_at\":\"2022-05-02 07:24:03\"}}', NULL, '2022-05-03 02:24:09', '2022-05-03 02:24:09'),
(352, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"6AGbl1NfeUFEoeuxzcz6XbGpgcFKX0tNZlSKtw2AltClpUM6H7syYmQZJrHT\"},\"old\":{\"remember_token\":\"O5dukBgu8AnmCNWPXzBZ4wmr5HNi7uDq9o94flKYYYk2OWklxmu80zX3OgYW\"}}', NULL, '2022-05-03 03:41:17', '2022-05-03 03:41:17'),
(353, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-04 04:37:06\",\"updated_at\":\"2022-05-04 04:37:06\"},\"old\":{\"last_login\":\"2022-05-03 05:24:09\",\"updated_at\":\"2022-05-03 05:24:09\"}}', NULL, '2022-05-04 01:37:06', '2022-05-04 01:37:06'),
(354, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"IWy66kSE4uwkF2YtHOIC7Q7fF1uoW383d7vdqIgDPDkDNGEpXmJlKURuT2wf\"},\"old\":{\"remember_token\":\"6AGbl1NfeUFEoeuxzcz6XbGpgcFKX0tNZlSKtw2AltClpUM6H7syYmQZJrHT\"}}', NULL, '2022-05-04 01:42:41', '2022-05-04 01:42:41'),
(355, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-04 04:42:50\",\"updated_at\":\"2022-05-04 04:42:50\"},\"old\":{\"last_login\":\"2022-04-29 11:27:06\",\"updated_at\":\"2022-04-29 11:27:06\"}}', NULL, '2022-05-04 01:42:50', '2022-05-04 01:42:50'),
(356, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"mNnqnq0OCoeZtSs7wjQzMfRFi8Izirdlfvgd3Z65yTOwFQ7QMSUGR4eN209I\"},\"old\":{\"remember_token\":\"JunBC67EIbJQ3Weuu38jKKCMZlGkhqOCFVvqItlfcrRFkZFdmQf6IlILSRHU\"}}', NULL, '2022-05-04 01:54:56', '2022-05-04 01:54:56'),
(357, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-04 04:55:43\",\"updated_at\":\"2022-05-04 04:55:43\"},\"old\":{\"last_login\":\"2022-05-04 04:37:06\",\"updated_at\":\"2022-05-04 04:37:06\"}}', NULL, '2022-05-04 01:55:43', '2022-05-04 01:55:43'),
(358, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"4ljTkgmqdjBmpqo25o7kzgdvG8g95iQbcugBfFy8cs0DE3ANfCpTtWM7gsYe\"},\"old\":{\"remember_token\":\"IWy66kSE4uwkF2YtHOIC7Q7fF1uoW383d7vdqIgDPDkDNGEpXmJlKURuT2wf\"}}', NULL, '2022-05-04 01:56:00', '2022-05-04 01:56:00'),
(359, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-04 04:56:04\",\"updated_at\":\"2022-05-04 04:56:04\"},\"old\":{\"last_login\":\"2022-05-04 04:55:43\",\"updated_at\":\"2022-05-04 04:55:43\"}}', NULL, '2022-05-04 01:56:04', '2022-05-04 01:56:04'),
(360, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"v8uuU0LmmFsHDFjAMURstcHM8Y9182SGOv0RN0Cw9KUvzShopI42QSrVbyxw\"},\"old\":{\"remember_token\":\"4ljTkgmqdjBmpqo25o7kzgdvG8g95iQbcugBfFy8cs0DE3ANfCpTtWM7gsYe\"}}', NULL, '2022-05-04 01:58:05', '2022-05-04 01:58:05'),
(361, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-04 04:58:24\",\"updated_at\":\"2022-05-04 04:58:24\"},\"old\":{\"last_login\":\"2022-05-04 04:42:50\",\"updated_at\":\"2022-05-04 04:42:50\"}}', NULL, '2022-05-04 01:58:24', '2022-05-04 01:58:24'),
(362, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"H99Md5THF48Av2VQSkOvNkl6JoChpjalnngWq8jvTrt1Qj4LdPS9QU8hnckU\"},\"old\":{\"remember_token\":\"mNnqnq0OCoeZtSs7wjQzMfRFi8Izirdlfvgd3Z65yTOwFQ7QMSUGR4eN209I\"}}', NULL, '2022-05-04 02:00:29', '2022-05-04 02:00:29'),
(363, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-04 05:00:43\",\"updated_at\":\"2022-05-04 05:00:43\"},\"old\":{\"last_login\":\"2022-05-04 04:56:04\",\"updated_at\":\"2022-05-04 04:56:04\"}}', NULL, '2022-05-04 02:00:43', '2022-05-04 02:00:43'),
(364, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"huRoAJiu7luaUvzCVH5PmgR4kXwU03XtdGsERYex4lwPvp6oUrwpZFrrAgXe\"},\"old\":{\"remember_token\":\"v8uuU0LmmFsHDFjAMURstcHM8Y9182SGOv0RN0Cw9KUvzShopI42QSrVbyxw\"}}', NULL, '2022-05-04 02:01:08', '2022-05-04 02:01:08'),
(365, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-04 05:01:19\",\"updated_at\":\"2022-05-04 05:01:19\"},\"old\":{\"last_login\":\"2022-05-04 04:58:24\",\"updated_at\":\"2022-05-04 04:58:24\"}}', NULL, '2022-05-04 02:01:19', '2022-05-04 02:01:19'),
(366, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"PEOCLd6zAZFLIlDxRKNYTP63l64AB1FmUS4a6RKMnjuh5cVlMicmCgBaMgNk\"},\"old\":{\"remember_token\":\"H99Md5THF48Av2VQSkOvNkl6JoChpjalnngWq8jvTrt1Qj4LdPS9QU8hnckU\"}}', NULL, '2022-05-04 02:21:11', '2022-05-04 02:21:11'),
(367, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-04 05:21:20\",\"updated_at\":\"2022-05-04 05:21:20\"},\"old\":{\"last_login\":\"2022-05-04 05:00:43\",\"updated_at\":\"2022-05-04 05:00:43\"}}', NULL, '2022-05-04 02:21:20', '2022-05-04 02:21:20'),
(368, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"jzzs3cjCqZCYaF2DzWzXPd5LEuGEa2bdLFM0HZJjbSKOSlmUqBdEtvjgEw7d\"},\"old\":{\"remember_token\":\"huRoAJiu7luaUvzCVH5PmgR4kXwU03XtdGsERYex4lwPvp6oUrwpZFrrAgXe\"}}', NULL, '2022-05-04 03:01:11', '2022-05-04 03:01:11'),
(369, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-04 06:01:19\",\"updated_at\":\"2022-05-04 06:01:19\"},\"old\":{\"last_login\":\"2022-05-04 05:01:19\",\"updated_at\":\"2022-05-04 05:01:19\"}}', NULL, '2022-05-04 03:01:19', '2022-05-04 03:01:19'),
(370, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"dDTYMqxV9TiUEqTChmMxjn4qYfgipN1Po0fbbylKHKCspRlcgyI7Z1SDq8pD\"},\"old\":{\"remember_token\":\"PEOCLd6zAZFLIlDxRKNYTP63l64AB1FmUS4a6RKMnjuh5cVlMicmCgBaMgNk\"}}', NULL, '2022-05-04 03:40:34', '2022-05-04 03:40:34'),
(371, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-04 06:40:45\",\"updated_at\":\"2022-05-04 06:40:45\"},\"old\":{\"last_login\":\"2022-05-04 05:21:20\",\"updated_at\":\"2022-05-04 05:21:20\"}}', NULL, '2022-05-04 03:40:45', '2022-05-04 03:40:45'),
(372, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"J4PyJ2A4IYXq2jfQpxHHNUmrdyoAAAXcjCVx1Ys303OZ5IeC5JN3dqPXEFnR\"},\"old\":{\"remember_token\":\"jzzs3cjCqZCYaF2DzWzXPd5LEuGEa2bdLFM0HZJjbSKOSlmUqBdEtvjgEw7d\"}}', NULL, '2022-05-04 03:42:28', '2022-05-04 03:42:28'),
(373, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-04 06:42:35\",\"updated_at\":\"2022-05-04 06:42:35\"},\"old\":{\"last_login\":\"2022-05-02 07:23:45\",\"updated_at\":\"2022-05-02 07:23:45\"}}', NULL, '2022-05-04 03:42:35', '2022-05-04 03:42:35'),
(374, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"yYQ5wL428uj4vWcXLdv9HS3EB9mwBsw50wPykvgk378mIUQYdsJABnqQ07Sj\"},\"old\":{\"remember_token\":\"T7lBL0vOADJLpWUmHXC1kepBkvj1VX6qX6pYxCvDkVSCWAtAz7YVNHKVnnMS\"}}', NULL, '2022-05-04 03:46:22', '2022-05-04 03:46:22'),
(375, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-04 06:46:29\",\"updated_at\":\"2022-05-04 06:46:29\"},\"old\":{\"last_login\":\"2022-05-04 06:40:45\",\"updated_at\":\"2022-05-04 06:40:45\"}}', NULL, '2022-05-04 03:46:29', '2022-05-04 03:46:29'),
(376, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"KpyQ4osvS5qV3Qa0jTDiMXsfvUEnJXTYSX0Boj8FxDdgfDtBcautCDFxiE6B\"},\"old\":{\"remember_token\":\"J4PyJ2A4IYXq2jfQpxHHNUmrdyoAAAXcjCVx1Ys303OZ5IeC5JN3dqPXEFnR\"}}', NULL, '2022-05-04 03:46:40', '2022-05-04 03:46:40'),
(377, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-04 06:46:48\",\"updated_at\":\"2022-05-04 06:46:48\"},\"old\":{\"last_login\":\"2022-05-04 06:42:35\",\"updated_at\":\"2022-05-04 06:42:35\"}}', NULL, '2022-05-04 03:46:48', '2022-05-04 03:46:48'),
(378, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"ft0zokav0cyhjddqSaq5ry2TNo902RExqt855kxl8EAyPDN8G14cCnWljmiU\"},\"old\":{\"remember_token\":\"yYQ5wL428uj4vWcXLdv9HS3EB9mwBsw50wPykvgk378mIUQYdsJABnqQ07Sj\"}}', NULL, '2022-05-04 04:22:14', '2022-05-04 04:22:14'),
(379, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-04 07:22:24\",\"updated_at\":\"2022-05-04 07:22:24\"},\"old\":{\"last_login\":\"2022-05-04 06:46:48\",\"updated_at\":\"2022-05-04 06:46:48\"}}', NULL, '2022-05-04 04:22:24', '2022-05-04 04:22:24'),
(380, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-04 21:05:25\",\"updated_at\":\"2022-05-04 21:05:25\"},\"old\":{\"last_login\":\"2022-05-04 06:01:19\",\"updated_at\":\"2022-05-04 06:01:19\"}}', NULL, '2022-05-04 18:05:25', '2022-05-04 18:05:25'),
(381, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"9kufBTNhRBrQ2fwsXMY9khbw43GQcjngn61BFYi3vA60eID3Jsf6UkImSRVu\"},\"old\":{\"remember_token\":\"dDTYMqxV9TiUEqTChmMxjn4qYfgipN1Po0fbbylKHKCspRlcgyI7Z1SDq8pD\"}}', NULL, '2022-05-04 18:08:02', '2022-05-04 18:08:02'),
(382, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-04 21:08:30\",\"updated_at\":\"2022-05-04 21:08:30\"},\"old\":{\"last_login\":\"2022-05-04 07:22:24\",\"updated_at\":\"2022-05-04 07:22:24\"}}', NULL, '2022-05-04 18:08:30', '2022-05-04 18:08:30'),
(383, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"ezrXUtAPsRaEeSB16LpHVIMHP9Gft9pffBmgLn8tecdWhr3xd493SLmnyNiz\"},\"old\":{\"remember_token\":\"ft0zokav0cyhjddqSaq5ry2TNo902RExqt855kxl8EAyPDN8G14cCnWljmiU\"}}', NULL, '2022-05-04 18:08:54', '2022-05-04 18:08:54'),
(384, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-04 21:09:07\",\"updated_at\":\"2022-05-04 21:09:07\"},\"old\":{\"last_login\":\"2022-05-04 21:05:25\",\"updated_at\":\"2022-05-04 21:05:25\"}}', NULL, '2022-05-04 18:09:07', '2022-05-04 18:09:07'),
(385, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"1Ymwkwj07NIF3005EnYXj09btDpEFADLuFxjmzlwe6oavvILzlVizAqdG4sn\"},\"old\":{\"remember_token\":\"9kufBTNhRBrQ2fwsXMY9khbw43GQcjngn61BFYi3vA60eID3Jsf6UkImSRVu\"}}', NULL, '2022-05-04 18:11:37', '2022-05-04 18:11:37'),
(386, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-04 21:11:46\",\"updated_at\":\"2022-05-04 21:11:46\"},\"old\":{\"last_login\":\"2022-05-04 21:08:30\",\"updated_at\":\"2022-05-04 21:08:30\"}}', NULL, '2022-05-04 18:11:46', '2022-05-04 18:11:46'),
(387, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"PQyY9pypYCGdtw9u5YlFyt1KHfAK8hUx4HIwpdbneOHoRLoynRCfID93vTqF\"},\"old\":{\"remember_token\":\"ezrXUtAPsRaEeSB16LpHVIMHP9Gft9pffBmgLn8tecdWhr3xd493SLmnyNiz\"}}', NULL, '2022-05-04 18:12:10', '2022-05-04 18:12:10'),
(388, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-04 21:12:19\",\"updated_at\":\"2022-05-04 21:12:19\"},\"old\":{\"last_login\":\"2022-05-04 21:09:07\",\"updated_at\":\"2022-05-04 21:09:07\"}}', NULL, '2022-05-04 18:12:19', '2022-05-04 18:12:19'),
(389, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"G7M4nn2lmw6WdMKelLdlc0JDcK7bLoxhOhyFcbwVDWWmDGyyi78hCMgKX5Xb\"},\"old\":{\"remember_token\":\"1Ymwkwj07NIF3005EnYXj09btDpEFADLuFxjmzlwe6oavvILzlVizAqdG4sn\"}}', NULL, '2022-05-04 18:13:22', '2022-05-04 18:13:22'),
(390, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-04 21:13:42\",\"updated_at\":\"2022-05-04 21:13:42\"},\"old\":{\"last_login\":\"2022-05-04 21:11:46\",\"updated_at\":\"2022-05-04 21:11:46\"}}', NULL, '2022-05-04 18:13:42', '2022-05-04 18:13:42'),
(391, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"hAv2N8BW1VRh1W6EvFtlNyHK695lqmLcLl9BQjTQsjP3zflTiVH9mgxGTc8v\"},\"old\":{\"remember_token\":\"PQyY9pypYCGdtw9u5YlFyt1KHfAK8hUx4HIwpdbneOHoRLoynRCfID93vTqF\"}}', NULL, '2022-05-04 18:14:20', '2022-05-04 18:14:20'),
(392, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-04 21:14:32\",\"updated_at\":\"2022-05-04 21:14:32\"},\"old\":{\"last_login\":\"2022-05-04 06:46:29\",\"updated_at\":\"2022-05-04 06:46:29\"}}', NULL, '2022-05-04 18:14:32', '2022-05-04 18:14:32'),
(393, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"M9PovutASOah8DRuLkB6r7WN9xMwORkWB4KPd3ZmInSA8S8cgfaS8kZkjFd2\"},\"old\":{\"remember_token\":\"KpyQ4osvS5qV3Qa0jTDiMXsfvUEnJXTYSX0Boj8FxDdgfDtBcautCDFxiE6B\"}}', NULL, '2022-05-04 18:14:47', '2022-05-04 18:14:47'),
(394, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-04 21:15:20\",\"updated_at\":\"2022-05-04 21:15:20\"},\"old\":{\"last_login\":\"2022-05-04 21:13:42\",\"updated_at\":\"2022-05-04 21:13:42\"}}', NULL, '2022-05-04 18:15:20', '2022-05-04 18:15:20'),
(395, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"PMWhvA8wbdon19Sw4lgGv2zmzGgWORGM3GjGjPztbXZAehtp1srfxc6GcVSF\"},\"old\":{\"remember_token\":\"hAv2N8BW1VRh1W6EvFtlNyHK695lqmLcLl9BQjTQsjP3zflTiVH9mgxGTc8v\"}}', NULL, '2022-05-04 18:15:42', '2022-05-04 18:15:42'),
(396, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-04 21:15:53\",\"updated_at\":\"2022-05-04 21:15:53\"},\"old\":{\"last_login\":\"2022-05-04 21:12:19\",\"updated_at\":\"2022-05-04 21:12:19\"}}', NULL, '2022-05-04 18:15:53', '2022-05-04 18:15:53'),
(397, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"FffEYgknFgegTevXyMew5Mz36mce4ovsP31RRUbX60qEIxpmjQRCCX7Ndw32\"},\"old\":{\"remember_token\":\"G7M4nn2lmw6WdMKelLdlc0JDcK7bLoxhOhyFcbwVDWWmDGyyi78hCMgKX5Xb\"}}', NULL, '2022-05-04 18:18:05', '2022-05-04 18:18:05'),
(398, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-04 21:18:18\",\"updated_at\":\"2022-05-04 21:18:18\"},\"old\":{\"last_login\":\"2022-05-04 21:15:20\",\"updated_at\":\"2022-05-04 21:15:20\"}}', NULL, '2022-05-04 18:18:18', '2022-05-04 18:18:18'),
(399, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"aeoaBLzD2gjzLQEctIdepDEdcbPxetzGnCqI2h1R2GkL9QKCxDnnqXvpPbqA\"},\"old\":{\"remember_token\":\"PMWhvA8wbdon19Sw4lgGv2zmzGgWORGM3GjGjPztbXZAehtp1srfxc6GcVSF\"}}', NULL, '2022-05-04 18:18:39', '2022-05-04 18:18:39');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `event`, `causer_id`, `causer_type`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(400, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-04 21:18:49\",\"updated_at\":\"2022-05-04 21:18:49\"},\"old\":{\"last_login\":\"2022-05-04 21:15:53\",\"updated_at\":\"2022-05-04 21:15:53\"}}', NULL, '2022-05-04 18:18:49', '2022-05-04 18:18:49'),
(401, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"9Gfcl8DBnuCz9SR0VVir70wTSeEkBIdIYsYCOylLKF3VeYf6lEH2KWi5GCVW\"},\"old\":{\"remember_token\":\"FffEYgknFgegTevXyMew5Mz36mce4ovsP31RRUbX60qEIxpmjQRCCX7Ndw32\"}}', NULL, '2022-05-04 18:41:44', '2022-05-04 18:41:44'),
(402, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-04 21:41:58\",\"updated_at\":\"2022-05-04 21:41:58\"},\"old\":{\"last_login\":\"2022-05-04 21:18:18\",\"updated_at\":\"2022-05-04 21:18:18\"}}', NULL, '2022-05-04 18:41:58', '2022-05-04 18:41:58'),
(403, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"Vc2LpyXSZsJfMMObXmhGeQnkFp5SrOJ65pqZZs2h8mNTQQgGajr4Y5POZd5O\"},\"old\":{\"remember_token\":\"aeoaBLzD2gjzLQEctIdepDEdcbPxetzGnCqI2h1R2GkL9QKCxDnnqXvpPbqA\"}}', NULL, '2022-05-04 18:42:17', '2022-05-04 18:42:17'),
(404, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-04 21:42:23\",\"updated_at\":\"2022-05-04 21:42:23\"},\"old\":{\"last_login\":\"2022-05-04 21:18:49\",\"updated_at\":\"2022-05-04 21:18:49\"}}', NULL, '2022-05-04 18:42:23', '2022-05-04 18:42:23'),
(405, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 03:22:12\",\"updated_at\":\"2022-05-05 03:22:12\"},\"old\":{\"last_login\":\"2022-05-04 21:42:23\",\"updated_at\":\"2022-05-04 21:42:23\"}}', NULL, '2022-05-05 00:22:12', '2022-05-05 00:22:12'),
(406, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"5U8DvMpmnlIdWFo0nKYFb5dxoBDi90dAC8zDrV02ajZ24gewmGta4iHldRST\"},\"old\":{\"remember_token\":\"9Gfcl8DBnuCz9SR0VVir70wTSeEkBIdIYsYCOylLKF3VeYf6lEH2KWi5GCVW\"}}', NULL, '2022-05-05 01:04:02', '2022-05-05 01:04:02'),
(407, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 04:04:09\",\"updated_at\":\"2022-05-05 04:04:09\"},\"old\":{\"last_login\":\"2022-05-04 21:41:58\",\"updated_at\":\"2022-05-04 21:41:58\"}}', NULL, '2022-05-05 01:04:09', '2022-05-05 01:04:09'),
(408, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"e9rsUCiWSye8yW2ql0Ebd20MqH3ZBnJ50TzFY9zaFMvhIehSqbvtdU5OuDdM\"},\"old\":{\"remember_token\":\"Vc2LpyXSZsJfMMObXmhGeQnkFp5SrOJ65pqZZs2h8mNTQQgGajr4Y5POZd5O\"}}', NULL, '2022-05-05 01:05:32', '2022-05-05 01:05:32'),
(409, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 04:05:42\",\"updated_at\":\"2022-05-05 04:05:42\"},\"old\":{\"last_login\":\"2022-05-05 03:22:12\",\"updated_at\":\"2022-05-05 03:22:12\"}}', NULL, '2022-05-05 01:05:42', '2022-05-05 01:05:42'),
(410, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"5S9JFKXLYtItcThwlA7HWQZeT5dkNYi39XjQp4umYPjDkMmyCNFUv4jzSqll\"},\"old\":{\"remember_token\":\"5U8DvMpmnlIdWFo0nKYFb5dxoBDi90dAC8zDrV02ajZ24gewmGta4iHldRST\"}}', NULL, '2022-05-05 01:07:34', '2022-05-05 01:07:34'),
(411, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 04:07:42\",\"updated_at\":\"2022-05-05 04:07:42\"},\"old\":{\"last_login\":\"2022-05-05 04:04:09\",\"updated_at\":\"2022-05-05 04:04:09\"}}', NULL, '2022-05-05 01:07:42', '2022-05-05 01:07:42'),
(412, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"JyuM28O8fISGpsv1KhyfQnGLjxP24kqmT4l68hXr0TAVa0B9T1YHAMp3OngF\"},\"old\":{\"remember_token\":\"e9rsUCiWSye8yW2ql0Ebd20MqH3ZBnJ50TzFY9zaFMvhIehSqbvtdU5OuDdM\"}}', NULL, '2022-05-05 01:19:33', '2022-05-05 01:19:33'),
(413, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 04:19:41\",\"updated_at\":\"2022-05-05 04:19:41\"},\"old\":{\"last_login\":\"2022-05-05 04:05:42\",\"updated_at\":\"2022-05-05 04:05:42\"}}', NULL, '2022-05-05 01:19:41', '2022-05-05 01:19:41'),
(414, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"eKLN9isafGzyq27M49n8RIT9UwiWIwBAWaEfHsZlH6gGxNHX5VMP4sBKt3ZY\"},\"old\":{\"remember_token\":\"5S9JFKXLYtItcThwlA7HWQZeT5dkNYi39XjQp4umYPjDkMmyCNFUv4jzSqll\"}}', NULL, '2022-05-05 01:20:01', '2022-05-05 01:20:01'),
(415, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 04:20:10\",\"updated_at\":\"2022-05-05 04:20:10\"},\"old\":{\"last_login\":\"2022-05-05 04:07:42\",\"updated_at\":\"2022-05-05 04:07:42\"}}', NULL, '2022-05-05 01:20:10', '2022-05-05 01:20:10'),
(416, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"kcIF3676PV8Kg4Y9u7hbyhOM3bQ5mUmOoZZ8hCNuoWTjomLflyar8V1wKtYE\"},\"old\":{\"remember_token\":\"JyuM28O8fISGpsv1KhyfQnGLjxP24kqmT4l68hXr0TAVa0B9T1YHAMp3OngF\"}}', NULL, '2022-05-05 01:23:31', '2022-05-05 01:23:31'),
(417, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 04:23:41\",\"updated_at\":\"2022-05-05 04:23:41\"},\"old\":{\"last_login\":\"2022-05-05 04:19:41\",\"updated_at\":\"2022-05-05 04:19:41\"}}', NULL, '2022-05-05 01:23:41', '2022-05-05 01:23:41'),
(418, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"VRd9R1FXJBT3GvWHnx0aoCyeB8hjTf2Y9yqeBrt6LvcJ3Sad2iRewPCgFBNT\"},\"old\":{\"remember_token\":\"eKLN9isafGzyq27M49n8RIT9UwiWIwBAWaEfHsZlH6gGxNHX5VMP4sBKt3ZY\"}}', NULL, '2022-05-05 01:23:58', '2022-05-05 01:23:58'),
(419, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 04:24:06\",\"updated_at\":\"2022-05-05 04:24:06\"},\"old\":{\"last_login\":\"2022-05-05 04:20:10\",\"updated_at\":\"2022-05-05 04:20:10\"}}', NULL, '2022-05-05 01:24:06', '2022-05-05 01:24:06'),
(420, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"CFQlrkI2c4gmbZcXIVIYXteB4m170nMY6rKy9SSxBaPhh6wOMd2ysRdrDdWD\"},\"old\":{\"remember_token\":\"kcIF3676PV8Kg4Y9u7hbyhOM3bQ5mUmOoZZ8hCNuoWTjomLflyar8V1wKtYE\"}}', NULL, '2022-05-05 01:35:16', '2022-05-05 01:35:16'),
(421, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 04:35:23\",\"updated_at\":\"2022-05-05 04:35:23\"},\"old\":{\"last_login\":\"2022-05-05 04:23:41\",\"updated_at\":\"2022-05-05 04:23:41\"}}', NULL, '2022-05-05 01:35:23', '2022-05-05 01:35:23'),
(422, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"bJA2bjme5JrNsyG8hRQiWbwsjat7RNMWTGaaBZKnILkPMZrujTuGhKwtn4tC\"},\"old\":{\"remember_token\":\"VRd9R1FXJBT3GvWHnx0aoCyeB8hjTf2Y9yqeBrt6LvcJ3Sad2iRewPCgFBNT\"}}', NULL, '2022-05-05 01:36:20', '2022-05-05 01:36:20'),
(423, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 04:36:27\",\"updated_at\":\"2022-05-05 04:36:27\"},\"old\":{\"last_login\":\"2022-05-05 04:24:06\",\"updated_at\":\"2022-05-05 04:24:06\"}}', NULL, '2022-05-05 01:36:27', '2022-05-05 01:36:27'),
(424, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"DxR3AEcBmdkeHjov18YNT7jMDg6rq1YmWunAsAO255suv2SqtShrYsL1WDk8\"},\"old\":{\"remember_token\":\"CFQlrkI2c4gmbZcXIVIYXteB4m170nMY6rKy9SSxBaPhh6wOMd2ysRdrDdWD\"}}', NULL, '2022-05-05 01:38:58', '2022-05-05 01:38:58'),
(425, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 04:39:04\",\"updated_at\":\"2022-05-05 04:39:04\"},\"old\":{\"last_login\":\"2022-05-05 04:35:23\",\"updated_at\":\"2022-05-05 04:35:23\"}}', NULL, '2022-05-05 01:39:04', '2022-05-05 01:39:04'),
(426, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"39XeGiU2tzjOLpN2EkvziBPmygfUQR0NPuAmS21zMY83P0x92bbNszSfPJYw\"},\"old\":{\"remember_token\":\"bJA2bjme5JrNsyG8hRQiWbwsjat7RNMWTGaaBZKnILkPMZrujTuGhKwtn4tC\"}}', NULL, '2022-05-05 01:39:25', '2022-05-05 01:39:25'),
(427, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 04:39:31\",\"updated_at\":\"2022-05-05 04:39:31\"},\"old\":{\"last_login\":\"2022-05-05 04:36:27\",\"updated_at\":\"2022-05-05 04:36:27\"}}', NULL, '2022-05-05 01:39:31', '2022-05-05 01:39:31'),
(428, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"f48kLFsUX4rD3tGOCmIsvizDBv5EAVchoIH0QMY4pRGLUhnIl7okIRr3a2tu\"},\"old\":{\"remember_token\":\"DxR3AEcBmdkeHjov18YNT7jMDg6rq1YmWunAsAO255suv2SqtShrYsL1WDk8\"}}', NULL, '2022-05-05 01:43:38', '2022-05-05 01:43:38'),
(429, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 04:44:11\",\"updated_at\":\"2022-05-05 04:44:11\"},\"old\":{\"last_login\":\"2022-05-05 04:39:31\",\"updated_at\":\"2022-05-05 04:39:31\"}}', NULL, '2022-05-05 01:44:11', '2022-05-05 01:44:11'),
(430, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"ml237NewrYDDbRvlga2U8dW8JE20DWuC9RiJGjvnhjgxf42Oa6XrvusGIXy9\"},\"old\":{\"remember_token\":\"f48kLFsUX4rD3tGOCmIsvizDBv5EAVchoIH0QMY4pRGLUhnIl7okIRr3a2tu\"}}', NULL, '2022-05-05 01:44:37', '2022-05-05 01:44:37'),
(431, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 04:44:45\",\"updated_at\":\"2022-05-05 04:44:45\"},\"old\":{\"last_login\":\"2022-05-05 04:39:04\",\"updated_at\":\"2022-05-05 04:39:04\"}}', NULL, '2022-05-05 01:44:45', '2022-05-05 01:44:45'),
(432, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"g0Y06QkqFjrc6XSoHYhKS1TFpzoI9sg4NPb5iyQZEVKhR8IPVbOqxqrF3bGS\"},\"old\":{\"remember_token\":\"39XeGiU2tzjOLpN2EkvziBPmygfUQR0NPuAmS21zMY83P0x92bbNszSfPJYw\"}}', NULL, '2022-05-05 01:46:04', '2022-05-05 01:46:04'),
(433, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 04:50:55\",\"updated_at\":\"2022-05-05 04:50:55\"},\"old\":{\"last_login\":\"2022-05-05 04:44:45\",\"updated_at\":\"2022-05-05 04:44:45\"}}', NULL, '2022-05-05 01:50:55', '2022-05-05 01:50:55'),
(434, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"oeu7EyAk9Nv1FD7JqFGxuxNgQmyFNdZ2yBOkzT5r1UO22xdwIoY9V4jWzjhS\"},\"old\":{\"remember_token\":\"g0Y06QkqFjrc6XSoHYhKS1TFpzoI9sg4NPb5iyQZEVKhR8IPVbOqxqrF3bGS\"}}', NULL, '2022-05-05 01:51:23', '2022-05-05 01:51:23'),
(435, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 04:51:36\",\"updated_at\":\"2022-05-05 04:51:36\"},\"old\":{\"last_login\":\"2022-05-02 07:23:16\",\"updated_at\":\"2022-05-02 07:23:16\"}}', NULL, '2022-05-05 01:51:36', '2022-05-05 01:51:36'),
(436, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"L7qiRZbp79vdPoWktqlQkJhYMNNGdqoWH205Gs1rYawbbVu2WO1d9fX4L1tW\"},\"old\":{\"remember_token\":\"xgsMDHtkBhGKLbUaRQlSJ57fJLSfVvw33KDGtLZjBEotzePW60U5cn0ysBDC\"}}', NULL, '2022-05-05 02:01:43', '2022-05-05 02:01:43'),
(437, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 05:01:50\",\"updated_at\":\"2022-05-05 05:01:50\"},\"old\":{\"last_login\":\"2022-05-05 04:50:55\",\"updated_at\":\"2022-05-05 04:50:55\"}}', NULL, '2022-05-05 02:01:50', '2022-05-05 02:01:50'),
(438, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"ewU4pHUdH1GxC6tRGDKGGf6ISla8vOcJrQC23QHMRS9iLq16jyXktBqxqz7O\"},\"old\":{\"remember_token\":\"oeu7EyAk9Nv1FD7JqFGxuxNgQmyFNdZ2yBOkzT5r1UO22xdwIoY9V4jWzjhS\"}}', NULL, '2022-05-05 02:04:27', '2022-05-05 02:04:27'),
(439, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 05:04:41\",\"updated_at\":\"2022-05-05 05:04:41\"},\"old\":{\"last_login\":\"2022-05-05 04:51:36\",\"updated_at\":\"2022-05-05 04:51:36\"}}', NULL, '2022-05-05 02:04:41', '2022-05-05 02:04:41'),
(440, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"Sotc2E8niP3YJdGvYO8EOLNJdOWUDrQ6EIiENCaiUKcMZFrSZQH5nq304jMV\"},\"old\":{\"remember_token\":\"L7qiRZbp79vdPoWktqlQkJhYMNNGdqoWH205Gs1rYawbbVu2WO1d9fX4L1tW\"}}', NULL, '2022-05-05 02:05:08', '2022-05-05 02:05:08'),
(441, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 05:05:15\",\"updated_at\":\"2022-05-05 05:05:15\"},\"old\":{\"last_login\":\"2022-05-05 04:44:11\",\"updated_at\":\"2022-05-05 04:44:11\"}}', NULL, '2022-05-05 02:05:15', '2022-05-05 02:05:15'),
(442, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"jCgnSibonzD4nibxMGNP2ZxIhSqKOp40DRJyl7HKXADyb1AobXj76en1jAzH\"},\"old\":{\"remember_token\":\"ml237NewrYDDbRvlga2U8dW8JE20DWuC9RiJGjvnhjgxf42Oa6XrvusGIXy9\"}}', NULL, '2022-05-05 02:05:52', '2022-05-05 02:05:52'),
(443, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 05:06:01\",\"updated_at\":\"2022-05-05 05:06:01\"},\"old\":{\"last_login\":\"2022-05-04 21:14:32\",\"updated_at\":\"2022-05-04 21:14:32\"}}', NULL, '2022-05-05 02:06:01', '2022-05-05 02:06:01'),
(444, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"9VtMR17POHfTbTVDigAbGTp391VTksI7Jh0mXSbUHp7yc5ugmwraZ97yISst\"},\"old\":{\"remember_token\":\"M9PovutASOah8DRuLkB6r7WN9xMwORkWB4KPd3ZmInSA8S8cgfaS8kZkjFd2\"}}', NULL, '2022-05-05 02:06:23', '2022-05-05 02:06:23'),
(445, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 05:06:34\",\"updated_at\":\"2022-05-05 05:06:34\"},\"old\":{\"last_login\":\"2022-05-05 05:05:15\",\"updated_at\":\"2022-05-05 05:05:15\"}}', NULL, '2022-05-05 02:06:34', '2022-05-05 02:06:34'),
(446, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"GgZ8GUJGblwFiWPSIKrzzmRyS5Nv7Z6l1KOYfniO1uDMZnSLi40SoVpSUEOh\"},\"old\":{\"remember_token\":\"jCgnSibonzD4nibxMGNP2ZxIhSqKOp40DRJyl7HKXADyb1AobXj76en1jAzH\"}}', NULL, '2022-05-05 02:15:54', '2022-05-05 02:15:54'),
(447, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 05:29:24\",\"updated_at\":\"2022-05-05 05:29:24\"},\"old\":{\"last_login\":\"2022-05-05 05:04:41\",\"updated_at\":\"2022-05-05 05:04:41\"}}', NULL, '2022-05-05 02:29:24', '2022-05-05 02:29:24'),
(448, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"h2xBGyt7DEAT51we4rGp0Av9pQpgcCbF8lq4pHEazyKY5wlOunUhox0jRF5u\"},\"old\":{\"remember_token\":\"Sotc2E8niP3YJdGvYO8EOLNJdOWUDrQ6EIiENCaiUKcMZFrSZQH5nq304jMV\"}}', NULL, '2022-05-05 02:29:38', '2022-05-05 02:29:38'),
(449, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 05:29:44\",\"updated_at\":\"2022-05-05 05:29:44\"},\"old\":{\"last_login\":\"2022-05-05 05:01:50\",\"updated_at\":\"2022-05-05 05:01:50\"}}', NULL, '2022-05-05 02:29:44', '2022-05-05 02:29:44'),
(450, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"UNc6mwllfHfZMTNYdMSqZr1MftU60Hhhd8IZNl6eTm76NmaCbn3ycIvr2STR\"},\"old\":{\"remember_token\":\"ewU4pHUdH1GxC6tRGDKGGf6ISla8vOcJrQC23QHMRS9iLq16jyXktBqxqz7O\"}}', NULL, '2022-05-05 02:30:04', '2022-05-05 02:30:04'),
(451, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 05:30:15\",\"updated_at\":\"2022-05-05 05:30:15\"},\"old\":{\"last_login\":\"2022-05-05 05:29:24\",\"updated_at\":\"2022-05-05 05:29:24\"}}', NULL, '2022-05-05 02:30:15', '2022-05-05 02:30:15'),
(452, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 08:50:04\",\"updated_at\":\"2022-05-05 08:50:04\"},\"old\":{\"last_login\":\"2022-05-05 05:30:15\",\"updated_at\":\"2022-05-05 05:30:15\"}}', NULL, '2022-05-05 05:50:04', '2022-05-05 05:50:04'),
(453, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"qFyEATkaQ9bNGdD9QswZWHOcMU8tEpc1YOMOU7HbGlAk1qNrfINTptRhCKAJ\"},\"old\":{\"remember_token\":\"h2xBGyt7DEAT51we4rGp0Av9pQpgcCbF8lq4pHEazyKY5wlOunUhox0jRF5u\"}}', NULL, '2022-05-05 06:22:35', '2022-05-05 06:22:35'),
(454, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 09:22:42\",\"updated_at\":\"2022-05-05 09:22:42\"},\"old\":{\"last_login\":\"2022-05-05 05:29:44\",\"updated_at\":\"2022-05-05 05:29:44\"}}', NULL, '2022-05-05 06:22:42', '2022-05-05 06:22:42'),
(455, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"anK1wEyScxgFbSHhcocAx8t7FtnVGEOTg3rr92lg6LwvrGGip0BFXwnuZOSC\"},\"old\":{\"remember_token\":\"UNc6mwllfHfZMTNYdMSqZr1MftU60Hhhd8IZNl6eTm76NmaCbn3ycIvr2STR\"}}', NULL, '2022-05-05 06:47:36', '2022-05-05 06:47:36'),
(456, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 09:47:50\",\"updated_at\":\"2022-05-05 09:47:50\"},\"old\":{\"last_login\":\"2022-05-05 08:50:04\",\"updated_at\":\"2022-05-05 08:50:04\"}}', NULL, '2022-05-05 06:47:50', '2022-05-05 06:47:50'),
(457, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"R3HVhXcYNuicsNGaIyv0rjim9tbAD2pKB3su2m3UWDsCgepuBc0ZQmCMIisx\"},\"old\":{\"remember_token\":\"qFyEATkaQ9bNGdD9QswZWHOcMU8tEpc1YOMOU7HbGlAk1qNrfINTptRhCKAJ\"}}', NULL, '2022-05-05 06:48:23', '2022-05-05 06:48:23'),
(458, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 09:48:47\",\"updated_at\":\"2022-05-05 09:48:47\"},\"old\":{\"last_login\":\"2022-05-05 09:22:42\",\"updated_at\":\"2022-05-05 09:22:42\"}}', NULL, '2022-05-05 06:48:47', '2022-05-05 06:48:47'),
(459, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"SGrocw80NSBPS78UTHqyDMKCHuFxQdxlUGHhcdX0MhoAtYKODoH0AHeohtDI\"},\"old\":{\"remember_token\":\"anK1wEyScxgFbSHhcocAx8t7FtnVGEOTg3rr92lg6LwvrGGip0BFXwnuZOSC\"}}', NULL, '2022-05-05 06:55:40', '2022-05-05 06:55:40'),
(460, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 09:55:49\",\"updated_at\":\"2022-05-05 09:55:49\"},\"old\":{\"last_login\":\"2022-05-05 09:48:47\",\"updated_at\":\"2022-05-05 09:48:47\"}}', NULL, '2022-05-05 06:55:49', '2022-05-05 06:55:49'),
(461, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"cZaZsBpQx2dJs9dT0aUJcNSwTR3hyNdxAfsD8GFErqqmerdURvu9MmltQ2vx\"},\"old\":{\"remember_token\":\"SGrocw80NSBPS78UTHqyDMKCHuFxQdxlUGHhcdX0MhoAtYKODoH0AHeohtDI\"}}', NULL, '2022-05-05 07:00:58', '2022-05-05 07:00:58'),
(462, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 10:01:11\",\"updated_at\":\"2022-05-05 10:01:11\"},\"old\":{\"last_login\":\"2022-05-05 09:47:50\",\"updated_at\":\"2022-05-05 09:47:50\"}}', NULL, '2022-05-05 07:01:11', '2022-05-05 07:01:11'),
(463, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"AqzChAVGxdVgkIVJqoN1Z5sv6601yhltghffBucdiNVKCd6kfYLdtuBOdSqe\"},\"old\":{\"remember_token\":\"R3HVhXcYNuicsNGaIyv0rjim9tbAD2pKB3su2m3UWDsCgepuBc0ZQmCMIisx\"}}', NULL, '2022-05-05 07:01:40', '2022-05-05 07:01:40'),
(464, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 10:01:46\",\"updated_at\":\"2022-05-05 10:01:46\"},\"old\":{\"last_login\":\"2022-05-05 05:06:34\",\"updated_at\":\"2022-05-05 05:06:34\"}}', NULL, '2022-05-05 07:01:46', '2022-05-05 07:01:46'),
(465, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"TwwVBP9XHbJXaT1trXOIuemdUxX6SRGhojebeLJdB4BzU9LTYx1YNTZwV6M5\"},\"old\":{\"remember_token\":\"GgZ8GUJGblwFiWPSIKrzzmRyS5Nv7Z6l1KOYfniO1uDMZnSLi40SoVpSUEOh\"}}', NULL, '2022-05-05 07:02:19', '2022-05-05 07:02:19'),
(466, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 10:02:26\",\"updated_at\":\"2022-05-05 10:02:26\"},\"old\":{\"last_login\":\"2022-05-05 09:55:49\",\"updated_at\":\"2022-05-05 09:55:49\"}}', NULL, '2022-05-05 07:02:26', '2022-05-05 07:02:26'),
(467, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"fkS14FdXkcvV4BycYis1AdzzJwy3tRTvQ8hHz0qQbtIqDmkEXt2Vy4cIf0so\"},\"old\":{\"remember_token\":\"cZaZsBpQx2dJs9dT0aUJcNSwTR3hyNdxAfsD8GFErqqmerdURvu9MmltQ2vx\"}}', NULL, '2022-05-05 07:02:49', '2022-05-05 07:02:49'),
(468, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 10:03:01\",\"updated_at\":\"2022-05-05 10:03:01\"},\"old\":{\"last_login\":\"2022-05-05 10:01:46\",\"updated_at\":\"2022-05-05 10:01:46\"}}', NULL, '2022-05-05 07:03:01', '2022-05-05 07:03:01'),
(469, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"jsVCEzdVJ3u9jVbLIBYxOw1s6oUQ8urOlYCe82PWzm9H1P1wgy3zADWglEEd\"},\"old\":{\"remember_token\":\"TwwVBP9XHbJXaT1trXOIuemdUxX6SRGhojebeLJdB4BzU9LTYx1YNTZwV6M5\"}}', NULL, '2022-05-05 07:05:12', '2022-05-05 07:05:12'),
(470, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 10:05:28\",\"updated_at\":\"2022-05-05 10:05:28\"},\"old\":{\"last_login\":\"2022-05-05 10:01:11\",\"updated_at\":\"2022-05-05 10:01:11\"}}', NULL, '2022-05-05 07:05:28', '2022-05-05 07:05:28'),
(471, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"TyIOuoCzJqaSGmDoIKps4SpnOU9yVSQajG1oIujA03ZN6j9AfbgJPLAut53Q\"},\"old\":{\"remember_token\":\"AqzChAVGxdVgkIVJqoN1Z5sv6601yhltghffBucdiNVKCd6kfYLdtuBOdSqe\"}}', NULL, '2022-05-05 07:55:40', '2022-05-05 07:55:40'),
(472, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 10:55:47\",\"updated_at\":\"2022-05-05 10:55:47\"},\"old\":{\"last_login\":\"2022-05-05 10:03:01\",\"updated_at\":\"2022-05-05 10:03:01\"}}', NULL, '2022-05-05 07:55:47', '2022-05-05 07:55:47'),
(473, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"AxlNj5ZoVi97mYzkqKmH3t648HWVHHKPXekf3UvOfRoHLCRc1nsEaqOoTIa1\"},\"old\":{\"remember_token\":\"jsVCEzdVJ3u9jVbLIBYxOw1s6oUQ8urOlYCe82PWzm9H1P1wgy3zADWglEEd\"}}', NULL, '2022-05-05 07:59:08', '2022-05-05 07:59:08'),
(474, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 10:59:21\",\"updated_at\":\"2022-05-05 10:59:21\"},\"old\":{\"last_login\":\"2022-05-05 10:02:26\",\"updated_at\":\"2022-05-05 10:02:26\"}}', NULL, '2022-05-05 07:59:21', '2022-05-05 07:59:21'),
(475, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"oyJAd1MEuP4uyJpgbJoqEtI5ZVkcrXl1OY7SsDr001LNEQADkHyaJeYVruGT\"},\"old\":{\"remember_token\":\"fkS14FdXkcvV4BycYis1AdzzJwy3tRTvQ8hHz0qQbtIqDmkEXt2Vy4cIf0so\"}}', NULL, '2022-05-05 07:59:42', '2022-05-05 07:59:42'),
(476, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 11:02:28\",\"updated_at\":\"2022-05-05 11:02:28\"},\"old\":{\"last_login\":\"2022-05-05 10:05:28\",\"updated_at\":\"2022-05-05 10:05:28\"}}', NULL, '2022-05-05 08:02:28', '2022-05-05 08:02:28'),
(477, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"bw1tdbwivHXWiC3wmcxpXNjEyQyaxA7uzPjVb7WnMgC1CvGMOLjpXGHlrEDO\"},\"old\":{\"remember_token\":\"TyIOuoCzJqaSGmDoIKps4SpnOU9yVSQajG1oIujA03ZN6j9AfbgJPLAut53Q\"}}', NULL, '2022-05-05 08:03:04', '2022-05-05 08:03:04'),
(478, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 11:03:12\",\"updated_at\":\"2022-05-05 11:03:12\"},\"old\":{\"last_login\":\"2022-05-05 10:55:47\",\"updated_at\":\"2022-05-05 10:55:47\"}}', NULL, '2022-05-05 08:03:12', '2022-05-05 08:03:12'),
(479, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"4O74UrMjTSmRohkurj41D1j6aTEXV5mR2ZNyg6iVcGCr00LG1MDNDhhKawWR\"},\"old\":{\"remember_token\":\"AxlNj5ZoVi97mYzkqKmH3t648HWVHHKPXekf3UvOfRoHLCRc1nsEaqOoTIa1\"}}', NULL, '2022-05-05 08:15:28', '2022-05-05 08:15:28'),
(480, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 11:15:42\",\"updated_at\":\"2022-05-05 11:15:42\"},\"old\":{\"last_login\":\"2022-05-05 11:02:28\",\"updated_at\":\"2022-05-05 11:02:28\"}}', NULL, '2022-05-05 08:15:42', '2022-05-05 08:15:42'),
(481, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"qISTVBBOUY8EkmCmg3RWOUbsdxKG2FFdBoF6JmNKffBuMhiLHJr4lr9RSZMj\"},\"old\":{\"remember_token\":\"bw1tdbwivHXWiC3wmcxpXNjEyQyaxA7uzPjVb7WnMgC1CvGMOLjpXGHlrEDO\"}}', NULL, '2022-05-05 08:15:59', '2022-05-05 08:15:59'),
(482, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 11:16:13\",\"updated_at\":\"2022-05-05 11:16:13\"},\"old\":{\"last_login\":\"2022-05-05 11:15:42\",\"updated_at\":\"2022-05-05 11:15:42\"}}', NULL, '2022-05-05 08:16:13', '2022-05-05 08:16:13'),
(483, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"l7EGVjxkbjFTQmRpMEDSHAfKja1dRfg3Lv8WX8giI5Rz8ERqjq7EYK8dgt0R\"},\"old\":{\"remember_token\":\"qISTVBBOUY8EkmCmg3RWOUbsdxKG2FFdBoF6JmNKffBuMhiLHJr4lr9RSZMj\"}}', NULL, '2022-05-05 08:16:44', '2022-05-05 08:16:44'),
(484, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 11:16:50\",\"updated_at\":\"2022-05-05 11:16:50\"},\"old\":{\"last_login\":\"2022-05-05 10:59:21\",\"updated_at\":\"2022-05-05 10:59:21\"}}', NULL, '2022-05-05 08:16:50', '2022-05-05 08:16:50'),
(485, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"AfPFJBAHX8dKCpEy4v4KjGZTQUbAEKsSVfCCVxiNch9fG95lmS14BYoQJcZn\"},\"old\":{\"remember_token\":\"oyJAd1MEuP4uyJpgbJoqEtI5ZVkcrXl1OY7SsDr001LNEQADkHyaJeYVruGT\"}}', NULL, '2022-05-05 08:16:58', '2022-05-05 08:16:58'),
(486, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 11:17:07\",\"updated_at\":\"2022-05-05 11:17:07\"},\"old\":{\"last_login\":\"2022-05-05 11:03:12\",\"updated_at\":\"2022-05-05 11:03:12\"}}', NULL, '2022-05-05 08:17:07', '2022-05-05 08:17:07'),
(487, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"iYm9alCGdb6yZ5eJyPJWS5XBeLgESG4RZFIn0FkriMdqapg4bxDJ9mzjVRft\"},\"old\":{\"remember_token\":\"4O74UrMjTSmRohkurj41D1j6aTEXV5mR2ZNyg6iVcGCr00LG1MDNDhhKawWR\"}}', NULL, '2022-05-05 08:20:22', '2022-05-05 08:20:22'),
(488, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 11:20:33\",\"updated_at\":\"2022-05-05 11:20:33\"},\"old\":{\"last_login\":\"2022-05-05 11:16:50\",\"updated_at\":\"2022-05-05 11:16:50\"}}', NULL, '2022-05-05 08:20:33', '2022-05-05 08:20:33'),
(489, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"flDPbnbuK0yENbGb9hbe3sWzrIrXx1vunID92M7exlditc1sfBbKhsddxLwM\"},\"old\":{\"remember_token\":\"AfPFJBAHX8dKCpEy4v4KjGZTQUbAEKsSVfCCVxiNch9fG95lmS14BYoQJcZn\"}}', NULL, '2022-05-05 08:20:53', '2022-05-05 08:20:53'),
(490, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 11:21:03\",\"updated_at\":\"2022-05-05 11:21:03\"},\"old\":{\"last_login\":\"2022-05-05 11:16:13\",\"updated_at\":\"2022-05-05 11:16:13\"}}', NULL, '2022-05-05 08:21:03', '2022-05-05 08:21:03'),
(491, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"iqZIjYnRwNpGliymlw5XXG2CH2Kof4mXmGqZxQqSbN226okLLd0jGOPf0aQ7\"},\"old\":{\"remember_token\":\"l7EGVjxkbjFTQmRpMEDSHAfKja1dRfg3Lv8WX8giI5Rz8ERqjq7EYK8dgt0R\"}}', NULL, '2022-05-05 08:21:25', '2022-05-05 08:21:25'),
(492, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 11:21:36\",\"updated_at\":\"2022-05-05 11:21:36\"},\"old\":{\"last_login\":\"2022-05-05 11:17:07\",\"updated_at\":\"2022-05-05 11:17:07\"}}', NULL, '2022-05-05 08:21:36', '2022-05-05 08:21:36'),
(493, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"7DqwgX6ETtLLmSBxLC2kfKLZuPwOEK6pDg4ojibmLwAMVsETpsnaD9QFazAO\"},\"old\":{\"remember_token\":\"iYm9alCGdb6yZ5eJyPJWS5XBeLgESG4RZFIn0FkriMdqapg4bxDJ9mzjVRft\"}}', NULL, '2022-05-05 08:24:06', '2022-05-05 08:24:06'),
(494, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 11:24:16\",\"updated_at\":\"2022-05-05 11:24:16\"},\"old\":{\"last_login\":\"2022-05-05 11:21:03\",\"updated_at\":\"2022-05-05 11:21:03\"}}', NULL, '2022-05-05 08:24:16', '2022-05-05 08:24:16'),
(495, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"kMCben7snSjTcp4u0VJOMCE34tSrTEHIHQjTOevhVoM48EeVB3z0Wc2HeoEg\"},\"old\":{\"remember_token\":\"iqZIjYnRwNpGliymlw5XXG2CH2Kof4mXmGqZxQqSbN226okLLd0jGOPf0aQ7\"}}', NULL, '2022-05-05 08:24:40', '2022-05-05 08:24:40'),
(496, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 11:24:59\",\"updated_at\":\"2022-05-05 11:24:59\"},\"old\":{\"last_login\":\"2022-05-05 11:21:36\",\"updated_at\":\"2022-05-05 11:21:36\"}}', NULL, '2022-05-05 08:24:59', '2022-05-05 08:24:59'),
(497, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"pW0yu6Sa0iMMXgWzTrmVf7MarRvaVSTQEkuetV9327kvFRvdWpwlXbmHqZCX\"},\"old\":{\"remember_token\":\"7DqwgX6ETtLLmSBxLC2kfKLZuPwOEK6pDg4ojibmLwAMVsETpsnaD9QFazAO\"}}', NULL, '2022-05-05 08:34:55', '2022-05-05 08:34:55'),
(498, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 11:35:02\",\"updated_at\":\"2022-05-05 11:35:02\"},\"old\":{\"last_login\":\"2022-05-05 11:20:33\",\"updated_at\":\"2022-05-05 11:20:33\"}}', NULL, '2022-05-05 08:35:02', '2022-05-05 08:35:02'),
(499, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"2As8xoSsLhsWSPnG8pxesozQREufKJsrfVsqiiXFmKBazmrIj8jP00ZhgkTs\"},\"old\":{\"remember_token\":\"flDPbnbuK0yENbGb9hbe3sWzrIrXx1vunID92M7exlditc1sfBbKhsddxLwM\"}}', NULL, '2022-05-05 08:37:04', '2022-05-05 08:37:04'),
(500, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 11:37:16\",\"updated_at\":\"2022-05-05 11:37:16\"},\"old\":{\"last_login\":\"2022-05-05 05:06:01\",\"updated_at\":\"2022-05-05 05:06:01\"}}', NULL, '2022-05-05 08:37:16', '2022-05-05 08:37:16'),
(501, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"QBmzn1fHR0i9Uxx0AbI66lMSmvNzxyD34oRzjOsbe29y0OlWAX9ErTXn0CHN\"},\"old\":{\"remember_token\":\"9VtMR17POHfTbTVDigAbGTp391VTksI7Jh0mXSbUHp7yc5ugmwraZ97yISst\"}}', NULL, '2022-05-05 08:37:40', '2022-05-05 08:37:40'),
(502, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 11:37:51\",\"updated_at\":\"2022-05-05 11:37:51\"},\"old\":{\"last_login\":\"2022-05-05 11:35:02\",\"updated_at\":\"2022-05-05 11:35:02\"}}', NULL, '2022-05-05 08:37:51', '2022-05-05 08:37:51'),
(503, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"UxtmwXqwVDJMrdHol73Wx2FVy21cenkZdHjv05jVLSZNWHwt1xjD9YRhXIxc\"},\"old\":{\"remember_token\":\"2As8xoSsLhsWSPnG8pxesozQREufKJsrfVsqiiXFmKBazmrIj8jP00ZhgkTs\"}}', NULL, '2022-05-05 08:46:12', '2022-05-05 08:46:12'),
(504, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 11:46:26\",\"updated_at\":\"2022-05-05 11:46:26\"},\"old\":{\"last_login\":\"2022-05-05 11:24:16\",\"updated_at\":\"2022-05-05 11:24:16\"}}', NULL, '2022-05-05 08:46:27', '2022-05-05 08:46:27'),
(505, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"LZfdkCXThwqt9w0eHU51gg2lTRA69WDTpmsj2zKNfJVyx7lxYGRaSDQFzuLX\"},\"old\":{\"remember_token\":\"kMCben7snSjTcp4u0VJOMCE34tSrTEHIHQjTOevhVoM48EeVB3z0Wc2HeoEg\"}}', NULL, '2022-05-05 08:46:55', '2022-05-05 08:46:55'),
(506, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 11:47:02\",\"updated_at\":\"2022-05-05 11:47:02\"},\"old\":{\"last_login\":\"2022-05-05 11:24:59\",\"updated_at\":\"2022-05-05 11:24:59\"}}', NULL, '2022-05-05 08:47:02', '2022-05-05 08:47:02'),
(507, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"TYnXoQXmcbto5L1jLKwsjUWGQNmqW36HxTDhH1JsRwdm4UEhDvbpTZSD5P9M\"},\"old\":{\"remember_token\":\"pW0yu6Sa0iMMXgWzTrmVf7MarRvaVSTQEkuetV9327kvFRvdWpwlXbmHqZCX\"}}', NULL, '2022-05-05 08:47:22', '2022-05-05 08:47:22'),
(508, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 11:47:30\",\"updated_at\":\"2022-05-05 11:47:30\"},\"old\":{\"last_login\":\"2022-05-05 11:37:51\",\"updated_at\":\"2022-05-05 11:37:51\"}}', NULL, '2022-05-05 08:47:30', '2022-05-05 08:47:30'),
(509, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"He8Z3K32A3cuQzyaFUhG87If46mIreYJLQqTHr8R95zmSA2dt6zgGvn8l5J8\"},\"old\":{\"remember_token\":\"UxtmwXqwVDJMrdHol73Wx2FVy21cenkZdHjv05jVLSZNWHwt1xjD9YRhXIxc\"}}', NULL, '2022-05-05 08:48:00', '2022-05-05 08:48:00'),
(510, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 11:48:15\",\"updated_at\":\"2022-05-05 11:48:15\"},\"old\":{\"last_login\":\"2022-05-05 11:47:30\",\"updated_at\":\"2022-05-05 11:47:30\"}}', NULL, '2022-05-05 08:48:15', '2022-05-05 08:48:15'),
(511, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 11:48:20\",\"updated_at\":\"2022-05-05 11:48:20\"},\"old\":{\"last_login\":\"2022-05-05 11:37:16\",\"updated_at\":\"2022-05-05 11:37:16\"}}', NULL, '2022-05-05 08:48:20', '2022-05-05 08:48:20'),
(512, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"mc2dta5un6VVxbBGCvBZ5jMd2vy6ODylYvstuyws3uePOmzKMX6MRvfqEv88\"},\"old\":{\"remember_token\":\"QBmzn1fHR0i9Uxx0AbI66lMSmvNzxyD34oRzjOsbe29y0OlWAX9ErTXn0CHN\"}}', NULL, '2022-05-05 08:48:37', '2022-05-05 08:48:37'),
(513, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 11:48:44\",\"updated_at\":\"2022-05-05 11:48:44\"},\"old\":{\"last_login\":\"2022-05-05 11:47:02\",\"updated_at\":\"2022-05-05 11:47:02\"}}', NULL, '2022-05-05 08:48:44', '2022-05-05 08:48:44'),
(514, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"aZZfPJ6dBUQB5hfN6Bi23bpyhIe6U4Pj0o4LyUYBTdwklz50n8euIV3YWgyg\"},\"old\":{\"remember_token\":\"TYnXoQXmcbto5L1jLKwsjUWGQNmqW36HxTDhH1JsRwdm4UEhDvbpTZSD5P9M\"}}', NULL, '2022-05-05 08:48:59', '2022-05-05 08:48:59'),
(515, 'default', 'updated', 7, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 11:49:15\",\"updated_at\":\"2022-05-05 11:49:15\"},\"old\":{\"last_login\":null,\"updated_at\":\"2022-04-24 11:23:34\"}}', NULL, '2022-05-05 08:49:15', '2022-05-05 08:49:15'),
(516, 'default', 'updated', 7, 'App\\Components\\User\\Models\\User', NULL, 7, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"LDqoQQ0mrkkCLO7MCiKEkyaEvDoLyktvYAQxVftoMuf9l25KGxjRRSa9HBOU\"},\"old\":{\"remember_token\":null}}', NULL, '2022-05-05 08:49:33', '2022-05-05 08:49:33'),
(517, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 11:49:44\",\"updated_at\":\"2022-05-05 11:49:44\"},\"old\":{\"last_login\":\"2022-05-05 11:48:20\",\"updated_at\":\"2022-05-05 11:48:20\"}}', NULL, '2022-05-05 08:49:44', '2022-05-05 08:49:44'),
(518, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"zmNSGZ6Ox3Ap7tGqpBZigk1E6yVSeKg75WeOrNDN57VUu9pQsH1eTMdZZhTs\"},\"old\":{\"remember_token\":\"mc2dta5un6VVxbBGCvBZ5jMd2vy6ODylYvstuyws3uePOmzKMX6MRvfqEv88\"}}', NULL, '2022-05-05 08:50:00', '2022-05-05 08:50:00'),
(519, 'default', 'updated', 8, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 11:50:07\",\"updated_at\":\"2022-05-05 11:50:07\"},\"old\":{\"last_login\":\"2022-04-24 21:45:24\",\"updated_at\":\"2022-04-24 21:45:24\"}}', NULL, '2022-05-05 08:50:07', '2022-05-05 08:50:07'),
(520, 'default', 'updated', 8, 'App\\Components\\User\\Models\\User', NULL, 8, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"TUbQ5k3Nob8b1pmdOK9sY57cF3IR8Lmzg1eBBZXbn66f1cElXQytfq5QHlFU\"},\"old\":{\"remember_token\":\"das4Na185FQXtAO5xE1BpCKjuzjFteu2YVjkEecFqGLqidJMR3t7wTpCDY0D\"}}', NULL, '2022-05-05 08:50:15', '2022-05-05 08:50:15'),
(521, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 11:50:26\",\"updated_at\":\"2022-05-05 11:50:26\"},\"old\":{\"last_login\":\"2022-05-05 11:46:26\",\"updated_at\":\"2022-05-05 11:46:26\"}}', NULL, '2022-05-05 08:50:26', '2022-05-05 08:50:26'),
(522, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"Cr7iRuWSVIOue7btTRODeHh4auSmsLvLSZ1jpjvMRoJdFWER0rUi89sf9OWj\"},\"old\":{\"remember_token\":\"LZfdkCXThwqt9w0eHU51gg2lTRA69WDTpmsj2zKNfJVyx7lxYGRaSDQFzuLX\"}}', NULL, '2022-05-05 08:50:47', '2022-05-05 08:50:47'),
(523, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 11:50:57\",\"updated_at\":\"2022-05-05 11:50:57\"},\"old\":{\"last_login\":\"2022-05-05 11:49:44\",\"updated_at\":\"2022-05-05 11:49:44\"}}', NULL, '2022-05-05 08:50:57', '2022-05-05 08:50:57'),
(524, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"paDgV5WWDeLDLp6M186W1qP1rb7kZ7vVTIU7y8BQrU8OGlFbgiozA3hQhAum\"},\"old\":{\"remember_token\":\"zmNSGZ6Ox3Ap7tGqpBZigk1E6yVSeKg75WeOrNDN57VUu9pQsH1eTMdZZhTs\"}}', NULL, '2022-05-05 08:52:52', '2022-05-05 08:52:52'),
(525, 'default', 'updated', 7, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 11:53:00\",\"updated_at\":\"2022-05-05 11:53:00\"},\"old\":{\"last_login\":\"2022-05-05 11:49:15\",\"updated_at\":\"2022-05-05 11:49:15\"}}', NULL, '2022-05-05 08:53:00', '2022-05-05 08:53:00'),
(526, 'default', 'updated', 7, 'App\\Components\\User\\Models\\User', NULL, 7, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"kIVSDqyMqJ4VYs9M5TsxlbTALncXNm0UeJykKIEpfn2Sh4shPcjKpwngbVKR\"},\"old\":{\"remember_token\":\"LDqoQQ0mrkkCLO7MCiKEkyaEvDoLyktvYAQxVftoMuf9l25KGxjRRSa9HBOU\"}}', NULL, '2022-05-05 08:56:37', '2022-05-05 08:56:37'),
(527, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 11:56:43\",\"updated_at\":\"2022-05-05 11:56:43\"},\"old\":{\"last_login\":\"2022-05-05 11:48:15\",\"updated_at\":\"2022-05-05 11:48:15\"}}', NULL, '2022-05-05 08:56:43', '2022-05-05 08:56:43'),
(528, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"K7fx25Ddgj2xOx2aLmA1vxPvOtACLlWFmhG8UkwUUZF5nxZ1yN7H5efzYz2I\"},\"old\":{\"remember_token\":\"He8Z3K32A3cuQzyaFUhG87If46mIreYJLQqTHr8R95zmSA2dt6zgGvn8l5J8\"}}', NULL, '2022-05-05 08:58:53', '2022-05-05 08:58:53'),
(529, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 11:59:06\",\"updated_at\":\"2022-05-05 11:59:06\"},\"old\":{\"last_login\":\"2022-05-05 11:50:57\",\"updated_at\":\"2022-05-05 11:50:57\"}}', NULL, '2022-05-05 08:59:06', '2022-05-05 08:59:06'),
(530, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"bWgttTSgGpRV7ibIv5ZSGuYs5FfXRtO39ZYSIas9lDgCbtzUr6lqJD8yjJUl\"},\"old\":{\"remember_token\":\"paDgV5WWDeLDLp6M186W1qP1rb7kZ7vVTIU7y8BQrU8OGlFbgiozA3hQhAum\"}}', NULL, '2022-05-05 08:59:24', '2022-05-05 08:59:24'),
(531, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 11:59:30\",\"updated_at\":\"2022-05-05 11:59:30\"},\"old\":{\"last_login\":\"2022-05-05 11:56:43\",\"updated_at\":\"2022-05-05 11:56:43\"}}', NULL, '2022-05-05 08:59:30', '2022-05-05 08:59:30'),
(532, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"3Z8E5MsWmiaoNKbMjVp98oWRIBKLZUiTNujwXGJfAMV3D4uceVQ7C2VaiGMN\"},\"old\":{\"remember_token\":\"K7fx25Ddgj2xOx2aLmA1vxPvOtACLlWFmhG8UkwUUZF5nxZ1yN7H5efzYz2I\"}}', NULL, '2022-05-05 08:59:46', '2022-05-05 08:59:46'),
(533, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 11:59:59\",\"updated_at\":\"2022-05-05 11:59:59\"},\"old\":{\"last_login\":\"2022-05-05 11:59:06\",\"updated_at\":\"2022-05-05 11:59:06\"}}', NULL, '2022-05-05 08:59:59', '2022-05-05 08:59:59'),
(534, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"j5bbc3NnklbYASFDkWczlWJAYjIFylNjmklawGBoMCMQeF8nusK1eefhN8JS\"},\"old\":{\"remember_token\":\"bWgttTSgGpRV7ibIv5ZSGuYs5FfXRtO39ZYSIas9lDgCbtzUr6lqJD8yjJUl\"}}', NULL, '2022-05-05 09:00:27', '2022-05-05 09:00:27'),
(535, 'default', 'updated', 6, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 12:00:32\",\"updated_at\":\"2022-05-05 12:00:32\"},\"old\":{\"last_login\":null,\"updated_at\":\"2022-04-24 12:38:32\"}}', NULL, '2022-05-05 09:00:32', '2022-05-05 09:00:32'),
(536, 'default', 'updated', 6, 'App\\Components\\User\\Models\\User', NULL, 6, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"zpMIEP1rjCaGv8Ax9LCRpwTWP7KSJK5MiMMQYIUOHsuOhg83siIcE5FxBEdJ\"},\"old\":{\"remember_token\":null}}', NULL, '2022-05-05 09:00:57', '2022-05-05 09:00:57'),
(537, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 12:01:07\",\"updated_at\":\"2022-05-05 12:01:07\"},\"old\":{\"last_login\":\"2022-05-05 11:59:30\",\"updated_at\":\"2022-05-05 11:59:30\"}}', NULL, '2022-05-05 09:01:07', '2022-05-05 09:01:07'),
(538, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 13:28:03\",\"updated_at\":\"2022-05-05 13:28:03\"},\"old\":{\"last_login\":\"2022-05-05 04:01:07\",\"updated_at\":\"2022-05-05 04:01:07\"}}', NULL, '2022-05-05 18:28:03', '2022-05-05 18:28:03'),
(539, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"4Ch7gqIe9Onebec1cEhwXFK5Ml3i1oFjoskVO08Snl91JWF8H4J3qzsZccV1\"},\"old\":{\"remember_token\":\"3Z8E5MsWmiaoNKbMjVp98oWRIBKLZUiTNujwXGJfAMV3D4uceVQ7C2VaiGMN\"}}', NULL, '2022-05-05 18:30:43', '2022-05-05 18:30:43'),
(540, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 13:31:02\",\"updated_at\":\"2022-05-05 13:31:02\"},\"old\":{\"last_login\":\"2022-05-05 03:50:26\",\"updated_at\":\"2022-05-05 03:50:26\"}}', NULL, '2022-05-05 18:31:02', '2022-05-05 18:31:02'),
(541, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"6Rw12DsLWoPmVM9NGf02kDpnowaYh1asxSglO3mV3mfzcthWjy6zwmFWj5vU\"},\"old\":{\"remember_token\":\"Cr7iRuWSVIOue7btTRODeHh4auSmsLvLSZ1jpjvMRoJdFWER0rUi89sf9OWj\"}}', NULL, '2022-05-05 18:51:53', '2022-05-05 18:51:53'),
(542, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"g5ZLa3h107dfo4mAMVDzGok7N94ZRpD3gZciAF6YrhvRV7OhQ5exJIUXIF4p\"},\"old\":{\"remember_token\":\"6Rw12DsLWoPmVM9NGf02kDpnowaYh1asxSglO3mV3mfzcthWjy6zwmFWj5vU\"}}', NULL, '2022-05-05 18:51:53', '2022-05-05 18:51:53');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `event`, `causer_id`, `causer_type`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(543, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 13:52:09\",\"updated_at\":\"2022-05-05 13:52:09\"},\"old\":{\"last_login\":\"2022-05-05 03:48:44\",\"updated_at\":\"2022-05-05 03:48:44\"}}', NULL, '2022-05-05 18:52:09', '2022-05-05 18:52:09'),
(544, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"9ZcunbjNHHkqdAzXaV35U1ceyLTYyP1HKlwsYXEGc8Jsxr0RhQxN2EjmVXeO\"},\"old\":{\"remember_token\":\"aZZfPJ6dBUQB5hfN6Bi23bpyhIe6U4Pj0o4LyUYBTdwklz50n8euIV3YWgyg\"}}', NULL, '2022-05-05 18:52:55', '2022-05-05 18:52:55'),
(545, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 13:54:31\",\"updated_at\":\"2022-05-05 13:54:31\"},\"old\":{\"last_login\":\"2022-05-05 13:28:03\",\"updated_at\":\"2022-05-05 13:28:03\"}}', NULL, '2022-05-05 18:54:31', '2022-05-05 18:54:31'),
(546, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"vcSBjKPH7ydwKcRqK5AIXAGeDNMnp2jj5lhKRZHlvmUALd8bPZsqbotxuOwY\"},\"old\":{\"remember_token\":\"4Ch7gqIe9Onebec1cEhwXFK5Ml3i1oFjoskVO08Snl91JWF8H4J3qzsZccV1\"}}', NULL, '2022-05-05 18:55:39', '2022-05-05 18:55:39'),
(547, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 13:55:55\",\"updated_at\":\"2022-05-05 13:55:55\"},\"old\":{\"last_login\":\"2022-05-05 03:59:59\",\"updated_at\":\"2022-05-05 03:59:59\"}}', NULL, '2022-05-05 18:55:55', '2022-05-05 18:55:55'),
(548, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"mYIE1YTQNGhE5iYcOKEqSOb2G2Do3eDtFYNlwOmjEjGXRgpocGiUSRFdKouy\"},\"old\":{\"remember_token\":\"j5bbc3NnklbYASFDkWczlWJAYjIFylNjmklawGBoMCMQeF8nusK1eefhN8JS\"}}', NULL, '2022-05-05 18:56:40', '2022-05-05 18:56:40'),
(549, 'default', 'updated', 7, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 13:57:48\",\"updated_at\":\"2022-05-05 13:57:48\"},\"old\":{\"last_login\":\"2022-05-05 03:53:00\",\"updated_at\":\"2022-05-05 03:53:00\"}}', NULL, '2022-05-05 18:57:48', '2022-05-05 18:57:48'),
(550, 'default', 'updated', 7, 'App\\Components\\User\\Models\\User', NULL, 7, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"ftFSOsZJvK6zQimGtSI9BNfI4UvIH7Bgc6MhRbGKCwQnPzMhmcCOl2CZ2Re7\"},\"old\":{\"remember_token\":\"kIVSDqyMqJ4VYs9M5TsxlbTALncXNm0UeJykKIEpfn2Sh4shPcjKpwngbVKR\"}}', NULL, '2022-05-05 18:58:13', '2022-05-05 18:58:13'),
(551, 'default', 'updated', 8, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 13:58:40\",\"updated_at\":\"2022-05-05 13:58:40\"},\"old\":{\"last_login\":\"2022-05-05 03:50:07\",\"updated_at\":\"2022-05-05 03:50:07\"}}', NULL, '2022-05-05 18:58:40', '2022-05-05 18:58:40'),
(552, 'default', 'updated', 8, 'App\\Components\\User\\Models\\User', NULL, 8, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"1scwAkha7MdKJIgBcN5WJ2zVrvvGDG80BiIRxNlmkxYrSVhMDNSIq8qdPc5f\"},\"old\":{\"remember_token\":\"TUbQ5k3Nob8b1pmdOK9sY57cF3IR8Lmzg1eBBZXbn66f1cElXQytfq5QHlFU\"}}', NULL, '2022-05-05 18:59:00', '2022-05-05 18:59:00'),
(553, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 13:59:17\",\"updated_at\":\"2022-05-05 13:59:17\"},\"old\":{\"last_login\":\"2022-05-05 13:54:31\",\"updated_at\":\"2022-05-05 13:54:31\"}}', NULL, '2022-05-05 18:59:17', '2022-05-05 18:59:17'),
(554, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"CVlhTZJkB9ryZBHSHuP4v5r3U9QkPhkLrfLdPiAcOW58YcpwBXLeJgBhUUFz\"},\"old\":{\"remember_token\":\"vcSBjKPH7ydwKcRqK5AIXAGeDNMnp2jj5lhKRZHlvmUALd8bPZsqbotxuOwY\"}}', NULL, '2022-05-05 19:00:00', '2022-05-05 19:00:00'),
(555, 'default', 'updated', 7, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 14:00:11\",\"updated_at\":\"2022-05-05 14:00:11\"},\"old\":{\"last_login\":\"2022-05-05 13:57:48\",\"updated_at\":\"2022-05-05 13:57:48\"}}', NULL, '2022-05-05 19:00:11', '2022-05-05 19:00:11'),
(556, 'default', 'updated', 7, 'App\\Components\\User\\Models\\User', NULL, 7, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"VtvQ9VfOuMKAN6L7evqfZxyWzin0BOsT6q4tcLesjl6BF6rwmQQrCcZmVlPF\"},\"old\":{\"remember_token\":\"ftFSOsZJvK6zQimGtSI9BNfI4UvIH7Bgc6MhRbGKCwQnPzMhmcCOl2CZ2Re7\"}}', NULL, '2022-05-05 19:00:47', '2022-05-05 19:00:47'),
(557, 'default', 'updated', 8, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 14:00:59\",\"updated_at\":\"2022-05-05 14:00:59\"},\"old\":{\"last_login\":\"2022-05-05 13:58:40\",\"updated_at\":\"2022-05-05 13:58:40\"}}', NULL, '2022-05-05 19:00:59', '2022-05-05 19:00:59'),
(558, 'default', 'updated', 8, 'App\\Components\\User\\Models\\User', NULL, 8, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"55VbrpHTFnb82Roz8J9bpzYAl8hguxg1RuHJcl9rT7vxqZVd4WHtBYYitlWx\"},\"old\":{\"remember_token\":\"1scwAkha7MdKJIgBcN5WJ2zVrvvGDG80BiIRxNlmkxYrSVhMDNSIq8qdPc5f\"}}', NULL, '2022-05-05 19:01:14', '2022-05-05 19:01:14'),
(559, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-05 14:01:26\",\"updated_at\":\"2022-05-05 14:01:26\"},\"old\":{\"last_login\":\"2022-05-05 13:59:17\",\"updated_at\":\"2022-05-05 13:59:17\"}}', NULL, '2022-05-05 19:01:26', '2022-05-05 19:01:26'),
(560, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-06 05:50:32\",\"updated_at\":\"2022-05-06 05:50:32\"},\"old\":{\"last_login\":\"2022-05-05 14:01:26\",\"updated_at\":\"2022-05-05 14:01:26\"}}', NULL, '2022-05-06 10:50:32', '2022-05-06 10:50:32'),
(561, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-06 05:50:32\",\"updated_at\":\"2022-05-06 05:50:32\"},\"old\":{\"last_login\":\"2022-05-05 14:01:26\",\"updated_at\":\"2022-05-05 14:01:26\"}}', NULL, '2022-05-06 10:50:32', '2022-05-06 10:50:32'),
(562, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-06 12:00:37\",\"updated_at\":\"2022-05-06 12:00:37\"},\"old\":{\"last_login\":\"2022-05-06 05:50:32\",\"updated_at\":\"2022-05-06 05:50:32\"}}', NULL, '2022-05-06 17:00:37', '2022-05-06 17:00:37'),
(563, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"2juMRXNYJ6LuiAT6ihBwc6bD0DRIG4TCwSF7KP3UtBCpqIEG13BzViaQcJ0j\"},\"old\":{\"remember_token\":\"CVlhTZJkB9ryZBHSHuP4v5r3U9QkPhkLrfLdPiAcOW58YcpwBXLeJgBhUUFz\"}}', NULL, '2022-05-06 17:19:54', '2022-05-06 17:19:54'),
(564, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-06 12:20:09\",\"updated_at\":\"2022-05-06 12:20:09\"},\"old\":{\"last_login\":\"2022-05-05 13:31:02\",\"updated_at\":\"2022-05-05 13:31:02\"}}', NULL, '2022-05-06 17:20:09', '2022-05-06 17:20:09'),
(565, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"n4ELJ9JLpV0TgeH6PfvN06cRA6BScfYE8LGhMFz0XJugjcf76D9HBkohiuc0\"},\"old\":{\"remember_token\":\"g5ZLa3h107dfo4mAMVDzGok7N94ZRpD3gZciAF6YrhvRV7OhQ5exJIUXIF4p\"}}', NULL, '2022-05-06 17:20:53', '2022-05-06 17:20:53'),
(566, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-06 12:21:28\",\"updated_at\":\"2022-05-06 12:21:28\"},\"old\":{\"last_login\":\"2022-05-05 13:52:09\",\"updated_at\":\"2022-05-05 13:52:09\"}}', NULL, '2022-05-06 17:21:28', '2022-05-06 17:21:28'),
(567, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"A5MhSblls0wncoGf5LdbPmsvgMRQ1APplrxfcqxJIvziZlbPTiqCpzD4b9uJ\"},\"old\":{\"remember_token\":\"9ZcunbjNHHkqdAzXaV35U1ceyLTYyP1HKlwsYXEGc8Jsxr0RhQxN2EjmVXeO\"}}', NULL, '2022-05-06 17:22:22', '2022-05-06 17:22:22'),
(568, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-06 12:22:36\",\"updated_at\":\"2022-05-06 12:22:36\"},\"old\":{\"last_login\":\"2022-05-06 12:00:37\",\"updated_at\":\"2022-05-06 12:00:37\"}}', NULL, '2022-05-06 17:22:36', '2022-05-06 17:22:36'),
(569, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"8suLR7lCv8JqRMx49Q9oToUy0vJV8iCwjRQ9JLe9bvZxk9PJOIGGJR3JMAru\"},\"old\":{\"remember_token\":\"2juMRXNYJ6LuiAT6ihBwc6bD0DRIG4TCwSF7KP3UtBCpqIEG13BzViaQcJ0j\"}}', NULL, '2022-05-06 17:23:01', '2022-05-06 17:23:01'),
(570, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-06 12:23:14\",\"updated_at\":\"2022-05-06 12:23:14\"},\"old\":{\"last_login\":\"2022-05-05 13:55:55\",\"updated_at\":\"2022-05-05 13:55:55\"}}', NULL, '2022-05-06 17:23:14', '2022-05-06 17:23:14'),
(571, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"NffILabI4YSQTcQukXLeDPgtnW4zmWZiN4rBLnals35rxPtCd9jTy4QCN9oa\"},\"old\":{\"remember_token\":\"mYIE1YTQNGhE5iYcOKEqSOb2G2Do3eDtFYNlwOmjEjGXRgpocGiUSRFdKouy\"}}', NULL, '2022-05-06 17:23:39', '2022-05-06 17:23:39'),
(572, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-06 12:23:52\",\"updated_at\":\"2022-05-06 12:23:52\"},\"old\":{\"last_login\":\"2022-05-06 12:22:36\",\"updated_at\":\"2022-05-06 12:22:36\"}}', NULL, '2022-05-06 17:23:52', '2022-05-06 17:23:52'),
(573, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"skWdWjiEMN3YrviX2yEDPb2HUU1rxexLz6WuvJQddHpUp4HqVZnqxF1ErfIF\"},\"old\":{\"remember_token\":\"8suLR7lCv8JqRMx49Q9oToUy0vJV8iCwjRQ9JLe9bvZxk9PJOIGGJR3JMAru\"}}', NULL, '2022-05-06 18:50:39', '2022-05-06 18:50:39'),
(574, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-06 13:50:59\",\"updated_at\":\"2022-05-06 13:50:59\"},\"old\":{\"last_login\":\"2022-05-06 12:20:09\",\"updated_at\":\"2022-05-06 12:20:09\"}}', NULL, '2022-05-06 18:50:59', '2022-05-06 18:50:59'),
(575, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"ZPIcWzbEG599Szj2eg9mtw8MXCv4E3DDnXej9h8jENFgz3Nc7gkAr5t7gNVP\"},\"old\":{\"remember_token\":\"n4ELJ9JLpV0TgeH6PfvN06cRA6BScfYE8LGhMFz0XJugjcf76D9HBkohiuc0\"}}', NULL, '2022-05-06 18:51:27', '2022-05-06 18:51:27'),
(576, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-06 13:51:43\",\"updated_at\":\"2022-05-06 13:51:43\"},\"old\":{\"last_login\":\"2022-05-06 12:21:28\",\"updated_at\":\"2022-05-06 12:21:28\"}}', NULL, '2022-05-06 18:51:43', '2022-05-06 18:51:43'),
(577, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"WcgzdqtfRmRrWq60fCZDid5h7BBL0isxCJgqWU2hACEx8TVWC8f8PtWuXj1M\"},\"old\":{\"remember_token\":\"A5MhSblls0wncoGf5LdbPmsvgMRQ1APplrxfcqxJIvziZlbPTiqCpzD4b9uJ\"}}', NULL, '2022-05-06 18:52:14', '2022-05-06 18:52:14'),
(578, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-06 13:52:29\",\"updated_at\":\"2022-05-06 13:52:29\"},\"old\":{\"last_login\":\"2022-05-06 12:23:14\",\"updated_at\":\"2022-05-06 12:23:14\"}}', NULL, '2022-05-06 18:52:29', '2022-05-06 18:52:29'),
(579, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"HU2gX6dFvSGazP4rYaGjShIcPxPHDUiUqYvgUMZK9DcGZqD7myHSTLIWvwlz\"},\"old\":{\"remember_token\":\"NffILabI4YSQTcQukXLeDPgtnW4zmWZiN4rBLnals35rxPtCd9jTy4QCN9oa\"}}', NULL, '2022-05-06 18:52:44', '2022-05-06 18:52:44'),
(580, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-06 13:52:59\",\"updated_at\":\"2022-05-06 13:52:59\"},\"old\":{\"last_login\":\"2022-05-06 12:23:52\",\"updated_at\":\"2022-05-06 12:23:52\"}}', NULL, '2022-05-06 18:52:59', '2022-05-06 18:52:59'),
(581, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"3S3G0oowBWFJxSw7ouWXPyQCqlZEjYp48aKFhmpqAMgm29yohE2puiyWz4TT\"},\"old\":{\"remember_token\":\"skWdWjiEMN3YrviX2yEDPb2HUU1rxexLz6WuvJQddHpUp4HqVZnqxF1ErfIF\"}}', NULL, '2022-05-06 18:53:20', '2022-05-06 18:53:20'),
(582, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-06 13:53:32\",\"updated_at\":\"2022-05-06 13:53:32\"},\"old\":{\"last_login\":\"2022-05-06 13:52:29\",\"updated_at\":\"2022-05-06 13:52:29\"}}', NULL, '2022-05-06 18:53:32', '2022-05-06 18:53:32'),
(583, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"cm6grAEMDq3HWusyQdLhgDocgQHR5QrXOpAyfwbQg2e4XK2yGegQeCnUFsxO\"},\"old\":{\"remember_token\":\"HU2gX6dFvSGazP4rYaGjShIcPxPHDUiUqYvgUMZK9DcGZqD7myHSTLIWvwlz\"}}', NULL, '2022-05-06 18:54:20', '2022-05-06 18:54:20'),
(584, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-06 13:54:41\",\"updated_at\":\"2022-05-06 13:54:41\"},\"old\":{\"last_login\":\"2022-05-06 13:52:59\",\"updated_at\":\"2022-05-06 13:52:59\"}}', NULL, '2022-05-06 18:54:41', '2022-05-06 18:54:41'),
(585, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"B88mMk1UxOuTbQMKDmMwP4ehSFcgtG4DUpjTheRsHAildPHTJawwEzk002aS\"},\"old\":{\"remember_token\":\"3S3G0oowBWFJxSw7ouWXPyQCqlZEjYp48aKFhmpqAMgm29yohE2puiyWz4TT\"}}', NULL, '2022-05-06 18:54:56', '2022-05-06 18:54:56'),
(586, 'default', 'updated', 7, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-06 13:55:07\",\"updated_at\":\"2022-05-06 13:55:07\"},\"old\":{\"last_login\":\"2022-05-05 14:00:11\",\"updated_at\":\"2022-05-05 14:00:11\"}}', NULL, '2022-05-06 18:55:07', '2022-05-06 18:55:07'),
(587, 'default', 'updated', 7, 'App\\Components\\User\\Models\\User', NULL, 7, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"Ud1iDkIg8SFScktOQTYWkGX2eVls1pvxHyW8Ep8J9d75VsJfUfBVAYFaWaRC\"},\"old\":{\"remember_token\":\"VtvQ9VfOuMKAN6L7evqfZxyWzin0BOsT6q4tcLesjl6BF6rwmQQrCcZmVlPF\"}}', NULL, '2022-05-06 18:55:31', '2022-05-06 18:55:31'),
(588, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-06 13:55:40\",\"updated_at\":\"2022-05-06 13:55:40\"},\"old\":{\"last_login\":\"2022-05-06 13:54:41\",\"updated_at\":\"2022-05-06 13:54:41\"}}', NULL, '2022-05-06 18:55:40', '2022-05-06 18:55:40'),
(589, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"eNnEH26PyPTEuiN4l6qhZ5L2wRURrWlzmvoc07ogF4ojOXuMbVDoe5nGXfhm\"},\"old\":{\"remember_token\":\"B88mMk1UxOuTbQMKDmMwP4ehSFcgtG4DUpjTheRsHAildPHTJawwEzk002aS\"}}', NULL, '2022-05-06 18:57:15', '2022-05-06 18:57:15'),
(590, 'default', 'updated', 8, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-06 13:57:25\",\"updated_at\":\"2022-05-06 13:57:25\"},\"old\":{\"last_login\":\"2022-05-05 14:00:59\",\"updated_at\":\"2022-05-05 14:00:59\"}}', NULL, '2022-05-06 18:57:25', '2022-05-06 18:57:25'),
(591, 'default', 'updated', 8, 'App\\Components\\User\\Models\\User', NULL, 8, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"2M4HyKQN4N9YFG3DjCO2VCAq6u8E6ZzkowerIVTw1MmYK8nVlGQw0FtncO8C\"},\"old\":{\"remember_token\":\"55VbrpHTFnb82Roz8J9bpzYAl8hguxg1RuHJcl9rT7vxqZVd4WHtBYYitlWx\"}}', NULL, '2022-05-06 18:57:54', '2022-05-06 18:57:54'),
(592, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-06 13:58:04\",\"updated_at\":\"2022-05-06 13:58:04\"},\"old\":{\"last_login\":\"2022-05-06 13:55:40\",\"updated_at\":\"2022-05-06 13:55:40\"}}', NULL, '2022-05-06 18:58:04', '2022-05-06 18:58:04'),
(593, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-07 19:52:03\",\"updated_at\":\"2022-05-07 19:52:03\"},\"old\":{\"last_login\":\"2022-04-24 03:05:03\",\"updated_at\":\"2022-04-24 03:05:03\"}}', NULL, '2022-05-08 00:52:03', '2022-05-08 00:52:03'),
(594, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-08 07:14:27\",\"updated_at\":\"2022-05-08 07:14:27\"},\"old\":{\"last_login\":\"2022-05-06 13:58:04\",\"updated_at\":\"2022-05-06 13:58:04\"}}', NULL, '2022-05-08 12:14:27', '2022-05-08 12:14:27'),
(595, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"k9cVGPMZe4yaQsj78dpHyq8SaJJNTf7AvXXGcKpvLuqXywAoWmDgk0P1STjP\"},\"old\":{\"remember_token\":\"eNnEH26PyPTEuiN4l6qhZ5L2wRURrWlzmvoc07ogF4ojOXuMbVDoe5nGXfhm\"}}', NULL, '2022-05-08 12:20:00', '2022-05-08 12:20:00'),
(596, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-08 07:20:12\",\"updated_at\":\"2022-05-08 07:20:12\"},\"old\":{\"last_login\":\"2022-05-06 13:50:59\",\"updated_at\":\"2022-05-06 13:50:59\"}}', NULL, '2022-05-08 12:20:12', '2022-05-08 12:20:12'),
(597, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"tGY7QiTIdjwBlhWV9aGC8e1RJweR9CMabGhYWECvYkZqZhe53wtWmVGltEch\"},\"old\":{\"remember_token\":\"ZPIcWzbEG599Szj2eg9mtw8MXCv4E3DDnXej9h8jENFgz3Nc7gkAr5t7gNVP\"}}', NULL, '2022-05-08 12:21:52', '2022-05-08 12:21:52'),
(598, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-08 07:23:13\",\"updated_at\":\"2022-05-08 07:23:13\"},\"old\":{\"last_login\":\"2022-05-06 13:51:43\",\"updated_at\":\"2022-05-06 13:51:43\"}}', NULL, '2022-05-08 12:23:13', '2022-05-08 12:23:13'),
(599, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"whR9Q8LZnlZCa2N9KQecXaGnLSjOK9Dv0AfjgT9wguibuSlXho9fbYvEMK1R\"},\"old\":{\"remember_token\":\"WcgzdqtfRmRrWq60fCZDid5h7BBL0isxCJgqWU2hACEx8TVWC8f8PtWuXj1M\"}}', NULL, '2022-05-08 12:24:42', '2022-05-08 12:24:42'),
(600, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-08 07:24:50\",\"updated_at\":\"2022-05-08 07:24:50\"},\"old\":{\"last_login\":\"2022-05-08 07:14:27\",\"updated_at\":\"2022-05-08 07:14:27\"}}', NULL, '2022-05-08 12:24:50', '2022-05-08 12:24:50'),
(601, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-08 11:32:59\",\"updated_at\":\"2022-05-08 11:32:59\"},\"old\":{\"last_login\":\"2022-05-08 07:24:50\",\"updated_at\":\"2022-05-08 07:24:50\"}}', NULL, '2022-05-08 16:32:59', '2022-05-08 16:32:59'),
(602, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-09 06:56:34\",\"updated_at\":\"2022-05-09 06:56:34\"},\"old\":{\"last_login\":\"2022-05-08 11:32:59\",\"updated_at\":\"2022-05-08 11:32:59\"}}', NULL, '2022-05-09 11:56:34', '2022-05-09 11:56:34'),
(603, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"kNx6JO2lv9n1cPR4q85FrNs6X6uCNqcKuywXvCIsxJ2wEOiVZRnWyrN63EOp\"},\"old\":{\"remember_token\":\"k9cVGPMZe4yaQsj78dpHyq8SaJJNTf7AvXXGcKpvLuqXywAoWmDgk0P1STjP\"}}', NULL, '2022-05-09 12:35:05', '2022-05-09 12:35:05'),
(604, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-09 07:35:16\",\"updated_at\":\"2022-05-09 07:35:16\"},\"old\":{\"last_login\":\"2022-05-08 07:20:12\",\"updated_at\":\"2022-05-08 07:20:12\"}}', NULL, '2022-05-09 12:35:16', '2022-05-09 12:35:16'),
(605, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', NULL, 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"pqwmofSQluEjkEI634nEgMmfwlpyKaU4xzBfSXBlhkmwkgEbbeVd6pzY2Nr7\"},\"old\":{\"remember_token\":\"tGY7QiTIdjwBlhWV9aGC8e1RJweR9CMabGhYWECvYkZqZhe53wtWmVGltEch\"}}', NULL, '2022-05-09 12:35:42', '2022-05-09 12:35:42'),
(606, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-09 07:35:50\",\"updated_at\":\"2022-05-09 07:35:50\"},\"old\":{\"last_login\":\"2022-05-08 07:23:13\",\"updated_at\":\"2022-05-08 07:23:13\"}}', NULL, '2022-05-09 12:35:51', '2022-05-09 12:35:51'),
(607, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', NULL, 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"fTewi6RbSDUZxBAiqSLfpYEvq19ulCvageSmslWtzdE7hOk6Wy8tZbIN67lM\"},\"old\":{\"remember_token\":\"whR9Q8LZnlZCa2N9KQecXaGnLSjOK9Dv0AfjgT9wguibuSlXho9fbYvEMK1R\"}}', NULL, '2022-05-09 12:36:15', '2022-05-09 12:36:15'),
(608, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-09 07:36:24\",\"updated_at\":\"2022-05-09 07:36:24\"},\"old\":{\"last_login\":\"2022-05-09 06:56:34\",\"updated_at\":\"2022-05-09 06:56:34\"}}', NULL, '2022-05-09 12:36:24', '2022-05-09 12:36:24'),
(609, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"HCCQWolxoZLZO4jdn3MbUNFCCALNkiU89Uu8Wn3zURMcRIx0Y8bNWqNX6cvC\"},\"old\":{\"remember_token\":\"kNx6JO2lv9n1cPR4q85FrNs6X6uCNqcKuywXvCIsxJ2wEOiVZRnWyrN63EOp\"}}', NULL, '2022-05-09 12:42:36', '2022-05-09 12:42:36'),
(610, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-09 07:42:47\",\"updated_at\":\"2022-05-09 07:42:47\"},\"old\":{\"last_login\":\"2022-05-06 13:53:32\",\"updated_at\":\"2022-05-06 13:53:32\"}}', NULL, '2022-05-09 12:42:47', '2022-05-09 12:42:47'),
(611, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', NULL, 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"17YIcbr7WtgkoRzoh3bXn4opSNAmc5bYb74HyT8Fzs7w6KwWfiCl53UBoQ6H\"},\"old\":{\"remember_token\":\"cm6grAEMDq3HWusyQdLhgDocgQHR5QrXOpAyfwbQg2e4XK2yGegQeCnUFsxO\"}}', NULL, '2022-05-09 12:43:08', '2022-05-09 12:43:08'),
(612, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', NULL, NULL, NULL, '{\"attributes\":{\"last_login\":\"2022-05-09 07:43:16\",\"updated_at\":\"2022-05-09 07:43:16\"},\"old\":{\"last_login\":\"2022-05-09 07:36:24\",\"updated_at\":\"2022-05-09 07:36:24\"}}', NULL, '2022-05-09 12:43:16', '2022-05-09 12:43:16'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-05-11 02:38:34', '2022-05-11 02:38:34'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-05-11 19:08:45', '2022-05-11 19:08:45'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-05-12 16:57:12', '2022-05-12 16:57:12'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-05-12 19:15:54', '2022-05-12 19:15:54'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-05-12 23:35:07', '2022-05-12 23:35:07'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-05-13 04:38:41', '2022-05-13 04:38:41'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-05-13 17:33:23', '2022-05-13 17:33:23'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-05-13 21:40:19', '2022-05-13 21:40:19'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-05-13 21:40:22', '2022-05-13 21:40:22'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-05-14 19:29:51', '2022-05-14 19:29:51'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-05-16 00:13:56', '2022-05-16 00:13:56'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-05-22 01:08:49', '2022-05-22 01:08:49'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-05-22 22:44:55', '2022-05-22 22:44:55'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-05-24 23:40:03', '2022-05-24 23:40:03'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-01 01:15:29', '2022-06-01 01:15:29'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-01 23:11:31', '2022-06-01 23:11:31'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-02 21:37:43', '2022-06-02 21:37:43'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-05 19:26:15', '2022-06-05 19:26:15'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-06 20:50:58', '2022-06-06 20:50:58'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-08 21:23:58', '2022-06-08 21:23:58'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-09 23:34:31', '2022-06-09 23:34:31'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-10 22:55:04', '2022-06-10 22:55:04'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-11 07:05:18', '2022-06-11 07:05:18'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-12 22:44:42', '2022-06-12 22:44:42'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-14 01:03:24', '2022-06-14 01:03:24'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-15 01:24:11', '2022-06-15 01:24:11'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-15 18:06:29', '2022-06-15 18:06:29'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-15 23:47:47', '2022-06-15 23:47:47'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-16 06:24:24', '2022-06-16 06:24:24'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-16 22:13:13', '2022-06-16 22:13:13'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-19 21:30:15', '2022-06-19 21:30:15'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-20 17:51:52', '2022-06-20 17:51:52'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-21 01:48:18', '2022-06-21 01:48:18'),
(0, 'default', 'created', 10, 'App\\Components\\User\\Models\\User', 'created', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 01:54:39', '2022-06-21 01:54:39'),
(0, 'default', 'updated', 10, 'App\\Components\\User\\Models\\User', 'updated', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 01:56:53', '2022-06-21 01:56:53'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 01:57:03', '2022-06-21 01:57:03'),
(0, 'default', 'updated', 10, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-21 01:57:49', '2022-06-21 01:57:49'),
(0, 'default', 'updated', 10, 'App\\Components\\User\\Models\\User', 'updated', 10, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 02:27:17', '2022-06-21 02:27:17'),
(0, 'default', 'updated', 10, 'App\\Components\\User\\Models\\User', 'updated', 10, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 03:19:47', '2022-06-21 03:19:47'),
(0, 'default', 'updated', 10, 'App\\Components\\User\\Models\\User', 'updated', 10, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 03:21:08', '2022-06-21 03:21:08'),
(0, 'default', 'updated', 10, 'App\\Components\\User\\Models\\User', 'updated', 10, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 03:44:46', '2022-06-21 03:44:46'),
(0, 'default', 'updated', 10, 'App\\Components\\User\\Models\\User', 'updated', 10, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 03:45:15', '2022-06-21 03:45:15'),
(0, 'default', 'updated', 10, 'App\\Components\\User\\Models\\User', 'updated', 10, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 03:49:04', '2022-06-21 03:49:04'),
(0, 'default', 'updated', 10, 'App\\Components\\User\\Models\\User', 'updated', 10, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 03:49:46', '2022-06-21 03:49:46'),
(0, 'default', 'updated', 10, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-21 20:35:29', '2022-06-21 20:35:29'),
(0, 'default', 'updated', 10, 'App\\Components\\User\\Models\\User', 'updated', 10, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 20:37:04', '2022-06-21 20:37:04'),
(0, 'default', 'updated', 10, 'App\\Components\\User\\Models\\User', 'updated', 10, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 20:40:10', '2022-06-21 20:40:10'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', 10, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 20:44:39', '2022-06-21 20:44:39'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 20:46:58', '2022-06-21 20:46:58'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-21 20:47:07', '2022-06-21 20:47:07'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 20:47:21', '2022-06-21 20:47:21'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-21 20:47:28', '2022-06-21 20:47:28'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 20:49:32', '2022-06-21 20:49:32'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-21 20:50:01', '2022-06-21 20:50:01'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 20:50:33', '2022-06-21 20:50:33'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-21 20:50:44', '2022-06-21 20:50:44'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 20:57:52', '2022-06-21 20:57:52'),
(0, 'default', 'updated', 10, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-21 20:58:04', '2022-06-21 20:58:04'),
(0, 'default', 'updated', 10, 'App\\Components\\User\\Models\\User', 'updated', 10, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 21:05:32', '2022-06-21 21:05:32'),
(0, 'default', 'updated', 10, 'App\\Components\\User\\Models\\User', 'updated', 10, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 21:05:38', '2022-06-21 21:05:38'),
(0, 'default', 'updated', 10, 'App\\Components\\User\\Models\\User', 'updated', 10, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 21:06:06', '2022-06-21 21:06:06'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-21 21:09:26', '2022-06-21 21:09:26'),
(0, 'default', 'created', 11, 'App\\Components\\User\\Models\\User', 'created', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 21:11:04', '2022-06-21 21:11:04'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 21:11:16', '2022-06-21 21:11:16'),
(0, 'default', 'updated', 11, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-21 21:11:27', '2022-06-21 21:11:27'),
(0, 'default', 'updated', 11, 'App\\Components\\User\\Models\\User', 'updated', 11, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 21:11:35', '2022-06-21 21:11:35'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-21 21:12:42', '2022-06-21 21:12:42'),
(0, 'default', 'created', 12, 'App\\Components\\User\\Models\\User', 'created', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 21:13:36', '2022-06-21 21:13:36'),
(0, 'default', 'created', 20, 'App\\Components\\User\\Models\\User', 'created', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 21:47:27', '2022-06-21 21:47:27'),
(0, 'default', 'created', 21, 'App\\Components\\User\\Models\\User', 'created', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 21:53:49', '2022-06-21 21:53:49'),
(0, 'default', 'created', 23, 'App\\Components\\User\\Models\\User', 'created', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 22:01:57', '2022-06-21 22:01:57'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 22:03:17', '2022-06-21 22:03:17'),
(0, 'default', 'updated', 23, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-21 22:03:33', '2022-06-21 22:03:33'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-21 22:03:48', '2022-06-21 22:03:48'),
(0, 'default', 'created', 24, 'App\\Components\\User\\Models\\User', 'created', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 22:04:51', '2022-06-21 22:04:51'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 22:05:15', '2022-06-21 22:05:15'),
(0, 'default', 'updated', 24, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-21 22:05:23', '2022-06-21 22:05:23'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', 24, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 22:05:33', '2022-06-21 22:05:33'),
(0, 'default', 'created', 25, 'App\\Components\\User\\Models\\User', 'created', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 22:06:58', '2022-06-21 22:06:58'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 22:08:01', '2022-06-21 22:08:01'),
(0, 'default', 'updated', 25, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-21 22:08:07', '2022-06-21 22:08:07'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', 25, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 22:08:29', '2022-06-21 22:08:29'),
(0, 'default', 'created', 26, 'App\\Components\\User\\Models\\User', 'created', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 22:12:17', '2022-06-21 22:12:17'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 22:12:23', '2022-06-21 22:12:23'),
(0, 'default', 'updated', 26, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-21 22:12:41', '2022-06-21 22:12:41'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', 26, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 22:48:57', '2022-06-21 22:48:57'),
(0, 'default', 'created', 27, 'App\\Components\\User\\Models\\User', 'created', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 22:50:33', '2022-06-21 22:50:33'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 22:50:50', '2022-06-21 22:50:50'),
(0, 'default', 'updated', 27, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-21 22:51:02', '2022-06-21 22:51:02'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-21 22:52:24', '2022-06-21 22:52:24'),
(0, 'default', 'created', 28, 'App\\Components\\User\\Models\\User', 'created', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 23:05:51', '2022-06-21 23:05:51'),
(0, 'default', 'created', 29, 'App\\Components\\User\\Models\\User', 'created', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 23:06:55', '2022-06-21 23:06:55'),
(0, 'default', 'created', 30, 'App\\Components\\User\\Models\\User', 'created', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 23:10:43', '2022-06-21 23:10:43'),
(0, 'default', 'updated', 30, 'App\\Components\\User\\Models\\User', 'updated', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 23:10:43', '2022-06-21 23:10:43'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-21 23:11:00', '2022-06-21 23:11:00'),
(0, 'default', 'updated', 30, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-21 23:11:23', '2022-06-21 23:11:23'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-22 01:08:03', '2022-06-22 01:08:03'),
(0, 'default', 'created', 31, 'App\\Components\\User\\Models\\User', 'created', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-22 01:09:02', '2022-06-22 01:09:02'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-22 01:10:29', '2022-06-22 01:10:29'),
(0, 'default', 'updated', 31, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-22 01:10:39', '2022-06-22 01:10:39'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', 31, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-22 01:33:53', '2022-06-22 01:33:53'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-22 02:01:22', '2022-06-22 02:01:22'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-22 02:01:31', '2022-06-22 02:01:31'),
(0, 'default', 'created', 32, 'App\\Components\\User\\Models\\User', 'created', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-22 02:12:25', '2022-06-22 02:12:25'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-22 02:12:32', '2022-06-22 02:12:32'),
(0, 'default', 'updated', 32, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-22 02:12:47', '2022-06-22 02:12:47'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', 32, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-22 03:07:07', '2022-06-22 03:07:07'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-22 03:57:06', '2022-06-22 03:57:06'),
(0, 'default', 'updated', 32, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-22 03:57:49', '2022-06-22 03:57:49'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-22 21:14:01', '2022-06-22 21:14:01'),
(0, 'default', 'created', 33, 'App\\Components\\User\\Models\\User', 'created', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-22 21:15:24', '2022-06-22 21:15:24'),
(0, 'default', 'updated', 33, 'App\\Components\\User\\Models\\User', 'updated', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-22 21:15:24', '2022-06-22 21:15:24'),
(0, 'default', 'deleted', 33, 'App\\Components\\User\\Models\\User', 'deleted', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-22 21:18:12', '2022-06-22 21:18:12'),
(0, 'default', 'created', 37, 'App\\Components\\User\\Models\\User', 'created', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-22 21:20:25', '2022-06-22 21:20:25'),
(0, 'default', 'updated', 37, 'App\\Components\\User\\Models\\User', 'updated', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-22 21:20:25', '2022-06-22 21:20:25'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-06-22 21:43:01', '2022-06-22 21:43:01'),
(0, 'default', 'updated', 37, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-22 21:43:46', '2022-06-22 21:43:46'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-22 23:11:02', '2022-06-22 23:11:02'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-23 20:30:13', '2022-06-23 20:30:13'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-24 23:31:39', '2022-06-24 23:31:39'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-26 01:05:16', '2022-06-26 01:05:16'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-26 21:00:46', '2022-06-26 21:00:46'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-27 20:41:19', '2022-06-27 20:41:19'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-28 17:12:48', '2022-06-28 17:12:48'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-06-30 22:33:41', '2022-06-30 22:33:41'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-07-01 22:13:57', '2022-07-01 22:13:57'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', 1, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-07-01 23:30:03', '2022-07-01 23:30:03'),
(0, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-07-01 23:31:01', '2022-07-01 23:31:01'),
(0, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', 'updated', 2, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-07-01 23:31:39', '2022-07-01 23:31:39'),
(0, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-07-01 23:31:47', '2022-07-01 23:31:47'),
(0, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', 'updated', 2, 'App\\Components\\User\\Models\\User', '[]', NULL, '2022-07-02 00:14:30', '2022-07-02 00:14:30'),
(0, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 'updated', NULL, NULL, '[]', NULL, '2022-07-02 00:14:44', '2022-07-02 00:14:44');

-- --------------------------------------------------------

--
-- بنية الجدول `agencies`
--

CREATE TABLE `agencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `trade_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `record_number` int(10) UNSIGNED DEFAULT NULL,
  `delegate_record` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agency_number` int(10) UNSIGNED DEFAULT NULL,
  `agent_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_card_number` int(10) UNSIGNED DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `assign_project_to_users`
--

CREATE TABLE `assign_project_to_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `categorables`
--

CREATE TABLE `categorables` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `categorable_id` int(11) NOT NULL,
  `categorable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `categorables`
--

INSERT INTO `categorables` (`id`, `category_id`, `categorable_id`, `categorable_type`) VALUES
(1, 1, 5, 'App\\Project');

-- --------------------------------------------------------

--
-- بنية الجدول `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `categories`
--

INSERT INTO `categories` (`id`, `name`, `type`, `project_id`, `created_at`, `updated_at`) VALUES
(1, 'ييي', 'tasks', 1, '2022-04-08 02:27:28', '2022-04-08 02:27:28'),
(2, '44', 'tasks', 2, '2022-04-14 22:37:08', '2022-04-14 22:37:08'),
(3, '4343434', 'tasks', 2, '2022-04-14 22:52:01', '2022-04-14 22:52:01'),
(4, 'test', 'tasks', 5, '2022-04-29 03:53:45', '2022-04-29 03:53:45');

-- --------------------------------------------------------

--
-- بنية الجدول `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `iso_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `currencies`
--

INSERT INTO `currencies` (`id`, `iso_name`, `symbol`, `created_at`, `updated_at`) VALUES
(1, 'USD', '$', '2019-04-18 19:19:26', '2019-04-18 19:19:26');

-- --------------------------------------------------------

--
-- بنية الجدول `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fourth_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_contact_id` int(11) DEFAULT NULL,
  `company` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` int(11) NOT NULL,
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alternate_contact_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `source_id` int(11) DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `contacted_date` datetime DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `beneficiary_id_number` int(10) UNSIGNED NOT NULL,
  `beneficiary_id_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identity_granted_date` datetime DEFAULT NULL,
  `identity_expiration_date` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `customer_infos`
--

CREATE TABLE `customer_infos` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `design_request`
--

CREATE TABLE `design_request` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `office_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `description` text NOT NULL,
  `note` text DEFAULT NULL,
  `status` enum('new','pending','sent','accepted','rejected','in_progress','completed') NOT NULL DEFAULT 'new',
  `sent` tinyint(1) NOT NULL DEFAULT 0,
  `is_agreed` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- إرجاع أو استيراد بيانات الجدول `design_request`
--

INSERT INTO `design_request` (`id`, `customer_id`, `office_id`, `project_id`, `description`, `note`, `status`, `sent`, `is_agreed`, `created_at`, `updated_at`, `created_by`) VALUES
(22, 3, 2, 5, '', 'test', 'in_progress', 1, 0, '2022-05-09 12:35:02', '2022-05-09 12:36:11', 3);

-- --------------------------------------------------------

--
-- بنية الجدول `documents`
--

CREATE TABLE `documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `type` enum('request_role') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `documents`
--

INSERT INTO `documents` (`id`, `user_id`, `type`, `path`, `created_at`, `updated_at`) VALUES
(1, 2, 'request_role', 'documents/2022-04-07-07-20-01_437fcaedf92167c36456ccd3c5df13683031d747.txt', '2022-04-08 02:20:01', NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `favorites`
--

CREATE TABLE `favorites` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `favoritable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `favoritable_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `invoice_lines`
--

CREATE TABLE `invoice_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `short_description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` decimal(20,4) NOT NULL,
  `quantity` decimal(20,4) NOT NULL,
  `unit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax` int(11) NOT NULL,
  `total` decimal(20,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `invoice_schemes`
--

CREATE TABLE `invoice_schemes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheme_type` enum('custom','year') COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_number` int(11) NOT NULL DEFAULT 0,
  `invoice_count` int(11) NOT NULL DEFAULT 0,
  `total_digits` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `knowledge_bases`
--

CREATE TABLE `knowledge_bases` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_to_employee` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `leaves`
--

CREATE TABLE `leaves` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `status` enum('pending','cancelled','approved') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `locations`
--

CREATE TABLE `locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `province_municipality` enum('province1','province2','province3') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `municipality` enum('municipality1','municipality2','municipality3') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` enum('category1','category2','category3') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `neighborhood` enum('neighborhood1','neighborhood2','neighborhood3') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` enum('district1','district2','district3') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `piece_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_number` int(10) UNSIGNED DEFAULT NULL,
  `instrument_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instrument_date` datetime DEFAULT NULL,
  `northern_border` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eastern_border` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `western_border` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `southern_border` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('status1','status2','status3','status4','status5') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `locations`
--

INSERT INTO `locations` (`id`, `province_municipality`, `municipality`, `category`, `neighborhood`, `district`, `plan_id`, `piece_number`, `size_number`, `instrument_number`, `instrument_date`, `northern_border`, `eastern_border`, `western_border`, `southern_border`, `status`, `lon`, `lat`, `created_at`, `updated_at`) VALUES
(5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-20 11:00:42', '2022-04-20 11:00:42');

-- --------------------------------------------------------

--
-- بنية الجدول `media`
--

CREATE TABLE `media` (
  `id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `collection_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(10) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `size`, `manipulations`, `custom_properties`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(5, 'App\\Project', 5, 'project_documents', '1651818576_dog', '1651818576_dog.jpg', 'image/jpeg', 'local', 163759, '[]', '[]', '[]', 1, '2022-05-06 11:29:39', '2022-05-06 11:29:39'),
(6, 'App\\Project', 5, 'project_documents', '1651846740_عرص-طلب-التصميم-(4) (1)', '1651846740_عرص-طلب-التصميم-(4)-(1).pdf', 'application/pdf', 'local', 4558, '[]', '[]', '[]', 2, '2022-05-06 19:19:08', '2022-05-06 19:19:08');

-- --------------------------------------------------------

--
-- بنية الجدول `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(50, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(51, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(52, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(53, '2016_06_01_000004_create_oauth_clients_table', 1),
(54, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(141, '2014_10_12_100000_create_password_resets_table', 2),
(142, '2019_02_01_054430_create_customers_table', 2),
(143, '2019_02_01_054431_create_users_table', 2),
(144, '2019_02_06_055002_create_location_table', 2),
(145, '2019_02_06_055003_create_agencies_table', 2),
(146, '2019_02_06_055008_create_projects_table', 2),
(147, '2019_02_06_113918_create_project_members_table', 2),
(148, '2019_02_07_110329_create_project_tasks_table', 2),
(149, '2019_02_07_111900_create_project_task_members_table', 2),
(150, '2019_02_20_054054_create_project_milestones_table', 2),
(151, '2019_02_23_053221_create_transactions_table', 2),
(152, '2019_02_23_053306_create_invoice_lines_table', 2),
(153, '2019_02_27_100259_create_transaction_payment_lines_table', 2),
(154, '2019_03_04_102320_create_activity_log_table', 2),
(155, '2019_03_06_071858_create_notes_table', 2),
(156, '2019_03_08_051449_create_categories_table', 2),
(157, '2019_03_08_075501_create_categorables_table', 2),
(158, '2019_03_08_132412_create_permission_tables', 2),
(159, '2019_03_20_112651_create_systems_table', 2),
(160, '2019_03_22_125825_add_role_type_to_roles_table', 2),
(161, '2019_03_26_132246_create_notifications_table', 2),
(162, '2019_04_02_070258_create_currencies_table', 2),
(163, '2019_04_09_062659_create_favorites_table', 2),
(164, '2019_04_24_044047_create_knowledge_bases_table', 2),
(165, '2019_05_03_131933_create_invoice_schemes_table', 2),
(166, '2019_05_13_072725_create_leaves_table', 2),
(167, '2019_07_15_072105_create_media_table', 2),
(168, '2019_07_18_102040_create_statuses_table', 2),
(169, '2019_07_18_102109_create_sources_table', 2),
(170, '2019_07_22_120415_create_reminders_table', 2),
(171, '2019_08_01_122204_add_system_settings_rows', 2),
(172, '2019_08_02_184806_create_tickets_table', 2),
(173, '2019_08_02_184839_create_ticket_comments_table', 2),
(174, '2019_08_06_182329_add_default_values_for_email_templates', 2),
(175, '2020_10_08_090327_create_request_types_table', 2),
(176, '2020_10_08_093540_create_visit_requests_table', 2),
(177, '2020_10_14_145346_create_project_requests_table', 2),
(178, '2020_10_25_151217_create_customer_infos_table', 2),
(179, '2021_11_28_225008_create_assign_project_to_users_table', 2),
(180, '2021_12_02_020315_create_user__types_table', 2),
(181, '2021_12_28_193730_create_reports_table', 2),
(182, '2022_02_20_033248_create_request_role_table', 2),
(183, '2022_02_20_033907_create_documents_table', 2),
(184, '2022_03_13_035042_create_request_enginners_table', 2),
(185, '2022_05_10_190859_create_media_table', 3),
(186, '2022_05_10_193515_add_event_column_to_activity_log_table', 4),
(187, '2022_05_10_193516_add_batch_uuid_column_to_activity_log_table', 4),
(188, '2022_06_22_164329_create_report_types_table', 5),
(189, '2022_06_22_165358_add_column_to_reprts', 6);

-- --------------------------------------------------------

--
-- بنية الجدول `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Components\\User\\Models\\User', 2),
(1, 'App\\Components\\User\\Models\\User', 3),
(1, 'App\\Components\\User\\Models\\User', 11),
(1, 'App\\Components\\User\\Models\\User', 12),
(1, 'App\\Components\\User\\Models\\User', 30),
(1, 'App\\Components\\User\\Models\\User', 32),
(2, 'App\\Components\\User\\Models\\User', 2),
(2, 'App\\Components\\User\\Models\\User', 31),
(2, 'App\\Components\\User\\Models\\User', 32),
(2, 'App\\Components\\User\\Models\\User', 37),
(6, 'App\\Components\\User\\Models\\User', 1),
(7, 'App\\Components\\User\\Models\\User', 4),
(7, 'App\\Components\\User\\Models\\User', 5),
(7, 'App\\Components\\User\\Models\\User', 6),
(7, 'App\\Components\\User\\Models\\User', 7),
(7, 'App\\Components\\User\\Models\\User', 8),
(7, 'App\\Components\\User\\Models\\User', 31);

-- --------------------------------------------------------

--
-- بنية الجدول `notes`
--

CREATE TABLE `notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `notable_id` int(11) NOT NULL,
  `notable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `notes`
--

INSERT INTO `notes` (`id`, `notable_id`, `notable_type`, `heading`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
(4, 15, 'App\\ProjectTask', NULL, 'test', 2, '2022-04-29 04:20:16', '2022-04-29 04:20:16');

-- --------------------------------------------------------

--
-- بنية الجدول `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('2b72b21f-ec84-476e-b1fc-12a39384b68c', 'App\\Notifications\\ShowDesignRequestOffer', 'App\\Components\\User\\Models\\User', 3, '{\"enginner_id\":4,\"design_id\":22,\"project_id\":5,\"design_enginner_id\":60,\"stage_id\":1}', '2022-05-09 12:36:31', '2022-05-09 12:36:11', '2022-05-09 12:36:31'),
('858ac8e5-11dc-4157-992e-68201c41a09a', 'App\\Notifications\\DesignRequestSendedToEmployees', 'App\\Components\\User\\Models\\User', 5, '{\"office_id\":2,\"stage_id\":2}', '2022-05-09 12:42:55', '2022-05-09 12:42:28', '2022-05-09 12:42:55'),
('89b7f825-8742-45ea-acd2-524b8e36a0e4', 'App\\Notifications\\AskDesignRequestOffer', 'App\\Components\\User\\Models\\User', 2, '{\"estate_id\":3}', '2022-05-09 12:35:23', '2022-05-09 12:35:02', '2022-05-09 12:35:23'),
('afd91dac-187e-4959-b31c-4fe614b077bf', 'App\\Notifications\\AcceptDesignRequestByEstateOwner', 'App\\Components\\User\\Models\\User', 4, '{\"estate_id\":3,\"stage_id\":1}', NULL, '2022-05-09 12:42:28', '2022-05-09 12:42:28'),
('b15cb886-e93c-45ae-8ebc-c4a880b515c2', 'App\\Notifications\\ShowDesignRequestOffer', 'App\\Components\\User\\Models\\User', 3, '{\"enginner_id\":5,\"design_id\":22,\"project_id\":5,\"design_enginner_id\":61,\"stage_id\":2}', '2022-05-09 12:43:23', '2022-05-09 12:43:03', '2022-05-09 12:43:23'),
('de3ceceb-8802-4b8e-a61b-3e7e24810ec4', 'App\\Notifications\\DesignRequestSendedToEmployees', 'App\\Components\\User\\Models\\User', 7, '{\"office_id\":2,\"stage_id\":3}', NULL, '2022-05-09 12:43:03', '2022-05-09 12:43:03'),
('f1d79bb4-1880-421f-af29-4f008b2ebe12', 'App\\Notifications\\DesignRequestSendedToEmployees', 'App\\Components\\User\\Models\\User', 4, '{\"office_id\":2,\"stage_id\":1}', '2022-05-09 12:35:58', '2022-05-09 12:35:38', '2022-05-09 12:35:58');

-- --------------------------------------------------------

--
-- بنية الجدول `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'employee.create', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(2, 'employee.view', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(3, 'employee.edit', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(4, 'employee.delete', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(5, 'employeeNote.create', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(6, 'employeeNote.view', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(7, 'employeeNote.edit', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(8, 'employeeNote.delete', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(9, 'customer.create', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(10, 'customer.view', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(11, 'customer.edit', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(12, 'customer.delete', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(13, 'contact.create', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(14, 'contact.view', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(15, 'contact.edit', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(16, 'contact.delete', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(17, 'customerNote.create', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(18, 'customerNote.view', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(19, 'customerNote.edit', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(20, 'customerNote.delete', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(21, 'project.list', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(22, 'project.create', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(23, 'project.edit', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(24, 'project.delete', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(25, 'file.create', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(26, 'setting', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(27, 'profile.edit', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(28, 'sales.invoices', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(29, 'knowledge_base.create', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(30, 'knowledge_base.view', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(31, 'knowledge_base.edit', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(32, 'knowledge_base.delete', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(33, 'expense.create', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(34, 'expense.edit', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(35, 'expense.delete', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(36, 'leaves.create', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(37, 'leaves.edit', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(38, 'leaves.delete', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(39, 'tickets.create', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(40, 'tickets.view', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(41, 'tickets.edit', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(42, 'tickets.delete', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(43, 'report.view', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(44, 'report.create', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(45, 'report.edit', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(46, 'report.delete', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(47, 'role.create', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(48, 'role.view', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(49, 'role.edit', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(50, 'role.delete', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(51, 'task.create', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(52, 'task.view', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(53, 'task.edit', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(54, 'task.delete', 'web', '2022-04-08 02:10:28', '2022-04-08 02:10:28'),
(55, 'specialty.view', 'web', NULL, NULL),
(56, 'specialty.create', 'web', NULL, NULL),
(57, 'specialty.delete', 'web', NULL, NULL),
(58, 'specialty.edit', 'web', NULL, NULL),
(59, 'archive', 'web', '2022-06-19 19:47:59', '2022-06-19 19:47:59');

-- --------------------------------------------------------

--
-- بنية الجدول `projects`
--

CREATE TABLE `projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `agency_id` int(10) UNSIGNED DEFAULT NULL,
  `project_type` enum('normal','not_normal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  `total_rate` decimal(8,2) DEFAULT NULL,
  `price_per_hours` decimal(8,2) DEFAULT NULL,
  `estimated_hours` decimal(8,2) DEFAULT NULL,
  `estimated_cost` decimal(8,2) DEFAULT NULL,
  `status` enum('not_started','in_progress','on_hold','cancelled','completed') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorization_request_number` int(10) UNSIGNED DEFAULT NULL,
  `license_number` int(10) UNSIGNED DEFAULT NULL,
  `plot_number` int(10) UNSIGNED DEFAULT NULL,
  `cadastral_decision_number` int(10) UNSIGNED DEFAULT NULL,
  `lead_id` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `favorite` tinyint(1) NOT NULL DEFAULT 0,
  `buiding_type` enum('institutional','business','storage','assembly','residential') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_number` int(10) UNSIGNED DEFAULT NULL,
  `unit_number` int(10) UNSIGNED DEFAULT NULL,
  `using` enum('support','personal') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `build_rate` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `projects`
--

INSERT INTO `projects` (`id`, `name`, `customer_id`, `location_id`, `agency_id`, `project_type`, `total_rate`, `price_per_hours`, `estimated_hours`, `estimated_cost`, `status`, `authorization_request_number`, `license_number`, `plot_number`, `cadastral_decision_number`, `lead_id`, `start_date`, `end_date`, `description`, `created_by`, `favorite`, `buiding_type`, `role_number`, `unit_number`, `using`, `build_rate`, `created_at`, `updated_at`) VALUES
(5, 'rt', 3, 5, NULL, 'normal', NULL, NULL, NULL, NULL, 'not_started', NULL, 45, 45, 45, NULL, NULL, NULL, NULL, 3, 0, NULL, 0, 0, NULL, '45.00', '2022-04-20 11:00:42', '2022-04-20 11:00:42');

-- --------------------------------------------------------

--
-- بنية الجدول `project_members`
--

CREATE TABLE `project_members` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_default` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `project_members`
--

INSERT INTO `project_members` (`id`, `project_id`, `user_id`, `is_default`) VALUES
(96, 5, 3, 0),
(97, 5, 2, 0),
(98, 5, 4, 0),
(99, 5, 7, 0),
(100, 5, 6, 0),
(101, 5, 8, 0);

-- --------------------------------------------------------

--
-- بنية الجدول `project_milestones`
--

CREATE TABLE `project_milestones` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `due_date` datetime NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `project_requests`
--

CREATE TABLE `project_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `authorization_request_number` int(10) UNSIGNED NOT NULL,
  `license_number` int(10) UNSIGNED NOT NULL,
  `type_of_request` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plot_number` int(10) UNSIGNED NOT NULL,
  `cadastral_decision_number` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `project_tasks`
--

CREATE TABLE `project_tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `task_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hourly_rate` decimal(8,2) NOT NULL DEFAULT 0.00,
  `start_date` datetime DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `priority` enum('low','medium','high','urgent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'low',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `show_to_customer` tinyint(1) NOT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `project_tasks`
--

INSERT INTO `project_tasks` (`id`, `project_id`, `task_id`, `category_id`, `subject`, `hourly_rate`, `start_date`, `due_date`, `priority`, `description`, `created_by`, `show_to_customer`, `is_completed`, `created_at`, `updated_at`) VALUES
(15, 5, '#15', 4, 'rr', '0.00', '2022-04-12 17:34:00', '2022-04-04 16:38:00', 'medium', NULL, 2, 1, 0, '2022-04-29 03:53:49', '2022-04-29 03:53:49');

-- --------------------------------------------------------

--
-- بنية الجدول `project_task_members`
--

CREATE TABLE `project_task_members` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_task_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `project_task_members`
--

INSERT INTO `project_task_members` (`id`, `project_task_id`, `user_id`) VALUES
(17, 15, 6),
(18, 15, 8);

-- --------------------------------------------------------

--
-- بنية الجدول `reminders`
--

CREATE TABLE `reminders` (
  `id` int(10) UNSIGNED NOT NULL,
  `remindable_id` int(11) NOT NULL,
  `remindable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remind_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remind_on` datetime NOT NULL,
  `remind_to` int(11) NOT NULL,
  `send_email` tinyint(1) NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `reports`
--

CREATE TABLE `reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `office_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `reports`
--

INSERT INTO `reports` (`id`, `name`, `description`, `project_id`, `type_id`, `created_at`, `updated_at`, `created_by`, `office_id`) VALUES
(11, NULL, NULL, 5, 4, '2022-07-02 03:02:02', '2022-07-02 03:02:02', 1, 3);

-- --------------------------------------------------------

--
-- بنية الجدول `report_types`
--

CREATE TABLE `report_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `form` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type_list_ar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`type_list_ar`)),
  `type_list_en` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`type_list_en`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `report_types`
--

INSERT INTO `report_types` (`id`, `type_name`, `form`, `created_at`, `updated_at`, `type_list_ar`, `type_list_en`) VALUES
(3, '001', NULL, '2022-06-27 02:45:05', '2022-06-28 03:31:00', '[\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0627\\u0644\\u0645\\u064a\\u0632\\u0627\\u0646\\u064a\\u0629 \\u0627\\u0644\\u0634\\u0628\\u0643\\u064a\\u0629 \\u0644\\u0644\\u0627\\u0631\\u0636 \\u0627\\u0644\\u0637\\u0628\\u064a\\u0639\\u064a\\u0629 \\u0642\\u0628\\u0644 \\u0627\\u0644\\u062d\\u0641\\u0631.\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0627\\u062d\\u062f\\u0627\\u062b\\u064a\\u0627\\u062a \\u062d\\u062f\\u0648\\u062f \\u0627\\u0644\\u062d\\u0641\\u0631 \\u0645\\u0639 \\u062d\\u062f\\u0648\\u062f \\u0627\\u0644\\u0645\\u0628\\u0646\\u0649 (\\u062d\\u062f\\u0648\\u062f \\u0631\\u0641\\u0631\\u0641\\u0629 \\u0627\\u0644\\u062e\\u0631\\u0633\\u0627\\u0646\\u0629 \\u0627\\u0644\\u0639\\u0627\\u062f\\u064a\\u0629 \\u0623\\u0648 \\u0627\\u0644\\u0627\\u062d\\u0644\\u0627\\u0644 \\u0625\\u0646 \\u0648\\u062c\\u062f \\u0637\\u0628\\u0642\\u0627 \\u0644\\u062a\\u0642\\u0631\\u064a\\u0631 \\u0627\\u0644\\u062a\\u0631\\u0628\\u0629)\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0645\\u0646\\u0633\\u0648\\u0628 \\u0627\\u0644\\u062a\\u0623\\u0633\\u064a\\u0633 \\u0645\\u0639 \\u0627\\u0644\\u0644\\u0648\\u062d\\u0627\\u062a \\u0648\\u0645\\u0639 \\u0623\\u0642\\u0631\\u0628 \\u0631\\u0648\\u0628\\u064a\\u0631 \\u0648 \\u0639\\u0645\\u0642 \\u0627\\u0644\\u062d\\u0641\\u0631 \\u0645\\u0646 \\u062a\\u0642\\u0631\\u064a\\u0631 \\u0627\\u0644\\u062a\\u0631\\u0628\\u0629.\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u062a\\u0637\\u0647\\u064a\\u0631 \\u0642\\u0627\\u0639 \\u0648\\u062c\\u0648\\u0627\\u0646\\u0628 \\u0627\\u0644\\u062d\\u0641\\u0631 \\u0648 \\u0627\\u0633\\u062a\\u0648\\u0627\\u0621 \\u0627\\u0644\\u062d\\u0641\\u0631.\",\"\\u0627\\u0644\\u062a\\u0627\\u0643\\u062f \\u0645\\u0646 \\u0627\\u0646 \\u0646\\u0648\\u0639 \\u062a\\u0631\\u0628\\u0629 \\u0642\\u0627\\u0639 \\u0627\\u0644\\u062d\\u0641\\u0631 \\u0644\\u0627 \\u062a\\u0648\\u062c\\u062f \\u0628\\u0647\\u0627 \\u0645\\u0634\\u0627\\u0647\\u062f\\u0627\\u062a \\u062a\\u062e\\u062a\\u0644\\u0641 \\u0639\\u0646 \\u062a\\u0642\\u0631\\u064a\\u0631 \\u0627\\u0644\\u062a\\u0631\\u0628\\u0629 (\\u0639\\u0631\\u0642 \\u0637\\u0641\\u0644\\u0629- \\u0635\\u062e\\u0631-\\u0627\\u0644\\u062e....).\"]', '[\"Review the grid budget of the natural ground before excavation.\",\"Review the coordinates of the excavation boundaries with the boundaries of the building (the boundaries of the regular concrete flap or the replacement, if any, according to the soil report).\",\"Check the foundation level with the plates and with the nearest ruber and the depth of excavation from the soil report.\",\"Review the clearance of the bottom and sides of the drilling and the levelness of the drilling.\",\"Ensure that the type of soil of the bottom of the excavation does not have observations that differ from the soil report (the sweat of a child - rock - etc...).\"]'),
(4, '002', NULL, '2022-06-27 03:40:14', '2022-06-27 03:40:14', '[\"\\u0627\\u0644\\u062a\\u0623\\u0643\\u062f \\u0645\\u0646 \\u0645\\u0646\\u0633\\u0648\\u0628 \\u0637\\u0628\\u0642\\u0629 \\u0627\\u0644\\u0627\\u062d\\u0644\\u0627\\u0644 (\\u0645\\u0646\\u0633\\u0648\\u0628 \\u0627\\u0644\\u062a\\u0623\\u0633\\u064a\\u0633)\",\"\\u0627\\u0644\\u062a\\u0623\\u0643\\u062f \\u0645\\u0646 \\u0633\\u0645\\u0643 \\u0637\\u0628\\u0642\\u0629 \\u0627\\u0644\\u0627\\u062d\\u0644\\u0627\\u0644 \\u0637\\u0628\\u0642\\u0627 \\u0644\\u062a\\u0648\\u0635\\u064a\\u0627\\u062a \\u0627\\u0644\\u0627\\u0633\\u062a\\u0634\\u0627\\u0631\\u064a\",\"\\u0627\\u0644\\u062a\\u0627\\u0643\\u062f \\u0645\\u0646 \\u0627\\u0646 \\u0637\\u0631\\u064a\\u0642\\u0629 \\u0627\\u0644\\u062f\\u0645\\u0643 \\u0627\\u0644\\u0645\\u0633\\u062a\\u062e\\u062f\\u0645\\u0629 \\u0637\\u0628\\u0642\\u0627 \\u0644\\u062a\\u0648\\u0635\\u064a\\u0627\\u062a \\u0627\\u0644\\u0627\\u0633\\u062a\\u0634\\u0627\\u0631\\u064a\",\"\\u0627\\u0644\\u062a\\u0627\\u0643\\u062f \\u0645\\u0646 \\u0623\\u0646 \\u0627\\u0644\\u0648\\u0632\\u0646 \\u0627\\u0644\\u0645\\u0633\\u062a\\u062e\\u062f\\u0645 \\u0641\\u0649 \\u0627\\u0644\\u062f\\u0645\\u0643 \\u0637\\u0628\\u0642\\u0627 \\u0644\\u062a\\u0639\\u0644\\u064a\\u0645\\u0627\\u062a \\u0627\\u0644\\u0627\\u0633\\u062a\\u0634\\u0627\\u0631\\u064a\",\"\\u0627\\u0644\\u062a\\u0627\\u0643\\u062f \\u0645\\u0646 \\u0646\\u062a\\u064a\\u062c\\u0629 \\u0627\\u062e\\u062a\\u0628\\u0627\\u0631 \\u0627\\u0644\\u062f\\u0645\\u0643 \\u0642\\u0628\\u0644 \\u0627\\u0644\\u0628\\u062f\\u0621 \\u0641\\u0649 \\u0627\\u0644\\u0637\\u0628\\u0642\\u0629 \\u0627\\u0644\\u062a\\u0627\\u0644\\u064a\\u0629\",\"\\u0627\\u0644\\u062a\\u0627\\u0643\\u062f \\u0645\\u0646 \\u0645\\u0637\\u0627\\u0628\\u0642\\u0629 \\u0637\\u0628\\u0642\\u0629 \\u0627\\u0644\\u0627\\u062d\\u0644\\u0627\\u0644 \\u0644\\u0644\\u0639\\u064a\\u0646\\u0629 \\u0627\\u0644\\u0645\\u0639\\u062a\\u0645\\u062f\\u0629\"]', '[\"Verify the level of the replacement layer (foundation level)\",\"Ensure the thickness of the replacement layer according to the recommendations of the consultant\",\"To ensure that the compaction method used is in accordance with the recommendations of the consultant\",\"Ensure that the weight used in the compaction is in accordance with the consultants instructions\",\"Confirm the result of the blood test before starting the next layer\",\"Ensure that the substitution layer matches the approved sample\"]'),
(5, '003', NULL, '2022-06-27 03:55:34', '2022-06-27 03:55:34', '[\"\\u064a\\u062a\\u0645 \\u0627\\u0633\\u062a\\u0644\\u0627\\u0645 \\u0627\\u0628\\u0639\\u0627\\u062f \\u0627\\u0644\\u062e\\u0646\\u0632\\u064a\\u0631\\u0629 \\u0628\\u062d\\u064a\\u062b \\u062a\\u0643\\u0648\\u0646 \\u0627\\u0643\\u0628\\u0631 \\u0645\\u0646 \\u0627\\u0628\\u0639\\u0627\\u062f \\u0642\\u0627\\u0639 \\u0627\\u0644\\u062d\\u0641\\u0631 \\u0628\\u0645\\u0633\\u0627\\u0641\\u0629 \\u062a\\u0645\\u0646\\u0639 \\u062a\\u0627\\u062b\\u0631\\u0647\\u0627 \\u0628\\u0627\\u0644\\u062d\\u0641\\u0631\",\"\\u064a\\u062a\\u0645 \\u0634\\u062f \\u062e\\u064a\\u0637 \\u0644\\u0644\\u062a\\u0627\\u0643\\u062f \\u0645\\u0646 \\u0627\\u0633\\u062a\\u0642\\u0627\\u0645\\u0629 \\u0627\\u0636\\u0644\\u0627\\u0639 \\u0627\\u0644\\u062e\\u0646\\u0632\\u064a\\u0631\\u0629\",\"\\u0627\\u0644\\u062a\\u0627\\u0643\\u062f \\u0645\\u0646 \\u062a\\u0642\\u0648\\u064a\\u0629 \\u062c\\u0645\\u064a\\u0639 \\u0627\\u0644\\u0627\\u0636\\u0644\\u0627\\u0639 \\u0628\\u0627\\u0644\\u062e\\u0648\\u0627\\u0628\\u064a\\u0631 \\u0627\\u0648 \\u0627\\u0644\\u0634\\u0643\\u0627\\u0644\\u0627\\u062a \\u0641\\u0649 \\u062d\\u0627\\u0644\\u0629 \\u0643\\u0648\\u0646 \\u0627\\u0644\\u062e\\u0646\\u0632\\u064a\\u0631\\u0629 \\u0639\\u0644\\u0649 \\u0627\\u0631\\u062a\\u0641\\u0627\\u0639 \\u0627\\u0639\\u0644\\u0649 \\u0645\\u0646 \\u0627\\u0644\\u0627\\u0631\\u0636 \\u0627\\u0644\\u0637\\u0628\\u064a\\u0639\\u064a\\u0629\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0627\\u0641\\u0642\\u064a\\u0629 \\u0643\\u0644 \\u0636\\u0644\\u0639 \\u0645\\u0646 \\u0627\\u0636\\u0644\\u0627\\u0639 \\u0627\\u0644\\u062e\\u0646\\u0632\\u064a\\u0631\\u0629 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0645\\u064a\\u0632\\u0627\\u0646 \\u0627\\u0644\\u0645\\u064a\\u0627\\u0647\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0627\\u0641\\u0642\\u064a\\u0629 \\u0627\\u0636\\u0644\\u0627\\u0639 \\u0627\\u0644\\u062e\\u0646\\u0632\\u064a\\u0631\\u0629 \\u0639\\u0646\\u062f \\u0627\\u0645\\u0627\\u0643\\u0646 \\u0627\\u0644\\u0627\\u0644\\u062a\\u0642\\u0627\\u0621\",\"\\u0627\\u0644\\u062a\\u0627\\u0643\\u062f \\u0645\\u0646 \\u0627\\u0644\\u0632\\u0648\\u0627\\u064a\\u0627 \\u0627\\u0644\\u0645\\u062d\\u0635\\u0648\\u0631\\u0629 \\u0628\\u064a\\u0646 \\u0627\\u0644\\u0627\\u0636\\u0644\\u0627\\u0639 \\u0639\\u0646 \\u0637\\u0631\\u064a\\u0642 \\u0646\\u0638\\u0631\\u064a\\u0629 \\u0641\\u064a\\u062b\\u0627\\u063a\\u0648\\u0631\\u062b\",\"\\u0627\\u0644\\u062a\\u0627\\u0643\\u062f \\u0645\\u0646 \\u0639\\u062f\\u0645 \\u062d\\u062f\\u0648\\u062b \\u0627\\u0649 \\u062d\\u0631\\u0643\\u0629 \\u0641\\u0649 \\u0632\\u0648\\u0627\\u064a\\u0627 \\u0627\\u0644\\u0627\\u0644\\u062a\\u0642\\u0627\\u0621 \\u0628\\u064a\\u0646 \\u0627\\u0636\\u0644\\u0627\\u0639 \\u0627\\u0644\\u062e\\u0646\\u0632\\u064a\\u0631\\u0629 \\u0628\\u0627\\u0646 \\u064a\\u062a\\u0645 \\u062a\\u0642\\u0648\\u064a\\u062a\\u0647\\u0627 \\u062c\\u064a\\u062f\\u0627\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0627\\u0644\\u0645\\u062d\\u0627\\u0648\\u0631 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062e\\u0646\\u0632\\u064a\\u0631\\u0629\"]', '[\"The dimensions of the pig are received so that they are greater than the dimensions of the bottom of the drill with a distance that prevents them from being affected by the drilling\",\"A string is pulled to make sure the pig\\\\\'s ribs are straight\",\"Ensure that all ribs are strengthened with staples or bars in the event that the pig is at a height higher than the natural ground\",\"Check the horizontality of each rib of the pig with a water balance\",\"Reviewing the horizontality of the pork ribs at the meeting points\",\"Verify the angles between the sides by the Pythagorean theorem\",\"Make sure that there is no movement in the corners of the meeting between the ribs of the pig to be well strengthened\",\"Axes review on the pig\"]'),
(6, '004', NULL, '2022-06-27 04:04:22', '2022-06-27 04:04:22', '[\"\\u0627\\u0644\\u062a\\u0627\\u0643\\u062f \\u0645\\u0646 \\u0646\\u0638\\u0627\\u0641\\u0629 \\u0645\\u0646\\u0633\\u0648\\u0628 \\u0627\\u0644\\u062a\\u0627\\u0633\\u064a\\u0633 \\u0645\\u0639 \\u062a\\u0645\\u0627\\u0645 \\u062f\\u0645\\u0643 \\u0627\\u0644\\u0633\\u0637\\u062d \\u0627\\u0644\\u0646\\u0647\\u0627\\u0626\",\"\\u0631\\u0641\\u0639 \\u0627\\u0631\\u0643\\u0627\\u0646 \\u0637\\u0628\\u0642\\u0629 \\u0627\\u0644\\u0646\\u0638\\u0627\\u0641\\u0629 \\u0628\\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u062c\\u0647\\u0627\\u0632 \\u062a\\u0648\\u062a\\u0627\\u0644 \\u0633\\u062a\\u064a\\u0634\\u0646 \\u0627\\u0646 \\u0648\\u062c\\u062f \\u0648 \\u0645\\u0637\\u0627\\u0628\\u0642\\u062a\\u0647\\u0627 \\u0628\\u0627\\u0644\\u0631\\u0633\\u0648\\u0645\\u0627\\u062a\",\"\\u0645\\u0637\\u0627\\u0628\\u0642\\u0629 \\u0627\\u0644\\u0645\\u062d\\u0627\\u0648\\u0631 \\u0627\\u0644\\u0627\\u0646\\u0634\\u0627\\u0626\\u064a\\u0629 \\u0645\\u0639 \\u0631\\u0633\\u0648\\u0645\\u0627\\u062a \\u0627\\u0644\\u0648\\u0631\\u0634\\u0629 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062e\\u0646\\u0632\\u064a\\u0631\\u0629 \\u0648\\u0635\\u062d\\u0629 \\u062a\\u0648\\u0642\\u064a\\u0639 \\u0632\\u0648\\u0627\\u064a\\u0627\\u0647\\u0627 \\u0645\\u0639 \\u0628\\u0639\\u0636\\u0647\\u0627 \\u0627\\u0644\\u0628\\u0639\\u0636\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0623\\u0628\\u0639\\u0627\\u062f \\u0635\\u0628\\u0629 \\u0627\\u0644\\u0646\\u0638\\u0627\\u0641\\u0629 \\u0644\\u0644\\u0642\\u0648\\u0627\\u0639\\u062f \\u0648 \\u062d\\u062f\\u0648\\u062f \\u062c\\u0648\\u0627\\u0646\\u0628\\u0647\\u0627 \\u0646\\u0633\\u0628\\u0629 \\u0627\\u0644\\u0649 \\u0627\\u0644\\u0645\\u062d\\u0627\\u0648\\u0631\"]', '[\"Ensure the cleanliness of the foundation level with complete blood flow to the final surface\",\"Raising the corners of the hygiene layer using the Total Station device, if available, and matching them with the drawings\",\"Matching the structural axes with the workshop drawings on the pig and the correctness of the signature of its angles with each other\",\"Reviewing the dimensions of hygiene of the rules and the limits of their sides in relation to the axes\"]'),
(7, '005', NULL, '2022-06-27 04:17:07', '2022-06-27 04:17:07', '[\"\\u0631\\u0641\\u0639 \\u062c\\u0648\\u0627\\u0646\\u0628 \\u0646\\u062c\\u0627\\u0631\\u0629 \\u0627\\u0644\\u0642\\u0648\\u0627\\u0639\\u062f \\u0628\\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u0627\\u0644\\u062a\\u0648\\u062a\\u0627\\u0644 \\u0633\\u062a\\u064a\\u0634\\u0646 \\u0627\\u0646 \\u0648\\u062c\\u062f\",\"\\u0627\\u0644\\u062a\\u0627\\u0643\\u062f \\u0645\\u0646 \\u062a\\u0637\\u0627\\u0628\\u0642 \\u0645\\u062d\\u0627\\u0648\\u0631 \\u0627\\u0644\\u0642\\u0648\\u0627\\u0639\\u062f \\u0645\\u0639 \\u0627\\u0644\\u0645\\u062d\\u0627\\u0648\\u0631 \\u0627\\u0644\\u0627\\u0646\\u0634\\u0627\\u0626\\u064a\\u0629 \\u0627\\u0644\\u0635\\u062d\\u064a\\u062d\\u0629 (\\u064a\\u062a\\u0645 \\u0648\\u0636\\u0639 \\u0627\\u0644\\u0645\\u062d\\u0627\\u0648\\u0631 \\u0639\\u0644\\u0649 \\u0638\\u0647\\u0631 \\u0627\\u0644\\u062e\\u0631\\u0633\\u0627\\u0646\\u0629 \\u0627\\u0644\\u0639\\u0627\\u062f\\u064a\\u0629)\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0627\\u0644\\u062a\\u0642\\u0641\\u064a\\u0644 \\u0627\\u0644\\u062c\\u064a\\u062f \\u0644\\u062c\\u0648\\u0627\\u0646\\u0628 \\u0627\\u0644\\u0642\\u0648\\u0627\\u0639\\u062f \\u0645\\u0639 \\u0628\\u0639\\u0636\\u0647\\u0627 \\u0648 \\u062a\\u0633\\u062f\\u064a\\u062f \\u0627\\u0644\\u0641\\u062a\\u062d\\u0627\\u062a \\u0628\\u064a\\u0646 \\u0627\\u0644\\u0627\\u0644\\u0648\\u0627\\u062d \\u0648 \\u0627\\u0644\\u062a\\u0627\\u0643\\u062f \\u0645\\u0646 \\u0627\\u0633\\u062a\\u0642\\u0627\\u0645\\u0629 \\u0627\\u0644\\u0627\\u062a\\u062c\\u0627\\u0647\\u0627\\u062a \\u0648 \\u0643\\u0630\\u0644\\u0643 \\u0631\\u0627\\u0633\\u064a\\u0629 \\u0627\\u062c\\u0646\\u0627\\u0628 \\u0627\\u0644\\u0642\\u0648\\u0627\\u0639\\u062f \\u0648 \\u0627\\u0644\\u0633\\u0645\\u0644\\u0627\\u062a \\u0627\\u0646 \\u0648\\u062c\\u062f\\u062a \\u0648 \\u0641\\u0649 \\u062d\\u0627\\u0644\\u0629 \\u0639\\u062f\\u0645 \\u0639\\u0645\\u0644 \\u0641\\u0631\\u0634\\u0629 \\u0639\\u0627\\u062f\\u064a\\u0629 \\u0627\\u0633\\u0641\\u0644 \\u0627\\u0644\\u0633\\u0645\\u0644\\u0627\\u062a \\u064a\\u062a\\u0645 \\u062a\\u0648\\u0641\\u064a\\u0631 \\u0641\\u0631\\u0634\\u0629 \\u0645\\u0646\\u0627\\u0633\\u0628\\u0629 \\u062a\\u062d\\u062a\\u0647\\u0627\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0627\\u0628\\u0639\\u0627\\u062f \\u0648 \\u0627\\u0631\\u062a\\u0641\\u0627\\u0639\\u0627\\u062a \\u0643\\u0644 \\u0645\\u0646 \\u0627\\u0644\\u0642\\u0648\\u0627\\u0639\\u062f \\u0648 \\u0627\\u0644\\u0633\\u0645\\u0644\\u0627\\u062a (\\u0628\\u0639\\u062f \\u0634\\u062f \\u0627\\u0644\\u0646\\u062c\\u0627\\u0631\\u0629 \\u064a\\u062a\\u0645 \\u0627\\u0644\\u062a\\u0627\\u0643\\u062f \\u0645\\u0646 \\u0645\\u0637\\u0627\\u0628\\u0642\\u0629 \\u0627\\u0644\\u0646\\u062c\\u0627\\u0631\\u0629 \\u0644\\u0644\\u062a\\u0648\\u0634\\u064a\\u062d) \\u0648 \\u0643\\u0630\\u0644\\u0643 \\u0631\\u0627\\u0633\\u064a\\u0629 \\u0627\\u062c\\u0646\\u0627\\u0628 \\u0627\\u0644\\u0642\\u0648\\u0627\\u0639\\u062f \\u0648 \\u0627\\u0644\\u0633\\u0645\\u0644\\u0627\\u062a\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0627\\u0645\\u0627\\u0643\\u0646 \\u062a\\u062b\\u0628\\u064a\\u062a \\u0627\\u0644\\u062c\\u0648\\u0627\\u064a\\u0637 \\u0627\\u0648 \\u0627\\u0644\\u0628\\u0627\\u0644\\u062a\\u0627\\u062a \\u0627\\u0646 \\u0648\\u062c\\u062f\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0623\\u0645\\u0627\\u0643\\u0646 \\u0641\\u062a\\u062d\\u0627\\u062a \\u0627\\u0644\\u0635\\u062d\\u0649 \\u0648 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0627\\u0621 \\u0625\\u0646 \\u0648\\u062c\\u062f\\u062a (\\u062d\\u0627\\u0644\\u0629 \\u0644\\u0628\\u0634\\u0629)\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0627\\u0644\\u062a\\u0642\\u0648\\u064a\\u0627\\u062a \\u0648 \\u0627\\u0644\\u062a\\u0627\\u0643\\u062f \\u0645\\u0646 \\u0627\\u062a\\u0645\\u0627\\u0645\\u0647\\u0627 \\u0628\\u0637\\u0631\\u064a\\u0642\\u0629 \\u0635\\u062d\\u064a\\u062d\\u0629 \\u0648 \\u0645\\u062a\\u064a\\u0646\\u0629\",\"\\u0627\\u0644\\u062a\\u0627\\u0643\\u062f \\u0645\\u0646 \\u0648\\u0636\\u0639 \\u0634\\u0631\\u0628 \\u0635\\u0628 \\u0627\\u0644\\u0642\\u0648\\u0627\\u0639\\u062f (\\u0645\\u0646\\u0633\\u0648\\u0628 \\u0638\\u0647\\u0631 \\u0627\\u0644\\u0642\\u0648\\u0627\\u0639\\u062f) \\u0628\\u0645\\u064a\\u0632\\u0627\\u0646 \\u0627\\u0644\\u0642\\u0627\\u0645\\u0629 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0645\\u0633\\u0627\\u0645\\u064a\\u0631 \\u0627\\u0648 \\u0639\\u0644\\u0627\\u0645\\u0627\\u062a\"]', '[\"Raising the carpentry sides of the bases using the total station, if available\",\"Ensure that the base axes match the correct structural axes (the axes are placed on the back of regular concrete)\",\"Reviewing the good sealing of the sides of the bases with each other and filling the slots between the panels and making sure of the straightness of the directions, as well as the verticality of the sides of the bases and screeds, if any.\",\"Review the dimensions and heights of each of the bases and screeds (after tightening the carpentry, it is checked that the carpentry matches the fringing) as well as the anchorage of the sides of the bases and screeds\",\"Review the places where the straps or pallets are installed, if any\",\"Review the locations of the sanitary and electrical openings, if any (Basha case)\",\"Review the reinforcements and ensure that they are completed in a correct and solid manner\",\"Ensure that the bases pouring drink (the level of the back of the bases) is placed on the scale by means of nails or markers\"]'),
(8, '006', NULL, '2022-06-27 04:23:45', '2022-06-27 04:23:45', '[\"\\u0627\\u0644\\u062a\\u0623\\u0643\\u062f \\u0645\\u0646 \\u0646\\u0638\\u0627\\u0641\\u0629 \\u062d\\u062f\\u064a\\u062f \\u0627\\u0644\\u062a\\u0633\\u0644\\u064a\\u062d \\u0648\\u0639\\u062f\\u0645 \\u0648\\u062c\\u0648\\u062f \\u0635\\u062f\\u0623\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0646\\u0648\\u0639 \\u0648\\u0623\\u0642\\u0637\\u0627\\u0631 \\u062d\\u062f\\u064a\\u062f \\u0627\\u0644\\u062a\\u0633\\u0644\\u064a\\u062d \\u0639\\u062f\\u062f \\u0648\\u0623\\u0637\\u0648\\u0627\\u0644 \\u0648 \\u0634\\u0643\\u0644\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0623\\u0645\\u0627\\u0643\\u0646 \\u0641\\u062a\\u062d\\u0627\\u062a \\u0648\\u0645\\u0633\\u0627\\u0631\\u0627\\u062a \\u0627\\u0644\\u0635\\u062d\\u0649 \\u0648\\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0627\\u0621 \\u0648 \\u0623\\u0645\\u0627\\u0643\\u0646 \\u062a\\u062b\\u0628\\u064a\\u062a \\u0627\\u0644\\u062c\\u0648\\u0627\\u064a\\u0637 (\\u062d\\u0627\\u0644\\u0629 \\u0644\\u0628\\u0634\\u0629)\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0623\\u0645\\u0627\\u0643\\u0646 \\u0623\\u0634\\u0627\\u064a\\u0631 \\u062d\\u062f\\u064a\\u062f \\u0627\\u0644\\u0627\\u0639\\u0645\\u062f\\u0629 \\u0648\\u0631\\u0628\\u0637\\u0647\\u0627 \\u0628\\u0643\\u0627\\u0646\\u0627\\u062a \\u0648 \\u062a\\u0643\\u0648\\u0646 \\u0645\\u0633\\u062a\\u0645\\u0631\\u0629 \\u062f\\u0627\\u062e\\u0644 \\u0627\\u0644\\u0642\\u0627\\u0639\\u062f\\u0629\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0623\\u0642\\u0637\\u0627\\u0631 \\u0648\\u0639\\u062f\\u062f \\u0648\\u0637\\u0648\\u0644 \\u062d\\u062f\\u064a\\u062f \\u0623\\u0634\\u0627\\u064a\\u0631 \\u0627\\u0644\\u0627\\u0639\\u0645\\u062f\\u0629\",\"\\u0644\\u062a\\u0623\\u0643\\u062f \\u0645\\u0646 \\u062a\\u0631\\u0628\\u064a\\u0637 \\u0627\\u0644\\u062d\\u062f\\u064a\\u062f \\u062c\\u064a\\u062f\\u0627 \\u0648 \\u062a\\u0631\\u0628\\u064a\\u0637 \\u0643\\u0627\\u0646\\u0627\\u062a \\u0627\\u0644\\u0633\\u0645\\u0644\\u0627\\u062a \\u0627\\u0646 \\u0648\\u062c\\u062f\\u062a \\u0628\\u0627\\u0644\\u062d\\u062f\\u064a\\u062f \\u0627\\u0644\\u0633\\u0641\\u0644\\u0649 \\u0648 \\u0627\\u0633\\u062a\\u0643\\u0645\\u0627\\u0644\\u0647\\u0627 \\u062d\\u062a\\u0649 \\u062d\\u062f\\u064a\\u062f \\u0627\\u0634\\u0627\\u064a\\u0631 \\u0627\\u0644\\u0627\\u0639\\u0645\\u062f\\u0629\",\"\\u062a\\u0631\\u0643\\u064a\\u0628 \\u0643\\u0631\\u0627\\u0633\\u0649 \\u0644\\u0644\\u062d\\u062f\\u064a\\u062f \\u0627\\u0644\\u0639\\u0644\\u0648\\u0649 \\u0644\\u0644\\u0642\\u0648\\u0627\\u0639\\u062f \\u0627\\u0646 \\u0648\\u062c\\u062f\",\"\\u0627\\u0644\\u062a\\u0623\\u0643\\u062f \\u0645\\u0646 \\u062a\\u0631\\u0643\\u064a\\u0628 \\u0628\\u0633\\u0643\\u0648\\u062a \\u0628\\u064a\\u0646 \\u062c\\u0648\\u0627\\u0646\\u0628 \\u0627\\u0644\\u0642\\u0627\\u0639\\u062f\\u0629 \\u0648\\u062d\\u062f\\u064a\\u062f \\u062a\\u0633\\u0644\\u064a\\u062d \\u0627\\u0644\\u0642\\u0648\\u0627\\u0639\\u062f \\u0637\\u0628\\u0642\\u0627 \\u0644\\u0644\\u063a\\u0637\\u0627\\u0621 \\u0627\\u0644\\u062e\\u0631\\u0633\\u0627\\u0646\\u0649 \\u0627\\u0644\\u0645\\u0637\\u0644\\u0648\\u0628 \\u062a\\u0635\\u0645\\u064a\\u0645\\u064a\\u0627\",\"\\u064a\\u062c\\u0628 \\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u062a\\u062d\\u0637\\u064a\\u0637 \\u0623\\u0634\\u0627\\u064a\\u0631 \\u0627\\u0644\\u0623\\u0639\\u0645\\u062f\\u0629 \\u062f\\u0627\\u062e\\u0644 \\u0627\\u0644\\u0642\\u0648\\u0627\\u0639\\u062f \\u0627\\u0644\\u0645\\u0633\\u0644\\u062d\\u0647  \\u0628\\u062c\\u0647\\u0627\\u0632 \\u0627\\u0644 Total Station \\u0627\\u0648 \\u0645\\u0646 \\u0627\\u0644\\u0645\\u062d\\u0627\\u0648\\u0631\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0639\\u062f\\u062f \\u0627\\u0644\\u0643\\u0627\\u0646\\u0627\\u062a \\u0648 \\u062a\\u0642\\u0633\\u064a\\u0637\\u0647\\u0627 \\u0648 \\u0631\\u0628\\u0627\\u0637\\u0647\\u0627 \\u0628\\u0627\\u0644\\u0627\\u0633\\u064a\\u0627\\u062e \\u0631\\u0628\\u0627\\u0637 \\u0633\\u062f \\u0648 \\u0627\\u0633\\u062a\\u0645\\u0631\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0627\\u0646\\u0627\\u062a \\u062d\\u062a\\u0649 \\u0627\\u0634\\u0627\\u064a\\u0631 \\u0627\\u0644\\u0627\\u0639\\u0645\\u062f\\u0629.\"]', '[\"Ensure that the rebar is clean and has no rust\",\"Review the type and diameters of rebar, number, length and shape\",\"Review the locations of the holes and paths of the health and electricity and the places of fixing the studs (Basha case)\",\"Reviewing the locations of the iron posts of the columns and linking them to the pillars, and they are continuous inside the base\",\"Review the diameters, number and length of iron shafts\",\"To make sure that the iron is well bonded and the smalt cans, if any, are bonded to the lower iron and complete them until the iron of the columns\",\"Installing chairs for the upper iron bases, if any\",\"Ensure that a biscuit is installed between the sides of the base and the armature of the bases according to the concrete cover required by design\",\"It is necessary to review the demarcation of the pillars inside the armed bases with the Total Station device or from the axes\",\"Reviewing the number of canes, their installments, and their binding to the skewers, a sealing bond, and the continuation of the canes until the columns are marked.\"]'),
(9, '007', NULL, '2022-06-27 04:27:21', '2022-06-27 04:27:21', '[\"\\u0627\\u0644\\u062a\\u0627\\u0643\\u062f \\u0645\\u0646 \\u0646\\u0638\\u0627\\u0641\\u0629 \\u0627\\u0633\\u0637\\u062d \\u0627\\u0644\\u062e\\u0631\\u0633\\u0627\\u0646\\u0627\\u062a \\u0627\\u0644\\u0645\\u0631\\u0627\\u062f \\u0639\\u0632\\u0644\\u0647\\u0627 \\u0645\\u0646 \\u0627\\u0644\\u0627\\u062a\\u0631\\u0628\\u0629 \\u0648 \\u0627\\u0644\\u0645\\u0648\\u0627\\u062f \\u0627\\u0644\\u0646\\u0627\\u0639\\u0645\\u0629 \\u0648 \\u0643\\u0630\\u0644\\u0643 \\u0645\\u0639\\u0627\\u0644\\u062c\\u0629 \\u062c\\u0645\\u064a\\u0639 \\u0627\\u0644\\u062a\\u0639\\u0634\\u064a\\u0634\\u0627\\u062a \\u0644\\u0627\\u062c\\u0632\\u0627\\u0621 \\u062d\\u062f\\u064a\\u062f \\u0638\\u0627\\u0647\\u0631\\u0629 \\u0648 \\u0627\\u0644\\u062a\\u0627\\u0643\\u062f \\u0645\\u0646 \\u0639\\u062f\\u0645 \\u0648\\u062c\\u0648\\u062f \\u0627\\u062c\\u0632\\u0627\\u0621 \\u062a\\u062a\\u0637\\u0644\\u0628 \\u0627\\u0649 \\u0627\\u0639\\u0645\\u0627\\u0644 \\u062a\\u0631\\u0645\\u064a\\u0645\\u0627\\u062a\",\"\\u0627\\u0644\\u062a\\u0627\\u0643\\u062f \\u0645\\u0646 \\u0627\\u0646 \\u0627\\u0644\\u0645\\u0627\\u062f\\u0629 \\u0627\\u0644\\u0645\\u0633\\u062a\\u062e\\u062f\\u0645\\u0629 \\u0647\\u0649 \\u0627\\u0644\\u0645\\u0627\\u062f\\u0629 \\u0627\\u0644\\u0645\\u0639\\u062a\\u0645\\u062f\\u0629\",\"\\u062f\\u0647\\u0627\\u0646 \\u0627\\u0644\\u0627\\u0633\\u0637\\u062d \\u0648\\u062c\\u0647 \\u0627\\u0648\\u0644 \\u062a\\u062d\\u0636\\u064a\\u0631\\u0649 \\u0648 \\u0627\\u0646\\u062a\\u0638\\u0627\\u0645 \\u0645\\u0639\\u062f\\u0644 \\u0641\\u0631\\u0634 \\u0627\\u0644\\u0645\\u0627\\u062f\\u0629 \\u0627\\u0644\\u0628\\u064a\\u062a\\u0648\\u0645\\u064a\\u0646\\u064a\\u0629 (\\u0646\\u0638\\u0627\\u0641\\u0629)\",\"\\u062c\\u0641\\u0627\\u0641 \\u0648\\u062c\\u0647 \\u0627\\u0644\\u062f\\u0647\\u0627\\u0646 \\u0627\\u0644\\u0627\\u0648\\u0644\",\"\\u062f\\u0647\\u0627\\u0646 \\u0627\\u0644\\u0627\\u0633\\u0637\\u062d \\u0648\\u062c\\u0647 \\u062b\\u0627\\u0646\\u0649 \\u0648 \\u0627\\u0646\\u062a\\u0638\\u0627\\u0645 \\u0645\\u0639\\u062f\\u0644 \\u0641\\u0631\\u0634  \\u0645\\u0627\\u062f\\u0629 \\u0627\\u0644\\u0628\\u064a\\u062a\\u0648\\u0645\\u064a\\u0646\"]', '[\"Ensuring the cleanliness of the concrete surfaces to be isolated from dust and soft materials, as well as treating all nests of visible iron parts and making sure that there are no parts that require any repair work\",\"Ensure that the material used is the approved material\",\"Painting surfaces, a preparatory first face, and the regularity of the bituminous material brushing rate (cleaning)\",\"Dry the face of the first paint\",\"Painting the surfaces with a second face and the regularity of the bitumen brushes rate\"]'),
(10, '009', NULL, '2022-06-27 04:33:05', '2022-06-27 04:33:05', '[\"\\u0627\\u0633\\u062a\\u0644\\u0627\\u0645 \\u0645\\u0646\\u0633\\u0648\\u0628 \\u0627\\u0644\\u0637\\u0628\\u0642\\u0629 \\u0627\\u0644\\u0627\\u062e\\u064a\\u0631\\u0629 \\u0645\\u0646 \\u0637\\u0628\\u0642\\u0627\\u062a \\u0627\\u0644\\u062f\\u0641\\u0627\\u0646\",\"\\u0627\\u0644\\u062a\\u0623\\u0643\\u062f \\u0645\\u0646 \\u062f\\u0631\\u062c\\u0629 \\u0631\\u0635 \\u0627\\u0644\\u0637\\u0628\\u0642\\u0629 \\u0627\\u0644\\u0627\\u062e\\u064a\\u0631\\u0629\",\"\\u0627\\u0633\\u062a\\u0644\\u0627\\u0645 \\u0623\\u0639\\u0645\\u0627\\u0644 \\u0631\\u0634 \\u0627\\u0644\\u0646\\u0645\\u0644 \\u0627\\u0644\\u0627\\u0628\\u064a\\u0636 \\u0642\\u0628\\u0644 \\u0627\\u0644\\u0628\\u062f\\u0621 \\u0628\\u0623\\u0639\\u0645\\u0627\\u0644 \\u0646\\u062c\\u0627\\u0631\\u0629 \\u0627\\u0644\\u0645\\u064a\\u062f\\u0629\",\"\\u0627\\u0633\\u062a\\u0644\\u0627\\u0645 \\u0646\\u062c\\u0627\\u0631\\u0629 \\u0627\\u0644\\u0645\\u064a\\u062f\\u0629  \\u0648\\u0641\\u0642\\u0627 \\u0644\\u0644\\u0645\\u062e\\u0637\\u0637 \\u0627\\u0644\\u0627\\u0646\\u0634\\u0627\\u0626\\u064a \\u0627\\u0644\\u0645\\u0639\\u062a\\u0645\\u062f\",\"\\u0627\\u0633\\u062a\\u0644\\u0627\\u0645 \\u062d\\u062f\\u064a\\u062f \\u062a\\u0633\\u0644\\u064a\\u062d \\u0627\\u0644\\u0645\\u064a\\u062f\\u0629 \\u0648\\u0641\\u0642\\u0627 \\u0644\\u0644\\u0645\\u062e\\u0637\\u0637 \\u0627\\u0644\\u0627\\u0646\\u0634\\u0627\\u0626\\u064a \\u0627\\u0644\\u0645\\u0639\\u062a\\u0645\\u062f\",\"\\u0627\\u0644\\u062a\\u0623\\u0643\\u062f \\u0645\\u0646 \\u0633\\u0645\\u0643 \\u0627\\u0644\\u063a\\u0637\\u0627\\u0621 \\u0627\\u0644\\u062e\\u0631\\u0633\\u0627\\u0646\\u064a \\u0644\\u0644\\u062d\\u062f\\u064a\\u062f \\u0628\\u062d\\u064a\\u062b \\u0644\\u0627\\u064a\\u0642\\u0644 \\u0639\\u0646 4 \\u0633\\u0645 \\u0645\\u0646 \\u062c\\u0645\\u064a\\u0639 \\u0627\\u0644\\u0627\\u062a\\u062c\\u0627\\u0647\\u0627\\u062a\",\"\\u062a\\u062d\\u062f\\u064a\\u062f \\u0645\\u0633\\u0627\\u0631 \\u0627\\u0644\\u0643\\u0627\\u0628\\u0644\\u0627\\u062a \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0627\\u0626\\u064a\\u0629\",\"\\u062a\\u062d\\u062f\\u064a\\u062f \\u0645\\u0633\\u0627\\u0631 \\u0643\\u0627\\u0628\\u0644\\u0627\\u062a \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u062e\\u0641\\u064a\\u0641\",\"\\u062a\\u0623\\u0631\\u064a\\u0636 \\u0627\\u0644\\u0645\\u0628\\u0646\\u0649 \\u0648\\u0642\\u0627\\u0626\\u064a\\u0627\",\"\\u062a\\u0623\\u0645\\u064a\\u0646 \\u0645\\u0633\\u0627\\u0631 \\u0643\\u0647\\u0631\\u0628\\u0627\\u0621 \\u0644\\u0644\\u0645\\u0644\\u062d\\u0642 \\u0627\\u0644\\u062e\\u0627\\u0631\\u062c\\u064a \\u0648 \\u0627\\u0646\\u0627\\u0631\\u0629 \\u0627\\u0644\\u0633\\u0648\\u0631 \\u0648 \\u0627\\u0644\\u0645\\u0636\\u062e\\u0627\\u062a \\u0627\\u0644\\u062e\\u0627\\u0631\\u062c\\u064a\\u0629\"]', '[\"Receiving the level of the last layer of the burial layers\",\"Check the degree of compaction of the last layer\",\"Receipt of termite spraying work before starting carpentry work\",\"Receipt of the maida carpentry according to the approved construction plan\",\"Receipt of steel reinforcement, according to the approved construction plan\",\"Ensure the thickness of the concrete cover for the iron so that it is not less than 4 cm from all directions\",\"Electrical cable routing\",\"Light current cable routing\",\"Protective grounding of the building\",\"Securing an electrical path for the external annex, lighting the fence and external pumps\"]'),
(11, '0010', NULL, '2022-06-27 04:40:50', '2022-06-27 04:40:50', '[\"\\u0627\\u0644\\u062a\\u0627\\u0643\\u062f \\u0645\\u0646 \\u0646\\u0638\\u0627\\u0641\\u0629 \\u0627\\u0633\\u0637\\u062d \\u0627\\u0644\\u062e\\u0631\\u0633\\u0627\\u0646\\u0627\\u062a \\u0627\\u0644\\u0645\\u0631\\u0627\\u062f \\u0639\\u0632\\u0644\\u0647\\u0627 \\u0645\\u0646 \\u0627\\u0644\\u0627\\u062a\\u0631\\u0628\\u0629 \\u0648 \\u0627\\u0644\\u0645\\u0648\\u0627\\u062f \\u0627\\u0644\\u0646\\u0627\\u0639\\u0645\\u0629 \\u0648 \\u0643\\u0630\\u0644\\u0643 \\u0645\\u0639\\u0627\\u0644\\u062c\\u0629 \\u062c\\u0645\\u064a\\u0639 \\u0627\\u0644\\u062a\\u0639\\u0634\\u064a\\u0634\\u0627\\u062a \\u0644\\u0627\\u062c\\u0632\\u0627\\u0621 \\u062d\\u062f\\u064a\\u062f \\u0638\\u0627\\u0647\\u0631\\u0629 \\u0648 \\u0627\\u0644\\u062a\\u0627\\u0643\\u062f \\u0645\\u0646 \\u0639\\u062f\\u0645 \\u0648\\u062c\\u0648\\u062f \\u0627\\u062c\\u0632\\u0627\\u0621 \\u062a\\u062a\\u0637\\u0644\\u0628 \\u0627\\u0649 \\u0627\\u0639\\u0645\\u0627\\u0644 \\u062a\\u0631\\u0645\\u064a\\u0645\\u0627\\u062a\",\"\\u0627\\u0644\\u062a\\u0627\\u0643\\u062f \\u0645\\u0646 \\u0627\\u0646 \\u0627\\u0644\\u0645\\u0627\\u062f\\u0629 \\u0627\\u0644\\u0645\\u0633\\u062a\\u062e\\u062f\\u0645\\u0629 \\u0647\\u0649 \\u0627\\u0644\\u0645\\u0627\\u062f\\u0629 \\u0627\\u0644\\u0645\\u0639\\u062a\\u0645\\u062f\\u0629\",\"\\u062f\\u0647\\u0627\\u0646 \\u0627\\u0644\\u0627\\u0633\\u0637\\u062d \\u0648\\u062c\\u0647 \\u0627\\u0648\\u0644 \\u062a\\u062d\\u0636\\u064a\\u0631\\u0649 \\u0648 \\u0627\\u0646\\u062a\\u0638\\u0627\\u0645 \\u0645\\u0639\\u062f\\u0644 \\u0641\\u0631\\u0634 \\u0627\\u0644\\u0645\\u0627\\u062f\\u0629 \\u0627\\u0644\\u0628\\u064a\\u062a\\u0648\\u0645\\u064a\\u0646\\u064a\\u0629 (\\u0646\\u0638\\u0627\\u0641\\u0629)\",\"\\u062c\\u0641\\u0627\\u0641 \\u0648\\u062c\\u0647 \\u0627\\u0644\\u062f\\u0647\\u0627\\u0646 \\u0627\\u0644\\u0627\\u0648\\u0644\",\"\\u062f\\u0647\\u0627\\u0646 \\u0627\\u0644\\u0627\\u0633\\u0637\\u062d \\u0648\\u062c\\u0647 \\u062b\\u0627\\u0646\\u0649 \\u0648 \\u0627\\u0646\\u062a\\u0638\\u0627\\u0645 \\u0645\\u0639\\u062f\\u0644 \\u0641\\u0631\\u0634  \\u0645\\u0627\\u062f\\u0629 \\u0627\\u0644\\u0628\\u064a\\u062a\\u0648\\u0645\\u064a\\u0646\"]', '[\"Ensuring the cleanliness of the concrete surfaces to be isolated from dust and soft materials, as well as treating all nests of visible iron parts and making sure that there are no parts that require any repair work\",\"Ensure that the material used is the approved material\",\"Painting surfaces, a preparatory first face, and the regularity of the bituminous material brushing rate (cleaning)\",\"Dry the face of the first paint\",\"Painting the surfaces with a second face and the regularity of the bitumen brushes rate\"]'),
(12, '0011', NULL, '2022-06-27 04:44:05', '2022-06-27 04:44:05', '[\"\\u0627\\u0644\\u062a\\u0623\\u0643\\u062f \\u0645\\u0646 \\u0633\\u0645\\u0643 \\u0628\\u0644\\u0627\\u0637\\u0629 \\u0627\\u0644\\u0627\\u0631\\u0636\\u064a\\u0629 15 \\u0633\\u0645\",\"\\u0627\\u0644\\u062a\\u0627\\u0643\\u062f \\u0645\\u0646 \\u062d\\u062f\\u064a\\u062f \\u062a\\u0633\\u0644\\u064a\\u062d \\u0627\\u0644\\u0627\\u0631\\u0636\\u064a\\u0629 \\u0639\\u0628\\u0627\\u0631\\u0629 \\u0639\\u0646 \\u0634\\u0628\\u0643 \\u0645\\u0644\\u062d\\u0648\\u0645 6 \\u0623\\u0633\\u064a\\u0627\\u062e \\u0628\\u0627\\u0644\\u0645\\u062a\\u0631 \\u0642\\u0637\\u0631 8 \\u0645\\u0645 \\u0628\\u0627\\u0644\\u0627\\u062a\\u062c\\u0627\\u0647\\u064a\\u0646\",\"\\u0627\\u0644\\u062a\\u0627\\u0643\\u062f \\u0645\\u0646 \\u0631\\u0634 \\u0645\\u0628\\u064a\\u062f \\u0627\\u0644\\u0646\\u0645\\u0644 \\u0627\\u0644\\u0627\\u0628\\u064a\\u0636 \\u0648 \\u0641\\u0631\\u0634 \\u0628\\u0648\\u0644\\u064a \\u0627\\u064a\\u062b\\u064a\\u0644\\u0646 \\u0634\\u064a\\u062a \\u0642\\u0628\\u0644 \\u0627\\u0644\\u0635\\u0628\",\"\\u0627\\u0633\\u062a\\u0644\\u0627\\u0645 \\u062a\\u0627\\u0633\\u064a\\u0633 \\u0633\\u0628\\u0627\\u0643\\u0629 \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0627\\u0631\\u0636\\u064a \\u0648 \\u062a\\u062d\\u062f\\u064a\\u062f \\u0645\\u0633\\u0627\\u0631 \\u062e\\u0637 \\u0627\\u0644\\u0635\\u0631\\u0641 \\u0627\\u0644\\u0631\\u0626\\u064a\\u0633\\u064a 6 \\\"\"]', '[\"Make sure the thickness of the floor slab is 15 cm\",\"Make sure the floor reinforcing iron is a welded mesh 6 skewers per meter, diameter 8 mm in both directions\",\"Make sure to spray the termite exterminator and polyethylene sheet before pouring\",\"Receiving the establishment of the ground floor plumbing and determining the route of the main drainage line 6 \\\"\"]'),
(13, '0012', NULL, '2022-06-27 04:47:06', '2022-06-27 04:47:06', '[\"\\u0627\\u0644\\u062a\\u0627\\u0643\\u062f \\u0645\\u0646 \\u0645\\u0637\\u0627\\u0628\\u0642\\u0629 \\u0645\\u062d\\u0627\\u0648\\u0631 \\u0627\\u0644\\u0627\\u0639\\u0645\\u062f\\u0629 \\u0645\\u0639 \\u0627\\u0644\\u0645\\u062d\\u0627\\u0648\\u0631 \\u0627\\u0644\\u0627\\u0646\\u0634\\u0627\\u0626\\u064a\\u0629 \\u0627\\u0644\\u0635\\u062d\\u064a\\u062d\\u0629\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0642\\u0637\\u0627\\u0639\\u0627\\u062a \\u0627\\u0644\\u0627\\u0639\\u0645\\u062f\\u0629 \\u0637\\u0628\\u0642\\u0627 \\u0644\\u0644\\u0631\\u0633\\u0648\\u0645\\u0627\\u062a\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0627\\u0628\\u0639\\u0627\\u062f \\u0627\\u0644\\u062d\\u0637\\u0627\\u062a \\u0628\\u064a\\u0646 \\u0627\\u0644\\u0627\\u0639\\u0645\\u062f\\u0629\",\"\\u0627\\u0644\\u062a\\u0623\\u0643\\u062f \\u0645\\u0646 \\u0645\\u0646\\u0633\\u0648\\u0628 \\u0646\\u0647\\u0627\\u064a\\u0629 \\u0627\\u0644\\u0635\\u0628 \\u0648\\u062a\\u062d\\u062f\\u064a\\u062f \\u0627\\u0631\\u062a\\u0641\\u0627\\u0639  \\u0627\\u0644\\u0639\\u0645\\u0648\\u062f\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0627\\u0644\\u062a\\u0642\\u0648\\u064a\\u0627\\u062a \\u0648\\u062a\\u062b\\u0628\\u064a\\u062a\\u0647\\u0627 \\u062c\\u064a\\u062f\\u0627 \\u0645\\u0639 \\u0627\\u0644\\u062a\\u062e\\u0634\\u064a\\u0628\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u062a\\u062b\\u0628\\u064a\\u062a \\u0627\\u0644\\u062a\\u0642\\u0648\\u064a\\u0627\\u062a (\\u0627\\u0644\\u0623\\u062d\\u0632\\u0645\\u0629) \\u0648\\u0639\\u062f\\u062f\\u0647\\u0627 (3 \\u0623\\u062d\\u0632\\u0645\\u0629 \\u0641\\u0649 \\u0627\\u0644\\u0645\\u062a\\u0631 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0627\\u0642\\u0644)\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0627\\u0644\\u0648\\u0632\\u0646\\u0627\\u062a \\u0627\\u0644\\u0631\\u0623\\u0633\\u064a\\u0629\"]', '[\"Ensure that the column axes match the correct structural axes\",\"Review column segments according to the drawings\",\"Review the dimensions of the stations between the columns\",\"Ensure the level of the end of the casting and determine the height of the column\",\"Review the reinforcements and install them well with the timber\",\"Reviewing the fixation of reinforcements (belts) and their number (at least 3 belts per meter)\",\"Vertical weights review\"]'),
(14, '0013', NULL, '2022-06-27 04:55:15', '2022-06-27 04:55:15', '[\"\\u0627\\u0644\\u062a\\u0623\\u0643\\u062f \\u0645\\u0646 \\u0646\\u0638\\u0627\\u0641\\u0629 \\u062d\\u062f\\u064a\\u062f \\u0627\\u0644\\u062a\\u0633\\u0644\\u064a\\u062d \\u0648\\u0639\\u062f\\u0645 \\u0648\\u062c\\u0648\\u062f \\u0635\\u062f\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0646\\u0648\\u0639 \\u0648\\u0623\\u0642\\u0637\\u0627\\u0631 \\u062d\\u062f\\u064a\\u062f \\u0627\\u0644\\u062a\\u0633\\u0644\\u064a\\u062d \\u0648\\u0639\\u062f\\u062f\\u0647\\u0627 \\u0648\\u0623\\u0637\\u0648\\u0627\\u0644\\u0647\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0639\\u062f\\u062f \\u0627\\u0644\\u0643\\u0627\\u0646\\u0627\\u062a \\u0648\\u062a\\u0642\\u0633\\u064a\\u0637\\u0647\\u0627 \\u0648\\u0631\\u0628\\u0637\\u0647\\u0627 \\u0628\\u0627\\u0644\\u0627\\u0633\\u064a\\u0627\\u062e \\u062a\\u0631\\u0628\\u064a\\u0637 \\u0633\\u062f\",\"\\u0627\\u0644\\u062a\\u0623\\u0643\\u062f \\u0645\\u0646 \\u0631\\u0623\\u0633\\u064a\\u0629 \\u062d\\u062f\\u064a\\u062f \\u0627\\u0644\\u062a\\u0633\\u0644\\u064a\\u062d \\u0627\\u0644\\u0631\\u0623\\u0633\\u0649 \\u0648\\u0623\\u0641\\u0642\\u064a\\u0629 \\u0627\\u0644\\u0643\\u0627\\u0646\\u0627\\u062a\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u062a\\u062b\\u0628\\u064a\\u062a \\u0627\\u0644\\u0639\\u062f\\u062f \\u0627\\u0644\\u0643\\u0627\\u0641\\u0649 \\u0645\\u0646 \\u0627\\u0644\\u0628\\u0633\\u0643\\u0648\\u062a \\u0628\\u064a\\u0646 \\u0634\\u062f\\u0629 \\u0627\\u0644\\u0639\\u0645\\u0648\\u062f \\u0648\\u062d\\u062f\\u064a\\u062f \\u0627\\u0644\\u062a\\u0633\\u0644\\u064a\\u062d\",\"\\u0627\\u0644\\u062a\\u0627\\u0643\\u062f \\u0645\\u0646 \\u0627\\u0637\\u0648\\u0627\\u0644 \\u0627\\u0644\\u0631\\u0628\\u0627\\u0637 \\u0628\\u064a\\u0646 \\u0627\\u0644\\u0627\\u0633\\u064a\\u0627\\u062e (splice length)\",\"\\u0627\\u0644\\u062a\\u0627\\u0643\\u062f \\u0645\\u0646 \\u0637\\u0648\\u0644 \\u0627\\u0644\\u0631\\u0628\\u0627\\u0637 \\u0644\\u0644\\u0627\\u0633\\u064a\\u0627\\u062e \\u062f\\u0627\\u062e\\u0644 \\u0627\\u0644\\u062e\\u0631\\u0633\\u0627\\u0646\\u0629(Bond Lenght)\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0637\\u0648\\u0644 \\u0627\\u0644\\u062d\\u062f\\u064a\\u062f \\u0627\\u0644\\u0631\\u0627\\u0633\\u0649 \\u0644\\u0644\\u062a\\u0627\\u0643\\u062f \\u0645\\u0646 \\u0637\\u0648\\u0644 \\u0627\\u0644\\u0648\\u0635\\u0644\\u0629 \\u0627\\u0639\\u0644\\u0649 \\u0645\\u0646\\u0633\\u0648\\u0628 \\u0638\\u0647\\u0631 \\u0627\\u0644\\u062e\\u0631\\u0633\\u0627\\u0646\\u0627\\u062a \\u0628\\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u062a\\u0627\\u0644\\u0649(\\u0644\\u0627 \\u062a\\u0642\\u0644 \\u0639\\u0646 60 \\u0645\\u0631\\u0629 \\u0642\\u0637\\u0631 \\u0627\\u0644\\u0633\\u064a\\u062e)\",\"\\u0627\\u0644\\u062a\\u0627\\u0643\\u062f \\u0645\\u0646 \\u0646\\u0638\\u0627\\u0641\\u0629 \\u0627\\u0644\\u062e\\u0631\\u0633\\u0627\\u0646\\u0629 \\u062f\\u0627\\u062e\\u0644 \\u0627\\u0644\\u0627\\u0639\\u0645\\u062f\\u0629 (\\u0642\\u0644\\u0628 \\u0627\\u0644\\u0639\\u0645\\u0648\\u062f) \\u0642\\u0628\\u0644 \\u062a\\u0642\\u0641\\u064a\\u0644 \\u0627\\u0644\\u0646\\u062c\\u0627\\u0631\\u0629\"]', '[\"Ensure that the rebar is clean and there is no rust\",\"Review the type, diameters, number and lengths of rebar\",\"Reviewing the number of kanats, their installments, and connecting them to skewers, tying a dam\",\"Verify the verticality of the rebar and the horizontalness of the canes\",\"Review the fixation of the sufficient number of biscuits between the stiffness of the column and the rebar\",\"Check the length of the splice length between the skewers.\",\"Ensure the length of the bonding for the skewers inside the concrete\",\"Review the length of the vertical iron to ensure that the length of the connection is above the level of the concrete back in the next floor (not less than 60 times the diameter of the skewer)\",\"Ensure the cleanliness of the concrete inside the columns (the heart of the column) before closing the carpentry\"]'),
(15, '0014', NULL, '2022-06-27 05:01:47', '2022-06-27 05:01:47', '[\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0627\\u0644\\u0642\\u0648\\u0627\\u0626\\u0645  \\u0648\\u0627\\u0644\\u0645\\u0633\\u0627\\u0641\\u0627\\u062a \\u0628\\u064a\\u0646\\u0647\\u0627  (\\u0645\\u0646 60 \\u0627\\u0644\\u0649 80 \\u0633\\u0645 )\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0623\\u0645\\u0627\\u0643\\u0646 \\u0648\\u0635\\u0644 \\u0627\\u0644\\u0639\\u0631\\u0648\\u0642 \\u0645\\u0639 \\u0628\\u0639\\u0636\\u0647\\u0627 \\u0641\\u0649 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u0627\\u0631\\u062a\\u0641\\u0627\\u0639\\u0627\\u062a \\u0627\\u0644\\u0639\\u0627\\u0644\\u064a\\u0629 \\u0648\\u0627\\u0644\\u062a\\u0623\\u0643\\u062f \\u0645\\u0646 \\u0645\\u062a\\u0627\\u0646\\u0629 \\u0627\\u0644\\u062a\\u0642\\u0648\\u064a\\u0629 \\u0639\\u0646\\u062f \\u0627\\u0644\\u0648\\u0635\\u0644\\u0627\\u062a\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u062c\\u0648\\u062f\\u0629 \\u062a\\u062b\\u0628\\u064a\\u062a \\u0639\\u0631\\u0642\\u0627\\u062a \\u0627\\u0644\\u0643\\u0645\\u0631\\u0627\\u062a\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u062a\\u0642\\u0648\\u064a\\u0629 \\u0642\\u0627\\u0639 \\u0627\\u0644\\u0643\\u0645\\u0631\\u0627\\u062a \\u0628\\u0639\\u0631\\u0648\\u0642 (\\u062d\\u0628\\u0633) \\u0628\\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u0627\\u0644\\u0642\\u0645\\u0637\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u062a\\u0642\\u0648\\u064a\\u0629 \\u0631\\u0642\\u0627\\u0628 \\u0627\\u0644\\u0627\\u0639\\u0645\\u062f\\u0629 \\u0648\\u0627\\u0644\\u062a\\u0623\\u0643\\u062f \\u0645\\u0646 \\u0633\\u0644\\u0627\\u0645\\u0629 \\u0627\\u0644\\u062a\\u0633\\u062f\\u064a\\u062f \\u0628\\u0645\\u0627 \\u064a\\u0636\\u0645\\u0646 \\u0639\\u062f\\u0645 \\u0648\\u062c\\u0648\\u062f \\u0632\\u0648\\u0627\\u064a\\u062f \\u062e\\u0631\\u0633\\u0627\\u0646\\u064a\\u0629 \\u0628\\u0639\\u062f \\u0627\\u0644\\u0641\\u0643 \\u0645\\u0639 \\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0631\\u0627\\u0633\\u064a\\u062a\\u0647\\u0627\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0633\\u0642\\u0648\\u0637 \\u0628\\u0644\\u0627\\u0637\\u0627\\u062a \\u062f\\u0648\\u0631\\u0627\\u062a \\u0627\\u0644\\u0645\\u064a\\u0627\\u0647 \\u0639\\u0646 \\u0645\\u0633\\u062a\\u0648\\u0649 \\u0628\\u0642\\u064a\\u0629 \\u0627\\u0644\\u0628\\u0644\\u0627\\u0637\\u0627\\u062a (\\u0625\\u0646 \\u0648\\u062c\\u062f)\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0627\\u0644\\u062a\\u0633\\u062f\\u064a\\u062f \\u0628\\u064a\\u0646 \\u0623\\u0644\\u0648\\u0627\\u062d \\u0627\\u0644\\u062a\\u0637\\u0628\\u064a\\u0642 \\u0645\\u0639 \\u0628\\u0639\\u0636\\u0647\\u0627 \\u0627\\u0644\\u0628\\u0639\\u0636 \\u0648 \\u0628\\u064a\\u0646 \\u0627\\u0644\\u062a\\u0642\\u0627\\u0621 \\u0623\\u062c\\u0646\\u0627\\u0628 \\u0627\\u0644\\u0643\\u0645\\u0631\\u0627\\u062a \\u0645\\u0639 \\u062a\\u0637\\u0628\\u064a\\u0642 \\u0627\\u0644\\u0633\\u0642\\u0641 \\u0648 \\u0639\\u0646\\u062f \\u0627\\u0644\\u062a\\u0642\\u0627\\u0621 \\u0627\\u0644\\u0643\\u0645\\u0631\\u0627\\u062a \\u0645\\u0639 \\u0628\\u0639\\u0636\\u0647\\u0627 \\u0648\\u0645\\u0639 \\u0627\\u0644\\u0627\\u0639\\u0645\\u062f\\u0629 \\u0648\\u0628\\u064a\\u0646 \\u0642\\u0627\\u0639 \\u0648\\u0623\\u062c\\u0646\\u0627\\u0628 \\u0627\\u0644\\u0643\\u0645\\u0631\\u0627\\u062a\",\"\\u0627\\u0644\\u062a\\u0627\\u0643\\u062f \\u0645\\u0646 \\u0646\\u0638\\u0627\\u0641\\u0629 \\u0633\\u0637\\u062d \\u0627\\u0644\\u0634\\u062f\\u0629 \\u0648 \\u0627\\u0644\\u0643\\u0645\\u0631\\u0627\\u062a\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u062d\\u062f\\u0648\\u062f \\u0627\\u0644\\u0628\\u0644\\u0627\\u0637\\u0629 \\u0628\\u0627\\u0644 Total Station  \\u0641\\u0649 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645\\u0647\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0623\\u0628\\u0639\\u0627\\u062f \\u0648\\u0627\\u0631\\u062a\\u0641\\u0627\\u0639\\u0627\\u062a \\u0633\\u0642\\u0648\\u0637 \\u0627\\u0644\\u0643\\u0645\\u0631\\u0627\\u062a \\u0648 \\u0631\\u0627\\u0633\\u064a\\u0629 \\u062c\\u0648\\u0627\\u0646\\u0628\\u0647\\u0627\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0623\\u0645\\u0627\\u0643\\u0646 \\u0648\\u0623\\u0628\\u0639\\u0627\\u062f \\u0641\\u062a\\u062d\\u0627\\u062a \\u0627\\u0644\\u0645\\u0646\\u0627\\u0648\\u0631 \\u0648 \\u0627\\u0644\\u0645\\u0635\\u0627\\u0639\\u062f \\u0648 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0627\\u0621  \\u0648 \\u0627\\u0644\\u0635\\u062d\\u0649 \\u0648 \\u0627\\u0644\\u062a\\u0643\\u064a\\u064a\\u0641  .. \\u0623\\u0644\\u062e\"]', '[\"Review the lists and the distances between them (from 60 to 80 cm)\",\"Review the places where the veins connect together in the case of high altitudes, and ensure the strength of the reinforcement at the connections\",\"Reviewing the quality of fixing the rails of the beams\",\"Review of strengthening the bottom of the beams with veins (confinement) using clamps\",\"Review of strengthening the necks of columns and ensuring the safety of payment to ensure that there are no concrete supports after dismantling, with a review of their anchorage\",\"Reviewing the fall of the bathroom tiles from the level of the rest of the tiles (if any)\",\"Review the payment between the application panels with each other and between the meeting of the sides of the beams with the application of the ceiling and when the meeting of the beams with each other and with the columns and between the bottom and sides of the beams\",\"Ensure that the surface of the tension and beams are clean\",\"Review the slab limits of the Total Station when using it\",\"Review the dimensions and heights of the beams falling and anchoring their sides\",\"Review the locations and dimensions of the openings for skylights, elevators, electricity, sanitary, air conditioning, etc.\"]');
INSERT INTO `report_types` (`id`, `type_name`, `form`, `created_at`, `updated_at`, `type_list_ar`, `type_list_en`) VALUES
(16, '0015', NULL, '2022-06-27 05:07:19', '2022-06-27 05:07:19', '[\"\\u0627\\u0644\\u062a\\u0623\\u0643\\u062f \\u0645\\u0646 \\u0646\\u0638\\u0627\\u0641\\u0629 \\u062d\\u062f\\u064a\\u062f \\u0627\\u0644\\u062a\\u0633\\u0644\\u064a\\u062d \\u0648\\u0639\\u062f\\u0645 \\u0648\\u062c\\u0648\\u062f \\u0635\\u062f\\u0623\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0646\\u0648\\u0639 \\u0648\\u0623\\u0642\\u0637\\u0627\\u0631 \\u062d\\u062f\\u064a\\u062f \\u0627\\u0644\\u062a\\u0633\\u0644\\u064a\\u062d \\u0648\\u0639\\u062f\\u062f\\u0647\\u0627 \\u0648\\u0623\\u0637\\u0648\\u0627\\u0644\\u0647\\u0627\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0627\\u0645\\u0627\\u0643\\u0646 \\u0648\\u0627\\u0637\\u0648\\u0627\\u0644 \\u0627\\u0644\\u0648\\u0635\\u0644\\u0627\\u062a \\u0648 \\u0627\\u0637\\u0648\\u0627\\u0644 \\u0623\\u0633\\u064a\\u0627\\u062e \\u062d\\u062f\\u064a\\u062f \\u0627\\u0644\\u062a\\u0633\\u0644\\u064a\\u062d \\u062d\\u0633\\u0628 \\u0627\\u0644\\u0631\\u0633\\u0648\\u0645\\u0627\\u062a\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0623\\u0628\\u0639\\u0627\\u062f \\u0643\\u0627\\u0646\\u0627\\u062a \\u0643\\u0645\\u0631\\u0627\\u062a \\u0627\\u0644\\u0633\\u0642\\u0641 \\u0648\\u0643\\u0630\\u0644\\u0643 \\u0639\\u062f\\u062f\\u0647\\u0627 \\u0648\\u062a\\u0642\\u0633\\u064a\\u0637\\u0647\\u0627 \\u0639\\u0644\\u0649 \\u0645\\u0633\\u0627\\u0641\\u0627\\u062a \\u0645\\u062a\\u0633\\u0627\\u0648\\u064a\\u0629 \\u0648 \\u062d\\u0633\\u0628 \\u0627\\u0644\\u0631\\u0633\\u0648\\u0645\\u0627\\u062a\",\"\\u0631\\u0628\\u0637 \\u062d\\u062f\\u064a\\u062f \\u062a\\u0633\\u0644\\u064a\\u062d \\u0627\\u0644\\u0643\\u0645\\u0631\\u0627\\u062a \\u0627\\u0644\\u0639\\u0644\\u0648\\u0649 \\u0648\\u0627\\u0644\\u0633\\u0641\\u0644\\u0649 \\u0645\\u0639 \\u0627\\u0644\\u0643\\u0627\\u0646\\u0627\\u062a \\u0628\\u0633\\u0644\\u0643 \\u0631\\u0628\\u0627\\u0637 \\u0631\\u0628\\u0637\\u0627 \\u062c\\u064a\\u062f\\u0627 (\\u0633\\u062f)\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0628\\u0633\\u0643\\u0648\\u062a \\u0628\\u0644\\u0627\\u0637\\u0629 \\u0627\\u0644\\u0633\\u0642\\u0641 \\u0648\\u0627\\u0644\\u0643\\u0645\\u0631\\u0627\\u062a \\u0648\\u0627\\u0644\\u0633\\u0644\\u0627\\u0644\\u0645\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0623\\u0634\\u0627\\u064a\\u0631 \\u0627\\u0644\\u0623\\u0639\\u0645\\u062f\\u0629 \\u0627\\u0644\\u0645\\u0632\\u0631\\u0648\\u0639\\u0629 \\u0625\\u0646 \\u0648\\u062c\\u062f\\u062a \\u0648\\u0627\\u0644\\u062a\\u0623\\u0643\\u062f \\u0645\\u0646 \\u0645\\u0643\\u0627\\u0646\\u0647\\u0627\",\"\\u0627\\u0644\\u062a\\u0623\\u0643\\u062f \\u0645\\u0646 \\u062a\\u0643\\u0633\\u064a\\u062d \\u062d\\u062f\\u064a\\u062f \\u0623\\u0634\\u0627\\u064a\\u0631 \\u0623\\u0639\\u0645\\u062f\\u0629 \\u0627\\u0644\\u062f\\u0648\\u0631 \\u0627\\u0644\\u0623\\u062e\\u064a\\u0631 \\u0627\\u0648 \\u0627\\u0644\\u0627\\u0639\\u0645\\u062f\\u0629 \\u0627\\u0644\\u0645\\u0646\\u062a\\u0647\\u064a\\u0629 \\u0639\\u0646\\u062f \\u0647\\u0630\\u0627 \\u0627\\u0644\\u062f\\u0648\\u0631 \\u062f\\u0627\\u062e\\u0644 \\u0628\\u0644\\u0627\\u0637\\u0629 \\u0627\\u0644\\u0633\\u0642\\u0641\",\"\\u064a\\u062c\\u0628 \\u0627\\u0644\\u062a\\u0627\\u0643\\u062f \\u0645\\u0646 \\u0627\\u0633\\u062a\\u0645\\u0631\\u0627\\u0631 \\u0643\\u0627\\u0646\\u0627\\u062a \\u0627\\u0644\\u0627\\u0639\\u0645\\u062f\\u0629 \\u0628\\u0639\\u0645\\u0642 \\u0627\\u0644\\u0643\\u0645\\u0631\\u0629 \\u0648 \\u0631\\u0642\\u0628\\u0629 \\u0627\\u0644\\u0639\\u0645\\u0648\\u062f \\u0627\\u0633\\u0641\\u0644 \\u0627\\u0644\\u0643\\u0645\\u0631\\u0629\",\"\\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u062d\\u062f\\u064a\\u062f \\u062a\\u0633\\u0644\\u064a\\u062d \\u0627\\u0644\\u0633\\u0644\\u0627\\u0644\\u0645 \\u0648 \\u0627\\u0644\\u062f\\u0631\\u062c \\u0648 \\u0627\\u0644\\u062a\\u0627\\u0643\\u062f \\u0645\\u0646 \\u0639\\u0645\\u0644 \\u0627\\u0634\\u0627\\u064a\\u0631 (\\u0641\\u0649 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u0627\\u062f\\u0648\\u0627\\u0631 \\u0627\\u0644\\u0645\\u062a\\u0643\\u0631\\u0631\\u0629)\"]', '[\"Ensure that the rebar is clean and has no rust\",\"Review the type, diameters, number and lengths of rebar\",\"Review the locations and lengths of the joints and the lengths of the reinforcing iron bars according to the drawings\",\"Review the dimensions of the ceiling beams, as well as their number and installments at equal distances and according to the drawings\",\"Connecting the armature of the upper and lower beams to the canes with a good tie wire (dam)\",\"Review of ceiling tiles, beams and stairs biscuits\",\"Review the planted columns, if any, and make sure of their location\",\"Ensure that the Asher iron columns of the last floor or the columns that ended at this role are smashed inside the ceiling slab\",\"It must be ensured that the columns in the depth of the beam and the neck of the column below the beam continue\",\"Reviewing the rebar for stairs and stairs and making sure that they work (in the case of repeated roles)\"]'),
(17, '0016', NULL, '2022-06-27 05:14:49', '2022-06-27 05:14:49', '[\"\\u0645\\u0637\\u0627\\u0628\\u0642\\u0629 \\u0623\\u0645\\u0627\\u0643\\u0646 \\u0627\\u0644\\u0645\\u062e\\u0627\\u0631\\u062c \\u062d\\u0633\\u0628 \\u0627\\u0644\\u0631\\u0633\\u0645\",\"\\u0645\\u0637\\u0627\\u0628\\u0642\\u0629 \\u0645\\u0642\\u0627\\u0633\\u0627\\u062a \\u0627\\u0644\\u0645\\u0648\\u0627\\u0633\\u064a\\u0631 \\u062d\\u0633\\u0628 \\u0627\\u0644\\u0645\\u0648\\u0627\\u0635\\u0641\\u0627\\u062a\",\"\\u0627\\u0644\\u062a\\u0623\\u0643\\u062f \\u0645\\u0646 \\u0631\\u0628\\u0637 \\u0627\\u0644\\u0645\\u062e\\u0627\\u0631\\u062c \\u0628\\u0627\\u0644\\u0644\\u0646\\u064a\\u0629 \\u0627\\u0644\\u0639\\u0645\\u0648\\u0645\\u064a\\u0629 \\u0644\\u0643\\u0644 \\u062c\\u0632\\u0621\",\"\\u0627\\u0644\\u062a\\u0623\\u0643\\u062f \\u0645\\u0646 \\u0631\\u0628\\u0637 \\u0627\\u0644\\u0645\\u062e\\u0627\\u0631\\u062c \\u0628\\u0627\\u0644\\u0644\\u0648\\u062d\\u0629 \\u0627\\u0644\\u062e\\u0627\\u0635\\u0629 \\u0628\\u0643\\u0644 \\u062f\\u0648\\u0631\",\"\\u0627\\u0644\\u062a\\u0623\\u0643\\u062f \\u0645\\u0646 \\u062a\\u0646\\u0638\\u064a\\u0641 \\u0627\\u0644\\u0645\\u062e\\u0627\\u0631\\u062c \\u0641\\u064a \\u0627\\u0644\\u063a\\u0631\\u0641\",\"\\u0627\\u0644\\u062a\\u0623\\u0643\\u062f \\u0645\\u0646 \\u0645\\u0633\\u0627\\u0631 \\u0627\\u0644\\u062e\\u0631\\u0627\\u0637\\u064a\\u0645 \\u062f\\u0627\\u062e\\u0644 \\u0627\\u0644\\u0633\\u0642\\u0641 \\u0628\\u062d\\u064a\\u062b \\u0644\\u0627 \\u064a\\u062a\\u0645 \\u062a\\u062c\\u0645\\u064a\\u0639\\u0647\\u0627 \\u062f\\u0627\\u062e\\u0644 \\u0643\\u0645\\u0631\\u0629 \\u0648\\u0627\\u062d\\u062f\\u0629\",\"\\u0627\\u0644\\u062a\\u0623\\u0643\\u062f \\u0645\\u0646 \\u0631\\u0628\\u0637 \\u0645\\u062e\\u0627\\u0631\\u062c \\u0627\\u0644\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u062e\\u0641\\u064a\\u0641 \\u0628\\u0645\\u0643\\u0627\\u0646 \\u0627\\u0644\\u062a\\u062c\\u0645\\u064a\\u0639\",\"\\u0627\\u0644\\u062a\\u0623\\u0643\\u062f \\u0645\\u0646 \\u0639\\u062f\\u0645 \\u0631\\u0628\\u0637 \\u0645\\u062e\\u0627\\u0631\\u062c \\u0627\\u0644\\u063a\\u0633\\u0627\\u0644\\u0627\\u062a \\u0648\\u0627\\u0644\\u0633\\u062e\\u0627\\u0646\\u0627\\u062a \\u0648\\u0628\\u0631\\u0627\\u064a\\u0632 \\u0627\\u0644\\u0642\\u0648\\u064a \\u0648\\u0627\\u0644\\u062a\\u0643\\u064a\\u064a\\u0641 \\u0628\\u0623\\u064a \\u0645\\u062e\\u0627\\u0631\\u062c \\u0623\\u062e\\u0631\\u0649 \\u0648\\u0623\\u0646\\u0645\\u0627 \\u062a\\u063a\\u0630\\u0649 \\u0645\\u0628\\u0627\\u0634\\u0631\\u0629 \\u0645\\u0646 \\u0627\\u0644\\u0644\\u0648\\u062d\\u0629\",\"\\u064a\\u0631\\u0627\\u0639\\u0649 \\u0627\\u0646 \\u062a\\u0643\\u0648\\u0646 \\u062e\\u0631\\u0627\\u0637\\u064a\\u0645 \\u0627\\u0644\\u062a\\u0643\\u064a\\u064a\\u0641 \\u0648 \\u0627\\u0644\\u063a\\u0633\\u0627\\u0644\\u0627\\u062a (\\u0627\\u0644\\u0642\\u0648\\u0649) \\u0627\\u0646 \\u062a\\u0643\\u0648\\u0646 23 \\u0645\\u0645 \\u0648 \\u0628\\u0627\\u0642\\u0649 \\u0627\\u0644\\u062e\\u0631\\u0627\\u0637\\u064a\\u0645 16 \\u0645\\u0645 (\\u0627\\u0646\\u0627\\u0631\\u0629) \\u0627\\u0648 \\u062d\\u0633\\u0628 \\u0627\\u0644\\u0631\\u0633\\u0648\\u0645\\u0627\\u062a \\u0627\\u0644\\u062a\\u0635\\u0645\\u064a\\u0645\\u064a\\u0629.\",\"\\u0627\\u0644\\u062a\\u0623\\u0643\\u062f \\u0645\\u0646 \\u0639\\u0640\\u062f\\u062f \\u0645\\u0648\\u0627\\u0633\\u064a\\u0631 \\u0627\\u0644\\u0635\\u0648\\u0627\\u0639\\u062f \\u0637\\u0628\\u0642\\u0627 \\u0644\\u0644\\u0631\\u0633\\u0648\\u0645\\u0627\\u062a \\u0627\\u0644\\u062a\\u0635\\u0645\\u064a\\u0645\\u064a\\u0629\"]', '[\"Ensure that the rebar is clean and has no rust\",\"Matching pipe sizes according to specifications\",\"Ensure that the outputs are linked to the general intent of each part\",\"Ensure that exits are connected to the board for each role\",\"Ensure that the exits in the rooms are clean\",\"Ensure that the hoses are routed inside the ceiling so that they are not assembled in one piece\",\"Ensure that the light current outlets are connected to the assembly location\",\"Ensure that the outlets for washing machines, heaters, strong breezes, and air conditioning are not connected to any other outlets, but are fed directly from the panel.\",\"The hoses for air conditioning and washing machines (powers) should be 23 mm, and the rest of the hoses are 16 mm (lighting) or according to the design drawings.\",\"Verify the number of stalagmite pipes according to the design drawings\"]');

-- --------------------------------------------------------

--
-- بنية الجدول `request_enginners`
--

CREATE TABLE `request_enginners` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `request_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `request_type` enum('visit_request','design_request','support_service_request','contractor_request','supervision_request') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dead_line_date` datetime DEFAULT NULL,
  `is_cheaked` tinyint(1) NOT NULL DEFAULT 0,
  `is_show` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `request_enginners`
--

INSERT INTO `request_enginners` (`id`, `created_at`, `updated_at`, `request_id`, `user_id`, `request_type`, `dead_line_date`, `is_cheaked`, `is_show`) VALUES
(120, NULL, '2022-04-29 11:13:09', 72, 4, 'visit_request', '2022-04-12 17:30:00', 1, 0),
(121, NULL, NULL, 72, 7, 'visit_request', NULL, 0, 0),
(122, NULL, NULL, 73, 4, 'visit_request', NULL, 0, 1),
(123, NULL, NULL, 73, 7, 'visit_request', NULL, 0, 1);

-- --------------------------------------------------------

--
-- بنية الجدول `request_roles`
--

CREATE TABLE `request_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path_document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `request_roles`
--

INSERT INTO `request_roles` (`id`, `role_id`, `user_id`, `note`, `path_document`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '3432423', 'documents/2022-04-07-07-20-01_437fcaedf92167c36456ccd3c5df13683031d747.txt', 1, '2022-04-08 02:20:01', '2022-04-08 02:20:35');

-- --------------------------------------------------------

--
-- بنية الجدول `request_types`
--

CREATE TABLE `request_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `request_types`
--

INSERT INTO `request_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'visit_request', '2019-04-18 19:26:57', '2019-04-18 19:26:57'),
(2, 'design_request', '2019-04-19 14:13:33', '2019-04-19 14:13:33'),
(3, 'support_service_request', '2019-04-18 19:26:57', '2019-04-18 19:26:57'),
(4, 'contractor_request', '2019-04-19 14:13:33', '2019-04-19 14:13:33'),
(5, 'supervision_request', '2019-04-18 19:26:57', '2019-04-18 19:26:57');

-- --------------------------------------------------------

--
-- بنية الجدول `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('ESTATE_OWNER','ENGINEERING_OFFICE_MANAGER','SUPPORT_SERVICES_OFFICE','CONTRACTING_COMPANY','GOVERNMENT_AGENCIES','SITE_MANAGENMENT') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `type`, `created_at`, `updated_at`, `is_primary`, `created_by`) VALUES
(1, 'Estate Owner', 'web', 'ESTATE_OWNER', '2022-04-08 02:10:28', '2022-04-08 02:10:28', 1, NULL),
(2, 'Engineering Office Manager', 'web', 'ENGINEERING_OFFICE_MANAGER', '2022-04-08 02:10:28', '2022-04-08 02:10:28', 1, NULL),
(3, 'Support Service Office', 'web', 'SUPPORT_SERVICES_OFFICE', '2022-04-08 02:10:28', '2022-04-08 02:10:28', 1, NULL),
(4, 'Contracting  Company', 'web', 'CONTRACTING_COMPANY', '2022-04-08 02:10:28', '2022-04-08 02:10:28', 1, NULL),
(5, 'Government Agencies', 'web', 'GOVERNMENT_AGENCIES', '2022-04-08 02:10:28', '2022-04-08 02:10:28', 1, NULL),
(6, 'superadmin', 'web', 'SITE_MANAGENMENT', '2022-04-08 02:10:28', '2022-04-08 02:10:28', 1, NULL),
(7, 'Engineer', 'web', NULL, '2022-04-08 02:25:56', '2022-04-08 02:25:56', 0, 2);

-- --------------------------------------------------------

--
-- بنية الجدول `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(5, 6),
(6, 6),
(7, 6),
(8, 6),
(9, 6),
(10, 6),
(11, 6),
(12, 6),
(13, 6),
(14, 6),
(15, 6),
(16, 6),
(17, 6),
(18, 6),
(19, 6),
(20, 6),
(21, 1),
(21, 2),
(21, 6),
(21, 7),
(22, 1),
(22, 2),
(22, 6),
(22, 7),
(23, 1),
(23, 2),
(23, 6),
(23, 7),
(24, 1),
(24, 2),
(24, 6),
(24, 7),
(25, 6),
(26, 6),
(27, 6),
(29, 6),
(30, 6),
(31, 6),
(32, 6),
(33, 6),
(34, 6),
(35, 6),
(36, 6),
(37, 6),
(38, 6),
(39, 1),
(39, 2),
(39, 6),
(39, 7),
(40, 1),
(40, 2),
(40, 6),
(40, 7),
(41, 1),
(41, 2),
(41, 6),
(41, 7),
(42, 1),
(42, 2),
(42, 6),
(42, 7),
(43, 2),
(43, 6),
(44, 2),
(44, 6),
(45, 2),
(45, 6),
(46, 2),
(46, 6),
(47, 1),
(47, 2),
(47, 6),
(48, 1),
(48, 2),
(48, 6),
(49, 1),
(49, 2),
(49, 6),
(50, 1),
(50, 2),
(50, 6),
(51, 1),
(51, 2),
(51, 6),
(52, 1),
(52, 2),
(52, 6),
(52, 7),
(53, 1),
(53, 2),
(53, 6),
(53, 7),
(54, 1),
(54, 2),
(54, 6),
(55, 2),
(55, 6),
(56, 2),
(56, 6),
(57, 2),
(57, 6),
(58, 2),
(58, 6);

-- --------------------------------------------------------

--
-- بنية الجدول `sources`
--

CREATE TABLE `sources` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `specialties`
--

CREATE TABLE `specialties` (
  `id` int(10) NOT NULL,
  `name` varchar(200) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `en_name` varchar(50) DEFAULT NULL,
  `ar_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- إرجاع أو استيراد بيانات الجدول `specialties`
--

INSERT INTO `specialties` (`id`, `name`, `created_at`, `updated_at`, `created_by`, `en_name`, `ar_name`) VALUES
(2, 'هندسة معلوماتية', '2022-04-24 09:01:02', '2022-04-24 09:32:43', 2, 'informatics engineering', 'هندسة معلوماتية'),
(3, 'هندسة مدنية', '2022-04-24 09:33:35', '2022-04-24 09:33:35', 2, 'Civil Engineering', 'هندسة مدنية'),
(4, 'هندسة انشاءات', '2022-04-24 09:34:07', '2022-04-24 11:05:39', 2, 'Construction Engineering', 'هندسة انشاءات'),
(5, 'هندسى عمارة', '2022-04-24 11:06:10', '2022-04-24 11:06:10', 1, 'Engineering architecture', 'هندسى عمارة'),
(6, 'هندسة كهربائية', '2022-04-24 15:48:10', '2022-04-24 15:48:10', 2, 'Electrcty Enginnering', 'هندسة كهربائية');

-- --------------------------------------------------------

--
-- بنية الجدول `specialtiy_request_project`
--

CREATE TABLE `specialtiy_request_project` (
  `id` int(10) NOT NULL,
  `specialty_id` int(10) DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `request_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- إرجاع أو استيراد بيانات الجدول `specialtiy_request_project`
--

INSERT INTO `specialtiy_request_project` (`id`, `specialty_id`, `project_id`, `user_id`, `json`, `request_id`) VALUES
(54, 2, 5, 4, NULL, 72),
(55, 3, 5, 7, NULL, 72);

-- --------------------------------------------------------

--
-- بنية الجدول `specialtiy_visit_request`
--

CREATE TABLE `specialtiy_visit_request` (
  `id` int(10) NOT NULL,
  `specialty_id` int(10) DEFAULT NULL,
  `rquest_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- إرجاع أو استيراد بيانات الجدول `specialtiy_visit_request`
--

INSERT INTO `specialtiy_visit_request` (`id`, `specialty_id`, `rquest_id`, `created_at`) VALUES
(103, 2, 72, NULL),
(104, 3, 72, NULL),
(105, 2, 73, NULL),
(106, 3, 73, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `stages_project_design_request`
--

CREATE TABLE `stages_project_design_request` (
  `id` int(10) UNSIGNED NOT NULL,
  `design_id` int(10) UNSIGNED NOT NULL,
  `enginner_id` int(10) UNSIGNED NOT NULL,
  `stage_id` int(10) UNSIGNED NOT NULL,
  `order` int(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `is_agreed` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 0,
  `price` float DEFAULT NULL,
  `is_sent` tinyint(1) DEFAULT 0,
  `is_rejected` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- إرجاع أو استيراد بيانات الجدول `stages_project_design_request`
--

INSERT INTO `stages_project_design_request` (`id`, `design_id`, `enginner_id`, `stage_id`, `order`, `created_at`, `updated_at`, `created_by`, `is_agreed`, `is_active`, `price`, `is_sent`, `is_rejected`) VALUES
(60, 22, 4, 1, 1, '2022-05-09 12:35:38', '2022-05-09 12:42:28', 2, 1, 1, 33, 1, 0),
(61, 22, 5, 2, 2, '2022-05-09 12:35:38', '2022-05-09 12:43:03', 2, 0, 1, 343.43, 1, 0),
(62, 22, 7, 3, 3, '2022-05-09 12:35:38', '2022-05-09 12:43:03', 2, 0, 1, NULL, 0, 0),
(63, 22, 8, 4, 4, '2022-05-09 12:35:38', NULL, 2, 0, 0, NULL, 0, 0);

-- --------------------------------------------------------

--
-- بنية الجدول `stage_project`
--

CREATE TABLE `stage_project` (
  `id` int(11) UNSIGNED NOT NULL,
  `type` enum('design','Supervisor','','') NOT NULL,
  `value` varchar(2000) NOT NULL,
  `order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- إرجاع أو استيراد بيانات الجدول `stage_project`
--

INSERT INTO `stage_project` (`id`, `type`, `value`, `order`) VALUES
(1, 'design', 'المرحلة الاولى', 1),
(2, 'design', 'المرحلة الثانية', 2),
(3, 'design', 'المرحلة الثالثة', 3),
(4, 'design', 'المرحلة الرابعة', 4);

-- --------------------------------------------------------

--
-- بنية الجدول `statuses`
--

CREATE TABLE `statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `statuses`
--

INSERT INTO `statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Customer', '2022-04-08 02:10:27', '2022-04-08 02:10:27');

-- --------------------------------------------------------

--
-- بنية الجدول `systems`
--

CREATE TABLE `systems` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `systems`
--

INSERT INTO `systems` (`id`, `key`, `value`) VALUES
(1, 'invoice_reminder_template', '{\"invoice_reminder_email_subject\":\"Invoice Reminder from {business_name}\",\"invoice_reminder_email_body\":\"<p>Dear {customer_name},<\\/p>\\r\\n\\r\\n                                    <p>Your invoice number for {project_name} is {invoice_number} and due date for this is {due_date}<br \\/>\\r\\n                                    \\r\\n                                    <p>Thank you for the business.<\\/p>\\r\\n                                    <p><br><\\/p>\\r\\n                                    <p>Regards,<\\/p> <br>\\r\\n                                    <p>{business_name}<\\/p>\",\"invoice_reminder_attachment\":1}'),
(2, 'first_day_of_week', '0'),
(3, 'address_line_1', ''),
(4, 'address_line_2', ''),
(5, 'employee_added_template', '{\"subject\":\"Welcome {employee_name}\",\"body\":\"<p>Dear {employee_name}<\\/p><p><br><\\/p><p>Welcome to {company_name}<\\/p><p><br><\\/p><p>Please find your login details below:<\\/p><p>Email: {email}<\\/p><p>Password: {password}<\\/p><p>Login link: {login_link}<\\/p><p><br><\\/p><p>Thank you!<\\/p>\",\"attachment\":0}'),
(6, 'send_reminder_notification_template', '{\"subject\":\"New reminder for you!\",\"body\":\"<p>Hello {remind_to}<\\/p><p><br><\\/p><p>You have a new reminder: {reminder_for}<\\/p><p>Notes: {notes}<\\/p><p>Datetime: {remind_on}<\\/p>\",\"attachment\":0}'),
(7, 'customer_added_template', '{\"subject\":\"Welcome {customer_name}\",\"body\":\"<p>Dear {customer_name}<\\/p><p><br><\\/p><p>Welcome to {company_name}, its our pleasure to have you with us.<\\/p>\",\"attachment\":0}'),
(8, 'customers_contact_added_template', '{\"subject\":\"Welcome {contact_name}\",\"body\":\"<p>Dear {contact_name}<\\/p><p><br><\\/p><p>Welcome to {company_name}<\\/p><p><br><\\/p><p>Please find your login details below:<\\/p><p>Email: {email}<\\/p><p>Password: {password}<\\/p><p>Login link: {login_link}<\\/p><p><br><\\/p><p>Thank you!<\\/p>\",\"attachment\":0}'),
(9, 'send_invoice_to_customer_template', '{\"subject\":\"{invoice_number} from {company_name}\",\"body\":\"<p>Dear {customer_name}<\\/p><p><br><\\/p><p>Please find attached the invoice {invoice_number}.<\\/p><p>Please process it as per your convenience &amp; let us know.<\\/p><p><br><\\/p><p>Thank you.<\\/p>\",\"attachment\":1}'),
(10, 'lead_added_template', '{\"subject\":\"Welcome {lead_name}\",\"body\":\"<p>Dear {lead_name}<\\/p><p><br><\\/p><p>Welcome to {company_name}, its our pleasure to have you with us.<\\/p>\",\"attachment\":0}'),
(11, 'tax_number', NULL),
(12, 'mobile', NULL),
(13, 'alternate_contact_no', NULL),
(14, 'email', NULL),
(15, 'city', NULL),
(16, 'state', NULL),
(17, 'country', NULL),
(18, 'zip_code', NULL),
(19, 'logo', NULL),
(20, 'date_format', 'm-d-Y'),
(21, 'time_format', '12'),
(22, 'currency_id', '1');

-- --------------------------------------------------------

--
-- بنية الجدول `tickets`
--

CREATE TABLE `tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `priority` enum('low','medium','high','urgent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('new','open','closed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `assigned_to` int(10) UNSIGNED DEFAULT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED NOT NULL,
  `closed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `ticket_comments`
--

CREATE TABLE `ticket_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `ticket_id` int(10) UNSIGNED NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `ref_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `expense_for` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('invoice','expense') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('draft','estimate','final') COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `invoice_scheme_id` int(11) DEFAULT NULL,
  `transaction_date` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `discount_amount` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `total` decimal(20,4) NOT NULL,
  `terms` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` enum('paid','due','partial') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `transaction_payment_lines`
--

CREATE TABLE `transaction_payment_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(20,4) NOT NULL,
  `conversion_rate` decimal(8,2) NOT NULL,
  `paid_on` date NOT NULL,
  `payment_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_num` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skype` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `guardian_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('male','female','other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_identifier_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_payer_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sticky_notes` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `active` timestamp NULL DEFAULT NULL,
  `activation_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_card_number` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `enginnering_type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 0,
  `user_type_log` enum('ESTATE_OWNER','ENGINEERING_OFFICE_MANAGER','SUPPORT_SERVICES_OFFICE','CONTRACTING_COMPANY','GOVERNMENT_AGENCIES','SITE_MANAGENMENT') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_employee` tinyint(1) DEFAULT 0,
  `is_emp` tinyint(1) NOT NULL DEFAULT 0,
  `specialty_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `alternate_num`, `home_address`, `current_address`, `address`, `skype`, `linkedin`, `facebook`, `twitter`, `birth_date`, `guardian_name`, `gender`, `account_holder_name`, `account_no`, `bank_name`, `bank_identifier_code`, `branch_location`, `tax_payer_id`, `note`, `password`, `sticky_notes`, `created_by`, `last_login`, `active`, `activation_key`, `id_card_number`, `parent_id`, `enginnering_type`, `isActive`, `user_type_log`, `remember_token`, `created_at`, `updated_at`, `is_employee`, `is_emp`, `specialty_id`) VALUES
(1, 'Superadmin', 'admin@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$BHeoMwpJ8DADdfmTvaUjKuS4qFiFffoN3dQAG.Z06kgmSNnVGV4MG', NULL, NULL, '2022-07-02 00:14:44', '2022-04-08 02:10:28', 'efb4677a-4b92-4640-8b73-f14cb7da59f6', NULL, NULL, NULL, 0, 'SITE_MANAGENMENT', 'oFyzp3hmLu9QT7bfwU4UQWmPJ9bUgLkcRoKOBa8dTYxonfuixBaYbsPZzxzJ', '2022-04-08 02:10:28', '2022-07-02 00:14:44', 0, 0, NULL),
(2, 'B', 'office@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$q/rDl787QQJ8B.WylcfTz.LoeamXq8kd1ASmiGCa0RKUtYtA5D5yu', NULL, NULL, '2022-07-01 23:31:47', '0000-00-00 00:00:00', NULL, 123, NULL, NULL, 1, 'ESTATE_OWNER', 'LOA1rvgqZMbGutIpZPIhm5Lp6lxVQCnN4YWiYSXEIZEdNr6cDxHJibvLIm44', '2022-04-08 02:19:22', '2022-07-01 23:31:47', 0, 0, NULL),
(3, 'ewr', 'estate@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$495d9f8tqlscsB94y41CTuR67dmkf7ZJRI5.HLsvbt3n/VdUq2HLG', NULL, NULL, '2022-05-09 12:43:16', '0000-00-00 00:00:00', NULL, 123456, NULL, NULL, 1, 'ESTATE_OWNER', 'HCCQWolxoZLZO4jdn3MbUNFCCALNkiU89Uu8Wn3zURMcRIx0Y8bNWqNX6cvC', '2022-04-08 02:21:41', '2022-05-09 12:43:16', 0, 0, NULL),
(4, 'em1', 'em1@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$5KWGr/P7NqFQH.RywcSB7eYze8MoPQzZYtmgctqXF9ifJLc0U5xOK', NULL, NULL, '2022-05-09 12:35:50', '2022-04-07 07:00:00', NULL, 12345678, 2, '\"civil_enginnering\"', 1, '', 'fTewi6RbSDUZxBAiqSLfpYEvq19ulCvageSmslWtzdE7hOk6Wy8tZbIN67lM', '2022-04-08 02:26:39', '2022-05-09 12:35:50', 0, 1, 2),
(5, 'emp2', 'emp2@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$Jd1KkYhykqlLOk.I5y7nKeEI89TKeFMoLEHX5AJcIPido0dwalQmG', NULL, NULL, '2022-05-09 12:42:47', '2022-04-07 07:00:00', NULL, 43543543, 2, '\"civil_enginnering\"', 1, '', '17YIcbr7WtgkoRzoh3bXn4opSNAmc5bYb74HyT8Fzs7w6KwWfiCl53UBoQ6H', '2022-04-08 02:28:36', '2022-05-09 12:42:47', 1, 1, 4),
(6, 'rrr', 'rr@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$CYRx7qDQmsJT7BhwVra7G.82pHwNgx13CscK.UPKyCOd1hJX..xF6', NULL, NULL, '2022-05-05 09:00:32', '2022-04-23 21:00:00', NULL, 34234, 2, '\"civil_enginnering\"', 1, '', 'zpMIEP1rjCaGv8Ax9LCRpwTWP7KSJK5MiMMQYIUOHsuOhg83siIcE5FxBEdJ', '2022-04-14 23:11:01', '2022-05-05 09:00:32', 1, 1, 5),
(7, 'emp3', 'emp3@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$nWyOI5KX0IMSC6LRPZedfuUZg20gyAj82SK7ihRWHsFvPz7wUQZiq', NULL, NULL, '2022-05-06 18:55:07', '2022-04-23 21:00:00', NULL, 3213213, 2, NULL, 1, '', 'Ud1iDkIg8SFScktOQTYWkGX2eVls1pvxHyW8Ep8J9d75VsJfUfBVAYFaWaRC', '2022-04-24 08:23:20', '2022-05-06 18:55:07', 1, 1, 3),
(8, 'emp5', 'emp5@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$o70AYo3G86BjbSRohSFBhO90.kK1uTMReKTGOKRj5QXKWXcn7EdZu', NULL, NULL, '2022-05-06 18:57:25', '2022-04-23 21:00:00', NULL, 3443434, 2, NULL, 1, '', '2M4HyKQN4N9YFG3DjCO2VCAq6u8E6ZzkowerIVTw1MmYK8nVlGQw0FtncO8C', '2022-04-24 12:50:13', '2022-05-06 18:57:25', 0, 1, 6),
(9, 'ewdwe', 'edwe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, NULL),
(32, 'ab', 'ab@mail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$cJ336ofU3fxdyXRBx8FIS.z0ixQNdZbIYuUruQojl73uovaBdAyay', NULL, NULL, '2022-06-22 03:57:49', '2022-06-21 07:00:00', NULL, 124548787, 1, NULL, 1, '', NULL, '2022-06-22 02:12:25', '2022-06-22 03:57:49', 0, 0, NULL),
(37, 'dfd', 'test@mail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$DwnYk99.yH1prY5gXThi6.bqjClqJfjZPaZtmkNoiK3YFKUFwRFSS', NULL, NULL, '2022-06-22 21:43:46', '2022-06-22 07:00:00', NULL, 4294967295, 1, NULL, 1, 'ENGINEERING_OFFICE_MANAGER', NULL, '2022-06-22 21:20:25', '2022-06-22 21:43:46', 0, 0, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `user_types`
--

CREATE TABLE `user_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('Estate Owner','Engineering Office','Support Service Office','Contracting  Company','Government Agencies','Site Managnment') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `visit_requests`
--

CREATE TABLE `visit_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `office_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_type` enum('visit_request','design_request','support_service_request','contractor_request','supervision_request') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('new','pending','sent','accepted','rejected') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office_status` enum('new','pending','sent','rejected','accepted','recieved') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent` tinyint(1) NOT NULL DEFAULT 0,
  `dead_line_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `visit_requests`
--

INSERT INTO `visit_requests` (`id`, `customer_id`, `office_id`, `project_id`, `description`, `request_type`, `note`, `status`, `office_status`, `sent`, `dead_line_date`, `created_at`, `updated_at`) VALUES
(72, 3, 2, 5, 'test', 'visit_request', 'te', 'accepted', 'accepted', 1, '2022-04-21 07:36:00', '2022-04-24 18:20:27', '2022-04-24 18:21:08'),
(73, 3, 2, 5, 'test', 'visit_request', 'erew', 'accepted', 'recieved', 1, '2022-04-22 20:40:00', '2022-04-24 18:20:42', '2022-04-24 18:21:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agencies`
--
ALTER TABLE `agencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agencies_user_id_foreign` (`user_id`);

--
-- Indexes for table `assign_project_to_users`
--
ALTER TABLE `assign_project_to_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assign_project_to_users_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `categorables`
--
ALTER TABLE `categorables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_created_by_index` (`created_by`);

--
-- Indexes for table `customer_infos`
--
ALTER TABLE `customer_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `design_request`
--
ALTER TABLE `design_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_user_id_foreign` (`user_id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorites_favoritable_type_favoritable_id_index` (`favoritable_type`,`favoritable_id`);

--
-- Indexes for table `invoice_lines`
--
ALTER TABLE `invoice_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_lines_transaction_id_foreign` (`transaction_id`);

--
-- Indexes for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `knowledge_bases`
--
ALTER TABLE `knowledge_bases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `knowledge_bases_created_by_index` (`created_by`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leaves_user_id_foreign` (`user_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notes_created_by_index` (`created_by`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_customer_id_foreign` (`customer_id`),
  ADD KEY `projects_location_id_foreign` (`location_id`),
  ADD KEY `projects_agency_id_foreign` (`agency_id`),
  ADD KEY `projects_created_by_index` (`created_by`);

--
-- Indexes for table `project_members`
--
ALTER TABLE `project_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_members_project_id_foreign` (`project_id`),
  ADD KEY `project_members_user_id_index` (`user_id`);

--
-- Indexes for table `project_milestones`
--
ALTER TABLE `project_milestones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_milestones_project_id_foreign` (`project_id`),
  ADD KEY `project_milestones_created_by_index` (`created_by`);

--
-- Indexes for table `project_requests`
--
ALTER TABLE `project_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_requests_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `project_tasks`
--
ALTER TABLE `project_tasks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `project_tasks_task_id_unique` (`task_id`),
  ADD KEY `project_tasks_project_id_foreign` (`project_id`),
  ADD KEY `project_tasks_created_by_index` (`created_by`);

--
-- Indexes for table `project_task_members`
--
ALTER TABLE `project_task_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_task_members_project_task_id_foreign` (`project_task_id`),
  ADD KEY `project_task_members_user_id_index` (`user_id`);

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reminders_created_by_index` (`created_by`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reports_project_id_foreign` (`project_id`);

--
-- Indexes for table `report_types`
--
ALTER TABLE `report_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_enginners`
--
ALTER TABLE `request_enginners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_enginners_request_id_foreign` (`request_id`),
  ADD KEY `request_enginners_user_id_index` (`user_id`);

--
-- Indexes for table `request_roles`
--
ALTER TABLE `request_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_roles_role_id_foreign` (`role_id`),
  ADD KEY `request_roles_user_id_foreign` (`user_id`);

--
-- Indexes for table `request_types`
--
ALTER TABLE `request_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sources`
--
ALTER TABLE `sources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specialties`
--
ALTER TABLE `specialties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specialtiy_request_project`
--
ALTER TABLE `specialtiy_request_project`
  ADD PRIMARY KEY (`id`),
  ADD KEY `specialty_id` (`specialty_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `request_id` (`request_id`);

--
-- Indexes for table `specialtiy_visit_request`
--
ALTER TABLE `specialtiy_visit_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rquest_id` (`rquest_id`),
  ADD KEY `specialty_id` (`specialty_id`);

--
-- Indexes for table `stages_project_design_request`
--
ALTER TABLE `stages_project_design_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `design_id` (`design_id`),
  ADD KEY `enginner_id` (`enginner_id`),
  ADD KEY `stage_id` (`stage_id`);

--
-- Indexes for table `stage_project`
--
ALTER TABLE `stage_project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `systems`
--
ALTER TABLE `systems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_category_id_foreign` (`category_id`),
  ADD KEY `tickets_assigned_to_foreign` (`assigned_to`),
  ADD KEY `tickets_customer_id_foreign` (`customer_id`),
  ADD KEY `tickets_created_by_foreign` (`created_by`),
  ADD KEY `tickets_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_comments_ticket_id_foreign` (`ticket_id`),
  ADD KEY `ticket_comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_project_id_foreign` (`project_id`),
  ADD KEY `transactions_expense_for_foreign` (`expense_for`),
  ADD KEY `transactions_customer_id_foreign` (`customer_id`),
  ADD KEY `transactions_created_by_index` (`created_by`);

--
-- Indexes for table `transaction_payment_lines`
--
ALTER TABLE `transaction_payment_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_payment_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_payment_lines_created_by_index` (`created_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_parent_id_foreign` (`parent_id`),
  ADD KEY `specialty_id` (`specialty_id`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_types_user_id_foreign` (`user_id`);

--
-- Indexes for table `visit_requests`
--
ALTER TABLE `visit_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visit_requests_customer_id_foreign` (`customer_id`),
  ADD KEY `visit_requests_office_id_foreign` (`office_id`),
  ADD KEY `visit_requests_project_id_foreign` (`project_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agencies`
--
ALTER TABLE `agencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assign_project_to_users`
--
ALTER TABLE `assign_project_to_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorables`
--
ALTER TABLE `categorables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_infos`
--
ALTER TABLE `customer_infos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `design_request`
--
ALTER TABLE `design_request`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoice_lines`
--
ALTER TABLE `invoice_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `knowledge_bases`
--
ALTER TABLE `knowledge_bases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `project_members`
--
ALTER TABLE `project_members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `project_milestones`
--
ALTER TABLE `project_milestones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_requests`
--
ALTER TABLE `project_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_tasks`
--
ALTER TABLE `project_tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `project_task_members`
--
ALTER TABLE `project_task_members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `report_types`
--
ALTER TABLE `report_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `request_enginners`
--
ALTER TABLE `request_enginners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `request_roles`
--
ALTER TABLE `request_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `request_types`
--
ALTER TABLE `request_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sources`
--
ALTER TABLE `sources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `specialties`
--
ALTER TABLE `specialties`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `specialtiy_request_project`
--
ALTER TABLE `specialtiy_request_project`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `specialtiy_visit_request`
--
ALTER TABLE `specialtiy_visit_request`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `stages_project_design_request`
--
ALTER TABLE `stages_project_design_request`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `stage_project`
--
ALTER TABLE `stage_project`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `systems`
--
ALTER TABLE `systems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_payment_lines`
--
ALTER TABLE `transaction_payment_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visit_requests`
--
ALTER TABLE `visit_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- قيود الجداول المحفوظة
--

--
-- القيود للجدول `agencies`
--
ALTER TABLE `agencies`
  ADD CONSTRAINT `agencies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `assign_project_to_users`
--
ALTER TABLE `assign_project_to_users`
  ADD CONSTRAINT `assign_project_to_users_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `invoice_lines`
--
ALTER TABLE `invoice_lines`
  ADD CONSTRAINT `invoice_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `leaves`
--
ALTER TABLE `leaves`
  ADD CONSTRAINT `leaves_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_agency_id_foreign` FOREIGN KEY (`agency_id`) REFERENCES `agencies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `projects_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `projects_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `project_members`
--
ALTER TABLE `project_members`
  ADD CONSTRAINT `project_members_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `project_milestones`
--
ALTER TABLE `project_milestones`
  ADD CONSTRAINT `project_milestones_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `project_requests`
--
ALTER TABLE `project_requests`
  ADD CONSTRAINT `project_requests_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `project_tasks`
--
ALTER TABLE `project_tasks`
  ADD CONSTRAINT `project_tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `project_task_members`
--
ALTER TABLE `project_task_members`
  ADD CONSTRAINT `project_task_members_project_task_id_foreign` FOREIGN KEY (`project_task_id`) REFERENCES `project_tasks` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `request_enginners`
--
ALTER TABLE `request_enginners`
  ADD CONSTRAINT `request_enginners_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `request_enginners_request_id_foreign` FOREIGN KEY (`request_id`) REFERENCES `visit_requests` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `request_roles`
--
ALTER TABLE `request_roles`
  ADD CONSTRAINT `request_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `request_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `specialtiy_request_project`
--
ALTER TABLE `specialtiy_request_project`
  ADD CONSTRAINT `specialtiy_request_project_ibfk_1` FOREIGN KEY (`specialty_id`) REFERENCES `specialties` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `specialtiy_request_project_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `specialtiy_request_project_ibfk_3` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `specialtiy_request_project_ibfk_4` FOREIGN KEY (`request_id`) REFERENCES `visit_requests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `specialtiy_visit_request`
--
ALTER TABLE `specialtiy_visit_request`
  ADD CONSTRAINT `specialtiy_visit_request_ibfk_1` FOREIGN KEY (`rquest_id`) REFERENCES `visit_requests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `specialtiy_visit_request_ibfk_2` FOREIGN KEY (`specialty_id`) REFERENCES `specialties` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `stages_project_design_request`
--
ALTER TABLE `stages_project_design_request`
  ADD CONSTRAINT `stages_project_design_request_ibfk_1` FOREIGN KEY (`design_id`) REFERENCES `design_request` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stages_project_design_request_ibfk_2` FOREIGN KEY (`enginner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stages_project_design_request_ibfk_3` FOREIGN KEY (`stage_id`) REFERENCES `stage_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tickets_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `tickets_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tickets_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tickets_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- القيود للجدول `ticket_comments`
--
ALTER TABLE `ticket_comments`
  ADD CONSTRAINT `ticket_comments_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ticket_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- القيود للجدول `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_for_foreign` FOREIGN KEY (`expense_for`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `transaction_payment_lines`
--
ALTER TABLE `transaction_payment_lines`
  ADD CONSTRAINT `transaction_payment_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`specialty_id`) REFERENCES `specialties` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `user_types`
--
ALTER TABLE `user_types`
  ADD CONSTRAINT `user_types_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- القيود للجدول `visit_requests`
--
ALTER TABLE `visit_requests`
  ADD CONSTRAINT `visit_requests_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `visit_requests_office_id_foreign` FOREIGN KEY (`office_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `visit_requests_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
