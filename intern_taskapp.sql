-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2022 at 11:05 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `intern_taskapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(16, '2014_10_12_000000_create_users_table', 1),
(17, '2014_10_12_100000_create_password_resets_table', 1),
(18, '2019_08_19_000000_create_failed_jobs_table', 1),
(19, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(20, '2022_10_10_152322_create_projectlist', 1),
(21, '2022_10_10_152357_create_tasklist', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `project_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_desc` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_notes` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `user_id`, `project_name`, `project_desc`, `project_notes`, `is_public`, `created_at`, `updated_at`) VALUES
(9, 1, 'OneMedy', NULL, NULL, 0, '2022-10-12 23:23:40', '2022-10-12 23:23:40'),
(14, 6, 'josh', NULL, NULL, 0, '2022-10-12 21:29:27', '2022-10-12 21:29:27'),
(15, 6, 'josh 2', NULL, NULL, 1, '2022-10-12 21:29:44', '2022-10-12 21:29:44');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `task` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `project_id`, `task`, `status`, `created_at`, `updated_at`) VALUES
(9, 9, 'Add contrast to the logo to make it more visible.', 0, '2022-10-12 15:11:59', '2022-10-13 14:24:24'),
(10, 9, 'Change the background picture of the dashboards', 0, '2022-10-12 15:12:21', '2022-10-12 15:12:21'),
(11, 9, 'Admin should be able to onboard doctors and vendors', 0, '2022-10-12 15:12:39', '2022-10-12 15:12:39'),
(12, 9, 'Remove the icon on the doctors clothe in the landing page.', 0, '2022-10-12 15:12:59', '2022-10-12 15:12:59'),
(13, 9, 'All forms should have back links to the home page.', 0, '2022-10-12 15:13:14', '2022-10-12 15:13:14'),
(14, 9, 'Prices should be in naira.', 0, '2022-10-12 15:13:28', '2022-10-12 15:13:28'),
(15, 9, 'Operations are local (Abuja for a start).', 0, '2022-10-12 15:13:39', '2022-10-13 14:22:22'),
(16, 9, 'After login actors should be redirected to their dashboard.', 0, '2022-10-12 15:14:47', '2022-10-12 15:14:47'),
(18, 9, 'Patient records should be exportable.', 0, '2022-10-12 15:15:40', '2022-10-12 15:15:40'),
(19, 9, 'Appointment should be more user-friendly, especially after payment.', 0, '2022-10-12 15:15:57', '2022-10-12 15:15:57'),
(20, 9, 'Patients should be able to speak to doctor immediately if they wish.', 0, '2022-10-12 15:16:15', '2022-10-12 15:16:15'),
(21, 9, 'Search doctor based on location.', 0, '2022-10-12 15:17:59', '2022-10-12 15:17:59'),
(22, 9, 'Better font style.', 0, '2022-10-12 15:18:12', '2022-10-12 15:18:12'),
(23, 9, 'Add icons to the dashboard menu items.', 0, '2022-10-12 15:18:28', '2022-10-12 15:18:28'),
(24, 9, 'Doctor search result page should be divided into online and offline doctors.', 0, '2022-10-12 15:18:53', '2022-10-12 15:18:53'),
(25, 9, 'Patients should be able to search for online doctors.', 0, '2022-10-12 15:19:11', '2022-10-12 15:19:11'),
(26, 9, 'Doctors should be filtered based on rating.', 0, '2022-10-12 15:19:31', '2022-10-12 15:19:31'),
(27, 9, 'Verification should include qualification and med school.', 0, '2022-10-12 15:19:49', '2022-10-12 15:19:49'),
(28, 9, 'Verify doctor with NMC API using license number.', 0, '2022-10-12 15:20:07', '2022-10-12 15:20:07'),
(29, 9, 'Schedule should be based on date(timestamp) and should be picked by doctor from a calendar.', 0, '2022-10-12 15:20:35', '2022-10-12 15:20:35'),
(30, 9, 'Reminders should be sent to doctors about appointments.', 0, '2022-10-12 15:20:52', '2022-10-12 15:20:52'),
(31, 9, 'All payments are to be made inhouse.', 0, '2022-10-12 15:21:15', '2022-10-12 15:21:15'),
(32, 9, 'Change labs to diagnostic centers.', 0, '2022-10-12 15:21:26', '2022-10-12 15:21:26'),
(33, 9, 'Chat should be saved.', 0, '2022-10-12 15:21:39', '2022-10-12 15:21:39'),
(34, 9, 'Add drugs in bulk.', 0, '2022-10-12 15:21:52', '2022-10-12 15:21:52'),
(35, 9, 'On the homepage, there should be a widget that shows payment options.', 0, '2022-10-12 15:22:07', '2022-10-12 15:22:07'),
(36, 9, 'Consulting a general practitioner is 3k.', 0, '2022-10-12 15:22:22', '2022-10-12 15:22:22'),
(37, 9, 'Consulting a specialist is 10k.', 0, '2022-10-12 15:22:37', '2022-10-12 15:22:37'),
(38, 9, 'Withdrawals should be automated. No need for withdrawal request.', 0, '2022-10-12 15:22:49', '2022-10-12 15:22:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$G7PxjF.6fViXfKqPBMlcLeOsaVh/0fkyKHl0FuAsURETbf6x9w8VW', NULL, '2022-10-12 19:26:02', '2022-10-12 19:26:02'),
(6, 'test', 'joshua@info.com', NULL, '$2y$10$qm3b.kBwAmgM8Oiic3SJQ.egFKH37IVhd53VilO7dggcGOIdS7UAy', NULL, '2022-10-12 19:32:03', '2022-10-12 19:32:03'),
(7, 'Yemi', 'opeyemi.ayanyemi@walexbizgroup.com', NULL, '$2y$10$G7PxjF.6fViXfKqPBMlcLeOsaVh/0fkyKHl0FuAsURETbf6x9w8VW', NULL, '2022-10-13 16:25:46', '2022-10-13 16:25:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_user_id_foreign` (`user_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasklist_project_id_foreign` (`project_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `project_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
