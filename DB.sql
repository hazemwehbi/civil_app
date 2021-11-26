-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2021 at 08:07 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `homestead1`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(1, 'default', 'created', 1, 'App\\Components\\User\\Models\\User', NULL, NULL, '{\"attributes\":{\"name\":\"Superadmin\",\"email\":\"admin@example.com\",\"mobile\":null,\"alternate_num\":null,\"home_address\":null,\"current_address\":null,\"address\":null,\"skype\":null,\"linkedin\":null,\"facebook\":null,\"twitter\":null,\"birth_date\":null,\"guardian_name\":null,\"gender\":null,\"note\":null,\"customer_id\":null,\"created_by\":null,\"password\":\"$2y$10$IaqWf4d8u4F\\/qD6JDOBI5exa\\/nDOQVJsETM0KzSKMhVopn04mAwBS\",\"remember_token\":\"rIA3hNFYTV\",\"created_at\":\"2019-04-18 12:03:19\",\"updated_at\":\"2019-04-18 12:03:19\",\"last_login\":\"2019-04-18 12:03:18\",\"active\":\"2019-04-18 12:03:18\",\"activation_key\":\"f25ea9af-9c92-4e3a-8a74-b6415e212ad9\"}}', '2019-04-18 10:03:19', '2019-04-18 10:03:19'),
(2, 'default', 'created', 1, 'App\\Customer', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"company\":\"Web Experts\",\"tax_number\":null,\"mobile\":\"923232323\",\"alternate_contact_no\":null,\"email\":\"webexpert@test.com\",\"website\":null,\"city\":null,\"state\":null,\"zip_code\":null,\"country\":null,\"billing_address\":null,\"shipping_address\":null,\"currency_id\":1,\"created_by\":1,\"deleted_at\":null,\"created_at\":\"2019-04-18 12:20:13\",\"updated_at\":\"2019-04-18 12:20:13\"}}', '2019-04-18 10:20:14', '2019-04-18 10:20:14'),
(3, 'default', 'updated', 1, 'App\\Customer', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"tax_number\":\"1010al\",\"updated_at\":\"2019-04-18 12:20:33\"},\"old\":{\"tax_number\":null,\"updated_at\":\"2019-04-18 12:20:13\"}}', '2019-04-18 10:20:33', '2019-04-18 10:20:33'),
(4, 'default', 'updated', 1, 'App\\Customer', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"website\":\"https:\\/\\/www.example.com\",\"updated_at\":\"2019-04-18 12:21:26\"},\"old\":{\"website\":null,\"updated_at\":\"2019-04-18 12:20:33\"}}', '2019-04-18 10:21:26', '2019-04-18 10:21:26'),
(5, 'default', 'updated', 1, 'App\\Customer', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"alternate_contact_no\":\"923232322\",\"city\":\"Arizona\",\"state\":\"Arizona\",\"zip_code\":\"1010101\",\"country\":\"USA\",\"billing_address\":\"Linking Street, Arizona\",\"shipping_address\":\"Linking Street, Arizona\",\"updated_at\":\"2019-04-18 12:25:09\"},\"old\":{\"alternate_contact_no\":null,\"city\":null,\"state\":null,\"zip_code\":null,\"country\":null,\"billing_address\":null,\"shipping_address\":null,\"updated_at\":\"2019-04-18 12:21:26\"}}', '2019-04-18 10:25:09', '2019-04-18 10:25:09'),
(6, 'default', 'created', 2, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"name\":\"Mike\",\"email\":\"mike@test.com\",\"mobile\":null,\"alternate_num\":null,\"home_address\":null,\"current_address\":null,\"address\":null,\"skype\":null,\"linkedin\":null,\"facebook\":null,\"twitter\":null,\"birth_date\":null,\"guardian_name\":null,\"gender\":null,\"note\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\",\"customer_id\":\"1\",\"created_by\":\"1\",\"password\":\"$2y$10$\\/NiMh9KLajJwRmRjuGUzo.4XqmQiNNrJWAtJR5PzuQXiQ4vV2F\\/ne\",\"remember_token\":null,\"created_at\":\"2019-04-18 12:26:19\",\"updated_at\":\"2019-04-18 12:26:19\",\"last_login\":null,\"active\":null,\"activation_key\":null}}', '2019-04-18 10:26:19', '2019-04-18 10:26:19'),
(7, 'default', 'created', 1, 'App\\Project', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"name\":\"Musical Design\",\"category_id\":1,\"customer_id\":1,\"billing_type\":\"fixed_rate\",\"total_rate\":\"0.00\",\"price_per_hours\":\"0.00\",\"estimated_hours\":\"0.00\",\"estimated_cost\":\"0.00\",\"status\":\"not_started\",\"lead_id\":1,\"start_date\":\"2019-04-18 00:00:00\",\"end_date\":\"2019-06-08 00:00:00\",\"description\":\"<p class=\\\"ql-align-justify\\\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.<\\/p><p><br><\\/p>\",\"created_by\":1,\"favorite\":0,\"created_at\":\"2019-04-18 12:27:30\",\"updated_at\":\"2019-04-18 12:27:30\"}}', '2019-04-18 10:27:30', '2019-04-18 10:27:30'),
(8, 'default', 'created', 2, 'App\\Project', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"name\":\"Zynga Game\",\"category_id\":2,\"customer_id\":1,\"billing_type\":\"fixed_rate\",\"total_rate\":\"0.00\",\"price_per_hours\":\"0.00\",\"estimated_hours\":\"0.00\",\"estimated_cost\":\"0.00\",\"status\":\"in_progress\",\"lead_id\":1,\"start_date\":\"2019-04-18 00:00:00\",\"end_date\":\"2019-06-15 00:00:00\",\"description\":\"<p class=\\\"ql-align-justify\\\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \\\"de Finibus Bonorum et Malorum\\\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.<\\/p><p><br><\\/p>\",\"created_by\":1,\"favorite\":0,\"created_at\":\"2019-04-18 12:28:58\",\"updated_at\":\"2019-04-18 12:28:58\"}}', '2019-04-18 10:28:58', '2019-04-18 10:28:58'),
(9, 'default', 'created', 1, 'App\\ProjectTask', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"project_id\":2,\"task_id\":null,\"subject\":\"Cras dictum libero eget erat rhoncus fermentum.\",\"hourly_rate\":\"0.00\",\"start_date\":\"2019-04-18 00:00:00\",\"due_date\":\"2019-05-17 00:00:00\",\"priority\":\"medium\",\"description\":\"<p class=\\\"ql-align-justify\\\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \\\"de Finibus Bonorum et Malorum\\\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.<\\/p><p><br><\\/p>\",\"created_by\":1,\"show_to_customer\":1,\"is_completed\":0,\"created_at\":\"2019-04-18 12:30:49\",\"updated_at\":\"2019-04-18 12:30:49\"}}', '2019-04-18 10:30:49', '2019-04-18 10:30:49'),
(10, 'default', 'created', 1, 'App\\Note', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"notable_id\":2,\"notable_type\":\"App\\\\Project\",\"heading\":\"Where can I get some?\",\"description\":\"<p class=\\\"ql-align-justify\\\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.<\\/p><p><br><\\/p>\",\"created_by\":1,\"created_at\":\"2019-04-18 12:31:31\",\"updated_at\":\"2019-04-18 12:31:31\"}}', '2019-04-18 10:31:31', '2019-04-18 10:31:31'),
(11, 'default', 'updated', 1, 'App\\ProjectTask', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"is_completed\":1,\"updated_at\":\"2019-04-18 12:31:52\"},\"old\":{\"is_completed\":0,\"updated_at\":\"2019-04-18 12:30:49\"}}', '2019-04-18 10:31:52', '2019-04-18 10:31:52'),
(12, 'default', 'updated', 1, 'App\\ProjectTask', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"is_completed\":0,\"updated_at\":\"2019-04-18 12:32:05\"},\"old\":{\"is_completed\":1,\"updated_at\":\"2019-04-18 12:31:52\"}}', '2019-04-18 10:32:05', '2019-04-18 10:32:05'),
(14, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"mobile\":\"900909090\",\"alternate_num\":\"10190190\",\"skype\":\"sky\",\"linkedin\":\"www.linkedin.com\",\"facebook\":\"www.fb.com\",\"twitter\":\"www.twitter.com\",\"birth_date\":\"1985-01-01\",\"guardian_name\":\"Test\",\"gender\":\"male\",\"updated_at\":\"2019-04-18 12:35:11\"},\"old\":{\"mobile\":null,\"alternate_num\":null,\"skype\":null,\"linkedin\":null,\"facebook\":null,\"twitter\":null,\"birth_date\":null,\"guardian_name\":null,\"gender\":null,\"updated_at\":\"2019-04-18 12:03:19\"}}', '2019-04-18 10:35:11', '2019-04-18 10:35:11'),
(15, 'default', 'created', 2, 'App\\ProjectTask', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"project_id\":1,\"task_id\":null,\"subject\":\"Song recording\",\"hourly_rate\":\"0.00\",\"start_date\":\"2019-04-18 00:00:00\",\"due_date\":\"2019-04-20 00:00:00\",\"priority\":\"high\",\"description\":null,\"created_by\":1,\"show_to_customer\":0,\"is_completed\":0,\"created_at\":\"2019-04-18 12:36:07\",\"updated_at\":\"2019-04-18 12:36:07\"}}', '2019-04-18 10:36:07', '2019-04-18 10:36:07'),
(19, 'default', 'created', 3, 'App\\ProjectTask', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"project_id\":2,\"task_id\":null,\"category_id\":null,\"subject\":\"implementing algorithem for game\",\"hourly_rate\":\"0.00\",\"start_date\":\"2019-05-16 00:00:00\",\"due_date\":\"2019-05-15 00:00:00\",\"priority\":\"medium\",\"description\":\"<h1 class=\\\"ql-align-justify\\\">Minimax Algorithm in Game Theory | Set 1 (Introduction)<\\/h1><p class=\\\"ql-align-justify\\\"><br><\\/p><p>Minimax is a kind of&nbsp;<a href=\\\"https:\\/\\/www.geeksforgeeks.org\\/tag\\/backtracking\\/\\\" target=\\\"_blank\\\" style=\\\"color: rgb(236, 78, 32);\\\">backtracking<\\/a>&nbsp;algorithm that is used in decision making and game theory to find the optimal move for a player, assuming that your opponent also plays optimally. It is widely used in two player turn-based games such as Tic-Tac-Toe, Backgammon, Mancala, Chess, etc.<\\/p><p>In Minimax the two players are called maximizer and minimizer. The&nbsp;<strong>maximizer<\\/strong>&nbsp;tries to get the highest score possible while the&nbsp;<strong>minimizer<\\/strong>&nbsp;tries to do the opposite and get the lowest score possible.<\\/p><p class=\\\"ql-align-justify\\\">Every board state has a value associated with it. In a given state if the maximizer has upper hand then, the score of the board will tend to be some positive value. If the minimizer has the upper hand in that board state then it will tend to be some negative value. The values of the board are calculated by some heuristics which are unique for every type of game.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><p><a href=\\\"https:\\/\\/www.geeksforgeeks.org\\/minimax-algorithm-in-game-theory-set-1-introduction\\/\\\" target=\\\"_blank\\\"><strong><em>to read more...<\\/em><\\/strong><\\/a><\\/p>\",\"created_by\":1,\"show_to_customer\":0,\"is_completed\":0,\"created_at\":\"2019-05-08 05:49:06\",\"updated_at\":\"2019-05-08 05:49:06\"}}', '2019-05-08 03:49:06', '2019-05-08 03:49:06'),
(20, 'default', 'created', 1, 'App\\Transaction', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"project_id\":1,\"type\":\"invoice\",\"status\":\"final\",\"ref_no\":\"custom-00002\",\"title\":\"Invoice forrecording song\",\"customer_id\":1,\"contact_id\":null,\"invoice_scheme_id\":1,\"transaction_date\":\"2019-05-11\",\"due_date\":\"2019-05-30\",\"discount_type\":\"fixed\",\"discount_amount\":\"1.000\",\"total\":\"25.250\",\"terms\":\"Terms\",\"notes\":\"Notes\",\"payment_status\":\"due\",\"created_by\":1,\"created_at\":\"2019-05-10 05:00:44\",\"updated_at\":\"2019-05-10 05:00:44\"}}', '2019-05-10 03:00:44', '2019-05-10 03:00:44'),
(21, 'default', 'created', 2, 'App\\Transaction', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"project_id\":2,\"type\":\"invoice\",\"status\":\"final\",\"ref_no\":\"2019-00002\",\"title\":\"Implemented Algorithem\",\"customer_id\":1,\"contact_id\":null,\"invoice_scheme_id\":2,\"transaction_date\":\"2019-05-11\",\"due_date\":\"2019-05-11\",\"discount_type\":\"fixed\",\"discount_amount\":\"2.000\",\"total\":\"263.200\",\"terms\":\"Terms\",\"notes\":\"Notes\",\"payment_status\":\"due\",\"created_by\":1,\"created_at\":\"2019-05-10 05:02:01\",\"updated_at\":\"2019-05-10 05:02:01\"}}', '2019-05-10 03:02:01', '2019-05-10 03:02:01'),
(22, 'default', 'created', 3, 'App\\Transaction', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"project_id\":2,\"type\":\"invoice\",\"status\":\"estimate\",\"ref_no\":\"estimate1883092509\",\"title\":\"Desgin for game\",\"customer_id\":1,\"contact_id\":null,\"invoice_scheme_id\":2,\"transaction_date\":\"2019-05-18\",\"due_date\":\"2019-05-15\",\"discount_type\":\"fixed\",\"discount_amount\":\"2.000\",\"total\":\"110.000\",\"terms\":\"Terms\",\"notes\":\"Notes\",\"payment_status\":\"due\",\"created_by\":1,\"created_at\":\"2019-05-10 05:03:54\",\"updated_at\":\"2019-05-10 05:03:54\"}}', '2019-05-10 03:03:54', '2019-05-10 03:03:54'),
(23, 'default', 'created', 2, 'App\\Customer', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"company\":\"Digital Ways\",\"currency_id\":1,\"tax_number\":null,\"mobile\":\"7890130490\",\"alternate_contact_no\":null,\"email\":\"digitalways@example.com\",\"website\":null,\"city\":null,\"state\":null,\"zip_code\":null,\"country\":null,\"billing_address\":null,\"shipping_address\":null,\"status_id\":2,\"source_id\":1,\"assigned_to\":1,\"contacted_date\":\"2019-07-26 13:25:00\",\"description\":null,\"created_by\":1,\"deleted_at\":null,\"created_at\":\"2019-07-25 15:50:54\",\"updated_at\":\"2019-07-25 15:50:54\"}}', '2019-07-25 13:50:54', '2019-07-25 13:50:54'),
(24, 'default', 'created', 3, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"name\":\"John Tyson\",\"email\":\"digitalways@example.com\",\"mobile\":null,\"alternate_num\":null,\"home_address\":null,\"current_address\":null,\"address\":null,\"skype\":null,\"linkedin\":null,\"facebook\":null,\"twitter\":null,\"birth_date\":null,\"guardian_name\":null,\"gender\":null,\"account_holder_name\":null,\"account_no\":null,\"bank_name\":null,\"bank_identifier_code\":null,\"branch_location\":null,\"tax_payer_id\":null,\"note\":null,\"password\":null,\"created_by\":null,\"customer_id\":\"2\",\"last_login\":null,\"active\":null,\"activation_key\":null,\"remember_token\":null,\"created_at\":\"2019-07-25 15:50:55\",\"updated_at\":\"2019-07-25 15:50:55\"}}', '2019-07-25 13:50:55', '2019-07-25 13:50:55'),
(25, 'default', 'created', 4, 'App\\Note', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"notable_id\":2,\"notable_type\":\"App\\\\Customer\",\"heading\":\"What is Lorem Ipsum?\",\"description\":\"<p><strong style=\\\"color: rgb(0, 0, 0);\\\">Lorem Ipsum<\\/strong><span style=\\\"color: rgb(0, 0, 0);\\\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum<\\/span><\\/p>\",\"created_by\":1,\"created_at\":\"2019-07-25 15:54:55\",\"updated_at\":\"2019-07-25 15:54:55\"}}', '2019-07-25 13:54:55', '2019-07-25 13:54:55'),
(26, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-14 19:04:32\",\"updated_at\":\"2020-07-14 19:04:32\"},\"old\":{\"last_login\":\"2019-04-18 12:03:18\",\"updated_at\":\"2019-04-18 12:35:11\"}}', '2020-07-14 17:04:32', '2020-07-14 17:04:32'),
(27, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"2lf7RcICV9WYsFHxofTnOb2KLw8XxHVyJkcm1M6LBmXJfPpQ44UVb00o7MVt\"},\"old\":{\"remember_token\":\"rIA3hNFYTV\"}}', '2020-07-14 17:05:34', '2020-07-14 17:05:34'),
(28, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-14 19:05:36\",\"updated_at\":\"2020-07-14 19:05:36\"},\"old\":{\"last_login\":\"2020-07-14 19:04:32\",\"updated_at\":\"2020-07-14 19:04:32\"}}', '2020-07-14 17:05:36', '2020-07-14 17:05:36'),
(29, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"EMUFZxKZT5JghuxYtBcIWyEluQjTEmNwOwiyV6WuIMjcOLZZ0jSiPlk7nDUl\"},\"old\":{\"remember_token\":\"2lf7RcICV9WYsFHxofTnOb2KLw8XxHVyJkcm1M6LBmXJfPpQ44UVb00o7MVt\"}}', '2020-07-14 17:07:26', '2020-07-14 17:07:26'),
(30, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-14 19:07:52\",\"updated_at\":\"2020-07-14 19:07:52\"},\"old\":{\"last_login\":null,\"updated_at\":\"2019-04-18 12:26:19\"}}', '2020-07-14 17:07:52', '2020-07-14 17:07:52'),
(31, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"DbF58Mlv7RK7bGKVzllU8xlQb1YtS27ogB7F0Z7ZBpd8KyJJpb4uV95C53n9\"},\"old\":{\"remember_token\":null}}', '2020-07-14 17:08:27', '2020-07-14 17:08:27'),
(32, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-14 19:08:28\",\"updated_at\":\"2020-07-14 19:08:28\"},\"old\":{\"last_login\":\"2020-07-14 19:05:36\",\"updated_at\":\"2020-07-14 19:05:36\"}}', '2020-07-14 17:08:28', '2020-07-14 17:08:28'),
(33, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"SHK1kYrC7T9YQdIYclg105l0ezOhzGzkg7SEzKpM6Yr45wzb0NaejbRlIwyE\"},\"old\":{\"remember_token\":\"EMUFZxKZT5JghuxYtBcIWyEluQjTEmNwOwiyV6WuIMjcOLZZ0jSiPlk7nDUl\"}}', '2020-07-14 17:10:31', '2020-07-14 17:10:31'),
(34, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-14 19:10:41\",\"updated_at\":\"2020-07-14 19:10:41\"},\"old\":{\"last_login\":\"2020-07-14 19:08:28\",\"updated_at\":\"2020-07-14 19:08:28\"}}', '2020-07-14 17:10:41', '2020-07-14 17:10:41'),
(35, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-14 19:11:07\",\"updated_at\":\"2020-07-14 19:11:07\"},\"old\":{\"last_login\":\"2020-07-14 19:10:41\",\"updated_at\":\"2020-07-14 19:10:41\"}}', '2020-07-14 17:11:07', '2020-07-14 17:11:07'),
(36, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-14 19:34:25\",\"updated_at\":\"2020-07-14 19:34:25\"},\"old\":{\"last_login\":\"2020-07-14 19:11:07\",\"updated_at\":\"2020-07-14 19:11:07\"}}', '2020-07-14 17:34:26', '2020-07-14 17:34:26'),
(37, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-15 17:51:19\",\"updated_at\":\"2020-07-15 17:51:19\"},\"old\":{\"last_login\":\"2020-07-14 19:34:25\",\"updated_at\":\"2020-07-14 19:34:25\"}}', '2020-07-15 15:51:19', '2020-07-15 15:51:19'),
(38, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-16 18:44:50\",\"updated_at\":\"2020-07-16 18:44:50\"},\"old\":{\"last_login\":\"2020-07-15 17:51:19\",\"updated_at\":\"2020-07-15 17:51:19\"}}', '2020-07-16 16:44:51', '2020-07-16 16:44:51'),
(39, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-17 10:33:37\",\"updated_at\":\"2020-07-17 10:33:37\"},\"old\":{\"last_login\":\"2020-07-16 18:44:50\",\"updated_at\":\"2020-07-16 18:44:50\"}}', '2020-07-17 08:33:38', '2020-07-17 08:33:38'),
(40, 'default', 'created', 3, 'App\\Project', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"name\":\"test\",\"customer_id\":1,\"billing_type\":\"fixed_rate\",\"total_rate\":\"0.00\",\"price_per_hours\":\"0.00\",\"estimated_hours\":\"0.00\",\"estimated_cost\":\"0.00\",\"status\":\"in_progress\",\"lead_id\":4,\"start_date\":\"2020-07-17 00:00:00\",\"end_date\":\"2020-07-25 00:00:00\",\"description\":\"<p>test<\\/p>\",\"created_by\":1,\"favorite\":0,\"created_at\":\"2020-07-17 13:08:14\",\"updated_at\":\"2020-07-17 13:08:14\"}}', '2020-07-17 11:08:14', '2020-07-17 11:08:14'),
(41, 'default', 'created', 5, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"name\":\"max wbi\",\"email\":\"hfg@gh.com\",\"mobile\":null,\"alternate_num\":null,\"home_address\":\"place du 8 Mai 1945\",\"current_address\":\"place du 8 Mai 1945\",\"address\":null,\"skype\":null,\"linkedin\":null,\"facebook\":null,\"twitter\":null,\"birth_date\":null,\"guardian_name\":null,\"gender\":null,\"account_holder_name\":null,\"account_no\":null,\"bank_name\":null,\"bank_identifier_code\":null,\"branch_location\":null,\"tax_payer_id\":null,\"note\":null,\"password\":\"$2y$10$K9Hb133mfOUbkYjo9KscH.IquzlYQEC2sb\\/4MhlykqVe6N9JwS4Qi\",\"sticky_notes\":null,\"created_by\":null,\"customer_id\":null,\"last_login\":null,\"active\":\"2020-07-17 00:00:00\",\"activation_key\":null,\"remember_token\":null,\"created_at\":\"2020-07-17 13:14:15\",\"updated_at\":\"2020-07-17 13:14:15\"}}', '2020-07-17 11:14:15', '2020-07-17 11:14:15'),
(42, 'default', 'updated', 3, 'App\\Project', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"lead_id\":5,\"updated_at\":\"2020-07-17 13:14:46\"},\"old\":{\"lead_id\":4,\"updated_at\":\"2020-07-17 13:08:14\"}}', '2020-07-17 11:14:46', '2020-07-17 11:14:46'),
(43, 'default', 'updated', 3, 'App\\Project', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"updated_at\":\"2020-07-17 13:15:42\"},\"old\":{\"updated_at\":\"2020-07-17 13:14:46\"}}', '2020-07-17 11:15:42', '2020-07-17 11:15:42'),
(44, 'default', 'updated', 3, 'App\\Project', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"lead_id\":1,\"updated_at\":\"2020-07-17 13:16:16\"},\"old\":{\"lead_id\":5,\"updated_at\":\"2020-07-17 13:15:42\"}}', '2020-07-17 11:16:16', '2020-07-17 11:16:16'),
(45, 'default', 'created', 4, 'App\\Project', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"name\":\"max wbidsf\",\"customer_id\":1,\"user_id\":null,\"billing_type\":\"fixed_rate\",\"total_rate\":\"0.00\",\"price_per_hours\":\"0.00\",\"estimated_hours\":\"0.00\",\"estimated_cost\":\"0.00\",\"status\":\"in_progress\",\"lead_id\":5,\"start_date\":\"2020-07-17 00:00:00\",\"end_date\":\"2020-07-31 00:00:00\",\"description\":\"<p>sdf<\\/p>\",\"created_by\":1,\"favorite\":0,\"created_at\":\"2020-07-17 16:22:19\",\"updated_at\":\"2020-07-17 16:22:19\"}}', '2020-07-17 14:22:19', '2020-07-17 14:22:19'),
(46, 'default', 'created', 5, 'App\\Project', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"name\":\"hazam sdsd\",\"customer_id\":1,\"billing_type\":\"fixed_rate\",\"total_rate\":\"0.00\",\"price_per_hours\":\"0.00\",\"estimated_hours\":\"0.00\",\"estimated_cost\":\"0.00\",\"status\":\"in_progress\",\"lead_id\":5,\"start_date\":\"2020-07-18 00:00:00\",\"end_date\":\"2020-07-29 00:00:00\",\"description\":\"<p>sdfsdf<\\/p>\",\"created_by\":1,\"favorite\":0,\"created_at\":\"2020-07-17 16:23:17\",\"updated_at\":\"2020-07-17 16:23:17\"}}', '2020-07-17 14:23:17', '2020-07-17 14:23:17'),
(47, 'default', 'updated', 5, 'App\\Project', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"name\":\"hazam sdsd;,:;:;:\",\"updated_at\":\"2020-07-17 16:24:45\"},\"old\":{\"name\":\"hazam sdsd\",\"updated_at\":\"2020-07-17 16:23:17\"}}', '2020-07-17 14:24:45', '2020-07-17 14:24:45'),
(48, 'default', 'created', 5, 'App\\Note', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"notable_id\":5,\"notable_type\":\"App\\\\Components\\\\User\\\\Models\\\\User\",\"heading\":\"dfgf\",\"description\":\"<p>vg<\\/p>\",\"created_by\":1,\"created_at\":\"2020-07-17 17:28:43\",\"updated_at\":\"2020-07-17 17:28:43\"}}', '2020-07-17 15:28:43', '2020-07-17 15:28:43'),
(49, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-18 11:14:11\",\"updated_at\":\"2020-07-18 11:14:11\"},\"old\":{\"last_login\":\"2020-07-17 10:33:37\",\"updated_at\":\"2020-07-17 10:33:37\"}}', '2020-07-18 09:14:11', '2020-07-18 09:14:11'),
(50, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"name\":\"max\",\"email\":\"max4solution@gmail.com\",\"password\":\"$2y$10$vDamCmDoyV\\/INyGOYsAOxef4riqBrOmmHy4Y9BInEua09NRfWeDA2\",\"active\":\"2020-07-18 00:00:00\",\"updated_at\":\"2020-07-18 11:16:23\"},\"old\":{\"name\":\"max wbi\",\"email\":\"hfg@gh.com\",\"password\":\"$2y$10$K9Hb133mfOUbkYjo9KscH.IquzlYQEC2sb\\/4MhlykqVe6N9JwS4Qi\",\"active\":\"2020-07-17 00:00:00\",\"updated_at\":\"2020-07-17 13:14:15\"}}', '2020-07-18 09:16:23', '2020-07-18 09:16:23'),
(51, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"msNEvhqHIvAlKxa9qNwKwj7NArc6WlVmtLBrmtctkqjE8HotkbuRwTaRzYij\"},\"old\":{\"remember_token\":\"SHK1kYrC7T9YQdIYclg105l0ezOhzGzkg7SEzKpM6Yr45wzb0NaejbRlIwyE\"}}', '2020-07-18 09:16:36', '2020-07-18 09:16:36'),
(52, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-18 11:16:44\",\"updated_at\":\"2020-07-18 11:16:44\"},\"old\":{\"last_login\":null,\"updated_at\":\"2020-07-18 11:16:23\"}}', '2020-07-18 09:16:44', '2020-07-18 09:16:44'),
(53, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"bmwSCeinyT9OtofDBLZ5dQ0Nk7eCMcO2ZjAn4KMkHa5eKKVoPE2klVfbPVJG\"},\"old\":{\"remember_token\":null}}', '2020-07-18 09:17:11', '2020-07-18 09:17:11'),
(54, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-18 11:17:15\",\"updated_at\":\"2020-07-18 11:17:15\"},\"old\":{\"last_login\":\"2020-07-18 11:14:11\",\"updated_at\":\"2020-07-18 11:14:11\"}}', '2020-07-18 09:17:15', '2020-07-18 09:17:15'),
(55, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"5acZoEcsou4xUgfFjE4b9gnoT3lBiQPaF2nVukQZNfwrhzygUuSiIy43ewxY\"},\"old\":{\"remember_token\":\"msNEvhqHIvAlKxa9qNwKwj7NArc6WlVmtLBrmtctkqjE8HotkbuRwTaRzYij\"}}', '2020-07-18 09:18:21', '2020-07-18 09:18:21'),
(56, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-18 11:18:27\",\"updated_at\":\"2020-07-18 11:18:27\"},\"old\":{\"last_login\":\"2020-07-18 11:16:44\",\"updated_at\":\"2020-07-18 11:16:44\"}}', '2020-07-18 09:18:27', '2020-07-18 09:18:27'),
(57, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"wXv5EmIkWQWbJ1dbyOkF7oClfc51QXHEFaCEeqnsazu6JtmXhxDHu10xoMVi\"},\"old\":{\"remember_token\":\"bmwSCeinyT9OtofDBLZ5dQ0Nk7eCMcO2ZjAn4KMkHa5eKKVoPE2klVfbPVJG\"}}', '2020-07-18 09:19:02', '2020-07-18 09:19:02'),
(58, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-18 11:19:07\",\"updated_at\":\"2020-07-18 11:19:07\"},\"old\":{\"last_login\":\"2020-07-18 11:17:15\",\"updated_at\":\"2020-07-18 11:17:15\"}}', '2020-07-18 09:19:07', '2020-07-18 09:19:07'),
(59, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"8PEqv7RkaKFukegZbYnqpFBkX3h28s93gOfNRagvj6wn2UeQaNypZBWlVJt6\"},\"old\":{\"remember_token\":\"5acZoEcsou4xUgfFjE4b9gnoT3lBiQPaF2nVukQZNfwrhzygUuSiIy43ewxY\"}}', '2020-07-18 09:19:52', '2020-07-18 09:19:52'),
(60, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-18 11:19:56\",\"updated_at\":\"2020-07-18 11:19:56\"},\"old\":{\"last_login\":\"2020-07-18 11:18:27\",\"updated_at\":\"2020-07-18 11:18:27\"}}', '2020-07-18 09:19:56', '2020-07-18 09:19:56'),
(61, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"firifuX0CEBn63Xop72sRPXv6PE7mt2xuldGkZhMZ25rBjJDEBu62jojKLO7\"},\"old\":{\"remember_token\":\"wXv5EmIkWQWbJ1dbyOkF7oClfc51QXHEFaCEeqnsazu6JtmXhxDHu10xoMVi\"}}', '2020-07-18 09:20:59', '2020-07-18 09:20:59'),
(62, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-18 11:21:01\",\"updated_at\":\"2020-07-18 11:21:01\"},\"old\":{\"last_login\":\"2020-07-18 11:19:56\",\"updated_at\":\"2020-07-18 11:19:56\"}}', '2020-07-18 09:21:01', '2020-07-18 09:21:01'),
(63, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"OvnMtxmpzbbdJJOipXLnuQbnvWRmOMeqUlNB8186lV6Cckl5W6ObSkr6nyn2\"},\"old\":{\"remember_token\":\"firifuX0CEBn63Xop72sRPXv6PE7mt2xuldGkZhMZ25rBjJDEBu62jojKLO7\"}}', '2020-07-18 13:38:35', '2020-07-18 13:38:35'),
(64, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-18 15:38:40\",\"updated_at\":\"2020-07-18 15:38:40\"},\"old\":{\"last_login\":\"2020-07-18 11:19:07\",\"updated_at\":\"2020-07-18 11:19:07\"}}', '2020-07-18 13:38:40', '2020-07-18 13:38:40'),
(65, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"OkPpGzvZmjqjWARcLtrcVllPIuNlaJVlI8EZpHU6w6QPXIWs8YDRoEMeu4bc\"},\"old\":{\"remember_token\":\"8PEqv7RkaKFukegZbYnqpFBkX3h28s93gOfNRagvj6wn2UeQaNypZBWlVJt6\"}}', '2020-07-18 13:39:42', '2020-07-18 13:39:42'),
(66, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-18 15:39:46\",\"updated_at\":\"2020-07-18 15:39:46\"},\"old\":{\"last_login\":\"2020-07-18 11:21:01\",\"updated_at\":\"2020-07-18 11:21:01\"}}', '2020-07-18 13:39:46', '2020-07-18 13:39:46'),
(67, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"VlBYXbtm9EJjYaTLIIA34ZK2L2XvOHMtOALhA6TJqpEnivNp9ov2oIsqKpj2\"},\"old\":{\"remember_token\":\"OvnMtxmpzbbdJJOipXLnuQbnvWRmOMeqUlNB8186lV6Cckl5W6ObSkr6nyn2\"}}', '2020-07-18 13:39:59', '2020-07-18 13:39:59'),
(68, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-18 15:40:03\",\"updated_at\":\"2020-07-18 15:40:03\"},\"old\":{\"last_login\":\"2020-07-18 15:38:40\",\"updated_at\":\"2020-07-18 15:38:40\"}}', '2020-07-18 13:40:03', '2020-07-18 13:40:03'),
(69, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"UauVDIiNvYANKa9NvaZ1tfQAiDW23RMQiJgEzvY5KQZGaGyZpRClO3IwmptZ\"},\"old\":{\"remember_token\":\"OkPpGzvZmjqjWARcLtrcVllPIuNlaJVlI8EZpHU6w6QPXIWs8YDRoEMeu4bc\"}}', '2020-07-18 13:41:26', '2020-07-18 13:41:26'),
(70, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-18 15:41:37\",\"updated_at\":\"2020-07-18 15:41:37\"},\"old\":{\"last_login\":\"2020-07-18 15:39:46\",\"updated_at\":\"2020-07-18 15:39:46\"}}', '2020-07-18 13:41:37', '2020-07-18 13:41:37'),
(71, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"RVADXqchC9J12dBPH0MVlzGjuyCQdQqzVTvw4VHwoP9hfZ41J5mjJyw70SSw\"},\"old\":{\"remember_token\":\"VlBYXbtm9EJjYaTLIIA34ZK2L2XvOHMtOALhA6TJqpEnivNp9ov2oIsqKpj2\"}}', '2020-07-18 13:42:25', '2020-07-18 13:42:25'),
(72, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-18 15:42:29\",\"updated_at\":\"2020-07-18 15:42:29\"},\"old\":{\"last_login\":\"2020-07-18 15:40:03\",\"updated_at\":\"2020-07-18 15:40:03\"}}', '2020-07-18 13:42:29', '2020-07-18 13:42:29'),
(73, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"mLsgjxn1NuXtiifsEDoaORzybqrwBjnjjPqEeVRzMUe1G1NYHFHUIPnNT5tL\"},\"old\":{\"remember_token\":\"UauVDIiNvYANKa9NvaZ1tfQAiDW23RMQiJgEzvY5KQZGaGyZpRClO3IwmptZ\"}}', '2020-07-18 13:44:21', '2020-07-18 13:44:21'),
(74, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-18 15:44:24\",\"updated_at\":\"2020-07-18 15:44:24\"},\"old\":{\"last_login\":\"2020-07-18 15:41:37\",\"updated_at\":\"2020-07-18 15:41:37\"}}', '2020-07-18 13:44:25', '2020-07-18 13:44:25'),
(75, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"OYyLmlUGmVqS24EHheKaluTtv4VJpHHr7JJmvo33KUQLZWyTLfpHZVnXK426\"},\"old\":{\"remember_token\":\"RVADXqchC9J12dBPH0MVlzGjuyCQdQqzVTvw4VHwoP9hfZ41J5mjJyw70SSw\"}}', '2020-07-18 13:44:52', '2020-07-18 13:44:52'),
(76, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-18 15:44:56\",\"updated_at\":\"2020-07-18 15:44:56\"},\"old\":{\"last_login\":\"2020-07-18 15:42:29\",\"updated_at\":\"2020-07-18 15:42:29\"}}', '2020-07-18 13:44:56', '2020-07-18 13:44:56'),
(77, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"uy1D9xVvAOZdb2HnWozfeZwg4wav7gSJROzhLsQMnBt0B3xFNuIc4477hf0L\"},\"old\":{\"remember_token\":\"mLsgjxn1NuXtiifsEDoaORzybqrwBjnjjPqEeVRzMUe1G1NYHFHUIPnNT5tL\"}}', '2020-07-18 13:46:12', '2020-07-18 13:46:12'),
(78, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-18 15:46:16\",\"updated_at\":\"2020-07-18 15:46:16\"},\"old\":{\"last_login\":\"2020-07-18 15:44:24\",\"updated_at\":\"2020-07-18 15:44:24\"}}', '2020-07-18 13:46:16', '2020-07-18 13:46:16'),
(79, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"NpVkjFW6MS74v2ovS02UISrP3vHGhZ2k6YMwWbB93wBkLEVb8TlWO0cCOmIe\"},\"old\":{\"remember_token\":\"OYyLmlUGmVqS24EHheKaluTtv4VJpHHr7JJmvo33KUQLZWyTLfpHZVnXK426\"}}', '2020-07-18 13:46:29', '2020-07-18 13:46:29'),
(80, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-18 15:46:32\",\"updated_at\":\"2020-07-18 15:46:32\"},\"old\":{\"last_login\":\"2020-07-18 15:44:56\",\"updated_at\":\"2020-07-18 15:44:56\"}}', '2020-07-18 13:46:32', '2020-07-18 13:46:32'),
(81, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"n2ErXTVMSf2qBy2w4C7J4ZwnoiPUFtJ0FuS7kKwpXVvMD0E5q6H7NvK6JtCJ\"},\"old\":{\"remember_token\":\"uy1D9xVvAOZdb2HnWozfeZwg4wav7gSJROzhLsQMnBt0B3xFNuIc4477hf0L\"}}', '2020-07-18 13:49:28', '2020-07-18 13:49:28'),
(82, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-18 15:49:31\",\"updated_at\":\"2020-07-18 15:49:31\"},\"old\":{\"last_login\":null,\"updated_at\":\"2019-07-30 07:45:43\"}}', '2020-07-18 13:49:31', '2020-07-18 13:49:31'),
(83, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"yFShijNaAJCe6NUhT9uQMdlGt86EndGD8BMwgePgLcIFIRR3lhNgnAjbtNtF\"},\"old\":{\"remember_token\":null}}', '2020-07-18 13:49:42', '2020-07-18 13:49:42'),
(84, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-18 15:50:38\",\"updated_at\":\"2020-07-18 15:50:38\"},\"old\":{\"last_login\":\"2020-07-14 19:07:52\",\"updated_at\":\"2020-07-14 19:07:52\"}}', '2020-07-18 13:50:38', '2020-07-18 13:50:38'),
(85, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', 2, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"kbmOuWFOpMU7ZjehYeZSn952P9JMzqYCqBNnHczkXtOxUYjvd9QvnoeiEOjB\"},\"old\":{\"remember_token\":\"DbF58Mlv7RK7bGKVzllU8xlQb1YtS27ogB7F0Z7ZBpd8KyJJpb4uV95C53n9\"}}', '2020-07-18 13:50:50', '2020-07-18 13:50:50'),
(86, 'default', 'updated', 6, 'App\\Components\\User\\Models\\User', 6, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-18 15:51:29\",\"updated_at\":\"2020-07-18 15:51:29\"},\"old\":{\"last_login\":\"2020-07-18 15:46:32\",\"updated_at\":\"2020-07-18 15:46:32\"}}', '2020-07-18 13:51:29', '2020-07-18 13:51:29'),
(87, 'default', 'updated', 6, 'App\\Components\\User\\Models\\User', 6, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"WNhNn3RpkcitfBIU8uS7HeaaAqGLQiSsDxKusLjsIgI1LWOOeNfhIML6whiY\"},\"old\":{\"remember_token\":\"uy1D9xVvAOZdb2HnWozfeZwg4wav7gSJROzhLsQMnBt0B3xFNuIc4477hf0L\"}}', '2020-07-18 13:52:07', '2020-07-18 13:52:07'),
(88, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-18 15:52:11\",\"updated_at\":\"2020-07-18 15:52:11\"},\"old\":{\"last_login\":\"2020-07-18 15:46:32\",\"updated_at\":\"2020-07-18 15:46:32\"}}', '2020-07-18 13:52:11', '2020-07-18 13:52:11'),
(89, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-26 17:30:26\",\"updated_at\":\"2020-07-26 17:30:26\"},\"old\":{\"last_login\":\"2020-07-18 15:52:11\",\"updated_at\":\"2020-07-18 15:52:11\"}}', '2020-07-26 15:30:27', '2020-07-26 15:30:27'),
(90, 'default', 'created', 1, 'App\\ProjectMilestone', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"project_id\":1,\"name\":\"cffff\",\"due_date\":\"2020-07-15 12:00:00\",\"description\":\"<p>fgfg<\\/p>\",\"created_by\":1,\"created_at\":\"2020-07-26 20:22:50\",\"updated_at\":\"2020-07-26 20:22:50\"}}', '2020-07-26 18:22:50', '2020-07-26 18:22:50'),
(91, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-29 15:39:44\",\"updated_at\":\"2020-07-29 15:39:44\"},\"old\":{\"last_login\":\"2020-07-26 17:30:26\",\"updated_at\":\"2020-07-26 17:30:26\"}}', '2020-07-29 13:39:44', '2020-07-29 13:39:44'),
(92, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"IRa0rTrSMhcQPqUXSDUTk4kWUW7Axssqk29nZeKu6M08zwJkI7IAccJY7JVM\"},\"old\":{\"remember_token\":\"n2ErXTVMSf2qBy2w4C7J4ZwnoiPUFtJ0FuS7kKwpXVvMD0E5q6H7NvK6JtCJ\"}}', '2020-07-29 13:39:52', '2020-07-29 13:39:52'),
(93, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-29 15:43:56\",\"updated_at\":\"2020-07-29 15:43:56\"},\"old\":{\"last_login\":\"2020-07-29 15:39:44\",\"updated_at\":\"2020-07-29 15:39:44\"}}', '2020-07-29 13:43:56', '2020-07-29 13:43:56'),
(94, 'default', 'updated', 2, 'App\\ProjectTask', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"category_id\":26,\"updated_at\":\"2020-07-29 15:55:59\"},\"old\":{\"category_id\":null,\"updated_at\":\"2019-04-18 12:36:07\"}}', '2020-07-29 13:55:59', '2020-07-29 13:55:59'),
(95, 'default', 'created', 6, 'App\\Note', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"notable_id\":1,\"notable_type\":\"App\\\\Project\",\"heading\":\"file1\",\"description\":\"<p>dfgdfg<\\/p>\",\"created_by\":1,\"created_at\":\"2020-07-29 15:58:23\",\"updated_at\":\"2020-07-29 15:58:23\"}}', '2020-07-29 13:58:23', '2020-07-29 13:58:23'),
(96, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"sticky_notes\":\"This is stick note area. Anything you write here is auto-saved\\n\\nsdfsfd\\n\\nsdfsdfsdf\\n\\nsdfsdfsdf\\n\\nsdf\\nsdf\",\"updated_at\":\"2020-07-29 16:11:09\"},\"old\":{\"sticky_notes\":\"This is stick note area. Anything you write here is auto-saved\",\"updated_at\":\"2020-07-29 15:43:56\"}}', '2020-07-29 14:11:09', '2020-07-29 14:11:09'),
(97, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"sticky_notes\":\"dfgdfg\\n\\nqsdqs\",\"updated_at\":\"2020-07-29 16:11:44\"},\"old\":{\"sticky_notes\":\"This is stick note area. Anything you write here is auto-saved\\n\\nsdfsfd\\n\\nsdfsdfsdf\\n\\nsdfsdfsdf\\n\\nsdf\\nsdf\",\"updated_at\":\"2020-07-29 16:11:09\"}}', '2020-07-29 14:11:44', '2020-07-29 14:11:44'),
(98, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"sbxG4qgDa4b6MMXp60TA1MCn5r3csjVQhV7wZhqQWYu42qL56rlnlMonQihw\"},\"old\":{\"remember_token\":\"IRa0rTrSMhcQPqUXSDUTk4kWUW7Axssqk29nZeKu6M08zwJkI7IAccJY7JVM\"}}', '2020-07-29 14:12:59', '2020-07-29 14:12:59'),
(99, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-29 16:13:04\",\"updated_at\":\"2020-07-29 16:13:04\"},\"old\":{\"last_login\":\"2020-07-18 15:49:31\",\"updated_at\":\"2020-07-18 15:49:31\"}}', '2020-07-29 14:13:04', '2020-07-29 14:13:04'),
(100, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"ppMQWt2nhbxvpPGltiwhefgjcCzpazzHbaGn0Jp53DiFn5RLDZNvsDT2y1En\"},\"old\":{\"remember_token\":\"yFShijNaAJCe6NUhT9uQMdlGt86EndGD8BMwgePgLcIFIRR3lhNgnAjbtNtF\"}}', '2020-07-29 14:15:06', '2020-07-29 14:15:06'),
(101, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-29 16:15:08\",\"updated_at\":\"2020-07-29 16:15:08\"},\"old\":{\"last_login\":\"2020-07-29 15:43:56\",\"updated_at\":\"2020-07-29 16:11:44\"}}', '2020-07-29 14:15:08', '2020-07-29 14:15:08'),
(102, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"1ATYN4cEdWkVrGe0kn3cfUdeO82wsv9PiVVfSC8jDjF46GHXXjtKhe1oFnLN\"},\"old\":{\"remember_token\":\"sbxG4qgDa4b6MMXp60TA1MCn5r3csjVQhV7wZhqQWYu42qL56rlnlMonQihw\"}}', '2020-07-29 14:15:45', '2020-07-29 14:15:45'),
(103, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-29 16:15:51\",\"updated_at\":\"2020-07-29 16:15:51\"},\"old\":{\"last_login\":\"2020-07-18 15:46:16\",\"updated_at\":\"2020-07-18 15:46:16\"}}', '2020-07-29 14:15:51', '2020-07-29 14:15:51'),
(104, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"KwAoP1FTbzjAIreCUnlvrVSgzNIPLQoWlrgd7AZ8uIin7Et3WYaTw6tylyDA\"},\"old\":{\"remember_token\":\"NpVkjFW6MS74v2ovS02UISrP3vHGhZ2k6YMwWbB93wBkLEVb8TlWO0cCOmIe\"}}', '2020-07-29 14:16:20', '2020-07-29 14:16:20'),
(105, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-29 16:16:25\",\"updated_at\":\"2020-07-29 16:16:25\"},\"old\":{\"last_login\":\"2020-07-29 16:15:08\",\"updated_at\":\"2020-07-29 16:15:08\"}}', '2020-07-29 14:16:25', '2020-07-29 14:16:25'),
(106, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"a5ANyAbk82uaWv81bWk0QvqSMsEE6cmNcvnDq4kukk6zu4XitvNRbj54GhSP\"},\"old\":{\"remember_token\":\"1ATYN4cEdWkVrGe0kn3cfUdeO82wsv9PiVVfSC8jDjF46GHXXjtKhe1oFnLN\"}}', '2020-07-29 14:17:07', '2020-07-29 14:17:07'),
(107, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-29 16:17:14\",\"updated_at\":\"2020-07-29 16:17:14\"},\"old\":{\"last_login\":\"2020-07-29 16:16:25\",\"updated_at\":\"2020-07-29 16:16:25\"}}', '2020-07-29 14:17:14', '2020-07-29 14:17:14'),
(108, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"active\":\"2020-07-29 00:00:00\",\"updated_at\":\"2020-07-29 16:17:53\"},\"old\":{\"active\":\"2019-07-30 00:00:00\",\"updated_at\":\"2020-07-29 16:13:04\"}}', '2020-07-29 14:17:53', '2020-07-29 14:17:53'),
(109, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"o403BfrSp0neAy23mm4xQAZsihgSTYOYt3g3Yt8WJPQPWm3j9beJOfME46zW\"},\"old\":{\"remember_token\":\"a5ANyAbk82uaWv81bWk0QvqSMsEE6cmNcvnDq4kukk6zu4XitvNRbj54GhSP\"}}', '2020-07-29 14:18:13', '2020-07-29 14:18:13'),
(110, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-29 16:18:19\",\"updated_at\":\"2020-07-29 16:18:19\"},\"old\":{\"last_login\":\"2020-07-29 16:13:04\",\"updated_at\":\"2020-07-29 16:17:53\"}}', '2020-07-29 14:18:19', '2020-07-29 14:18:19'),
(111, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"OuXZyw4gOdIEvJ6dS0Oo8Y96M4rLBqlGE7yXYb18WPSKyiNWY8Lhcm97LdOp\"},\"old\":{\"remember_token\":\"ppMQWt2nhbxvpPGltiwhefgjcCzpazzHbaGn0Jp53DiFn5RLDZNvsDT2y1En\"}}', '2020-07-29 14:18:33', '2020-07-29 14:18:33'),
(112, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-29 16:18:35\",\"updated_at\":\"2020-07-29 16:18:35\"},\"old\":{\"last_login\":\"2020-07-29 16:17:14\",\"updated_at\":\"2020-07-29 16:17:14\"}}', '2020-07-29 14:18:35', '2020-07-29 14:18:35'),
(113, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"Rl7CBnfi7Ae5aJytYPU95fbGoBfYoT3GnkmyrouEFy5335dFGO9k0FKAptIQ\"},\"old\":{\"remember_token\":\"o403BfrSp0neAy23mm4xQAZsihgSTYOYt3g3Yt8WJPQPWm3j9beJOfME46zW\"}}', '2020-07-29 14:19:22', '2020-07-29 14:19:22'),
(114, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-29 16:19:26\",\"updated_at\":\"2020-07-29 16:19:26\"},\"old\":{\"last_login\":\"2020-07-29 16:18:19\",\"updated_at\":\"2020-07-29 16:18:19\"}}', '2020-07-29 14:19:26', '2020-07-29 14:19:26'),
(115, 'default', 'created', 7, 'App\\Note', 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"notable_id\":2,\"notable_type\":\"App\\\\Project\",\"heading\":\"jj\",\"description\":\"<p>kj<\\/p>\",\"created_by\":4,\"created_at\":\"2020-07-29 16:21:26\",\"updated_at\":\"2020-07-29 16:21:26\"}}', '2020-07-29 14:21:26', '2020-07-29 14:21:26'),
(116, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"8Bj0gr8nuD9ntlMroPOjJXcdmHFnZKRtb4tJRfbYgPfPIbETp9CLA5qNeQuR\"},\"old\":{\"remember_token\":\"OuXZyw4gOdIEvJ6dS0Oo8Y96M4rLBqlGE7yXYb18WPSKyiNWY8Lhcm97LdOp\"}}', '2020-07-29 14:23:50', '2020-07-29 14:23:50'),
(117, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-29 16:23:52\",\"updated_at\":\"2020-07-29 16:23:52\"},\"old\":{\"last_login\":\"2020-07-29 16:18:35\",\"updated_at\":\"2020-07-29 16:18:35\"}}', '2020-07-29 14:23:52', '2020-07-29 14:23:52');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(118, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"phqVyfSTD5E3lsbq7w1Nil6v9SUkKzGt0YTeSYCli5VzHDEa34CJiP1m4ocX\"},\"old\":{\"remember_token\":\"Rl7CBnfi7Ae5aJytYPU95fbGoBfYoT3GnkmyrouEFy5335dFGO9k0FKAptIQ\"}}', '2020-07-29 14:26:21', '2020-07-29 14:26:21'),
(119, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-29 16:26:25\",\"updated_at\":\"2020-07-29 16:26:25\"},\"old\":{\"last_login\":\"2020-07-29 16:19:26\",\"updated_at\":\"2020-07-29 16:19:26\"}}', '2020-07-29 14:26:25', '2020-07-29 14:26:25'),
(120, 'default', 'updated', 4, 'App\\Components\\User\\Models\\User', 4, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"clAEfyXiEiTRcp4zKyCerY62FxkxVBEgn4jCrhSrYiQAocMqcFm2VCTMDUCT\"},\"old\":{\"remember_token\":\"8Bj0gr8nuD9ntlMroPOjJXcdmHFnZKRtb4tJRfbYgPfPIbETp9CLA5qNeQuR\"}}', '2020-07-29 14:28:53', '2020-07-29 14:28:53'),
(121, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-07-29 16:29:15\",\"updated_at\":\"2020-07-29 16:29:15\"},\"old\":{\"last_login\":\"2020-07-29 16:15:51\",\"updated_at\":\"2020-07-29 16:15:51\"}}', '2020-07-29 14:29:15', '2020-07-29 14:29:15'),
(122, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-08-08 09:36:35\",\"updated_at\":\"2020-08-08 09:36:35\"},\"old\":{\"last_login\":\"2020-07-29 16:23:52\",\"updated_at\":\"2020-07-29 16:23:52\"}}', '2020-08-08 07:36:35', '2020-08-08 07:36:35'),
(123, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-08-13 16:27:32\",\"updated_at\":\"2020-08-13 16:27:32\"},\"old\":{\"last_login\":\"2020-08-08 09:36:35\",\"updated_at\":\"2020-08-08 09:36:35\"}}', '2020-08-13 14:27:32', '2020-08-13 14:27:32'),
(124, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-08-13 16:27:39\",\"updated_at\":\"2020-08-13 16:27:39\"},\"old\":{\"last_login\":\"2020-08-13 16:27:32\",\"updated_at\":\"2020-08-13 16:27:32\"}}', '2020-08-13 14:27:39', '2020-08-13 14:27:39'),
(125, 'default', 'created', 4, 'App\\ProjectTask', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"project_id\":5,\"task_id\":null,\"category_id\":28,\"subject\":\"dfg\",\"hourly_rate\":\"0.00\",\"start_date\":\"2020-08-13 12:00:00\",\"due_date\":\"2020-08-21 12:00:00\",\"priority\":\"low\",\"description\":\"<p>dfgdgf<\\/p>\",\"created_by\":1,\"show_to_customer\":1,\"is_completed\":0,\"created_at\":\"2020-08-13 16:46:11\",\"updated_at\":\"2020-08-13 16:46:11\"}}', '2020-08-13 14:46:11', '2020-08-13 14:46:11'),
(126, 'default', 'updated', 1, 'App\\ProjectTask', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"is_completed\":1,\"updated_at\":\"2020-08-13 16:55:28\"},\"old\":{\"is_completed\":0,\"updated_at\":\"2019-04-18 12:32:05\"}}', '2020-08-13 14:55:28', '2020-08-13 14:55:28'),
(127, 'default', 'updated', 1, 'App\\ProjectTask', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"is_completed\":0,\"updated_at\":\"2020-08-13 16:55:30\"},\"old\":{\"is_completed\":1,\"updated_at\":\"2020-08-13 16:55:28\"}}', '2020-08-13 14:55:30', '2020-08-13 14:55:30'),
(128, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"Zj1MC4SjNiF1p8TLQl9LTjmw1FtqG1o0Qq2RxWmJqiS4ChfuoC8xgECwhqGs\"},\"old\":{\"remember_token\":\"phqVyfSTD5E3lsbq7w1Nil6v9SUkKzGt0YTeSYCli5VzHDEa34CJiP1m4ocX\"}}', '2020-08-13 15:01:06', '2020-08-13 15:01:06'),
(129, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-08-13 17:01:08\",\"updated_at\":\"2020-08-13 17:01:08\"},\"old\":{\"last_login\":\"2020-08-13 16:27:39\",\"updated_at\":\"2020-08-13 16:27:39\"}}', '2020-08-13 15:01:08', '2020-08-13 15:01:08'),
(130, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-08-19 09:22:18\",\"updated_at\":\"2020-08-19 09:22:18\"},\"old\":{\"last_login\":\"2020-08-13 08:01:08\",\"updated_at\":\"2020-08-13 08:01:08\"}}', '2020-08-19 16:22:19', '2020-08-19 16:22:19'),
(131, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-08-19 09:23:57\",\"updated_at\":\"2020-08-19 09:23:57\"},\"old\":{\"last_login\":\"2020-08-19 09:22:18\",\"updated_at\":\"2020-08-19 09:22:18\"}}', '2020-08-19 16:23:57', '2020-08-19 16:23:57'),
(132, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-08-19 10:00:32\",\"updated_at\":\"2020-08-19 10:00:32\"},\"old\":{\"last_login\":\"2020-08-19 09:23:57\",\"updated_at\":\"2020-08-19 09:23:57\"}}', '2020-08-19 17:00:32', '2020-08-19 17:00:32'),
(133, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-08-20 06:23:26\",\"updated_at\":\"2020-08-20 06:23:26\"},\"old\":{\"last_login\":\"2020-08-19 10:00:32\",\"updated_at\":\"2020-08-19 10:00:32\"}}', '2020-08-20 13:23:27', '2020-08-20 13:23:27'),
(134, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-08-20 06:27:14\",\"updated_at\":\"2020-08-20 06:27:14\"},\"old\":{\"last_login\":\"2020-08-20 06:23:26\",\"updated_at\":\"2020-08-20 06:23:26\"}}', '2020-08-20 13:27:14', '2020-08-20 13:27:14'),
(135, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-08-20 06:37:51\",\"updated_at\":\"2020-08-20 06:37:51\"},\"old\":{\"last_login\":\"2020-08-20 06:27:14\",\"updated_at\":\"2020-08-20 06:27:14\"}}', '2020-08-20 13:37:51', '2020-08-20 13:37:51'),
(136, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-08-20 06:49:16\",\"updated_at\":\"2020-08-20 06:49:16\"},\"old\":{\"last_login\":\"2020-08-20 06:37:51\",\"updated_at\":\"2020-08-20 06:37:51\"}}', '2020-08-20 13:49:16', '2020-08-20 13:49:16'),
(137, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-08-20 11:25:18\",\"updated_at\":\"2020-08-20 11:25:18\"},\"old\":{\"last_login\":\"2020-08-20 06:49:16\",\"updated_at\":\"2020-08-20 06:49:16\"}}', '2020-08-20 18:25:19', '2020-08-20 18:25:19'),
(138, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"A1FAQmcSK04qM4RkZeTFtVSfzu7efEPLmV81QuEkDbdM7tt64L2liK11W7RZ\"},\"old\":{\"remember_token\":\"Zj1MC4SjNiF1p8TLQl9LTjmw1FtqG1o0Qq2RxWmJqiS4ChfuoC8xgECwhqGs\"}}', '2020-08-20 19:26:20', '2020-08-20 19:26:20'),
(139, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-08-20 12:26:33\",\"updated_at\":\"2020-08-20 12:26:33\"},\"old\":{\"last_login\":\"2020-08-20 11:25:18\",\"updated_at\":\"2020-08-20 11:25:18\"}}', '2020-08-20 19:26:33', '2020-08-20 19:26:33'),
(140, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-08-20 12:28:59\",\"updated_at\":\"2020-08-20 12:28:59\"},\"old\":{\"last_login\":\"2020-08-20 12:26:33\",\"updated_at\":\"2020-08-20 12:26:33\"}}', '2020-08-20 19:28:59', '2020-08-20 19:28:59'),
(141, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-08-22 17:10:36\",\"updated_at\":\"2020-08-22 17:10:36\"},\"old\":{\"last_login\":\"2020-08-20 12:28:59\",\"updated_at\":\"2020-08-20 12:28:59\"}}', '2020-08-23 00:10:37', '2020-08-23 00:10:37'),
(142, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-08-23 11:54:55\",\"updated_at\":\"2020-08-23 11:54:55\"},\"old\":{\"last_login\":\"2020-08-22 17:10:36\",\"updated_at\":\"2020-08-22 17:10:36\"}}', '2020-08-23 18:54:56', '2020-08-23 18:54:56'),
(143, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-08-23 17:05:03\",\"updated_at\":\"2020-08-23 17:05:03\"},\"old\":{\"last_login\":\"2020-08-23 11:54:55\",\"updated_at\":\"2020-08-23 11:54:55\"}}', '2020-08-24 00:05:03', '2020-08-24 00:05:03'),
(144, 'default', 'deleted', 4, 'App\\ProjectTask', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"project_id\":5,\"task_id\":\"#4\",\"category_id\":28,\"subject\":\"dfg\",\"hourly_rate\":\"0.00\",\"start_date\":\"2020-08-13 12:00:00\",\"due_date\":\"2020-08-21 12:00:00\",\"priority\":\"low\",\"description\":\"<p>dfgdgf<\\/p>\",\"created_by\":1,\"show_to_customer\":1,\"is_completed\":0,\"created_at\":\"2020-08-13 07:46:11\",\"updated_at\":\"2020-08-13 07:46:11\"}}', '2020-08-25 18:24:35', '2020-08-25 18:24:35'),
(145, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"B5sEUEcsh7LegOZR9pD15im0Kp21KCsLCUoHnYqNkaJWcFw7t4hm1ZhkAa3G\"},\"old\":{\"remember_token\":\"A1FAQmcSK04qM4RkZeTFtVSfzu7efEPLmV81QuEkDbdM7tt64L2liK11W7RZ\"}}', '2020-08-25 18:30:47', '2020-08-25 18:30:47'),
(146, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-08-25 11:30:59\",\"updated_at\":\"2020-08-25 11:30:59\"},\"old\":{\"last_login\":\"2020-07-29 07:29:15\",\"updated_at\":\"2020-07-29 07:29:15\"}}', '2020-08-25 18:30:59', '2020-08-25 18:30:59'),
(147, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"VSaGbUxoLdso1b6YQjcW2GARAFOyhqYyMCbWQFLEEOoPl2Sbc38sjbRbhyoD\"},\"old\":{\"remember_token\":\"KwAoP1FTbzjAIreCUnlvrVSgzNIPLQoWlrgd7AZ8uIin7Et3WYaTw6tylyDA\"}}', '2020-08-25 18:31:29', '2020-08-25 18:31:29'),
(148, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-08-25 11:31:56\",\"updated_at\":\"2020-08-25 11:31:56\"},\"old\":{\"last_login\":\"2020-08-23 17:05:03\",\"updated_at\":\"2020-08-23 17:05:03\"}}', '2020-08-25 18:31:56', '2020-08-25 18:31:56'),
(149, 'default', 'updated', 2, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"gender\":\"male\",\"updated_at\":\"2020-08-25 14:42:00\"},\"old\":{\"gender\":null,\"updated_at\":\"2020-07-18 06:50:38\"}}', '2020-08-25 21:42:00', '2020-08-25 21:42:00'),
(150, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-08-26 05:45:18\",\"updated_at\":\"2020-08-26 05:45:18\"},\"old\":{\"last_login\":\"2020-08-25 11:31:56\",\"updated_at\":\"2020-08-25 11:31:56\"}}', '2020-08-26 12:45:19', '2020-08-26 12:45:19'),
(151, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"6hrw5nZiMF8yqqMR37NPk499lc2dpwMGjF4bQsTrcasGMIof9gzuwlBP1wzV\"},\"old\":{\"remember_token\":\"B5sEUEcsh7LegOZR9pD15im0Kp21KCsLCUoHnYqNkaJWcFw7t4hm1ZhkAa3G\"}}', '2020-08-26 20:52:28', '2020-08-26 20:52:28'),
(152, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-08-26 13:54:44\",\"updated_at\":\"2020-08-26 13:54:44\"},\"old\":{\"last_login\":\"2020-08-26 05:45:18\",\"updated_at\":\"2020-08-26 05:45:18\"}}', '2020-08-26 20:54:44', '2020-08-26 20:54:44'),
(153, 'default', 'created', 6, 'App\\Project', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"name\":\"Test\",\"customer_id\":1,\"billing_type\":\"fixed_rate\",\"total_rate\":\"0.00\",\"price_per_hours\":\"0.00\",\"estimated_hours\":\"0.00\",\"estimated_cost\":\"0.00\",\"status\":\"not_started\",\"lead_id\":4,\"start_date\":\"2020-08-20 00:00:00\",\"end_date\":\"2020-08-24 00:00:00\",\"description\":null,\"created_by\":1,\"favorite\":0,\"created_at\":\"2020-08-27 18:25:14\",\"updated_at\":\"2020-08-27 18:25:14\"}}', '2020-08-28 01:25:15', '2020-08-28 01:25:15'),
(154, 'default', 'created', 7, 'App\\Project', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"name\":\"hhkjh\",\"customer_id\":1,\"billing_type\":\"fixed_rate\",\"total_rate\":\"0.00\",\"price_per_hours\":\"0.00\",\"estimated_hours\":\"0.00\",\"estimated_cost\":\"0.00\",\"status\":\"not_started\",\"lead_id\":5,\"start_date\":\"2020-08-26 00:00:00\",\"end_date\":\"2020-08-16 00:00:00\",\"description\":null,\"created_by\":1,\"favorite\":0,\"created_at\":\"2020-08-27 18:26:36\",\"updated_at\":\"2020-08-27 18:26:36\"}}', '2020-08-28 01:26:36', '2020-08-28 01:26:36'),
(155, 'default', 'created', 8, 'App\\Project', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"name\":\"hkjhk\",\"customer_id\":1,\"billing_type\":\"fixed_rate\",\"total_rate\":\"0.00\",\"price_per_hours\":\"0.00\",\"estimated_hours\":\"0.00\",\"estimated_cost\":\"0.00\",\"status\":\"not_started\",\"lead_id\":4,\"start_date\":\"2020-08-13 00:00:00\",\"end_date\":\"2020-08-27 00:00:00\",\"description\":null,\"created_by\":1,\"favorite\":0,\"created_at\":\"2020-08-27 18:28:25\",\"updated_at\":\"2020-08-27 18:28:25\"}}', '2020-08-28 01:28:25', '2020-08-28 01:28:25'),
(156, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"VFBQwqnwtTUorKxAnenzUnBTAWWaf040tBP13zZ0epUlLOnQH3LrxEYpxmJF\"},\"old\":{\"remember_token\":\"6hrw5nZiMF8yqqMR37NPk499lc2dpwMGjF4bQsTrcasGMIof9gzuwlBP1wzV\"}}', '2020-08-31 19:42:20', '2020-08-31 19:42:20'),
(157, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-01 05:54:00\",\"updated_at\":\"2020-09-01 05:54:00\"},\"old\":{\"last_login\":\"2020-08-26 13:54:44\",\"updated_at\":\"2020-08-26 13:54:44\"}}', '2020-09-01 12:54:01', '2020-09-01 12:54:01'),
(158, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"n6MLsZXlzZ7gxIYW2PL50ltTUo1L2BWAszx8qXsES9rHFwRWtIBGYOYWwv9V\"},\"old\":{\"remember_token\":\"VFBQwqnwtTUorKxAnenzUnBTAWWaf040tBP13zZ0epUlLOnQH3LrxEYpxmJF\"}}', '2020-09-01 20:07:59', '2020-09-01 20:07:59'),
(159, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-01 13:08:12\",\"updated_at\":\"2020-09-01 13:08:12\"},\"old\":{\"last_login\":\"2020-09-01 05:54:00\",\"updated_at\":\"2020-09-01 05:54:00\"}}', '2020-09-01 20:08:12', '2020-09-01 20:08:12'),
(160, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"LtLDjidAPdF6v0zVi17uA86PJROgUJwzcDh1FhBo2IZSBHt2JymVfnCaL8Mg\"},\"old\":{\"remember_token\":\"n6MLsZXlzZ7gxIYW2PL50ltTUo1L2BWAszx8qXsES9rHFwRWtIBGYOYWwv9V\"}}', '2020-09-01 20:32:56', '2020-09-01 20:32:56'),
(161, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-01 13:33:12\",\"updated_at\":\"2020-09-01 13:33:12\"},\"old\":{\"last_login\":\"2020-09-01 13:08:12\",\"updated_at\":\"2020-09-01 13:08:12\"}}', '2020-09-01 20:33:12', '2020-09-01 20:33:12'),
(162, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"N7kTjHHZRku1jiMjaRDUIhH4P57sAWkfEZo4QUaT2cXrgZhAahzAGd7AgUOO\"},\"old\":{\"remember_token\":\"LtLDjidAPdF6v0zVi17uA86PJROgUJwzcDh1FhBo2IZSBHt2JymVfnCaL8Mg\"}}', '2020-09-03 01:54:47', '2020-09-03 01:54:47'),
(163, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-03 12:08:36\",\"updated_at\":\"2020-09-03 12:08:36\"},\"old\":{\"last_login\":\"2020-09-01 13:33:12\",\"updated_at\":\"2020-09-01 13:33:12\"}}', '2020-09-03 19:08:37', '2020-09-03 19:08:37'),
(164, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"12u6ELkdPlIrF8IuG1QZJqXLpf84yY4t7uYq7bLtnNsF7XvcSeny1hViThK7\"},\"old\":{\"remember_token\":\"N7kTjHHZRku1jiMjaRDUIhH4P57sAWkfEZo4QUaT2cXrgZhAahzAGd7AgUOO\"}}', '2020-09-04 13:30:12', '2020-09-04 13:30:12'),
(165, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-04 06:46:29\",\"updated_at\":\"2020-09-04 06:46:29\"},\"old\":{\"last_login\":\"2020-09-03 12:08:36\",\"updated_at\":\"2020-09-03 12:08:36\"}}', '2020-09-04 13:46:29', '2020-09-04 13:46:29'),
(166, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"U8EDERCzlymAVa4pFEYCwtsFiKLjJwv7iDdhfWKRVEsUL5JcVrQ2UyN44mOe\"},\"old\":{\"remember_token\":\"12u6ELkdPlIrF8IuG1QZJqXLpf84yY4t7uYq7bLtnNsF7XvcSeny1hViThK7\"}}', '2020-09-04 13:52:45', '2020-09-04 13:52:45'),
(167, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-04 06:53:57\",\"updated_at\":\"2020-09-04 06:53:57\"},\"old\":{\"last_login\":\"2020-09-04 06:46:29\",\"updated_at\":\"2020-09-04 06:46:29\"}}', '2020-09-04 13:53:57', '2020-09-04 13:53:57'),
(168, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-04 11:11:43\",\"updated_at\":\"2020-09-04 11:11:43\"},\"old\":{\"last_login\":\"2020-09-04 06:53:57\",\"updated_at\":\"2020-09-04 06:53:57\"}}', '2020-09-04 18:11:44', '2020-09-04 18:11:44'),
(169, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"yJhSPyuDTakw6TYA58CpTx82s7nRHC1gIkXkSzHNJI7zNiL5fUIo5DAZRNNv\"},\"old\":{\"remember_token\":\"U8EDERCzlymAVa4pFEYCwtsFiKLjJwv7iDdhfWKRVEsUL5JcVrQ2UyN44mOe\"}}', '2020-09-04 18:16:32', '2020-09-04 18:16:32'),
(170, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-04 11:48:29\",\"updated_at\":\"2020-09-04 11:48:29\"},\"old\":{\"last_login\":\"2020-09-04 11:11:43\",\"updated_at\":\"2020-09-04 11:11:43\"}}', '2020-09-04 18:48:29', '2020-09-04 18:48:29'),
(171, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"g6opGVSdhKAVzGq4PYHGuJLyfJl8rni5sBMdWyRgvwmcPoALiU1MXpf7MXbI\"},\"old\":{\"remember_token\":\"yJhSPyuDTakw6TYA58CpTx82s7nRHC1gIkXkSzHNJI7zNiL5fUIo5DAZRNNv\"}}', '2020-09-04 19:14:21', '2020-09-04 19:14:21'),
(172, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-04 12:28:24\",\"updated_at\":\"2020-09-04 12:28:24\"},\"old\":{\"last_login\":\"2020-09-04 11:48:29\",\"updated_at\":\"2020-09-04 11:48:29\"}}', '2020-09-04 19:28:24', '2020-09-04 19:28:24'),
(173, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-10 09:29:13\",\"updated_at\":\"2020-09-10 09:29:13\"},\"old\":{\"last_login\":\"2020-09-04 12:28:24\",\"updated_at\":\"2020-09-04 12:28:24\"}}', '2020-09-10 16:29:14', '2020-09-10 16:29:14'),
(174, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-12 10:40:02\",\"updated_at\":\"2020-09-12 10:40:02\"},\"old\":{\"last_login\":\"2020-09-10 09:29:13\",\"updated_at\":\"2020-09-10 09:29:13\"}}', '2020-09-12 17:40:02', '2020-09-12 17:40:02'),
(175, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"2Sb4FxwDAS45CXSq1Jl6RINZ1sLKCXt23Kd5DtATVPk3w0CECvsqYBbHpSrW\"},\"old\":{\"remember_token\":\"g6opGVSdhKAVzGq4PYHGuJLyfJl8rni5sBMdWyRgvwmcPoALiU1MXpf7MXbI\"}}', '2020-09-12 17:40:58', '2020-09-12 17:40:58'),
(176, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-12 10:41:08\",\"updated_at\":\"2020-09-12 10:41:08\"},\"old\":{\"last_login\":\"2020-08-25 11:30:59\",\"updated_at\":\"2020-08-25 11:30:59\"}}', '2020-09-12 17:41:08', '2020-09-12 17:41:08'),
(177, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"GfPA8rcSIMHEG41cNHI2jOCDvfQT2SWKCIIm4ehG3ekYMkPJRHyTTrbhfdMy\"},\"old\":{\"remember_token\":\"VSaGbUxoLdso1b6YQjcW2GARAFOyhqYyMCbWQFLEEOoPl2Sbc38sjbRbhyoD\"}}', '2020-09-12 17:41:29', '2020-09-12 17:41:29'),
(178, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-12 10:41:41\",\"updated_at\":\"2020-09-12 10:41:41\"},\"old\":{\"last_login\":\"2020-09-12 10:40:02\",\"updated_at\":\"2020-09-12 10:40:02\"}}', '2020-09-12 17:41:41', '2020-09-12 17:41:41'),
(179, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-12 20:42:49\",\"updated_at\":\"2020-09-12 20:42:49\"},\"old\":{\"last_login\":\"2020-09-12 10:41:41\",\"updated_at\":\"2020-09-12 10:41:41\"}}', '2020-09-13 03:42:50', '2020-09-13 03:42:50'),
(180, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-13 09:33:21\",\"updated_at\":\"2020-09-13 09:33:21\"},\"old\":{\"last_login\":\"2020-09-12 20:42:49\",\"updated_at\":\"2020-09-12 20:42:49\"}}', '2020-09-13 16:33:22', '2020-09-13 16:33:22'),
(181, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-13 20:31:55\",\"updated_at\":\"2020-09-13 20:31:56\"},\"old\":{\"last_login\":\"2020-09-13 09:33:21\",\"updated_at\":\"2020-09-13 09:33:21\"}}', '2020-09-14 03:31:56', '2020-09-14 03:31:56'),
(182, 'default', 'created', 8, 'App\\Note', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"notable_id\":5,\"notable_type\":\"App\\\\Project\",\"heading\":\"test\",\"description\":\"<p>new new<\\/p>\",\"created_by\":1,\"created_at\":\"2020-09-13 20:37:19\",\"updated_at\":\"2020-09-13 20:37:19\"}}', '2020-09-14 03:37:19', '2020-09-14 03:37:19'),
(183, 'default', 'created', 2, 'App\\ProjectMilestone', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"project_id\":5,\"name\":\"test\",\"due_date\":\"2020-09-19 00:00:00\",\"description\":\"<p>khkjhkj<\\/p>\",\"created_by\":1,\"created_at\":\"2020-09-13 20:39:22\",\"updated_at\":\"2020-09-13 20:39:22\"}}', '2020-09-14 03:39:22', '2020-09-14 03:39:22'),
(184, 'default', 'created', 9, 'App\\Project', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"name\":\"test\",\"customer_id\":null,\"billing_type\":\"fixed_rate\",\"total_rate\":\"0.00\",\"price_per_hours\":\"0.00\",\"estimated_hours\":\"0.00\",\"estimated_cost\":\"0.00\",\"status\":\"on_hold\",\"lead_id\":1,\"start_date\":\"2020-09-08 00:00:00\",\"end_date\":\"2020-09-14 00:00:00\",\"description\":null,\"created_by\":1,\"favorite\":0,\"created_at\":\"2020-09-13 20:56:53\",\"updated_at\":\"2020-09-13 20:56:53\"}}', '2020-09-14 03:56:53', '2020-09-14 03:56:53'),
(185, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"uF0r1h0fhr2ie2BPNCXpfvnUsz974hwgjDo6TlvHRY97oXR2Hjapd2o1fzs8\"},\"old\":{\"remember_token\":\"2Sb4FxwDAS45CXSq1Jl6RINZ1sLKCXt23Kd5DtATVPk3w0CECvsqYBbHpSrW\"}}', '2020-09-20 16:09:38', '2020-09-20 16:09:38'),
(186, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-20 09:09:50\",\"updated_at\":\"2020-09-20 09:09:50\"},\"old\":{\"last_login\":\"2020-09-12 10:41:08\",\"updated_at\":\"2020-09-12 10:41:08\"}}', '2020-09-20 16:09:50', '2020-09-20 16:09:50'),
(187, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"active\":\"2020-09-20 00:00:00\",\"updated_at\":\"2020-09-20 10:25:20\"},\"old\":{\"active\":\"2020-07-17 15:00:00\",\"updated_at\":\"2020-09-20 09:09:50\"}}', '2020-09-20 17:25:20', '2020-09-20 17:25:20'),
(188, 'default', 'updated', 5, 'App\\Components\\User\\Models\\User', 5, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"RdvfK6t671IpKvnE0aDeu24xGDENPFyrxuRrVegVCSaQQ0xMAZStB3IZy891\"},\"old\":{\"remember_token\":\"GfPA8rcSIMHEG41cNHI2jOCDvfQT2SWKCIIm4ehG3ekYMkPJRHyTTrbhfdMy\"}}', '2020-09-20 17:29:32', '2020-09-20 17:29:32'),
(189, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-20 10:33:20\",\"updated_at\":\"2020-09-20 10:33:20\"},\"old\":{\"last_login\":null,\"updated_at\":\"2019-07-25 06:50:55\"}}', '2020-09-20 17:33:20', '2020-09-20 17:33:20'),
(190, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"5Tpcr2gtt6lu7SUW0QfvX9e7elFDlCu7mGtEzOMZ5Sdlgazgg0ipcfWjAj90\"},\"old\":{\"remember_token\":null}}', '2020-09-20 21:19:27', '2020-09-20 21:19:27'),
(191, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-20 14:19:28\",\"updated_at\":\"2020-09-20 14:19:28\"},\"old\":{\"last_login\":\"2020-09-20 10:33:20\",\"updated_at\":\"2020-09-20 10:33:20\"}}', '2020-09-20 21:19:28', '2020-09-20 21:19:28'),
(192, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"2YpnJ9vUXkgLoIPN0pOQoD43PTyk5FtPVmg0Qfd9cSZcNR3QqCS7dgJ2LTYN\"},\"old\":{\"remember_token\":\"5Tpcr2gtt6lu7SUW0QfvX9e7elFDlCu7mGtEzOMZ5Sdlgazgg0ipcfWjAj90\"}}', '2020-09-20 22:04:07', '2020-09-20 22:04:07'),
(193, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-20 15:04:16\",\"updated_at\":\"2020-09-20 15:04:16\"},\"old\":{\"last_login\":\"2020-09-13 20:31:55\",\"updated_at\":\"2020-09-13 20:31:56\"}}', '2020-09-20 22:04:16', '2020-09-20 22:04:16'),
(194, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"MPhlmx8JhE6kEYP421qOGxwF1sBEy5AJW0svA0PfUSmVf5vHzoMPmACAuyQF\"},\"old\":{\"remember_token\":\"uF0r1h0fhr2ie2BPNCXpfvnUsz974hwgjDo6TlvHRY97oXR2Hjapd2o1fzs8\"}}', '2020-09-20 22:05:36', '2020-09-20 22:05:36'),
(195, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-20 15:05:48\",\"updated_at\":\"2020-09-20 15:05:48\"},\"old\":{\"last_login\":\"2020-09-20 14:19:28\",\"updated_at\":\"2020-09-20 14:19:28\"}}', '2020-09-20 22:05:48', '2020-09-20 22:05:48'),
(196, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-22 14:23:48\",\"updated_at\":\"2020-09-22 14:23:48\"},\"old\":{\"last_login\":\"2020-09-20 15:05:48\",\"updated_at\":\"2020-09-20 15:05:48\"}}', '2020-09-22 21:23:48', '2020-09-22 21:23:48'),
(197, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"lUX9nbmNNPv5uUaL0KOW2e1Z4VhboY1pMaJh0G3UKYN3M5W4cb43mvOnCz7a\"},\"old\":{\"remember_token\":\"2YpnJ9vUXkgLoIPN0pOQoD43PTyk5FtPVmg0Qfd9cSZcNR3QqCS7dgJ2LTYN\"}}', '2020-09-23 21:35:02', '2020-09-23 21:35:02'),
(198, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-23 14:35:16\",\"updated_at\":\"2020-09-23 14:35:16\"},\"old\":{\"last_login\":\"2020-09-20 15:04:16\",\"updated_at\":\"2020-09-20 15:04:16\"}}', '2020-09-23 21:35:16', '2020-09-23 21:35:16'),
(199, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"BcamqRVOpz5TTmAqffjnlfDchnYju6dV5UOA7AVQT0Gttw5Vt4P46JnQp87c\"},\"old\":{\"remember_token\":\"MPhlmx8JhE6kEYP421qOGxwF1sBEy5AJW0svA0PfUSmVf5vHzoMPmACAuyQF\"}}', '2020-09-23 21:36:26', '2020-09-23 21:36:26'),
(200, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-23 14:37:34\",\"updated_at\":\"2020-09-23 14:37:34\"},\"old\":{\"last_login\":\"2020-09-22 14:23:48\",\"updated_at\":\"2020-09-22 14:23:48\"}}', '2020-09-23 21:37:34', '2020-09-23 21:37:34'),
(201, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-23 14:39:22\",\"updated_at\":\"2020-09-23 14:39:22\"},\"old\":{\"last_login\":\"2020-09-23 14:35:16\",\"updated_at\":\"2020-09-23 14:35:16\"}}', '2020-09-23 21:39:22', '2020-09-23 21:39:22'),
(202, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"6KDZQyX7nCjr0PQzspKOkPXMUgEQl34rPEX9ZedXiqIuvpDolXFi4ZnjCSlN\"},\"old\":{\"remember_token\":\"lUX9nbmNNPv5uUaL0KOW2e1Z4VhboY1pMaJh0G3UKYN3M5W4cb43mvOnCz7a\"}}', '2020-09-24 23:10:47', '2020-09-24 23:10:47'),
(203, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-24 16:10:58\",\"updated_at\":\"2020-09-24 16:10:58\"},\"old\":{\"last_login\":\"2020-09-23 14:39:22\",\"updated_at\":\"2020-09-23 14:39:22\"}}', '2020-09-24 23:10:58', '2020-09-24 23:10:58'),
(204, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-26 10:08:30\",\"updated_at\":\"2020-09-26 10:08:30\"},\"old\":{\"last_login\":\"2020-09-24 16:10:58\",\"updated_at\":\"2020-09-24 16:10:58\"}}', '2020-09-26 17:08:30', '2020-09-26 17:08:30'),
(205, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"0jHRiELpWFipnNeR8jdFoJVPExhczjYLMc0NOiHLTH1U5DI5byD9hNOTSZw6\"},\"old\":{\"remember_token\":\"BcamqRVOpz5TTmAqffjnlfDchnYju6dV5UOA7AVQT0Gttw5Vt4P46JnQp87c\"}}', '2020-09-26 17:38:11', '2020-09-26 17:38:11'),
(206, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-26 10:38:38\",\"updated_at\":\"2020-09-26 10:38:38\"},\"old\":{\"last_login\":\"2020-09-23 14:37:34\",\"updated_at\":\"2020-09-23 14:37:34\"}}', '2020-09-26 17:38:38', '2020-09-26 17:38:38'),
(207, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"1ft0eJ7JoCpo7QMQ74DmR14ZROdOhmFCPB3hj7fpbiNBBeAel9JQOTJDl9A3\"},\"old\":{\"remember_token\":\"6KDZQyX7nCjr0PQzspKOkPXMUgEQl34rPEX9ZedXiqIuvpDolXFi4ZnjCSlN\"}}', '2020-09-26 17:39:41', '2020-09-26 17:39:41'),
(208, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-26 10:39:55\",\"updated_at\":\"2020-09-26 10:39:55\"},\"old\":{\"last_login\":\"2020-09-26 10:08:30\",\"updated_at\":\"2020-09-26 10:08:30\"}}', '2020-09-26 17:39:55', '2020-09-26 17:39:55'),
(209, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"oZhINpT8qbYgaTTZdNtnJGzmeK1lkercxaKwP6Ssv9R2iOmcxWGBF4NHIfAh\"},\"old\":{\"remember_token\":\"0jHRiELpWFipnNeR8jdFoJVPExhczjYLMc0NOiHLTH1U5DI5byD9hNOTSZw6\"}}', '2020-09-26 17:47:23', '2020-09-26 17:47:23'),
(210, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-26 10:47:44\",\"updated_at\":\"2020-09-26 10:47:44\"},\"old\":{\"last_login\":\"2020-09-26 10:38:38\",\"updated_at\":\"2020-09-26 10:38:38\"}}', '2020-09-26 17:47:44', '2020-09-26 17:47:44'),
(211, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"nrU8thBJEhfrkB41b1QXAGWXOrz3kOa7fag4IwIVMZHPpHC60McYirS3GWUL\"},\"old\":{\"remember_token\":\"1ft0eJ7JoCpo7QMQ74DmR14ZROdOhmFCPB3hj7fpbiNBBeAel9JQOTJDl9A3\"}}', '2020-09-26 17:48:30', '2020-09-26 17:48:30'),
(212, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-26 10:48:45\",\"updated_at\":\"2020-09-26 10:48:45\"},\"old\":{\"last_login\":\"2020-09-26 10:39:55\",\"updated_at\":\"2020-09-26 10:39:55\"}}', '2020-09-26 17:48:45', '2020-09-26 17:48:45'),
(213, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-26 15:39:23\",\"updated_at\":\"2020-09-26 15:39:23\"},\"old\":{\"last_login\":\"2020-09-26 10:48:45\",\"updated_at\":\"2020-09-26 10:48:45\"}}', '2020-09-26 22:39:24', '2020-09-26 22:39:24'),
(214, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"PBChuP4qUp8eE2rFkEdkyeNiqaxrg4oCLG0vxWRVQQGTyaAzwGQDRIoGq9bP\"},\"old\":{\"remember_token\":\"oZhINpT8qbYgaTTZdNtnJGzmeK1lkercxaKwP6Ssv9R2iOmcxWGBF4NHIfAh\"}}', '2020-09-26 22:39:43', '2020-09-26 22:39:43'),
(215, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-26 15:42:44\",\"updated_at\":\"2020-09-26 15:42:44\"},\"old\":{\"last_login\":\"2020-09-26 10:47:44\",\"updated_at\":\"2020-09-26 10:47:44\"}}', '2020-09-26 22:42:44', '2020-09-26 22:42:44'),
(216, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"T1hA09DqiYvkukEtxrRGc9Jc3Z3er0y6gW0CJAU6oauCSVoY4pJnuuprqcVe\"},\"old\":{\"remember_token\":\"nrU8thBJEhfrkB41b1QXAGWXOrz3kOa7fag4IwIVMZHPpHC60McYirS3GWUL\"}}', '2020-09-26 22:43:45', '2020-09-26 22:43:45'),
(217, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-26 15:43:56\",\"updated_at\":\"2020-09-26 15:43:56\"},\"old\":{\"last_login\":\"2020-09-26 15:39:23\",\"updated_at\":\"2020-09-26 15:39:23\"}}', '2020-09-26 22:43:56', '2020-09-26 22:43:56'),
(218, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-27 21:04:45\",\"updated_at\":\"2020-09-27 21:04:45\"},\"old\":{\"last_login\":\"2020-09-26 15:42:44\",\"updated_at\":\"2020-09-26 15:42:44\"}}', '2020-09-28 04:04:45', '2020-09-28 04:04:45'),
(219, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"G5sz25Wdw9Sl2vjtHZNv92NT3hoYdBqQSkVQVT944ReeH4LNOOySHWCKQRUk\"},\"old\":{\"remember_token\":\"T1hA09DqiYvkukEtxrRGc9Jc3Z3er0y6gW0CJAU6oauCSVoY4pJnuuprqcVe\"}}', '2020-09-28 04:05:22', '2020-09-28 04:05:22'),
(220, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-27 21:09:14\",\"updated_at\":\"2020-09-27 21:09:14\"},\"old\":{\"last_login\":\"2020-09-27 21:04:45\",\"updated_at\":\"2020-09-27 21:04:45\"}}', '2020-09-28 04:09:14', '2020-09-28 04:09:14'),
(221, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"mirTEQpT2Mam6VAkx5IayK3iHsw7crLMHP4RpxVuU9rhrY0dQX3Ie4CYPaNu\"},\"old\":{\"remember_token\":\"G5sz25Wdw9Sl2vjtHZNv92NT3hoYdBqQSkVQVT944ReeH4LNOOySHWCKQRUk\"}}', '2020-09-28 04:14:19', '2020-09-28 04:14:19'),
(222, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-27 21:14:29\",\"updated_at\":\"2020-09-27 21:14:29\"},\"old\":{\"last_login\":\"2020-09-27 21:09:14\",\"updated_at\":\"2020-09-27 21:09:14\"}}', '2020-09-28 04:14:29', '2020-09-28 04:14:29'),
(223, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"bzvJ8uLHqFgSBrVeFai6ILZ1G8gfHy6T2XLdsuYew9fBjwvzmEbx2XXWcAAI\"},\"old\":{\"remember_token\":\"mirTEQpT2Mam6VAkx5IayK3iHsw7crLMHP4RpxVuU9rhrY0dQX3Ie4CYPaNu\"}}', '2020-09-28 04:14:52', '2020-09-28 04:14:52'),
(224, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-27 21:15:10\",\"updated_at\":\"2020-09-27 21:15:10\"},\"old\":{\"last_login\":\"2020-09-26 15:43:56\",\"updated_at\":\"2020-09-26 15:43:56\"}}', '2020-09-28 04:15:10', '2020-09-28 04:15:10'),
(225, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"m4UtDm6J63dfaqWXNvwuxw2fVzTIDOYqLXN5NcRgeDobHF5mdgn1xOAmYyuo\"},\"old\":{\"remember_token\":\"PBChuP4qUp8eE2rFkEdkyeNiqaxrg4oCLG0vxWRVQQGTyaAzwGQDRIoGq9bP\"}}', '2020-09-28 04:16:24', '2020-09-28 04:16:24'),
(226, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-27 21:16:42\",\"updated_at\":\"2020-09-27 21:16:42\"},\"old\":{\"last_login\":\"2020-09-27 21:14:29\",\"updated_at\":\"2020-09-27 21:14:29\"}}', '2020-09-28 04:16:42', '2020-09-28 04:16:42'),
(227, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"mLUiMVsYO8XbgX6wpcdS5mLEFWU34ARdInzJ8TQS9ZPls3231HnzQmE3A6N1\"},\"old\":{\"remember_token\":\"bzvJ8uLHqFgSBrVeFai6ILZ1G8gfHy6T2XLdsuYew9fBjwvzmEbx2XXWcAAI\"}}', '2020-09-28 04:17:17', '2020-09-28 04:17:17'),
(228, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-27 21:17:32\",\"updated_at\":\"2020-09-27 21:17:32\"},\"old\":{\"last_login\":\"2020-09-27 21:15:10\",\"updated_at\":\"2020-09-27 21:15:10\"}}', '2020-09-28 04:17:32', '2020-09-28 04:17:32'),
(229, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"VpabwvXlZra9XxMFAWNIaTLU0eB8JFfJCvuSPg3o87NVgUQcymQJsgpD6Ja0\"},\"old\":{\"remember_token\":\"m4UtDm6J63dfaqWXNvwuxw2fVzTIDOYqLXN5NcRgeDobHF5mdgn1xOAmYyuo\"}}', '2020-09-28 04:17:51', '2020-09-28 04:17:51'),
(230, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-27 21:18:07\",\"updated_at\":\"2020-09-27 21:18:07\"},\"old\":{\"last_login\":\"2020-09-27 21:16:42\",\"updated_at\":\"2020-09-27 21:16:42\"}}', '2020-09-28 04:18:07', '2020-09-28 04:18:07'),
(231, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"ZEcxIYLsN71P2ECFjsLf9QvXAATYZMfE2UDzpV5SM9hdCxEWMVpR68TQ0mMa\"},\"old\":{\"remember_token\":\"mLUiMVsYO8XbgX6wpcdS5mLEFWU34ARdInzJ8TQS9ZPls3231HnzQmE3A6N1\"}}', '2020-09-28 04:19:30', '2020-09-28 04:19:30'),
(232, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-27 21:19:46\",\"updated_at\":\"2020-09-27 21:19:46\"},\"old\":{\"last_login\":\"2020-09-27 21:17:32\",\"updated_at\":\"2020-09-27 21:17:32\"}}', '2020-09-28 04:19:46', '2020-09-28 04:19:46'),
(233, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-09-30 10:08:26\",\"updated_at\":\"2020-09-30 10:08:26\"},\"old\":{\"last_login\":\"2020-09-27 21:19:46\",\"updated_at\":\"2020-09-27 21:19:46\"}}', '2020-09-30 17:08:27', '2020-09-30 17:08:27'),
(234, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"TCqwBoAGpigkYUfBTPMJOfjr0xhC2Dtof8DGTqJKe5kHpyodjCC462CVIA9N\"},\"old\":{\"remember_token\":\"VpabwvXlZra9XxMFAWNIaTLU0eB8JFfJCvuSPg3o87NVgUQcymQJsgpD6Ja0\"}}', '2020-10-02 15:32:53', '2020-10-02 15:32:53'),
(235, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-02 08:33:20\",\"updated_at\":\"2020-10-02 08:33:20\"},\"old\":{\"last_login\":\"2020-09-27 21:18:07\",\"updated_at\":\"2020-09-27 21:18:07\"}}', '2020-10-02 15:33:20', '2020-10-02 15:33:20'),
(236, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"kh284AnijB13focFJMNcpHtTBJCQ6F3GGQC8Fh5wTZx9fulHG8ObZGs9Vbnu\"},\"old\":{\"remember_token\":\"ZEcxIYLsN71P2ECFjsLf9QvXAATYZMfE2UDzpV5SM9hdCxEWMVpR68TQ0mMa\"}}', '2020-10-02 15:34:14', '2020-10-02 15:34:14'),
(237, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-02 08:34:26\",\"updated_at\":\"2020-10-02 08:34:26\"},\"old\":{\"last_login\":\"2020-09-30 10:08:26\",\"updated_at\":\"2020-09-30 10:08:26\"}}', '2020-10-02 15:34:26', '2020-10-02 15:34:26'),
(238, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"0vf1MnNwPcPRa4tGJv7Z5LBg14F2UDJ23VPRoEsS55zTT9F52rbiZD31hFZq\"},\"old\":{\"remember_token\":\"TCqwBoAGpigkYUfBTPMJOfjr0xhC2Dtof8DGTqJKe5kHpyodjCC462CVIA9N\"}}', '2020-10-02 15:45:30', '2020-10-02 15:45:30'),
(239, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-02 08:45:44\",\"updated_at\":\"2020-10-02 08:45:44\"},\"old\":{\"last_login\":\"2020-10-02 08:33:20\",\"updated_at\":\"2020-10-02 08:33:20\"}}', '2020-10-02 15:45:44', '2020-10-02 15:45:44'),
(240, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"8jm0kanwaGqLVyYWJZBpiXp4KumqJXe0p0rs6Sx9YK1giucOMZq75j59aVYO\"},\"old\":{\"remember_token\":\"kh284AnijB13focFJMNcpHtTBJCQ6F3GGQC8Fh5wTZx9fulHG8ObZGs9Vbnu\"}}', '2020-10-02 17:05:54', '2020-10-02 17:05:54'),
(241, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-02 10:06:10\",\"updated_at\":\"2020-10-02 10:06:10\"},\"old\":{\"last_login\":\"2020-10-02 08:34:26\",\"updated_at\":\"2020-10-02 08:34:26\"}}', '2020-10-02 17:06:10', '2020-10-02 17:06:10'),
(242, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-02 10:46:45\",\"updated_at\":\"2020-10-02 10:46:45\"},\"old\":{\"last_login\":\"2020-10-02 08:45:44\",\"updated_at\":\"2020-10-02 08:45:44\"}}', '2020-10-02 17:46:45', '2020-10-02 17:46:45'),
(243, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-03 08:18:42\",\"updated_at\":\"2020-10-03 08:18:42\"},\"old\":{\"last_login\":\"2020-10-02 10:46:45\",\"updated_at\":\"2020-10-02 10:46:45\"}}', '2020-10-03 15:18:42', '2020-10-03 15:18:42'),
(244, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"02C71ldvqGOTrnNuKH5nbS8zAplkOY9jT57ZsmedhDP53FjCGU3KOidQS3jZ\"},\"old\":{\"remember_token\":\"8jm0kanwaGqLVyYWJZBpiXp4KumqJXe0p0rs6Sx9YK1giucOMZq75j59aVYO\"}}', '2020-10-03 15:19:46', '2020-10-03 15:19:46'),
(245, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-03 08:20:00\",\"updated_at\":\"2020-10-03 08:20:00\"},\"old\":{\"last_login\":\"2020-10-02 10:06:10\",\"updated_at\":\"2020-10-02 10:06:10\"}}', '2020-10-03 15:20:00', '2020-10-03 15:20:00'),
(246, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"E7Wi9CUsbl46kBHSrtxsQQ0OWTYItWIDwdnCmgiamXlNdVSplCSQB9fAhj91\"},\"old\":{\"remember_token\":\"0vf1MnNwPcPRa4tGJv7Z5LBg14F2UDJ23VPRoEsS55zTT9F52rbiZD31hFZq\"}}', '2020-10-03 15:25:16', '2020-10-03 15:25:16'),
(247, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-03 08:25:30\",\"updated_at\":\"2020-10-03 08:25:30\"},\"old\":{\"last_login\":\"2020-10-03 08:18:42\",\"updated_at\":\"2020-10-03 08:18:42\"}}', '2020-10-03 15:25:30', '2020-10-03 15:25:30'),
(248, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-03 15:30:40\",\"updated_at\":\"2020-10-03 15:30:40\"},\"old\":{\"last_login\":\"2020-10-03 08:25:30\",\"updated_at\":\"2020-10-03 08:25:30\"}}', '2020-10-03 22:30:41', '2020-10-03 22:30:41'),
(249, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-04 09:22:50\",\"updated_at\":\"2020-10-04 09:22:50\"},\"old\":{\"last_login\":\"2020-10-03 15:30:40\",\"updated_at\":\"2020-10-03 15:30:40\"}}', '2020-10-04 16:22:50', '2020-10-04 16:22:50'),
(250, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-04 14:09:13\",\"updated_at\":\"2020-10-04 14:09:13\"},\"old\":{\"last_login\":\"2020-10-04 09:22:50\",\"updated_at\":\"2020-10-04 09:22:50\"}}', '2020-10-04 21:09:13', '2020-10-04 21:09:13'),
(251, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"nr9JL2bf8YlXSYUkyLduzON5IgYA0OrzNmWyryE5R1MyoFWE3vKfR5IunUOK\"},\"old\":{\"remember_token\":\"02C71ldvqGOTrnNuKH5nbS8zAplkOY9jT57ZsmedhDP53FjCGU3KOidQS3jZ\"}}', '2020-10-04 21:51:49', '2020-10-04 21:51:49'),
(252, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-04 14:52:01\",\"updated_at\":\"2020-10-04 14:52:01\"},\"old\":{\"last_login\":\"2020-10-03 08:20:00\",\"updated_at\":\"2020-10-03 08:20:00\"}}', '2020-10-04 21:52:01', '2020-10-04 21:52:01'),
(253, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"OZqZIr1Jn4aGvplzXKONo4SZhkc8mjPebbcQ5kxO8S0LxXpIXkXd8RdikfW9\"},\"old\":{\"remember_token\":\"E7Wi9CUsbl46kBHSrtxsQQ0OWTYItWIDwdnCmgiamXlNdVSplCSQB9fAhj91\"}}', '2020-10-04 21:58:01', '2020-10-04 21:58:01'),
(254, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-04 14:58:13\",\"updated_at\":\"2020-10-04 14:58:13\"},\"old\":{\"last_login\":\"2020-10-04 14:09:13\",\"updated_at\":\"2020-10-04 14:09:13\"}}', '2020-10-04 21:58:13', '2020-10-04 21:58:13'),
(255, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"dKNdCV8ZinIWroCgBLNrTzZcTayqAcoCZydiLMjSWGZouIjz1iEJfoVjpmbW\"},\"old\":{\"remember_token\":\"nr9JL2bf8YlXSYUkyLduzON5IgYA0OrzNmWyryE5R1MyoFWE3vKfR5IunUOK\"}}', '2020-10-04 22:08:03', '2020-10-04 22:08:03'),
(256, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-04 15:08:34\",\"updated_at\":\"2020-10-04 15:08:34\"},\"old\":{\"last_login\":\"2020-10-04 14:52:01\",\"updated_at\":\"2020-10-04 14:52:01\"}}', '2020-10-04 22:08:34', '2020-10-04 22:08:34');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(257, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"BsFr7VLR7Iniw0NmN1chlkivfpJgdxbz5jkmuq0DyyZBJDzVFXLwXLlkOdkB\"},\"old\":{\"remember_token\":\"OZqZIr1Jn4aGvplzXKONo4SZhkc8mjPebbcQ5kxO8S0LxXpIXkXd8RdikfW9\"}}', '2020-10-04 23:38:03', '2020-10-04 23:38:03'),
(258, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-04 16:38:14\",\"updated_at\":\"2020-10-04 16:38:14\"},\"old\":{\"last_login\":\"2020-10-04 15:08:34\",\"updated_at\":\"2020-10-04 15:08:34\"}}', '2020-10-04 23:38:14', '2020-10-04 23:38:14'),
(259, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-06 09:32:46\",\"updated_at\":\"2020-10-06 09:32:46\"},\"old\":{\"last_login\":\"2020-10-04 14:58:13\",\"updated_at\":\"2020-10-04 14:58:13\"}}', '2020-10-06 16:32:47', '2020-10-06 16:32:47'),
(260, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"3H4pxbkRuMyAm2gp3nY2yK7e7r79OPJPgXW2yeTqKipWFBiaCCmShEDQnKWc\"},\"old\":{\"remember_token\":\"dKNdCV8ZinIWroCgBLNrTzZcTayqAcoCZydiLMjSWGZouIjz1iEJfoVjpmbW\"}}', '2020-10-06 21:22:34', '2020-10-06 21:22:34'),
(261, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-06 14:23:26\",\"updated_at\":\"2020-10-06 14:23:26\"},\"old\":{\"last_login\":\"2020-10-06 09:32:46\",\"updated_at\":\"2020-10-06 09:32:46\"}}', '2020-10-06 21:23:26', '2020-10-06 21:23:26'),
(262, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"ZxrhNsmz0DdmoDospvH7tOQsczUXWjcX7DEANLj4Joy33lfVLQ23FDy6Tpi2\"},\"old\":{\"remember_token\":\"3H4pxbkRuMyAm2gp3nY2yK7e7r79OPJPgXW2yeTqKipWFBiaCCmShEDQnKWc\"}}', '2020-10-06 22:55:08', '2020-10-06 22:55:08'),
(263, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-06 15:55:18\",\"updated_at\":\"2020-10-06 15:55:18\"},\"old\":{\"last_login\":\"2020-10-06 14:23:26\",\"updated_at\":\"2020-10-06 14:23:26\"}}', '2020-10-06 22:55:18', '2020-10-06 22:55:18'),
(264, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-07 14:43:33\",\"updated_at\":\"2020-10-07 14:43:33\"},\"old\":{\"last_login\":\"2020-10-06 15:55:18\",\"updated_at\":\"2020-10-06 15:55:18\"}}', '2020-10-07 21:43:33', '2020-10-07 21:43:33'),
(265, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"BmGkkk0KFPJNFA1aCByn9lhRt1vwb1RJdJYEJbRBsHJqcFjqddcNZ5NA8Cbd\"},\"old\":{\"remember_token\":\"ZxrhNsmz0DdmoDospvH7tOQsczUXWjcX7DEANLj4Joy33lfVLQ23FDy6Tpi2\"}}', '2020-10-07 22:16:05', '2020-10-07 22:16:05'),
(266, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-07 15:16:17\",\"updated_at\":\"2020-10-07 15:16:17\"},\"old\":{\"last_login\":\"2020-10-07 14:43:33\",\"updated_at\":\"2020-10-07 14:43:33\"}}', '2020-10-07 22:16:17', '2020-10-07 22:16:17'),
(267, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-08 08:28:51\",\"updated_at\":\"2020-10-08 08:28:51\"},\"old\":{\"last_login\":\"2020-10-07 15:16:17\",\"updated_at\":\"2020-10-07 15:16:17\"}}', '2020-10-08 15:28:53', '2020-10-08 15:28:53'),
(268, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-08 14:08:39\",\"updated_at\":\"2020-10-08 14:08:39\"},\"old\":{\"last_login\":\"2020-10-08 08:28:51\",\"updated_at\":\"2020-10-08 08:28:51\"}}', '2020-10-08 21:08:40', '2020-10-08 21:08:40'),
(269, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"9iKsRFNRpDprZojRShdHyDVuOgOzEEjwcnPQSWZFBPmDkwmaMvG7rowYKok8\"},\"old\":{\"remember_token\":\"BmGkkk0KFPJNFA1aCByn9lhRt1vwb1RJdJYEJbRBsHJqcFjqddcNZ5NA8Cbd\"}}', '2020-10-08 21:17:13', '2020-10-08 21:17:13'),
(270, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-08 14:17:30\",\"updated_at\":\"2020-10-08 14:17:30\"},\"old\":{\"last_login\":\"2020-10-04 16:38:14\",\"updated_at\":\"2020-10-04 16:38:14\"}}', '2020-10-08 21:17:30', '2020-10-08 21:17:30'),
(271, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"xKEOKDOkRlYw6OsK0BeL5WhzBrHHPJHjqGAQA4fu6xglzbG2AUorgHMKqlJQ\"},\"old\":{\"remember_token\":\"BsFr7VLR7Iniw0NmN1chlkivfpJgdxbz5jkmuq0DyyZBJDzVFXLwXLlkOdkB\"}}', '2020-10-08 23:13:00', '2020-10-08 23:13:00'),
(272, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-08 16:13:09\",\"updated_at\":\"2020-10-08 16:13:09\"},\"old\":{\"last_login\":\"2020-10-08 14:08:39\",\"updated_at\":\"2020-10-08 14:08:39\"}}', '2020-10-08 23:13:09', '2020-10-08 23:13:09'),
(273, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"MxLaBegCr2HxSwGPdmVmIm1QZQLUzVyDRS5WK1Y15qB8r0DyHk1AbH0u2mvE\"},\"old\":{\"remember_token\":\"9iKsRFNRpDprZojRShdHyDVuOgOzEEjwcnPQSWZFBPmDkwmaMvG7rowYKok8\"}}', '2020-10-08 23:13:52', '2020-10-08 23:13:52'),
(274, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-08 16:13:59\",\"updated_at\":\"2020-10-08 16:13:59\"},\"old\":{\"last_login\":\"2020-10-08 14:17:30\",\"updated_at\":\"2020-10-08 14:17:30\"}}', '2020-10-08 23:14:00', '2020-10-08 23:14:00'),
(275, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"9vnHnmvTlKev5VJg2psCeIHYEX7hpUeva2oJ86lmlPmHW2eAf9ts4GAAsI62\"},\"old\":{\"remember_token\":\"xKEOKDOkRlYw6OsK0BeL5WhzBrHHPJHjqGAQA4fu6xglzbG2AUorgHMKqlJQ\"}}', '2020-10-08 23:14:07', '2020-10-08 23:14:07'),
(276, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-08 16:14:21\",\"updated_at\":\"2020-10-08 16:14:21\"},\"old\":{\"last_login\":\"2020-10-08 16:13:09\",\"updated_at\":\"2020-10-08 16:13:09\"}}', '2020-10-08 23:14:21', '2020-10-08 23:14:21'),
(277, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"HV5DihLrRZoWC5qstdnJRFfOSmAqfBL7YVEwhtDAIJiAE2qBKHt01ZyDpoDT\"},\"old\":{\"remember_token\":\"MxLaBegCr2HxSwGPdmVmIm1QZQLUzVyDRS5WK1Y15qB8r0DyHk1AbH0u2mvE\"}}', '2020-10-08 23:14:33', '2020-10-08 23:14:33'),
(278, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-08 16:14:48\",\"updated_at\":\"2020-10-08 16:14:48\"},\"old\":{\"last_login\":\"2020-10-08 16:13:59\",\"updated_at\":\"2020-10-08 16:13:59\"}}', '2020-10-08 23:14:48', '2020-10-08 23:14:48'),
(279, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-08 20:22:54\",\"updated_at\":\"2020-10-08 20:22:54\"},\"old\":{\"last_login\":\"2020-10-08 16:14:48\",\"updated_at\":\"2020-10-08 16:14:48\"}}', '2020-10-09 03:22:54', '2020-10-09 03:22:54'),
(280, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"BLaOxRQRdvkSjoveBmqxSBJXmBrcTCUoTbENqVvgIlNs6tNG2iM5av4bpunl\"},\"old\":{\"remember_token\":\"HV5DihLrRZoWC5qstdnJRFfOSmAqfBL7YVEwhtDAIJiAE2qBKHt01ZyDpoDT\"}}', '2020-10-17 01:49:23', '2020-10-17 01:49:23'),
(281, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-16 18:49:42\",\"updated_at\":\"2020-10-16 18:49:42\"},\"old\":{\"last_login\":\"2020-10-08 20:22:54\",\"updated_at\":\"2020-10-08 20:22:54\"}}', '2020-10-17 01:49:42', '2020-10-17 01:49:42'),
(282, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-24 14:23:47\",\"updated_at\":\"2020-10-24 14:23:47\"},\"old\":{\"last_login\":\"2020-10-16 18:49:42\",\"updated_at\":\"2020-10-16 18:49:42\"}}', '2020-10-24 21:23:49', '2020-10-24 21:23:49'),
(283, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"Z6VpXDhpPWrx3UyNN65gyJg1yWEvcwHqCWbdY5oamfv1Yb6bsCheA3sP3blJ\"},\"old\":{\"remember_token\":\"9vnHnmvTlKev5VJg2psCeIHYEX7hpUeva2oJ86lmlPmHW2eAf9ts4GAAsI62\"}}', '2020-10-24 21:37:53', '2020-10-24 21:37:53'),
(284, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-24 14:38:01\",\"updated_at\":\"2020-10-24 14:38:01\"},\"old\":{\"last_login\":\"2020-10-08 16:14:21\",\"updated_at\":\"2020-10-08 16:14:21\"}}', '2020-10-24 21:38:01', '2020-10-24 21:38:01'),
(285, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"Zk20xuBT4kELFKzS9JPLB5tgj8EaZI2wNql60DsubpS96sa0LEyb4c7KRLGa\"},\"old\":{\"remember_token\":\"BLaOxRQRdvkSjoveBmqxSBJXmBrcTCUoTbENqVvgIlNs6tNG2iM5av4bpunl\"}}', '2020-10-24 21:43:03', '2020-10-24 21:43:03'),
(286, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-24 14:43:10\",\"updated_at\":\"2020-10-24 14:43:10\"},\"old\":{\"last_login\":\"2020-10-24 14:23:47\",\"updated_at\":\"2020-10-24 14:23:47\"}}', '2020-10-24 21:43:11', '2020-10-24 21:43:11'),
(287, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"xOGehvO5NLi9gYmM8Qkx9WXdcO2CfYphwY4xqSy2qeByIOUUPieIn49SKDxH\"},\"old\":{\"remember_token\":\"Z6VpXDhpPWrx3UyNN65gyJg1yWEvcwHqCWbdY5oamfv1Yb6bsCheA3sP3blJ\"}}', '2020-10-24 21:54:28', '2020-10-24 21:54:28'),
(288, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-24 14:54:41\",\"updated_at\":\"2020-10-24 14:54:41\"},\"old\":{\"last_login\":\"2020-10-24 14:38:01\",\"updated_at\":\"2020-10-24 14:38:01\"}}', '2020-10-24 21:54:41', '2020-10-24 21:54:41'),
(289, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"f63AHZ0awRXzzw1rlTDKQ7klJrqrcRgTW06B86J6yDtVbkVuBjedVYDkugP2\"},\"old\":{\"remember_token\":\"Zk20xuBT4kELFKzS9JPLB5tgj8EaZI2wNql60DsubpS96sa0LEyb4c7KRLGa\"}}', '2020-10-24 23:50:42', '2020-10-24 23:50:42'),
(290, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-24 16:50:52\",\"updated_at\":\"2020-10-24 16:50:52\"},\"old\":{\"last_login\":\"2020-10-24 14:43:10\",\"updated_at\":\"2020-10-24 14:43:10\"}}', '2020-10-24 23:50:52', '2020-10-24 23:50:52'),
(291, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-25 14:43:58\",\"updated_at\":\"2020-10-25 14:43:58\"},\"old\":{\"last_login\":\"2020-10-24 16:50:52\",\"updated_at\":\"2020-10-24 16:50:52\"}}', '2020-10-25 21:43:59', '2020-10-25 21:43:59'),
(292, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"AihnNgCSSJVmWyavOljWkBz1vToTOZx6YZyBTS17V3cbxKy1Mi6dTuD2f5MB\"},\"old\":{\"remember_token\":\"xOGehvO5NLi9gYmM8Qkx9WXdcO2CfYphwY4xqSy2qeByIOUUPieIn49SKDxH\"}}', '2020-10-25 21:53:30', '2020-10-25 21:53:30'),
(293, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-25 14:53:48\",\"updated_at\":\"2020-10-25 14:53:48\"},\"old\":{\"last_login\":\"2020-10-25 14:43:58\",\"updated_at\":\"2020-10-25 14:43:58\"}}', '2020-10-25 21:53:48', '2020-10-25 21:53:48'),
(294, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-25 14:55:13\",\"updated_at\":\"2020-10-25 14:55:13\"},\"old\":{\"last_login\":\"2020-10-25 14:53:48\",\"updated_at\":\"2020-10-25 14:53:48\"}}', '2020-10-25 21:55:13', '2020-10-25 21:55:13'),
(295, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"mdadZHMUsNUFazRvZtvMjfifnSiQpAgNJqlHmZREGbiZRivCA2taJIi7dnqo\"},\"old\":{\"remember_token\":\"AihnNgCSSJVmWyavOljWkBz1vToTOZx6YZyBTS17V3cbxKy1Mi6dTuD2f5MB\"}}', '2020-10-25 21:56:07', '2020-10-25 21:56:07'),
(296, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-25 14:56:21\",\"updated_at\":\"2020-10-25 14:56:21\"},\"old\":{\"last_login\":\"2020-10-24 14:54:41\",\"updated_at\":\"2020-10-24 14:54:41\"}}', '2020-10-25 21:56:21', '2020-10-25 21:56:21'),
(297, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-25 20:11:38\",\"updated_at\":\"2020-10-25 20:11:38\"},\"old\":{\"last_login\":\"2020-10-25 14:55:13\",\"updated_at\":\"2020-10-25 14:55:13\"}}', '2020-10-26 03:11:39', '2020-10-26 03:11:39'),
(298, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-26 16:19:06\",\"updated_at\":\"2020-10-26 16:19:06\"},\"old\":{\"last_login\":\"2020-10-25 20:11:38\",\"updated_at\":\"2020-10-25 20:11:38\"}}', '2020-10-26 23:19:07', '2020-10-26 23:19:07'),
(299, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"Uug8yATy7W48dBkHmP3UCbjHtHqV6jYEYk2VGcZ16v050lTiKRSjBRgAQldB\"},\"old\":{\"remember_token\":\"mdadZHMUsNUFazRvZtvMjfifnSiQpAgNJqlHmZREGbiZRivCA2taJIi7dnqo\"}}', '2020-10-26 23:35:15', '2020-10-26 23:35:15'),
(300, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-26 16:35:24\",\"updated_at\":\"2020-10-26 16:35:24\"},\"old\":{\"last_login\":\"2020-10-25 14:56:21\",\"updated_at\":\"2020-10-25 14:56:21\"}}', '2020-10-26 23:35:24', '2020-10-26 23:35:24'),
(301, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"HQb963eb3B3e5lNR8hTgNN1CDLWU9X5Ay6h4k9GjlyzkvycYdzOvQNTO1sib\"},\"old\":{\"remember_token\":\"f63AHZ0awRXzzw1rlTDKQ7klJrqrcRgTW06B86J6yDtVbkVuBjedVYDkugP2\"}}', '2020-10-26 23:36:15', '2020-10-26 23:36:15'),
(302, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-26 16:36:28\",\"updated_at\":\"2020-10-26 16:36:28\"},\"old\":{\"last_login\":\"2020-10-26 16:35:24\",\"updated_at\":\"2020-10-26 16:35:24\"}}', '2020-10-26 23:36:28', '2020-10-26 23:36:28'),
(303, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"SuKwzt8M1rU7n8kCbe8bZ0TAhBmZ6LUeokI3OxllxN2DZiAQMfVNGYPLAnbe\"},\"old\":{\"remember_token\":\"HQb963eb3B3e5lNR8hTgNN1CDLWU9X5Ay6h4k9GjlyzkvycYdzOvQNTO1sib\"}}', '2020-10-26 23:39:15', '2020-10-26 23:39:15'),
(304, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-26 16:39:26\",\"updated_at\":\"2020-10-26 16:39:26\"},\"old\":{\"last_login\":\"2020-10-26 16:19:06\",\"updated_at\":\"2020-10-26 16:19:06\"}}', '2020-10-26 23:39:26', '2020-10-26 23:39:26'),
(305, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-27 14:49:15\",\"updated_at\":\"2020-10-27 14:49:15\"},\"old\":{\"last_login\":\"2020-10-26 16:39:26\",\"updated_at\":\"2020-10-26 16:39:26\"}}', '2020-10-27 21:49:15', '2020-10-27 21:49:15'),
(306, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-27 19:10:33\",\"updated_at\":\"2020-10-27 19:10:33\"},\"old\":{\"last_login\":\"2020-10-27 14:49:15\",\"updated_at\":\"2020-10-27 14:49:15\"}}', '2020-10-28 02:10:34', '2020-10-28 02:10:34'),
(307, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"iAcsxJI0rOtoEZQlHWbtqC1qOG20lUK2vxMJVGrBedoqKNxE6ujGkfCtUn26\"},\"old\":{\"remember_token\":\"Uug8yATy7W48dBkHmP3UCbjHtHqV6jYEYk2VGcZ16v050lTiKRSjBRgAQldB\"}}', '2020-10-28 04:36:11', '2020-10-28 04:36:11'),
(308, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-27 21:36:19\",\"updated_at\":\"2020-10-27 21:36:19\"},\"old\":{\"last_login\":\"2020-10-26 16:36:28\",\"updated_at\":\"2020-10-26 16:36:28\"}}', '2020-10-28 04:36:19', '2020-10-28 04:36:19'),
(309, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"blAOMFRPuq9QMQlbmkBN89YDCalcYvkvQt000VB6C7aWD1G3fFHAP32p63sE\"},\"old\":{\"remember_token\":\"SuKwzt8M1rU7n8kCbe8bZ0TAhBmZ6LUeokI3OxllxN2DZiAQMfVNGYPLAnbe\"}}', '2020-10-28 04:36:51', '2020-10-28 04:36:51'),
(310, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2020-10-27 21:37:01\",\"updated_at\":\"2020-10-27 21:37:01\"},\"old\":{\"last_login\":\"2020-10-27 19:10:33\",\"updated_at\":\"2020-10-27 19:10:33\"}}', '2020-10-28 04:37:01', '2020-10-28 04:37:01'),
(311, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"z3qsEZLvtiVOBKgdXsAALO6dNFSuZSBQUVarrjroOBEi6i0yU4OxylFZSRDP\"},\"old\":{\"remember_token\":\"iAcsxJI0rOtoEZQlHWbtqC1qOG20lUK2vxMJVGrBedoqKNxE6ujGkfCtUn26\"}}', '2021-10-11 11:49:36', '2021-10-11 11:49:36'),
(312, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2021-10-11 13:49:38\",\"updated_at\":\"2021-10-11 13:49:38\"},\"old\":{\"last_login\":\"2020-10-28 05:37:01\",\"updated_at\":\"2020-10-28 05:37:01\"}}', '2021-10-11 11:49:38', '2021-10-11 11:49:38'),
(313, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"iEAzcfix5J7nbdUlXKDsCOg7DB7sT2mYjbMtgYP5DejxTF9WREgf0rwOm6Am\"},\"old\":{\"remember_token\":\"z3qsEZLvtiVOBKgdXsAALO6dNFSuZSBQUVarrjroOBEi6i0yU4OxylFZSRDP\"}}', '2021-10-11 11:50:00', '2021-10-11 11:50:00'),
(314, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2021-10-11 13:50:06\",\"updated_at\":\"2021-10-11 13:50:06\"},\"old\":{\"last_login\":\"2020-10-28 05:36:19\",\"updated_at\":\"2020-10-28 05:36:19\"}}', '2021-10-11 11:50:06', '2021-10-11 11:50:06'),
(315, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"2L8Z4Ks6Udu3vuHwakAoEz8I1aBudSxeZmtPkIMR2K5ODGdpYSUkmKaM65Az\"},\"old\":{\"remember_token\":\"blAOMFRPuq9QMQlbmkBN89YDCalcYvkvQt000VB6C7aWD1G3fFHAP32p63sE\"}}', '2021-10-11 11:51:09', '2021-10-11 11:51:09'),
(316, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2021-10-11 13:51:13\",\"updated_at\":\"2021-10-11 13:51:13\"},\"old\":{\"last_login\":\"2021-10-11 13:49:38\",\"updated_at\":\"2021-10-11 13:49:38\"}}', '2021-10-11 11:51:13', '2021-10-11 11:51:13'),
(317, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"OI4UgONjgYqfVJQi8CGTyzpzY5OFK7oa6saij118nft1SUPe4koBG66FhnWH\"},\"old\":{\"remember_token\":\"iEAzcfix5J7nbdUlXKDsCOg7DB7sT2mYjbMtgYP5DejxTF9WREgf0rwOm6Am\"}}', '2021-10-11 11:59:31', '2021-10-11 11:59:31'),
(318, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2021-10-11 13:59:35\",\"updated_at\":\"2021-10-11 13:59:35\"},\"old\":{\"last_login\":\"2021-10-11 13:50:06\",\"updated_at\":\"2021-10-11 13:50:06\"}}', '2021-10-11 11:59:35', '2021-10-11 11:59:35'),
(319, 'default', 'updated', 3, 'App\\Components\\User\\Models\\User', 3, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"remember_token\":\"BWK8a0UzkADFzpIPZHF27AxfH3XtiyBFwA8eIIQHomC4KwW2OBfeMSGNxV7B\"},\"old\":{\"remember_token\":\"2L8Z4Ks6Udu3vuHwakAoEz8I1aBudSxeZmtPkIMR2K5ODGdpYSUkmKaM65Az\"}}', '2021-10-11 12:02:46', '2021-10-11 12:02:46'),
(320, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2021-10-11 14:02:50\",\"updated_at\":\"2021-10-11 14:02:50\"},\"old\":{\"last_login\":\"2021-10-11 13:51:13\",\"updated_at\":\"2021-10-11 13:51:13\"}}', '2021-10-11 12:02:50', '2021-10-11 12:02:50'),
(321, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2021-10-17 21:22:16\",\"updated_at\":\"2021-10-17 21:22:16\"},\"old\":{\"last_login\":\"2021-10-11 14:02:50\",\"updated_at\":\"2021-10-11 14:02:50\"}}', '2021-10-17 19:22:16', '2021-10-17 19:22:16'),
(322, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2021-10-18 04:26:13\",\"updated_at\":\"2021-10-18 04:26:13\"},\"old\":{\"last_login\":\"2021-10-17 21:22:16\",\"updated_at\":\"2021-10-17 21:22:16\"}}', '2021-10-18 02:26:13', '2021-10-18 02:26:13'),
(323, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2021-10-18 17:34:34\",\"updated_at\":\"2021-10-18 17:34:34\"},\"old\":{\"last_login\":\"2021-10-18 04:26:13\",\"updated_at\":\"2021-10-18 04:26:13\"}}', '2021-10-18 15:34:34', '2021-10-18 15:34:34'),
(324, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2021-11-16 19:15:37\",\"updated_at\":\"2021-11-16 19:15:37\"},\"old\":{\"last_login\":\"2021-10-18 17:34:34\",\"updated_at\":\"2021-10-18 17:34:34\"}}', '2021-11-16 18:15:37', '2021-11-16 18:15:37'),
(325, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2021-11-16 19:18:18\",\"updated_at\":\"2021-11-16 19:18:18\"},\"old\":{\"last_login\":\"2021-11-16 19:15:37\",\"updated_at\":\"2021-11-16 19:15:37\"}}', '2021-11-16 18:18:18', '2021-11-16 18:18:18'),
(326, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2021-11-17 13:27:37\",\"updated_at\":\"2021-11-17 13:27:37\"},\"old\":{\"last_login\":\"2021-11-16 19:18:18\",\"updated_at\":\"2021-11-16 19:18:18\"}}', '2021-11-17 12:27:37', '2021-11-17 12:27:37'),
(327, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2021-11-17 17:24:35\",\"updated_at\":\"2021-11-17 17:24:35\"},\"old\":{\"last_login\":\"2021-11-17 13:27:37\",\"updated_at\":\"2021-11-17 13:27:37\"}}', '2021-11-17 16:24:35', '2021-11-17 16:24:35'),
(328, 'default', 'updated', 1, 'App\\Components\\User\\Models\\User', 1, 'App\\Components\\User\\Models\\User', '{\"attributes\":{\"last_login\":\"2021-11-24 19:05:18\",\"updated_at\":\"2021-11-24 19:05:18\"},\"old\":{\"last_login\":\"2021-11-17 17:24:35\",\"updated_at\":\"2021-11-17 17:24:35\"}}', '2021-11-24 18:05:18', '2021-11-24 18:05:18');

-- --------------------------------------------------------

--
-- Table structure for table `categorables`
--

CREATE TABLE `categorables` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `categorable_id` int(11) NOT NULL,
  `categorable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categorables`
--

INSERT INTO `categorables` (`id`, `category_id`, `categorable_id`, `categorable_type`) VALUES
(1, 1, 1, 'App\\Project'),
(5, 3, 2, 'App\\Project'),
(11, 2, 4, 'App\\KnowladgeBase'),
(12, 2, 5, 'App\\KnowladgeBase'),
(13, 13, 5, 'App\\KnowladgeBase'),
(14, 1, 6, 'App\\KnowladgeBase'),
(15, 2, 6, 'App\\KnowladgeBase'),
(16, 14, 6, 'App\\KnowladgeBase'),
(17, 14, 7, 'App\\KnowladgeBase'),
(18, 1, 8, 'App\\KnowladgeBase'),
(19, 1, 9, 'App\\KnowladgeBase'),
(23, 16, 2, 'App\\KnowledgeBase'),
(24, 2, 1, 'App\\KnowledgeBase'),
(25, 17, 3, 'App\\KnowledgeBase'),
(26, 18, 4, 'App\\KnowledgeBase'),
(27, 19, 5, 'App\\KnowledgeBase'),
(28, 25, 3, 'App\\Project'),
(29, 1, 4, 'App\\Project'),
(30, 4, 5, 'App\\Project'),
(31, 1, 6, 'App\\Project'),
(32, 1, 7, 'App\\Project'),
(33, 1, 8, 'App\\Project'),
(34, 1, 9, 'App\\Project');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
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
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `type`, `project_id`, `created_at`, `updated_at`) VALUES
(1, 'Designing', 'projects', NULL, '2019-04-18 10:26:57', '2019-04-18 10:26:57'),
(3, 'Game Development for Android only', 'projects', NULL, '2019-04-19 05:13:33', '2019-04-19 05:13:33'),
(4, 'Hospitality', 'projects', NULL, '2019-04-22 09:01:35', '2019-04-22 09:01:35'),
(18, 'Internal Help', 'knowledge_base', NULL, '2019-04-25 03:40:11', '2019-04-25 03:40:11'),
(19, 'Getting Started', 'knowledge_base', NULL, '2019-04-25 03:40:56', '2019-04-25 03:40:56'),
(20, 'Algorithem', 'tasks', 2, '2019-05-08 03:49:02', '2019-05-08 03:49:02'),
(21, 'Advance Payment', 'expenses', NULL, '2019-05-11 09:27:19', '2019-05-11 09:27:19'),
(22, 'Extra Expense', 'expenses', NULL, '2019-05-11 09:31:03', '2019-05-11 09:31:03'),
(23, 'Support', 'tickets', NULL, '2019-08-13 09:03:56', '2019-08-13 09:03:56'),
(24, 'Maintenance', 'tickets', NULL, '2019-08-13 09:08:19', '2019-08-13 09:08:19'),
(25, 'test', 'projects', NULL, '2020-07-14 17:41:23', '2020-07-14 17:41:23'),
(26, 'ccvcv', 'tasks', 1, '2020-07-29 13:55:21', '2020-07-29 13:55:21'),
(27, 'ggggg', 'tickets', NULL, '2020-07-29 14:07:33', '2020-07-29 14:07:33'),
(28, 'building', 'tasks', 5, '2020-08-13 14:45:39', '2020-08-13 14:45:39'),
(29, 'mmm', 'projects', NULL, '2020-10-04 22:08:55', '2020-10-04 22:08:55');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `iso_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `iso_name`, `symbol`, `created_at`, `updated_at`) VALUES
(1, 'USD', '$', '2019-04-18 10:19:26', '2019-04-18 10:19:26');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `beneficiary_id_number` int(10) UNSIGNED DEFAULT NULL,
  `beneficiary_id_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_granted_date` timestamp NULL DEFAULT NULL,
  `identity_expiration_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `second_name`, `last_name`, `fourth_name`, `primary_contact_id`, `company`, `currency_id`, `tax_number`, `mobile`, `alternate_contact_no`, `email`, `website`, `city`, `state`, `zip_code`, `country`, `billing_address`, `shipping_address`, `status_id`, `source_id`, `assigned_to`, `contacted_date`, `description`, `created_by`, `deleted_at`, `created_at`, `updated_at`, `beneficiary_id_number`, `beneficiary_id_type`, `identity_granted_date`, `identity_expiration_date`) VALUES
(1, '', NULL, NULL, NULL, NULL, 'Web Experts', 1, '1010al', '923232323', '923232322', 'webexpert@test.com', 'https://www.example.com', 'Arizona', 'Arizona', '1010101', 'USA', 'Linking Street, Arizona', 'Linking Street, Arizona', 1, NULL, NULL, NULL, NULL, 1, NULL, '2019-04-18 10:20:13', '2019-04-18 10:25:09', NULL, NULL, NULL, NULL),
(2, 'ahmad', 'samer', 'yassin', 'mazen', NULL, 'Digital Ways', 1, NULL, '7890130490', NULL, 'digitalways@example.com', 'www.jjgtuy.com', NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 1, '2019-07-26 13:25:00', NULL, 1, NULL, '2019-07-25 13:50:54', '2019-07-25 13:50:54', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `favoritable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `favoritable_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `favoritable_type`, `favoritable_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'App\\Project', 2, '2019-04-18 10:29:28', '2019-04-18 10:29:28'),
(3, 1, 'App\\Project', 5, '2020-08-26 23:40:14', '2020-08-26 23:40:14'),
(4, 1, 'App\\Project', 4, '2021-10-11 12:04:45', '2021-10-11 12:04:45');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_lines`
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

--
-- Dumping data for table `invoice_lines`
--

INSERT INTO `invoice_lines` (`id`, `transaction_id`, `short_description`, `long_description`, `rate`, `quantity`, `unit`, `tax`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 'Invoice forrecording song', NULL, '5.0000', '5.0000', 'Hour', 5, '25.0000', '2019-05-10 03:00:44', '2019-05-10 03:00:44'),
(2, 2, 'Implemented Algorithem', NULL, '52.0000', '5.0000', 'Hour', 2, '260.0000', '2019-05-10 03:02:01', '2019-05-10 03:02:01'),
(3, 3, 'Design for game', NULL, '56.0000', '2.0000', 'Hour', 0, '112.0000', '2019-05-10 03:03:54', '2019-05-10 03:03:54');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_schemes`
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

--
-- Dumping data for table `invoice_schemes`
--

INSERT INTO `invoice_schemes` (`id`, `name`, `scheme_type`, `prefix`, `start_number`, `invoice_count`, `total_digits`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Custom', 'custom', 'custom', 1, 1, 5, 1, '2019-05-08 03:27:10', '2019-05-08 03:31:31'),
(2, 'Year', 'year', NULL, 1, 1, 5, 0, '2019-05-08 03:27:32', '2019-05-08 03:30:02');

-- --------------------------------------------------------

--
-- Table structure for table `knowledge_bases`
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

--
-- Dumping data for table `knowledge_bases`
--

INSERT INTO `knowledge_bases` (`id`, `title`, `description`, `show_to_employee`, `is_active`, `created_by`, `created_at`, `updated_at`) VALUES
(4, 'What is Lorem Ipsum?', '<p class=\"ql-align-justify\"><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p><br></p>', 1, 1, 1, '2019-04-25 03:40:28', '2019-04-25 03:40:28'),
(5, 'Why do we use it?', '<p class=\"ql-align-justify\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><p><br></p>', 0, 0, 1, '2019-04-25 03:41:15', '2019-04-25 03:41:15');

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
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

--
-- Dumping data for table `leaves`
--

INSERT INTO `leaves` (`id`, `user_id`, `start_date`, `end_date`, `status`, `reason`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-05-17 00:00:00', '2019-05-20 00:00:00', 'cancelled', 'Going home.', '2019-05-16 08:51:35', '2019-05-16 08:51:43'),
(2, 1, '2019-04-03 00:00:00', '2019-04-10 00:00:00', 'approved', 'Going to attend meeting.', '2019-05-16 08:52:34', '2019-05-16 08:52:54');

-- --------------------------------------------------------

--
-- Table structure for table `media`
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
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `size`, `manipulations`, `custom_properties`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(1, 'App\\Note', 5, 'employee_note', '1595006911_kazam_irpmsyng.movie', '1595006911_kazam_irpmsyng.movie.mux', 'application/octet-stream', 'local', 8543024, '[]', '[]', '[]', 1, '2020-07-17 15:28:43', '2020-07-17 15:28:43'),
(2, 'App\\Note', 5, 'employee_note', '1595006959_kazam_irpmsyng', '1595006959_kazam_irpmsyng.movie', 'inode/x-empty', 'local', 0, '[]', '[]', '[]', 2, '2020-07-17 15:29:21', '2020-07-17 15:29:21'),
(3, 'App\\Note', 6, 'project_note', '1596038276_1', '1596038276_1.png', 'image/png', 'local', 16792, '[]', '[]', '[]', 3, '2020-07-29 13:58:23', '2020-07-29 13:58:23'),
(4, 'App\\Note', 6, 'project_note', '1596038296_2', '1596038296_2.png', 'image/png', 'local', 93804, '[]', '[]', '[]', 4, '2020-07-29 13:58:23', '2020-07-29 13:58:23'),
(5, 'App\\Note', 7, 'project_note', '1596039678_1', '1596039678_1.png', 'image/png', 'local', 16792, '[]', '[]', '[]', 5, '2020-07-29 14:21:26', '2020-07-29 14:21:26'),
(6, 'App\\Note', 8, 'project_note', '1600029435_11', '1600029435_11.png', 'image/png', 'local', 82366, '[]', '[]', '[]', 6, '2020-09-14 03:37:19', '2020-09-14 03:37:19');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_02_01_054430_create_customers_table', 1),
(4, '2019_02_06_055008_create_projects_table', 1),
(5, '2019_02_06_113918_create_project_members_table', 1),
(6, '2019_02_07_110329_create_project_tasks_table', 1),
(7, '2019_02_07_111900_create_project_task_members_table', 1),
(8, '2019_02_20_054054_create_project_milestones_table', 1),
(9, '2019_02_23_053221_create_transactions_table', 1),
(10, '2019_02_23_053306_create_invoice_lines_table', 1),
(11, '2019_02_27_100259_create_transaction_payment_lines_table', 1),
(12, '2019_03_04_102320_create_activity_log_table', 1),
(13, '2019_03_06_071858_create_notes_table', 1),
(14, '2019_03_08_051449_create_categories_table', 1),
(15, '2019_03_08_075501_create_categorables_table', 1),
(16, '2019_03_08_132412_create_permission_tables', 1),
(17, '2019_03_20_112651_create_systems_table', 1),
(18, '2019_03_22_125825_add_role_type_to_roles_table', 1),
(19, '2019_03_26_132246_create_notifications_table', 1),
(20, '2019_04_02_070258_create_currencies_table', 1),
(21, '2019_04_09_062659_create_favorites_table', 1),
(22, '2019_04_24_044047_create_knowledge_bases_table', 1),
(23, '2019_05_03_131933_create_invoice_schemes_table', 1),
(24, '2019_05_13_072725_create_leaves_table', 1),
(25, '2019_07_15_072105_create_media_table', 1),
(26, '2019_07_18_102040_create_statuses_table', 1),
(27, '2019_07_18_102109_create_sources_table', 1),
(28, '2019_07_22_120415_create_reminders_table', 1),
(29, '2019_08_01_122204_add_system_settings_rows', 1),
(30, '2019_08_02_184806_create_tickets_table', 1),
(31, '2019_08_02_184839_create_ticket_comments_table', 1),
(32, '2019_08_06_182329_add_default_values_for_email_templates', 1),
(33, '2020_09_23_141847_create_project_infos_table', 2),
(38, '2020_09_24_103826_create_project_requests_table', 3),
(39, '2020_09_24_144612_add_column_to_customer_table', 4),
(40, '2020_10_03_155821_create_request_types_table', 4),
(41, '2020_10_07_142400_create_request_visits_table', 5),
(42, '2020_10_08_085957_create_visit_requests_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Components\\User\\Models\\User', 1),
(2, 'App\\Components\\User\\Models\\User', 4),
(2, 'App\\Components\\User\\Models\\User', 5),
(3, 'App\\Components\\User\\Models\\User', 2),
(3, 'App\\Components\\User\\Models\\User', 3),
(4, 'App\\Components\\User\\Models\\User', 1),
(5, 'App\\Components\\User\\Models\\User', 1),
(6, 'App\\Components\\User\\Models\\User', 2),
(7, 'App\\Components\\User\\Models\\User', 1),
(8, 'App\\Components\\User\\Models\\User', 1),
(9, 'App\\Components\\User\\Models\\User', 2),
(10, 'App\\Components\\User\\Models\\User', 1),
(11, 'App\\Components\\User\\Models\\User', 1),
(12, 'App\\Components\\User\\Models\\User', 2),
(15, 'App\\Components\\User\\Models\\User', 2),
(18, 'App\\Components\\User\\Models\\User', 2),
(20, 'App\\Components\\User\\Models\\User', 4),
(21, 'App\\Components\\User\\Models\\User', 4),
(22, 'App\\Components\\User\\Models\\User', 2),
(24, 'App\\Components\\User\\Models\\User', 4),
(25, 'App\\Components\\User\\Models\\User', 2),
(26, 'App\\Components\\User\\Models\\User', 4),
(27, 'App\\Components\\User\\Models\\User', 1),
(27, 'App\\Components\\User\\Models\\User', 4),
(28, 'App\\Components\\User\\Models\\User', 2),
(29, 'App\\Components\\User\\Models\\User', 1),
(30, 'App\\Components\\User\\Models\\User', 1),
(30, 'App\\Components\\User\\Models\\User', 4);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
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
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `notable_id`, `notable_type`, `heading`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 2, 'App\\Project', 'Where can I get some?', '<p class=\"ql-align-justify\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p><p><br></p>', 1, '2019-04-18 10:31:31', '2019-04-18 10:31:31'),
(2, 1, 'App\\Components\\User\\Models\\User', 'TEST employee note', '<p>TEST</p>', 1, '2019-04-19 03:38:05', '2019-04-19 03:38:05'),
(3, 1, 'App\\Customer', 'Where does it come from?', '<p class=\"ql-align-justify\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p class=\"ql-align-center\"><br></p>', 1, '2019-04-19 04:04:01', '2019-04-19 04:46:13'),
(4, 2, 'App\\Customer', 'What is Lorem Ipsum?', '<p><strong style=\"color: rgb(0, 0, 0);\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0);\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span></p>', 1, '2019-07-25 13:54:55', '2019-07-25 13:54:55'),
(5, 5, 'App\\Components\\User\\Models\\User', 'dfgf', '<p>vg</p>', 1, '2020-07-17 15:28:43', '2020-07-17 15:28:43'),
(6, 1, 'App\\Project', 'file1', '<p>dfgdfg</p>', 1, '2020-07-29 13:58:23', '2020-07-29 13:58:23'),
(7, 2, 'App\\Project', 'jj', '<p>kj</p>', 4, '2020-07-29 14:21:26', '2020-07-29 14:21:26'),
(8, 5, 'App\\Project', 'test', '<p>new new</p>', 1, '2020-09-14 03:37:19', '2020-09-14 03:37:19');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
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
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('0de6ddeb-4397-4766-b219-17d2df41eee7', 'App\\Notifications\\LeaveApplied', 'App\\Components\\User\\Models\\User', 1, '{\"user_id\":1,\"leave_id\":1}', '2019-05-16 08:53:39', '2019-05-16 08:52:35', '2019-05-16 08:53:39'),
('2063de03-b011-4231-81d2-75d2ca8547ae', 'App\\Notifications\\TaskCreatedNotification', 'App\\Components\\User\\Models\\User', 1, '{\"project_id\":1,\"task_id\":2}', '2019-04-18 10:36:17', '2019-04-18 10:36:07', '2019-04-18 10:36:17'),
('21d2ad0f-0873-4ac5-b413-cf08313eb5cd', 'App\\Notifications\\ProjectCreatedNotification', 'App\\Components\\User\\Models\\User', 4, '{\"project_id\":7}', NULL, '2020-08-28 01:26:37', '2020-08-28 01:26:37'),
('241cec94-3759-44b3-8f66-5bce796a0ba0', 'App\\Notifications\\ProjectCreatedNotification', 'App\\Components\\User\\Models\\User', 5, '{\"project_id\":5}', '2020-08-25 18:31:05', '2020-07-17 14:23:19', '2020-08-25 18:31:05'),
('2900bbe5-6362-4cc7-99ca-9d356a3547b3', 'App\\Notifications\\TicketCreated', 'App\\Components\\User\\Models\\User', 5, '{\"created_by\":1,\"ticket_id\":3}', '2020-08-25 18:31:05', '2020-08-25 18:26:00', '2020-08-25 18:31:05'),
('381bf190-30eb-465e-94a7-3ec7743e588e', 'App\\Notifications\\ProjectCreatedNotification', 'App\\Components\\User\\Models\\User', 1, '{\"project_id\":2}', '2019-04-18 10:30:49', '2019-04-18 10:28:59', '2019-04-18 10:36:17'),
('3827d90e-edbe-4ab3-99bc-8e0fdf59c947', 'App\\Notifications\\TaskCreatedNotification', 'App\\Components\\User\\Models\\User', 1, '{\"project_id\":2,\"task_id\":3}', '2019-05-16 08:53:39', '2019-05-08 03:49:06', '2019-05-16 08:53:39'),
('498e054f-1e98-4019-88bf-d4807b116dc1', 'App\\Notifications\\ProjectCreatedNotification', 'App\\Components\\User\\Models\\User', 1, '{\"project_id\":1}', '2019-04-18 10:36:17', '2019-04-18 10:27:31', '2019-04-18 10:36:17'),
('4dc215b9-7ac8-4ef3-ac35-ebcbfcba5b7b', 'App\\Notifications\\LeaveResponded', 'App\\Components\\User\\Models\\User', 1, '{\"leave_id\":2,\"admin\":1}', '2019-08-02 15:57:53', '2019-05-16 08:52:54', '2019-08-02 15:57:53'),
('55034e68-b333-4a3b-b5ce-a98754a5667a', 'App\\Notifications\\TicketCreated', 'App\\Components\\User\\Models\\User', 4, '{\"created_by\":1,\"ticket_id\":1}', NULL, '2019-08-13 09:05:32', '2019-08-13 09:05:32'),
('5746a80e-975d-4f11-9648-b878a69236a9', 'App\\Notifications\\ProjectCreatedNotification', 'App\\Components\\User\\Models\\User', 1, '{\"project_id\":\"3\"}', '2020-07-17 14:26:10', '2020-07-17 11:16:16', '2020-07-17 14:26:10'),
('58a5be5a-4f13-43e7-86c5-9c9c985ad824', 'App\\Notifications\\ProjectCreatedNotification', 'App\\Components\\User\\Models\\User', 5, '{\"project_id\":4}', '2020-08-25 18:31:05', '2020-07-17 14:22:21', '2020-08-25 18:31:05'),
('5b256fb6-da16-4c05-bd81-f1bd63ea2cae', 'App\\Notifications\\TaskCreatedNotification', 'App\\Components\\User\\Models\\User', 1, '{\"project_id\":2,\"task_id\":1}', '2019-04-18 10:30:49', '2019-04-18 10:30:49', '2019-04-18 10:36:17'),
('66e39c6b-136a-49d1-ac51-4c6ff4c102ec', 'App\\Notifications\\TicketCreated', 'App\\Components\\User\\Models\\User', 1, '{\"created_by\":1,\"ticket_id\":4}', '2021-11-16 18:18:45', '2020-09-17 16:24:23', '2021-11-16 18:18:45'),
('68dd6874-c8e6-4fbc-aff8-8aa03df06f65', 'App\\Notifications\\ProjectCreatedNotification', 'App\\Components\\User\\Models\\User', 4, '{\"project_id\":8}', NULL, '2020-08-28 01:28:27', '2020-08-28 01:28:27'),
('89e1fa42-ae1d-41dd-b591-97c06cc56150', 'App\\Notifications\\LeaveApplied', 'App\\Components\\User\\Models\\User', 1, '{\"user_id\":1,\"leave_id\":2}', '2019-05-16 08:53:39', '2019-05-16 08:51:36', '2019-05-16 08:53:39'),
('8e408063-bc1b-4e99-af09-e546b88b4f02', 'App\\Notifications\\TaskCreatedNotification', 'App\\Components\\User\\Models\\User', 5, '{\"project_id\":5,\"task_id\":4}', '2020-08-25 18:31:05', '2020-08-13 14:46:11', '2020-08-25 18:31:05'),
('9a9864c3-ed65-4106-8c4b-781d00433c9a', 'App\\Notifications\\TicketCreated', 'App\\Components\\User\\Models\\User', 2, '{\"created_by\":1,\"ticket_id\":1}', NULL, '2019-08-13 09:05:32', '2019-08-13 09:05:32'),
('9b3b8ba0-7e1d-4a43-9c5d-aeba9e519ab2', 'App\\Notifications\\ProjectCreatedNotification', 'App\\Components\\User\\Models\\User', 4, '{\"project_id\":9}', NULL, '2020-09-14 03:56:56', '2020-09-14 03:56:56'),
('a01bcbfb-1b29-4f75-9335-a0195b8089fc', 'App\\Notifications\\TicketCreated', 'App\\Components\\User\\Models\\User', 2, '{\"created_by\":1,\"ticket_id\":3}', NULL, '2020-08-25 18:26:00', '2020-08-25 18:26:00'),
('a513674d-ca8d-409b-ac81-052884fe0677', 'App\\Notifications\\TicketCreated', 'App\\Components\\User\\Models\\User', 2, '{\"created_by\":1,\"ticket_id\":4}', NULL, '2020-09-17 16:24:23', '2020-09-17 16:24:23'),
('af63b7a0-c4c2-4cad-bb82-d4f9d8b6bd72', 'App\\Notifications\\TicketCreated', 'App\\Components\\User\\Models\\User', 2, '{\"created_by\":1,\"ticket_id\":2}', NULL, '2019-08-13 09:08:35', '2019-08-13 09:08:35'),
('b43a8ecb-304e-4f27-be0e-cf7821f3b70e', 'App\\Notifications\\ProjectCreatedNotification', 'App\\Components\\User\\Models\\User', 1, '{\"project_id\":9}', '2021-11-16 18:18:45', '2020-09-14 03:56:56', '2021-11-16 18:18:45'),
('b8d5255f-4445-4a7e-a3a8-661fee9f96fd', 'App\\Notifications\\ProjectCreatedNotification', 'App\\Components\\User\\Models\\User', 5, '{\"project_id\":7}', NULL, '2020-08-28 01:26:37', '2020-08-28 01:26:37'),
('c3a26340-73b1-4307-957d-102fe57d1ca7', 'App\\Notifications\\ProjectCreatedNotification', 'App\\Components\\User\\Models\\User', 1, '{\"project_id\":8}', '2020-08-28 01:33:41', '2020-08-28 01:28:27', '2020-08-28 01:33:41'),
('d56bb744-dee8-4892-ba0b-e5aaddfcc3ce', 'App\\Notifications\\ProjectCreatedNotification', 'App\\Components\\User\\Models\\User', 4, '{\"project_id\":6}', NULL, '2020-08-28 01:25:17', '2020-08-28 01:25:17'),
('d57120dc-0f55-488b-abe3-aa2600a76c10', 'App\\Notifications\\ProjectCreatedNotification', 'App\\Components\\User\\Models\\User', 4, '{\"project_id\":3}', NULL, '2020-07-17 11:08:16', '2020-07-17 11:08:16'),
('e638843a-107f-4069-8a78-f8a559691e5b', 'App\\Notifications\\ProjectCreatedNotification', 'App\\Components\\User\\Models\\User', 5, '{\"project_id\":\"3\"}', '2020-08-25 18:31:05', '2020-07-17 11:14:47', '2020-08-25 18:31:05'),
('e9feafd5-17ad-4209-bc23-5c09d33392c0', 'App\\Notifications\\TicketCreated', 'App\\Components\\User\\Models\\User', 1, '{\"created_by\":1,\"ticket_id\":2}', '2020-07-16 16:58:59', '2019-08-13 09:08:35', '2020-07-16 16:58:59'),
('f87ce2b8-47cb-4e4b-b33e-700e8b10df6b', 'App\\Notifications\\TicketCreated', 'App\\Components\\User\\Models\\User', 1, '{\"created_by\":3,\"ticket_id\":5}', '2021-11-16 18:18:45', '2020-09-23 21:48:05', '2021-11-16 18:18:45'),
('f9426c07-d1ec-40e0-b85c-3c96f5d658f9', 'App\\Notifications\\LeaveResponded', 'App\\Components\\User\\Models\\User', 1, '{\"leave_id\":1,\"admin\":1}', '2019-05-16 08:53:39', '2019-05-16 08:51:43', '2019-05-16 08:53:39');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('max4solution@gmail.com', '$2y$10$4Xy22r7qqEj.zkbDnx2JPuu4N/yuDoNCSKcQTN.RzKHXAJGwxejXe', '2020-09-04 19:23:07');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'employee.create', 'web', '2019-04-18 10:03:15', '2019-04-18 10:03:15'),
(2, 'employee.view', 'web', '2019-04-18 10:03:16', '2019-04-18 10:03:16'),
(3, 'employee.edit', 'web', '2019-04-18 10:03:16', '2019-04-18 10:03:16'),
(4, 'employee.delete', 'web', '2019-04-18 10:03:16', '2019-04-18 10:03:16'),
(5, 'employeeNote.create', 'web', '2019-04-18 10:03:16', '2019-04-18 10:03:16'),
(6, 'employeeNote.view', 'web', '2019-04-18 10:03:16', '2019-04-18 10:03:16'),
(7, 'employeeNote.edit', 'web', '2019-04-18 10:03:16', '2019-04-18 10:03:16'),
(8, 'employeeNote.delete', 'web', '2019-04-18 10:03:16', '2019-04-18 10:03:16'),
(9, 'customer.create', 'web', '2019-04-18 10:03:16', '2019-04-18 10:03:16'),
(10, 'customer.view', 'web', '2019-04-18 10:03:16', '2019-04-18 10:03:16'),
(11, 'customer.edit', 'web', '2019-04-18 10:03:16', '2019-04-18 10:03:16'),
(12, 'customer.delete', 'web', '2019-04-18 10:03:16', '2019-04-18 10:03:16'),
(13, 'contact.create', 'web', '2019-04-18 10:03:16', '2019-04-18 10:03:16'),
(14, 'contact.view', 'web', '2019-04-18 10:03:17', '2019-04-18 10:03:17'),
(15, 'contact.edit', 'web', '2019-04-18 10:03:17', '2019-04-18 10:03:17'),
(16, 'contact.delete', 'web', '2019-04-18 10:03:17', '2019-04-18 10:03:17'),
(17, 'customerNote.create', 'web', '2019-04-18 10:03:17', '2019-04-18 10:03:17'),
(18, 'customerNote.view', 'web', '2019-04-18 10:03:17', '2019-04-18 10:03:17'),
(19, 'customerNote.edit', 'web', '2019-04-18 10:03:17', '2019-04-18 10:03:17'),
(20, 'customerNote.delete', 'web', '2019-04-18 10:03:17', '2019-04-18 10:03:17'),
(21, 'project.create', 'web', '2019-04-18 10:03:17', '2019-04-18 10:03:17'),
(22, 'file.create', 'web', '2019-04-18 10:03:18', '2019-04-18 10:03:18'),
(23, 'setting', 'web', '2019-04-18 10:03:18', '2019-04-18 10:03:18'),
(24, 'profile.edit', 'web', '2019-04-18 10:03:18', '2019-04-18 10:03:18'),
(25, 'sales.invoices', 'web', '2019-04-18 10:03:18', '2019-04-18 10:03:18'),
(26, 'project.1.edit', 'web', '2019-04-18 10:27:30', '2019-04-18 10:27:30'),
(27, 'project.1.status', 'web', '2019-04-18 10:27:30', '2019-04-18 10:27:30'),
(28, 'project.1.delete', 'web', '2019-04-18 10:27:30', '2019-04-18 10:27:30'),
(29, 'project.1.overview', 'web', '2019-04-18 10:27:30', '2019-04-18 10:27:30'),
(30, 'project.1.activities', 'web', '2019-04-18 10:27:30', '2019-04-18 10:27:30'),
(31, 'project.1.task.create', 'web', '2019-04-18 10:27:30', '2019-04-18 10:27:30'),
(32, 'project.1.task.view', 'web', '2019-04-18 10:27:30', '2019-04-18 10:27:30'),
(33, 'project.1.task.edit', 'web', '2019-04-18 10:27:30', '2019-04-18 10:27:30'),
(34, 'project.1.task.delete', 'web', '2019-04-18 10:27:30', '2019-04-18 10:27:30'),
(35, 'project.1.milestone.create', 'web', '2019-04-18 10:27:30', '2019-04-18 10:27:30'),
(36, 'project.1.milestone.view', 'web', '2019-04-18 10:27:30', '2019-04-18 10:27:30'),
(37, 'project.1.milestone.edit', 'web', '2019-04-18 10:27:30', '2019-04-18 10:27:30'),
(38, 'project.1.milestone.delete', 'web', '2019-04-18 10:27:30', '2019-04-18 10:27:30'),
(39, 'project.1.invoice.create', 'web', '2019-04-18 10:27:30', '2019-04-18 10:27:30'),
(40, 'project.1.invoice.view', 'web', '2019-04-18 10:27:30', '2019-04-18 10:27:30'),
(41, 'project.1.invoice.edit', 'web', '2019-04-18 10:27:30', '2019-04-18 10:27:30'),
(42, 'project.1.invoice.delete', 'web', '2019-04-18 10:27:30', '2019-04-18 10:27:30'),
(43, 'project.2.edit', 'web', '2019-04-18 10:28:58', '2019-04-18 10:28:58'),
(44, 'project.2.status', 'web', '2019-04-18 10:28:58', '2019-04-18 10:28:58'),
(45, 'project.2.delete', 'web', '2019-04-18 10:28:58', '2019-04-18 10:28:58'),
(46, 'project.2.overview', 'web', '2019-04-18 10:28:58', '2019-04-18 10:28:58'),
(47, 'project.2.activities', 'web', '2019-04-18 10:28:58', '2019-04-18 10:28:58'),
(48, 'project.2.task.create', 'web', '2019-04-18 10:28:58', '2019-04-18 10:28:58'),
(49, 'project.2.task.view', 'web', '2019-04-18 10:28:58', '2019-04-18 10:28:58'),
(50, 'project.2.task.edit', 'web', '2019-04-18 10:28:58', '2019-04-18 10:28:58'),
(51, 'project.2.task.delete', 'web', '2019-04-18 10:28:58', '2019-04-18 10:28:58'),
(52, 'project.2.milestone.create', 'web', '2019-04-18 10:28:58', '2019-04-18 10:28:58'),
(53, 'project.2.milestone.view', 'web', '2019-04-18 10:28:58', '2019-04-18 10:28:58'),
(54, 'project.2.milestone.edit', 'web', '2019-04-18 10:28:58', '2019-04-18 10:28:58'),
(55, 'project.2.milestone.delete', 'web', '2019-04-18 10:28:58', '2019-04-18 10:28:58'),
(56, 'project.2.invoice.create', 'web', '2019-04-18 10:28:58', '2019-04-18 10:28:58'),
(57, 'project.2.invoice.view', 'web', '2019-04-18 10:28:58', '2019-04-18 10:28:58'),
(58, 'project.2.invoice.edit', 'web', '2019-04-18 10:28:58', '2019-04-18 10:28:58'),
(59, 'project.2.invoice.delete', 'web', '2019-04-18 10:28:58', '2019-04-18 10:28:58'),
(94, 'knowledge_base.view', 'web', '2019-04-24 04:52:29', '2019-04-24 04:52:29'),
(95, 'knowledge_base.create', 'web', '2019-04-24 04:52:48', '2019-04-24 04:52:48'),
(96, 'knowledge_base.edit', 'web', '2019-04-24 04:53:05', '2019-04-24 04:53:05'),
(97, 'knowledge_base.delete', 'web', '2019-04-24 04:53:20', '2019-04-24 04:53:20'),
(115, 'expense.create', 'web', '2019-05-10 06:21:37', '2019-05-10 06:21:37'),
(116, 'expense.edit', 'web', '2019-05-10 06:21:59', '2019-05-10 06:21:59'),
(117, 'expense.delete', 'web', '2019-05-10 06:22:18', '2019-05-10 06:22:18'),
(118, 'leaves.create', 'web', '2019-05-14 02:49:33', '2019-05-14 02:49:33'),
(119, 'leaves.edit', 'web', '2019-05-14 02:49:49', '2019-05-14 02:49:49'),
(120, 'leaves.delete', 'web', '2019-05-14 02:50:03', '2019-05-14 02:50:03'),
(121, 'tickets.create', 'web', '2019-08-05 16:39:08', '2019-08-05 16:39:08'),
(122, 'tickets.view', 'web', '2019-08-05 16:39:13', '2019-08-05 16:39:13'),
(123, 'tickets.edit', 'web', '2019-08-05 16:39:18', '2019-08-05 16:39:18'),
(124, 'tickets.delete', 'web', '2019-08-05 16:39:21', '2019-08-05 16:39:21'),
(125, 'project.3.edit', 'web', '2020-07-17 11:08:14', '2020-07-17 11:08:14'),
(126, 'project.3.status', 'web', '2020-07-17 11:08:14', '2020-07-17 11:08:14'),
(127, 'project.3.delete', 'web', '2020-07-17 11:08:14', '2020-07-17 11:08:14'),
(128, 'project.3.overview', 'web', '2020-07-17 11:08:14', '2020-07-17 11:08:14'),
(129, 'project.3.activities', 'web', '2020-07-17 11:08:14', '2020-07-17 11:08:14'),
(130, 'project.3.task.create', 'web', '2020-07-17 11:08:14', '2020-07-17 11:08:14'),
(131, 'project.3.task.view', 'web', '2020-07-17 11:08:15', '2020-07-17 11:08:15'),
(132, 'project.3.task.edit', 'web', '2020-07-17 11:08:15', '2020-07-17 11:08:15'),
(133, 'project.3.task.delete', 'web', '2020-07-17 11:08:15', '2020-07-17 11:08:15'),
(134, 'project.3.milestone.create', 'web', '2020-07-17 11:08:15', '2020-07-17 11:08:15'),
(135, 'project.3.milestone.view', 'web', '2020-07-17 11:08:15', '2020-07-17 11:08:15'),
(136, 'project.3.milestone.edit', 'web', '2020-07-17 11:08:15', '2020-07-17 11:08:15'),
(137, 'project.3.milestone.delete', 'web', '2020-07-17 11:08:15', '2020-07-17 11:08:15'),
(138, 'project.3.invoice.create', 'web', '2020-07-17 11:08:15', '2020-07-17 11:08:15'),
(139, 'project.3.invoice.view', 'web', '2020-07-17 11:08:15', '2020-07-17 11:08:15'),
(140, 'project.3.invoice.edit', 'web', '2020-07-17 11:08:15', '2020-07-17 11:08:15'),
(141, 'project.3.invoice.delete', 'web', '2020-07-17 11:08:15', '2020-07-17 11:08:15'),
(142, 'project.4.edit', 'web', '2020-07-17 14:22:19', '2020-07-17 14:22:19'),
(143, 'project.4.status', 'web', '2020-07-17 14:22:19', '2020-07-17 14:22:19'),
(144, 'project.4.delete', 'web', '2020-07-17 14:22:19', '2020-07-17 14:22:19'),
(145, 'project.4.overview', 'web', '2020-07-17 14:22:19', '2020-07-17 14:22:19'),
(146, 'project.4.activities', 'web', '2020-07-17 14:22:19', '2020-07-17 14:22:19'),
(147, 'project.4.task.create', 'web', '2020-07-17 14:22:19', '2020-07-17 14:22:19'),
(148, 'project.4.task.view', 'web', '2020-07-17 14:22:19', '2020-07-17 14:22:19'),
(149, 'project.4.task.edit', 'web', '2020-07-17 14:22:19', '2020-07-17 14:22:19'),
(150, 'project.4.task.delete', 'web', '2020-07-17 14:22:19', '2020-07-17 14:22:19'),
(151, 'project.4.milestone.create', 'web', '2020-07-17 14:22:19', '2020-07-17 14:22:19'),
(152, 'project.4.milestone.view', 'web', '2020-07-17 14:22:19', '2020-07-17 14:22:19'),
(153, 'project.4.milestone.edit', 'web', '2020-07-17 14:22:19', '2020-07-17 14:22:19'),
(154, 'project.4.milestone.delete', 'web', '2020-07-17 14:22:19', '2020-07-17 14:22:19'),
(155, 'project.4.invoice.create', 'web', '2020-07-17 14:22:19', '2020-07-17 14:22:19'),
(156, 'project.4.invoice.view', 'web', '2020-07-17 14:22:19', '2020-07-17 14:22:19'),
(157, 'project.4.invoice.edit', 'web', '2020-07-17 14:22:19', '2020-07-17 14:22:19'),
(158, 'project.4.invoice.delete', 'web', '2020-07-17 14:22:19', '2020-07-17 14:22:19'),
(159, 'project.5.edit', 'web', '2020-07-17 14:23:17', '2020-07-17 14:23:17'),
(160, 'project.5.status', 'web', '2020-07-17 14:23:18', '2020-07-17 14:23:18'),
(161, 'project.5.delete', 'web', '2020-07-17 14:23:18', '2020-07-17 14:23:18'),
(162, 'project.5.overview', 'web', '2020-07-17 14:23:18', '2020-07-17 14:23:18'),
(163, 'project.5.activities', 'web', '2020-07-17 14:23:18', '2020-07-17 14:23:18'),
(164, 'project.5.task.create', 'web', '2020-07-17 14:23:18', '2020-07-17 14:23:18'),
(165, 'project.5.task.view', 'web', '2020-07-17 14:23:18', '2020-07-17 14:23:18'),
(166, 'project.5.task.edit', 'web', '2020-07-17 14:23:18', '2020-07-17 14:23:18'),
(167, 'project.5.task.delete', 'web', '2020-07-17 14:23:18', '2020-07-17 14:23:18'),
(168, 'project.5.milestone.create', 'web', '2020-07-17 14:23:18', '2020-07-17 14:23:18'),
(169, 'project.5.milestone.view', 'web', '2020-07-17 14:23:18', '2020-07-17 14:23:18'),
(170, 'project.5.milestone.edit', 'web', '2020-07-17 14:23:18', '2020-07-17 14:23:18'),
(171, 'project.5.milestone.delete', 'web', '2020-07-17 14:23:18', '2020-07-17 14:23:18'),
(172, 'project.5.invoice.create', 'web', '2020-07-17 14:23:18', '2020-07-17 14:23:18'),
(173, 'project.5.invoice.view', 'web', '2020-07-17 14:23:18', '2020-07-17 14:23:18'),
(174, 'project.5.invoice.edit', 'web', '2020-07-17 14:23:18', '2020-07-17 14:23:18'),
(175, 'project.5.invoice.delete', 'web', '2020-07-17 14:23:18', '2020-07-17 14:23:18'),
(176, 'project.6.edit', 'web', '2020-08-28 01:25:15', '2020-08-28 01:25:15'),
(177, 'project.6.status', 'web', '2020-08-28 01:25:15', '2020-08-28 01:25:15'),
(178, 'project.6.delete', 'web', '2020-08-28 01:25:15', '2020-08-28 01:25:15'),
(179, 'project.6.overview', 'web', '2020-08-28 01:25:15', '2020-08-28 01:25:15'),
(180, 'project.6.activities', 'web', '2020-08-28 01:25:15', '2020-08-28 01:25:15'),
(181, 'project.6.task.create', 'web', '2020-08-28 01:25:15', '2020-08-28 01:25:15'),
(182, 'project.6.task.view', 'web', '2020-08-28 01:25:15', '2020-08-28 01:25:15'),
(183, 'project.6.task.edit', 'web', '2020-08-28 01:25:15', '2020-08-28 01:25:15'),
(184, 'project.6.task.delete', 'web', '2020-08-28 01:25:15', '2020-08-28 01:25:15'),
(185, 'project.6.milestone.create', 'web', '2020-08-28 01:25:15', '2020-08-28 01:25:15'),
(186, 'project.6.milestone.view', 'web', '2020-08-28 01:25:15', '2020-08-28 01:25:15'),
(187, 'project.6.milestone.edit', 'web', '2020-08-28 01:25:15', '2020-08-28 01:25:15'),
(188, 'project.6.milestone.delete', 'web', '2020-08-28 01:25:15', '2020-08-28 01:25:15'),
(189, 'project.6.invoice.create', 'web', '2020-08-28 01:25:15', '2020-08-28 01:25:15'),
(190, 'project.6.invoice.view', 'web', '2020-08-28 01:25:16', '2020-08-28 01:25:16'),
(191, 'project.6.invoice.edit', 'web', '2020-08-28 01:25:16', '2020-08-28 01:25:16'),
(192, 'project.6.invoice.delete', 'web', '2020-08-28 01:25:16', '2020-08-28 01:25:16'),
(193, 'project.7.edit', 'web', '2020-08-28 01:26:36', '2020-08-28 01:26:36'),
(194, 'project.7.status', 'web', '2020-08-28 01:26:36', '2020-08-28 01:26:36'),
(195, 'project.7.delete', 'web', '2020-08-28 01:26:36', '2020-08-28 01:26:36'),
(196, 'project.7.overview', 'web', '2020-08-28 01:26:36', '2020-08-28 01:26:36'),
(197, 'project.7.activities', 'web', '2020-08-28 01:26:36', '2020-08-28 01:26:36'),
(198, 'project.7.task.create', 'web', '2020-08-28 01:26:36', '2020-08-28 01:26:36'),
(199, 'project.7.task.view', 'web', '2020-08-28 01:26:36', '2020-08-28 01:26:36'),
(200, 'project.7.task.edit', 'web', '2020-08-28 01:26:36', '2020-08-28 01:26:36'),
(201, 'project.7.task.delete', 'web', '2020-08-28 01:26:36', '2020-08-28 01:26:36'),
(202, 'project.7.milestone.create', 'web', '2020-08-28 01:26:36', '2020-08-28 01:26:36'),
(203, 'project.7.milestone.view', 'web', '2020-08-28 01:26:36', '2020-08-28 01:26:36'),
(204, 'project.7.milestone.edit', 'web', '2020-08-28 01:26:36', '2020-08-28 01:26:36'),
(205, 'project.7.milestone.delete', 'web', '2020-08-28 01:26:36', '2020-08-28 01:26:36'),
(206, 'project.7.invoice.create', 'web', '2020-08-28 01:26:37', '2020-08-28 01:26:37'),
(207, 'project.7.invoice.view', 'web', '2020-08-28 01:26:37', '2020-08-28 01:26:37'),
(208, 'project.7.invoice.edit', 'web', '2020-08-28 01:26:37', '2020-08-28 01:26:37'),
(209, 'project.7.invoice.delete', 'web', '2020-08-28 01:26:37', '2020-08-28 01:26:37'),
(210, 'project.8.edit', 'web', '2020-08-28 01:28:25', '2020-08-28 01:28:25'),
(211, 'project.8.status', 'web', '2020-08-28 01:28:25', '2020-08-28 01:28:25'),
(212, 'project.8.delete', 'web', '2020-08-28 01:28:25', '2020-08-28 01:28:25'),
(213, 'project.8.overview', 'web', '2020-08-28 01:28:25', '2020-08-28 01:28:25'),
(214, 'project.8.activities', 'web', '2020-08-28 01:28:25', '2020-08-28 01:28:25'),
(215, 'project.8.task.create', 'web', '2020-08-28 01:28:25', '2020-08-28 01:28:25'),
(216, 'project.8.task.view', 'web', '2020-08-28 01:28:25', '2020-08-28 01:28:25'),
(217, 'project.8.task.edit', 'web', '2020-08-28 01:28:25', '2020-08-28 01:28:25'),
(218, 'project.8.task.delete', 'web', '2020-08-28 01:28:25', '2020-08-28 01:28:25'),
(219, 'project.8.milestone.create', 'web', '2020-08-28 01:28:25', '2020-08-28 01:28:25'),
(220, 'project.8.milestone.view', 'web', '2020-08-28 01:28:26', '2020-08-28 01:28:26'),
(221, 'project.8.milestone.edit', 'web', '2020-08-28 01:28:26', '2020-08-28 01:28:26'),
(222, 'project.8.milestone.delete', 'web', '2020-08-28 01:28:26', '2020-08-28 01:28:26'),
(223, 'project.8.invoice.create', 'web', '2020-08-28 01:28:26', '2020-08-28 01:28:26'),
(224, 'project.8.invoice.view', 'web', '2020-08-28 01:28:26', '2020-08-28 01:28:26'),
(225, 'project.8.invoice.edit', 'web', '2020-08-28 01:28:26', '2020-08-28 01:28:26'),
(226, 'project.8.invoice.delete', 'web', '2020-08-28 01:28:26', '2020-08-28 01:28:26'),
(227, 'project.9.edit', 'web', '2020-09-14 03:56:53', '2020-09-14 03:56:53'),
(228, 'project.9.status', 'web', '2020-09-14 03:56:53', '2020-09-14 03:56:53'),
(229, 'project.9.delete', 'web', '2020-09-14 03:56:53', '2020-09-14 03:56:53'),
(230, 'project.9.overview', 'web', '2020-09-14 03:56:53', '2020-09-14 03:56:53'),
(231, 'project.9.activities', 'web', '2020-09-14 03:56:53', '2020-09-14 03:56:53'),
(232, 'project.9.task.create', 'web', '2020-09-14 03:56:53', '2020-09-14 03:56:53'),
(233, 'project.9.task.view', 'web', '2020-09-14 03:56:54', '2020-09-14 03:56:54'),
(234, 'project.9.task.edit', 'web', '2020-09-14 03:56:54', '2020-09-14 03:56:54'),
(235, 'project.9.task.delete', 'web', '2020-09-14 03:56:54', '2020-09-14 03:56:54'),
(236, 'project.9.milestone.create', 'web', '2020-09-14 03:56:54', '2020-09-14 03:56:54'),
(237, 'project.9.milestone.view', 'web', '2020-09-14 03:56:54', '2020-09-14 03:56:54'),
(238, 'project.9.milestone.edit', 'web', '2020-09-14 03:56:54', '2020-09-14 03:56:54'),
(239, 'project.9.milestone.delete', 'web', '2020-09-14 03:56:54', '2020-09-14 03:56:54'),
(240, 'project.9.invoice.create', 'web', '2020-09-14 03:56:54', '2020-09-14 03:56:54'),
(241, 'project.9.invoice.view', 'web', '2020-09-14 03:56:54', '2020-09-14 03:56:54'),
(242, 'project.9.invoice.edit', 'web', '2020-09-14 03:56:54', '2020-09-14 03:56:54'),
(243, 'project.9.invoice.delete', 'web', '2020-09-14 03:56:54', '2020-09-14 03:56:54');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `billing_type` enum('fixed_rate','project_hours','task_hours') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed_rate',
  `total_rate` decimal(8,2) NOT NULL DEFAULT 0.00,
  `price_per_hours` decimal(8,2) NOT NULL DEFAULT 0.00,
  `estimated_hours` decimal(8,2) NOT NULL DEFAULT 0.00,
  `estimated_cost` decimal(8,2) NOT NULL DEFAULT 0.00,
  `status` enum('not_started','in_progress','on_hold','cancelled','completed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorization_request_number` int(10) DEFAULT NULL,
  `license_number` int(10) DEFAULT NULL,
  `plot_number` int(10) DEFAULT NULL,
  `cadastral_decision_number` int(10) DEFAULT NULL,
  `lead_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `favorite` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `customer_id`, `billing_type`, `total_rate`, `price_per_hours`, `estimated_hours`, `estimated_cost`, `status`, `authorization_request_number`, `license_number`, `plot_number`, `cadastral_decision_number`, `lead_id`, `start_date`, `end_date`, `description`, `created_by`, `favorite`, `created_at`, `updated_at`) VALUES
(1, 'Al malik road', 1, 'fixed_rate', '0.00', '0.00', '0.00', '0.00', 'not_started', NULL, NULL, NULL, NULL, 1, '2019-04-18 00:00:00', '2019-06-08 00:00:00', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 1, 0, '2019-04-18 10:27:30', '2019-04-18 10:27:30'),
(2, 'Abd villa', 2, 'fixed_rate', '0.00', '0.00', '0.00', '0.00', 'in_progress', NULL, NULL, NULL, NULL, 1, '2019-04-18 00:00:00', '2019-06-15 00:00:00', 'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', 1, 0, '2019-04-18 10:28:58', '2019-04-18 10:28:58'),
(3, 'Al ryadah main road', 1, 'fixed_rate', '0.00', '0.00', '0.00', '0.00', 'in_progress', NULL, NULL, NULL, NULL, 1, '2020-07-17 00:00:00', '2020-07-25 00:00:00', '<p>test</p>', 1, 0, '2020-07-17 11:08:14', '2020-07-17 11:16:16'),
(4, 'Big Site Pro', 1, 'fixed_rate', '0.00', '0.00', '0.00', '0.00', 'in_progress', NULL, NULL, NULL, NULL, 5, '2020-07-17 00:00:00', '2020-07-31 00:00:00', '<p>sdf</p>', 1, 0, '2020-07-17 14:22:19', '2020-07-17 14:22:19'),
(5, 'ACR Building', 2, 'fixed_rate', '0.00', '0.00', '0.00', '0.00', 'in_progress', NULL, NULL, NULL, NULL, 5, '2020-07-18 00:00:00', '2020-07-29 00:00:00', '<p>sdfsdf</p>', 1, 0, '2020-07-17 14:23:17', '2020-07-17 14:24:45'),
(6, 'GHHF Tawer', 1, 'fixed_rate', '0.00', '0.00', '0.00', '0.00', 'not_started', NULL, NULL, NULL, NULL, 4, '2020-08-20 00:00:00', '2020-08-24 00:00:00', NULL, 1, 0, '2020-08-28 01:25:14', '2020-08-28 01:25:14'),
(7, 'Madina Road', 1, 'fixed_rate', '0.00', '0.00', '0.00', '0.00', 'not_started', NULL, NULL, NULL, NULL, 5, '2020-08-26 00:00:00', '2020-08-16 00:00:00', NULL, 1, 0, '2020-08-28 01:26:36', '2020-08-28 01:26:36'),
(8, 'Granb Road', 1, 'fixed_rate', '0.00', '0.00', '0.00', '0.00', 'not_started', NULL, NULL, NULL, NULL, 4, '2020-08-13 00:00:00', '2020-08-27 00:00:00', NULL, 1, 0, '2020-08-28 01:28:25', '2020-08-28 01:28:25'),
(9, 'Hyper Road', NULL, 'fixed_rate', '0.00', '0.00', '0.00', '0.00', 'on_hold', NULL, NULL, NULL, NULL, 1, '2020-09-08 00:00:00', '2020-09-14 00:00:00', NULL, 1, 0, '2020-09-14 03:56:53', '2020-09-14 03:56:53');

-- --------------------------------------------------------

--
-- Table structure for table `project_infos`
--

CREATE TABLE `project_infos` (
  `id` int(10) UNSIGNED NOT NULL,
  `authorization_request_number` int(10) UNSIGNED NOT NULL,
  `license_number` int(10) UNSIGNED NOT NULL,
  `plot_number` int(10) UNSIGNED NOT NULL,
  `cadastral_decision_number` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_members`
--

CREATE TABLE `project_members` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_members`
--

INSERT INTO `project_members` (`id`, `project_id`, `user_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 2, 4),
(5, 3, 5),
(6, 3, 1),
(7, 4, 5),
(8, 5, 5),
(9, 6, 4),
(10, 7, 4),
(11, 7, 5),
(12, 8, 1),
(13, 8, 4),
(14, 9, 4),
(15, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `project_milestones`
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

--
-- Dumping data for table `project_milestones`
--

INSERT INTO `project_milestones` (`id`, `project_id`, `name`, `due_date`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'cffff', '2020-07-15 12:00:00', '<p>fgfg</p>', 1, '2020-07-26 18:22:50', '2020-07-26 18:22:50'),
(2, 5, 'test', '2020-09-19 00:00:00', '<p>khkjhkj</p>', 1, '2020-09-14 03:39:22', '2020-09-14 03:39:22');

-- --------------------------------------------------------

--
-- Table structure for table `project_requests`
--

CREATE TABLE `project_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `authorization_request_number` int(10) UNSIGNED DEFAULT NULL,
  `license_number` int(10) UNSIGNED DEFAULT NULL,
  `type_of_request` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plot_number` int(10) UNSIGNED DEFAULT NULL,
  `cadastral_decision_number` int(10) UNSIGNED DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `sent` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_requests`
--

INSERT INTO `project_requests` (`id`, `name`, `customer_id`, `description`, `start_date`, `end_date`, `authorization_request_number`, `license_number`, `type_of_request`, `plot_number`, `cadastral_decision_number`, `status`, `sent`, `created_at`, `updated_at`) VALUES
(13, 'rytryt', 3, '<p>ghdfdgfd	</p>', '2020-10-19 00:00:00', '2020-10-22 00:00:00', 34545543, 6657657, 'build', 546464, 454664, 'accepted', 0, '2020-10-02 15:48:51', '2020-10-02 17:17:42'),
(14, 'jlkjlkj', 3, '<p>hjkhkhk	</p>', '2020-10-26 00:00:00', '2020-10-20 00:00:00', 879897, 78797, 'build', 65757575, 76786876, 'accepted', 0, '2020-10-02 17:05:50', '2020-10-02 17:14:38'),
(16, 'test', 3, '<p>hkjhkhjk	</p>', '2020-10-06 00:00:00', '2020-10-22 00:00:00', 687687, 87979, 'build', 0, 6768, 'pending', 0, '2020-10-06 22:00:52', '2020-10-06 22:00:52'),
(17, 'hello', 3, '<p>bbbbbbbbbbbb</p>', '2020-10-01 00:00:00', '2020-10-14 00:00:00', 6768, 5677, 'build', 79879, 66786, 'pending', 0, '2020-10-08 17:33:39', '2020-10-08 17:33:39'),
(19, 'testtttttttt', 2, '<p>hgjgj</p>', '2020-10-24 00:00:00', '2020-10-06 00:00:00', 9800, 798, 'kjhk', 8797, 78686, 'accepted', 1, '2020-10-17 01:44:59', '2020-10-17 01:50:04');

-- --------------------------------------------------------

--
-- Table structure for table `project_tasks`
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
-- Dumping data for table `project_tasks`
--

INSERT INTO `project_tasks` (`id`, `project_id`, `task_id`, `category_id`, `subject`, `hourly_rate`, `start_date`, `due_date`, `priority`, `description`, `created_by`, `show_to_customer`, `is_completed`, `created_at`, `updated_at`) VALUES
(1, 2, '#1', NULL, 'Cras dictum libero eget erat rhoncus fermentum.', '0.00', '2019-04-18 00:00:00', '2019-05-17 00:00:00', 'medium', '<p class=\"ql-align-justify\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p><p><br></p>', 1, 1, 0, '2019-04-18 10:30:49', '2020-08-13 14:55:30'),
(2, 1, '#2', 26, 'Song recording', '0.00', '2019-04-18 00:00:00', '2019-04-20 00:00:00', 'high', NULL, 1, 0, 0, '2019-04-18 10:36:07', '2020-07-29 13:55:59'),
(3, 2, '#3', 20, 'implementing algorithem for game', '0.00', '2019-05-16 00:00:00', '2019-05-15 00:00:00', 'medium', '<h1 class=\"ql-align-justify\">Minimax Algorithm in Game Theory | Set 1 (Introduction)</h1><p class=\"ql-align-justify\"><br></p><p>Minimax is a kind of&nbsp;<a href=\"https://www.geeksforgeeks.org/tag/backtracking/\" target=\"_blank\" style=\"color: rgb(236, 78, 32);\">backtracking</a>&nbsp;algorithm that is used in decision making and game theory to find the optimal move for a player, assuming that your opponent also plays optimally. It is widely used in two player turn-based games such as Tic-Tac-Toe, Backgammon, Mancala, Chess, etc.</p><p>In Minimax the two players are called maximizer and minimizer. The&nbsp;<strong>maximizer</strong>&nbsp;tries to get the highest score possible while the&nbsp;<strong>minimizer</strong>&nbsp;tries to do the opposite and get the lowest score possible.</p><p class=\"ql-align-justify\">Every board state has a value associated with it. In a given state if the maximizer has upper hand then, the score of the board will tend to be some positive value. If the minimizer has the upper hand in that board state then it will tend to be some negative value. The values of the board are calculated by some heuristics which are unique for every type of game.</p><p class=\"ql-align-justify\"><br></p><p><a href=\"https://www.geeksforgeeks.org/minimax-algorithm-in-game-theory-set-1-introduction/\" target=\"_blank\"><strong><em>to read more...</em></strong></a></p>', 1, 0, 0, '2019-05-08 03:49:06', '2019-05-08 03:49:06');

-- --------------------------------------------------------

--
-- Table structure for table `project_task_members`
--

CREATE TABLE `project_task_members` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_task_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_task_members`
--

INSERT INTO `project_task_members` (`id`, `project_task_id`, `user_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
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

--
-- Dumping data for table `reminders`
--

INSERT INTO `reminders` (`id`, `remindable_id`, `remindable_type`, `remind_for`, `remind_on`, `remind_to`, `send_email`, `notes`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 2, 'App\\Customer', 'Talk to Lead (Digital Ways)', '2019-07-26 13:00:00', 1, 1, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.', 1, '2019-07-25 13:56:17', '2019-07-25 13:56:17');

-- --------------------------------------------------------

--
-- Table structure for table `request_types`
--

CREATE TABLE `request_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `request_types`
--

INSERT INTO `request_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'test', '2020-10-04 16:39:39', '2020-10-04 16:39:39'),
(2, 'new', '2020-10-04 16:46:56', '2020-10-04 16:46:56'),
(3, 'last', '2020-10-04 16:47:45', '2020-10-04 16:47:45'),
(4, 'kjhkjh', '2020-10-04 16:52:11', '2020-10-04 16:52:11'),
(5, 'yruryutuy', '2020-10-04 16:54:09', '2020-10-04 16:54:09'),
(6, 'bnmbmb', '2020-10-04 16:55:27', '2020-10-04 16:55:27'),
(7, 'hgjhgj', '2020-10-04 17:13:37', '2020-10-04 17:13:37'),
(8, 'good', '2020-10-04 17:15:12', '2020-10-04 17:15:12'),
(9, 'm,nmn,', '2020-10-04 17:42:54', '2020-10-04 17:42:54'),
(10, 'vbvn', '2020-10-04 17:43:31', '2020-10-04 17:43:31'),
(11, 'bbb', '2020-10-04 21:33:40', '2020-10-04 21:33:40'),
(12, 'kkkk', '2020-10-04 21:34:14', '2020-10-04 21:34:14'),
(13, 'mn,mn,', '2020-10-04 23:25:13', '2020-10-04 23:25:13'),
(14, 'hjkhk', '2020-10-04 23:30:32', '2020-10-04 23:30:32'),
(15, 'kkljl', '2020-10-06 16:33:19', '2020-10-06 16:33:19'),
(16, 'metre', '2020-10-06 16:37:19', '2020-10-06 16:37:19'),
(17, 'rola', '2020-10-07 21:44:09', '2020-10-07 21:44:09'),
(18, 'nnnnn', '2020-10-07 22:29:10', '2020-10-07 22:29:10'),
(19, 'ooooo', '2020-10-08 16:20:33', '2020-10-08 16:20:33');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('employee','contact','project') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `type`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'web', NULL, '2019-04-18 10:03:18', '2019-04-18 10:03:18'),
(2, 'employee', 'web', 'employee', '2019-04-18 10:03:18', '2019-04-18 10:03:18'),
(3, 'contact', 'web', 'contact', '2019-04-18 10:03:18', '2019-04-18 10:03:18'),
(4, 'lead.1', 'web', 'project', '2019-04-18 10:27:30', '2019-04-18 10:27:30'),
(5, 'member.1', 'web', 'project', '2019-04-18 10:27:30', '2019-04-18 10:27:30'),
(6, 'customer.1', 'web', 'project', '2019-04-18 10:27:30', '2019-04-18 10:27:30'),
(7, 'lead.2', 'web', 'project', '2019-04-18 10:28:58', '2019-04-18 10:28:58'),
(8, 'member.2', 'web', 'project', '2019-04-18 10:28:59', '2019-04-18 10:28:59'),
(9, 'customer.2', 'web', 'project', '2019-04-18 10:28:59', '2019-04-18 10:28:59'),
(10, 'lead.3', 'web', 'project', '2020-07-17 11:08:15', '2020-07-17 11:08:15'),
(11, 'member.3', 'web', 'project', '2020-07-17 11:08:15', '2020-07-17 11:08:15'),
(12, 'customer.3', 'web', 'project', '2020-07-17 11:08:15', '2020-07-17 11:08:15'),
(13, 'lead.4', 'web', 'project', '2020-07-17 14:22:19', '2020-07-17 14:22:19'),
(14, 'member.4', 'web', 'project', '2020-07-17 14:22:20', '2020-07-17 14:22:20'),
(15, 'customer.4', 'web', 'project', '2020-07-17 14:22:20', '2020-07-17 14:22:20'),
(16, 'lead.5', 'web', 'project', '2020-07-17 14:23:18', '2020-07-17 14:23:18'),
(17, 'member.5', 'web', 'project', '2020-07-17 14:23:18', '2020-07-17 14:23:18'),
(18, 'customer.5', 'web', 'project', '2020-07-17 14:23:19', '2020-07-17 14:23:19'),
(19, 'Admin', 'web', 'employee', '2020-07-18 09:15:34', '2020-07-18 09:15:34'),
(20, 'lead.6', 'web', 'project', '2020-08-28 01:25:16', '2020-08-28 01:25:16'),
(21, 'member.6', 'web', 'project', '2020-08-28 01:25:16', '2020-08-28 01:25:16'),
(22, 'customer.6', 'web', 'project', '2020-08-28 01:25:16', '2020-08-28 01:25:16'),
(23, 'lead.7', 'web', 'project', '2020-08-28 01:26:37', '2020-08-28 01:26:37'),
(24, 'member.7', 'web', 'project', '2020-08-28 01:26:37', '2020-08-28 01:26:37'),
(25, 'customer.7', 'web', 'project', '2020-08-28 01:26:37', '2020-08-28 01:26:37'),
(26, 'lead.8', 'web', 'project', '2020-08-28 01:28:26', '2020-08-28 01:28:26'),
(27, 'member.8', 'web', 'project', '2020-08-28 01:28:26', '2020-08-28 01:28:26'),
(28, 'customer.8', 'web', 'project', '2020-08-28 01:28:26', '2020-08-28 01:28:26'),
(29, 'lead.9', 'web', 'project', '2020-09-14 03:56:54', '2020-09-14 03:56:54'),
(30, 'member.9', 'web', 'project', '2020-09-14 03:56:54', '2020-09-14 03:56:54'),
(31, 'customer.9', 'web', 'project', '2020-09-14 03:56:54', '2020-09-14 03:56:54');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 19),
(2, 19),
(3, 19),
(4, 19),
(5, 19),
(6, 19),
(7, 19),
(8, 19),
(9, 19),
(10, 19),
(11, 19),
(12, 19),
(13, 19),
(14, 19),
(15, 19),
(16, 19),
(17, 19),
(18, 19),
(19, 19),
(20, 19),
(21, 2),
(21, 19),
(23, 19),
(24, 2),
(24, 3),
(24, 19),
(25, 19),
(26, 4),
(27, 4),
(28, 4),
(29, 4),
(29, 5),
(29, 6),
(30, 4),
(30, 5),
(30, 6),
(31, 4),
(31, 5),
(31, 6),
(32, 4),
(32, 5),
(32, 6),
(33, 4),
(33, 5),
(33, 6),
(34, 4),
(34, 5),
(34, 6),
(35, 4),
(35, 5),
(35, 6),
(36, 4),
(36, 5),
(36, 6),
(37, 4),
(37, 5),
(37, 6),
(38, 4),
(38, 5),
(38, 6),
(39, 4),
(40, 4),
(40, 6),
(41, 4),
(42, 4),
(43, 7),
(44, 7),
(45, 7),
(46, 7),
(46, 8),
(46, 9),
(47, 7),
(47, 8),
(47, 9),
(48, 7),
(48, 8),
(48, 9),
(49, 7),
(49, 8),
(49, 9),
(50, 7),
(50, 8),
(50, 9),
(51, 7),
(51, 8),
(51, 9),
(52, 7),
(52, 8),
(52, 9),
(53, 7),
(53, 8),
(53, 9),
(54, 7),
(54, 8),
(54, 9),
(55, 7),
(55, 8),
(55, 9),
(56, 7),
(57, 7),
(57, 9),
(58, 7),
(59, 7),
(94, 2),
(94, 19),
(95, 19),
(96, 19),
(97, 19),
(115, 19),
(116, 19),
(117, 19),
(118, 2),
(118, 19),
(119, 2),
(119, 19),
(120, 19),
(121, 2),
(121, 3),
(121, 19),
(122, 2),
(122, 3),
(122, 19),
(123, 2),
(123, 19),
(124, 2),
(124, 19),
(125, 10),
(126, 10),
(127, 10),
(128, 10),
(128, 11),
(128, 12),
(129, 10),
(129, 11),
(129, 12),
(130, 10),
(130, 11),
(130, 12),
(131, 10),
(131, 11),
(131, 12),
(132, 10),
(132, 11),
(132, 12),
(133, 10),
(133, 11),
(133, 12),
(134, 10),
(134, 11),
(134, 12),
(135, 10),
(135, 11),
(135, 12),
(136, 10),
(136, 11),
(136, 12),
(137, 10),
(137, 11),
(137, 12),
(138, 10),
(139, 10),
(139, 12),
(140, 10),
(141, 10),
(142, 13),
(143, 13),
(144, 13),
(145, 13),
(145, 14),
(145, 15),
(146, 13),
(146, 14),
(146, 15),
(147, 13),
(147, 14),
(147, 15),
(148, 13),
(148, 14),
(148, 15),
(149, 13),
(149, 14),
(149, 15),
(150, 13),
(150, 14),
(150, 15),
(151, 13),
(151, 14),
(151, 15),
(152, 13),
(152, 14),
(152, 15),
(153, 13),
(153, 14),
(153, 15),
(154, 13),
(154, 14),
(154, 15),
(155, 13),
(156, 13),
(156, 15),
(157, 13),
(158, 13),
(159, 16),
(160, 16),
(161, 16),
(162, 16),
(162, 17),
(162, 18),
(163, 16),
(163, 17),
(163, 18),
(164, 16),
(164, 17),
(164, 18),
(165, 16),
(165, 17),
(165, 18),
(166, 16),
(166, 17),
(166, 18),
(167, 16),
(167, 17),
(167, 18),
(168, 16),
(168, 17),
(168, 18),
(169, 16),
(169, 17),
(169, 18),
(170, 16),
(170, 17),
(170, 18),
(171, 16),
(171, 17),
(171, 18),
(172, 16),
(173, 16),
(173, 18),
(174, 16),
(175, 16),
(176, 20),
(177, 20),
(178, 20),
(179, 20),
(179, 21),
(179, 22),
(180, 20),
(180, 21),
(180, 22),
(181, 20),
(181, 21),
(181, 22),
(182, 20),
(182, 21),
(182, 22),
(183, 20),
(183, 21),
(183, 22),
(184, 20),
(184, 21),
(184, 22),
(185, 20),
(185, 21),
(185, 22),
(186, 20),
(186, 21),
(186, 22),
(187, 20),
(187, 21),
(187, 22),
(188, 20),
(188, 21),
(188, 22),
(189, 20),
(190, 20),
(190, 22),
(191, 20),
(192, 20),
(193, 23),
(194, 23),
(195, 23),
(196, 23),
(196, 24),
(196, 25),
(197, 23),
(197, 24),
(197, 25),
(198, 23),
(198, 24),
(198, 25),
(199, 23),
(199, 24),
(199, 25),
(200, 23),
(200, 24),
(200, 25),
(201, 23),
(201, 24),
(201, 25),
(202, 23),
(202, 24),
(202, 25),
(203, 23),
(203, 24),
(203, 25),
(204, 23),
(204, 24),
(204, 25),
(205, 23),
(205, 24),
(205, 25),
(206, 23),
(207, 23),
(207, 25),
(208, 23),
(209, 23),
(210, 26),
(211, 26),
(212, 26),
(213, 26),
(213, 27),
(213, 28),
(214, 26),
(214, 27),
(214, 28),
(215, 26),
(215, 27),
(215, 28),
(216, 26),
(216, 27),
(216, 28),
(217, 26),
(217, 27),
(217, 28),
(218, 26),
(218, 27),
(218, 28),
(219, 26),
(219, 27),
(219, 28),
(220, 26),
(220, 27),
(220, 28),
(221, 26),
(221, 27),
(221, 28),
(222, 26),
(222, 27),
(222, 28),
(223, 26),
(224, 26),
(224, 28),
(225, 26),
(226, 26),
(227, 29),
(228, 29),
(229, 29),
(230, 29),
(230, 30),
(230, 31),
(231, 29),
(231, 30),
(231, 31),
(232, 29),
(232, 30),
(232, 31),
(233, 29),
(233, 30),
(233, 31),
(234, 29),
(234, 30),
(234, 31),
(235, 29),
(235, 30),
(235, 31),
(236, 29),
(236, 30),
(236, 31),
(237, 29),
(237, 30),
(237, 31),
(238, 29),
(238, 30),
(238, 31),
(239, 29),
(239, 30),
(239, 31),
(240, 29),
(241, 29),
(241, 31),
(242, 29),
(243, 29);

-- --------------------------------------------------------

--
-- Table structure for table `sources`
--

CREATE TABLE `sources` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sources`
--

INSERT INTO `sources` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'LinkedIn', '2019-07-25 13:48:25', '2019-07-25 13:48:25'),
(2, 'Facebook', '2019-07-25 13:48:37', '2019-07-25 13:48:37'),
(3, 'Twitter', '2019-07-25 13:48:52', '2019-07-25 13:48:52'),
(4, 'Trade Show', '2019-07-25 13:48:52', '2019-07-25 13:48:52'),
(5, 'Referral', '2019-07-25 13:48:52', '2019-07-25 13:48:52');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Customer', '2020-07-14 16:59:58', '2020-07-14 16:59:58'),
(2, 'New', '2019-07-25 13:49:13', '2019-07-25 13:49:13'),
(3, 'Working', '2019-07-25 13:49:13', '2019-07-25 13:49:13'),
(4, 'Open', '2019-07-25 13:49:13', '2019-07-25 13:49:13'),
(5, 'Qualified', '2019-07-25 13:49:13', '2019-07-25 13:49:13'),
(6, 'Unqualified', '2019-07-25 13:49:13', '2019-07-25 13:49:13');

-- --------------------------------------------------------

--
-- Table structure for table `systems`
--

CREATE TABLE `systems` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `systems`
--

INSERT INTO `systems` (`id`, `key`, `value`) VALUES
(1, 'invoice_reminder_template', '{\"invoice_reminder_email_subject\":\"Invoice Reminder from {business_name}\",\"invoice_reminder_email_body\":\"<p>Dear {customer_name},<\\/p>\\n\\n                                    <p>Your invoice number for {project_name} is {invoice_number} and due date for this is {due_date}<br \\/>\\n                                    \\n                                    <p>Thank you for the business.<\\/p>\\n                                    <p><br><\\/p>\\n                                    <p>Regards,<\\/p> <br>\\n                                    <p>{business_name}<\\/p>\",\"invoice_reminder_attachment\":1}'),
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
(19, 'date_format', 'm-d-Y'),
(20, 'time_format', '12'),
(21, 'currency_id', '1'),
(22, 'logo', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
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

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `reference_no`, `title`, `category_id`, `priority`, `description`, `status`, `assigned_to`, `customer_id`, `created_by`, `updated_by`, `closed_at`, `created_at`, `updated_at`) VALUES
(1, 'ticket#1', 'Help adding discount.', 23, 'high', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc', 'open', 4, 1, 1, 1, '2020-09-16 20:34:39', '2019-08-13 09:05:31', '2020-09-17 03:34:39'),
(2, 'ticket#2', 'Help regarding app maintenance', 24, 'medium', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source', 'open', 1, 1, 1, 1, NULL, '2019-08-13 09:08:35', '2019-08-13 09:08:35'),
(3, 'ticket#3', 'sds', 27, 'low', 'sfsfsdfdsf', 'open', 5, 1, 1, 1, NULL, '2020-08-25 18:25:59', '2020-08-25 18:25:59'),
(4, 'ticket#4', 'Test', 23, 'low', 'new tesr', 'open', 1, 1, 1, 1, NULL, '2020-09-17 16:24:23', '2020-09-17 16:24:47'),
(5, 'ticket#5', 'test', 23, NULL, 'hello', 'new', NULL, 2, 3, 3, NULL, '2020-09-23 21:48:05', '2020-09-23 21:48:05');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_comments`
--

CREATE TABLE `ticket_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `ticket_id` int(10) UNSIGNED NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_comments`
--

INSERT INTO `ticket_comments` (`id`, `ticket_id`, `comment`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 4, 'ghjhgj', 1, '2020-09-17 16:24:46', '2020-09-17 16:24:46');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
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

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `project_id`, `ref_no`, `category_id`, `expense_for`, `type`, `status`, `title`, `customer_id`, `contact_id`, `invoice_scheme_id`, `transaction_date`, `due_date`, `discount_type`, `discount_amount`, `total`, `terms`, `notes`, `payment_status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'custom-00001', NULL, NULL, 'invoice', 'final', 'Invoice forrecording song', 1, NULL, 1, '2019-05-11', '2019-05-30', 'fixed', '1.0000', '25.2500', 'Terms', 'Notes', 'paid', 1, '2019-05-10 03:00:44', '2019-05-20 10:22:11'),
(2, 2, '2019-00001', NULL, NULL, 'invoice', 'final', 'Implemented Algorithem', 1, NULL, 2, '2019-05-11', '2019-05-11', 'fixed', '2.0000', '263.2000', 'Terms', 'Notes', 'partial', 1, '2019-05-10 03:02:01', '2019-05-20 10:22:28'),
(3, 2, 'estimate1883092509', NULL, NULL, 'invoice', 'estimate', 'Desgin for game', 1, NULL, 2, '2019-05-18', '2019-05-15', 'fixed', '2.0000', '110.0000', 'Terms', 'Notes', 'due', 1, '2019-05-10 03:03:54', '2019-05-10 03:03:54'),
(4, 2, '12365', 21, 1, 'expense', 'final', NULL, NULL, NULL, NULL, '2019-05-08', '2019-05-09', 'fixed', '0.0000', '562.0000', NULL, 'to be paid', 'due', 1, '2019-05-11 09:27:50', '2019-05-11 09:27:50'),
(5, 1, '326', 22, 1, 'expense', 'final', NULL, NULL, NULL, NULL, '2019-05-14', '2019-05-18', 'fixed', '0.0000', '235.0000', NULL, 'not paid', 'due', 1, '2019-05-11 09:31:33', '2019-05-11 09:32:12');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_payment_lines`
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

--
-- Dumping data for table `transaction_payment_lines`
--

INSERT INTO `transaction_payment_lines` (`id`, `transaction_id`, `amount`, `conversion_rate`, `paid_on`, `payment_details`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, '25.2500', '1.00', '2019-05-21', 'Paid', 1, '2019-05-20 10:22:11', '2019-05-20 10:22:11'),
(2, 2, '23.2000', '1.00', '2019-05-21', NULL, 1, '2019-05-20 10:22:28', '2019-05-20 10:22:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
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
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `active` timestamp NULL DEFAULT NULL,
  `activation_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `alternate_num`, `home_address`, `current_address`, `address`, `skype`, `linkedin`, `facebook`, `twitter`, `birth_date`, `guardian_name`, `gender`, `account_holder_name`, `account_no`, `bank_name`, `bank_identifier_code`, `branch_location`, `tax_payer_id`, `note`, `password`, `sticky_notes`, `created_by`, `customer_id`, `last_login`, `active`, `activation_key`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Superadmin', 'admin@example.com', '900909090', '10190190', NULL, NULL, NULL, 'sky', 'www.linkedin.com', 'www.fb.com', 'www.twitter.com', '1985-01-01', 'Test', 'male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$IaqWf4d8u4F/qD6JDOBI5exa/nDOQVJsETM0KzSKMhVopn04mAwBS', 'dfgdfg\n\nqsdqs', NULL, NULL, '2021-11-24 18:05:18', '2019-04-18 10:03:18', 'f25ea9af-9c92-4e3a-8a74-b6415e212ad9', 'OI4UgONjgYqfVJQi8CGTyzpzY5OFK7oa6saij118nft1SUPe4koBG66FhnWH', '2019-04-18 10:03:19', '2021-11-24 18:05:18'),
(2, 'Mike', 'customer@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '$2y$10$IaqWf4d8u4F/qD6JDOBI5exa/nDOQVJsETM0KzSKMhVopn04mAwBS', 'This is stick note area. Anything you write here is auto-saved', 1, 1, '2020-07-18 13:50:38', NULL, NULL, 'kbmOuWFOpMU7ZjehYeZSn952P9JMzqYCqBNnHczkXtOxUYjvd9QvnoeiEOjB', '2019-04-18 10:26:19', '2020-08-25 21:42:00'),
(3, 'John Tyson', 'digitalways@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$IaqWf4d8u4F/qD6JDOBI5exa/nDOQVJsETM0KzSKMhVopn04mAwBS', 'This is stick note area. Anything you write here is auto-saved', NULL, 2, '2021-10-11 11:59:35', NULL, NULL, 'BWK8a0UzkADFzpIPZHF27AxfH3XtiyBFwA8eIIQHomC4KwW2OBfeMSGNxV7B', '2019-07-25 13:50:55', '2021-10-11 11:59:35'),
(4, 'Donald Black', 'employee@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$IaqWf4d8u4F/qD6JDOBI5exa/nDOQVJsETM0KzSKMhVopn04mAwBS', 'This is stick note area. Anything you write here is auto-saved', NULL, NULL, '2020-07-29 14:26:25', '2020-07-28 22:00:00', NULL, 'clAEfyXiEiTRcp4zKyCerY62FxkxVBEgn4jCrhSrYiQAocMqcFm2VCTMDUCT', '2019-07-30 05:45:43', '2020-07-29 14:26:25'),
(5, 'max', 'max4solution@gmail.com', NULL, NULL, 'place du 8 Mai 1945', 'place du 8 Mai 1945', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$vDamCmDoyV/INyGOYsAOxef4riqBrOmmHy4Y9BInEua09NRfWeDA2', NULL, NULL, NULL, '2020-09-20 16:09:50', '2020-09-20 07:00:00', NULL, 'RdvfK6t671IpKvnE0aDeu24xGDENPFyrxuRrVegVCSaQQ0xMAZStB3IZy891', '2020-07-17 11:14:15', '2020-09-20 17:25:20');

-- --------------------------------------------------------

--
-- Table structure for table `visit_requests`
--

CREATE TABLE `visit_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `request_type_id` int(10) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` enum('low','medium','high','urgent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('new','open','closed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `sent` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visit_requests`
--

INSERT INTO `visit_requests` (`id`, `title`, `customer_id`, `project_id`, `request_type_id`, `description`, `priority`, `status`, `sent`, `created_at`, `updated_at`) VALUES
(9, 'Abd villa', 2, 2, 12, 'n,n,', NULL, '', 1, NULL, '2020-10-27 22:03:17'),
(10, 'build submain Entrance', 2, 2, 2, 'kjhkhk', NULL, 'new', 1, NULL, '2021-10-11 11:50:51'),
(12, 'Build bath', 2, 5, 1, 'bmnbm', NULL, 'new', 0, NULL, NULL),
(14, 'hhh', 1, 2, 2, 'hkjkhk', NULL, '', 1, NULL, NULL),
(18, 'Maintenance main Entrance', 2, 3, 2, 'Maintenance main Entrance', NULL, '', 1, NULL, NULL),
(20, 'Build Cuisine', 2, 2, 2, 'Build Cuisine', NULL, 'new', 0, NULL, NULL),
(21, 'Build the main hall', 2, 5, 2, 'Build the main hall', NULL, 'new', 0, NULL, NULL),
(22, 'Build the small hall', 2, 5, 2, 'Build the small hall', NULL, 'new', 1, NULL, '2021-10-11 12:02:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

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
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

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
  ADD KEY `projects_created_by_index` (`created_by`);

--
-- Indexes for table `project_infos`
--
ALTER TABLE `project_infos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_infos_project_id_foreign` (`project_id`);

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
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `users_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `visit_requests`
--
ALTER TABLE `visit_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visit_requests_customer_id_foreign` (`customer_id`),
  ADD KEY `visit_requests_project_id_foreign` (`project_id`),
  ADD KEY `visit_requests_request_type_id_foreign` (`request_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=329;

--
-- AUTO_INCREMENT for table `categorables`
--
ALTER TABLE `categorables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `invoice_lines`
--
ALTER TABLE `invoice_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `knowledge_bases`
--
ALTER TABLE `knowledge_bases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=244;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `project_infos`
--
ALTER TABLE `project_infos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_members`
--
ALTER TABLE `project_members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `project_milestones`
--
ALTER TABLE `project_milestones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `project_requests`
--
ALTER TABLE `project_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `project_tasks`
--
ALTER TABLE `project_tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `project_task_members`
--
ALTER TABLE `project_task_members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `request_types`
--
ALTER TABLE `request_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `sources`
--
ALTER TABLE `sources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `systems`
--
ALTER TABLE `systems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transaction_payment_lines`
--
ALTER TABLE `transaction_payment_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `visit_requests`
--
ALTER TABLE `visit_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice_lines`
--
ALTER TABLE `invoice_lines`
  ADD CONSTRAINT `invoice_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leaves`
--
ALTER TABLE `leaves`
  ADD CONSTRAINT `leaves_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_infos`
--
ALTER TABLE `project_infos`
  ADD CONSTRAINT `project_infos_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_members`
--
ALTER TABLE `project_members`
  ADD CONSTRAINT `project_members_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_milestones`
--
ALTER TABLE `project_milestones`
  ADD CONSTRAINT `project_milestones_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_tasks`
--
ALTER TABLE `project_tasks`
  ADD CONSTRAINT `project_tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_task_members`
--
ALTER TABLE `project_task_members`
  ADD CONSTRAINT `project_task_members_project_task_id_foreign` FOREIGN KEY (`project_task_id`) REFERENCES `project_tasks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tickets_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `tickets_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tickets_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tickets_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  ADD CONSTRAINT `ticket_comments_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ticket_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_for_foreign` FOREIGN KEY (`expense_for`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_payment_lines`
--
ALTER TABLE `transaction_payment_lines`
  ADD CONSTRAINT `transaction_payment_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `visit_requests`
--
ALTER TABLE `visit_requests`
  ADD CONSTRAINT `visit_requests_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `visit_requests_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `visit_requests_request_type_id_foreign` FOREIGN KEY (`request_type_id`) REFERENCES `request_types` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
