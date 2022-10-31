-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2022 at 10:44 AM
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
-- Database: `jon-lee`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `body`, `created_at`, `updated_at`) VALUES
(1, 4, 4, 'Hentai bro', '2022-10-07 11:18:05', '2022-10-07 11:18:05');

-- --------------------------------------------------------

--
-- Table structure for table `educationcredentials`
--

CREATE TABLE `educationcredentials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `school` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_major` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_major` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `degree_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `graduation_year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `educationcredentials`
--

INSERT INTO `educationcredentials` (`id`, `user_id`, `school`, `primary_major`, `secondary_major`, `degree_type`, `graduation_year`, `created_at`, `updated_at`) VALUES
(1, 4, 'MIT', 'Computer', 'Programing', 'M.Sc', '2023', '2022-10-07 13:47:17', '2022-10-07 13:47:17');

-- --------------------------------------------------------

--
-- Table structure for table `employment_credentials`
--

CREATE TABLE `employment_credentials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_year` int(11) DEFAULT NULL,
  `end_year` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employment_credentials`
--

INSERT INTO `employment_credentials` (`id`, `user_id`, `position`, `company`, `start_year`, `end_year`, `created_at`, `updated_at`) VALUES
(1, 4, 'backend developer', 'walexbiz', 2022, 2023, '2022-10-07 11:58:57', '2022-10-07 11:58:57'),
(2, 4, 'backend developer', 'walexbiz', 2022, 2023, '2022-10-07 13:18:42', '2022-10-07 13:18:42');

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
(5, '2014_10_12_000000_create_users_table', 1),
(6, '2014_10_12_100000_create_password_resets_table', 1),
(7, '2019_08_19_000000_create_failed_jobs_table', 1),
(8, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(9, '2022_09_27_095036_add_profiles_to_users_table', 2),
(12, '2022_09_27_101801_create_comments_table', 3),
(13, '2022_09_27_131436_create_posts_table', 4),
(14, '2022_09_28_092841_create_spaces_table', 5),
(15, '2022_09_29_202219_create_questions_table', 6),
(18, '2022_10_07_110457_create_employmentcredential_table', 7),
(19, '2022_10_07_125720_create_employment_credentials_table', 8),
(21, '2022_10_07_144653_create_educationcredentials_table', 9);

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

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'jontoken', 'fb49a2a913d044e0e14129773e0f784c5d75512985e8e5cedfde4b4c195c97e8', '[\"*\"]', NULL, '2022-09-28 12:47:04', '2022-09-28 12:47:04'),
(2, 'App\\Models\\User', 1, 'myapptoken', 'e6e4488a452cf533e05bc51ffced44046d95e2bc661f41101ac2833fb52fdd0c', '[\"*\"]', NULL, '2022-09-28 14:57:42', '2022-09-28 14:57:42'),
(3, 'App\\Models\\User', 2, 'jontoken', '7311288f213e2cc5182f9ab376fff18084ac0809aa57083c366104b4067d5675', '[\"*\"]', '2022-09-30 14:08:09', '2022-09-30 12:34:31', '2022-09-30 14:08:09'),
(4, 'App\\Models\\User', 3, 'jontoken', '1b0aca6d19ed3158b5c85598086c1180e3ffcfe11fd2789f34fcd3aca310191d', '[\"*\"]', '2022-10-05 07:48:03', '2022-10-04 06:35:03', '2022-10-05 07:48:03'),
(5, 'App\\Models\\User', 4, 'jontoken', '5a8d01ed8d92bf4b0a5eecc80a92e93bfb4b7108745c7b8c2080113e1a1f3ffd', '[\"*\"]', '2022-10-07 13:47:17', '2022-10-07 11:08:54', '2022-10-07 13:47:17');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `body`, `created_at`, `updated_at`) VALUES
(1, 2, '(Gear 5) LUFFY VS (Six Path) MADARA', 'Who would win in an all battle between One Piece Monkey D. Luffy and Naruto Madara Uchiha', '2022-09-30 13:37:42', '2022-09-30 13:37:42'),
(3, 3, 'Man utd go rise again', 'Hallaand will have food poisoning in the the match against Arsenal who man utd trashed 3-1 earlier this season', '2022-10-04 06:51:05', '2022-10-04 06:51:05'),
(4, 4, 'Some Hentai shit', 'Hinata and Naruto ........', '2022-10-07 11:13:44', '2022-10-07 11:13:44');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `question_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `user_id`, `question_desc`, `created_at`, `updated_at`) VALUES
(1, 3, 'What\'s the best backend language', '2022-10-04 14:59:36', '2022-10-04 14:59:36'),
(2, 3, 'What\'s the best backend language', '2022-10-05 07:05:26', '2022-10-05 07:05:26'),
(3, 4, 'Hentai and slice of life which is better', '2022-10-07 11:16:17', '2022-10-07 11:16:17');

-- --------------------------------------------------------

--
-- Table structure for table `spaces`
--

CREATE TABLE `spaces` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `space_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `spaces`
--

INSERT INTO `spaces` (`id`, `user_id`, `space_name`, `image`, `created_at`, `updated_at`) VALUES
(2, 3, 'HOLLYWOOD', 'image-1664959683.png', '2022-10-05 07:48:03', '2022-10-05 07:48:03'),
(3, 4, 'Anime', 'image-1665144856.png', '2022-10-07 11:14:16', '2022-10-07 11:14:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `profile_credential` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `is_verified`, `email_verified_at`, `password`, `remember_token`, `otp`, `created_at`, `updated_at`, `profile_credential`, `profile_desc`, `profile_photo`) VALUES
(1, 'JonLee', 'jonlee@gmail.com', 1, NULL, '$2y$10$1N01vhRlg66b1oPJEv8TY.hkfaRkoSZ3yvGDeFKCh9OPLSeiTKzum', NULL, '276689', '2022-09-28 12:47:04', '2022-09-28 12:52:00', NULL, NULL, NULL),
(2, 'Jon D Lee', 'jonathan@gmail.com', 1, NULL, '$2y$10$sLlsgfBUzQkTCMCUMoB5LeuFDuqiBSya1ZCm1Svb4vjH8ClCUvafy', NULL, '441943', '2022-09-30 12:34:31', '2022-09-30 12:57:41', 'BACKEND DEVELOPER', 'Laravel Newbie and Anime Lover', 'profile_photo-1664546261.jpg'),
(3, 'Darkpayne', 'joshua@email', 1, NULL, '$2y$10$j/vTNA5HKwYGGBUIdsRQj.QrRAy2V9eUO7EAelN9LTa.Y27F8Jyd2', NULL, '793878', '2022-10-04 06:35:02', '2022-10-04 06:46:20', 'FRONTEND DEVELOPER', NULL, 'profile_photo-1664869580.jpg'),
(4, 'Dave', 'david@email.com', 1, NULL, '$2y$10$JdqikjWPxdNZntDr4wGN0.GAsRZ4R47hhqKx6a5ZSA4WwzDzxUjuO', NULL, '461503', '2022-10-07 11:08:54', '2022-10-07 11:12:06', 'backend guy', 'Hentai lover', 'profile_photo-1665144726.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `educationcredentials`
--
ALTER TABLE `educationcredentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employment_credentials`
--
ALTER TABLE `employment_credentials`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spaces`
--
ALTER TABLE `spaces`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `educationcredentials`
--
ALTER TABLE `educationcredentials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employment_credentials`
--
ALTER TABLE `employment_credentials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `spaces`
--
ALTER TABLE `spaces`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
