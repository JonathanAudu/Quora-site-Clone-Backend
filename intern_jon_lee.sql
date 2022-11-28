-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 28, 2022 at 04:19 PM
-- Server version: 8.0.30
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `intern_jon_lee`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `body`, `created_at`, `updated_at`) VALUES
(16, 22, 5, 'Jonathan bosss!!!', '2022-11-04 14:41:34', '2022-11-04 14:41:34'),
(17, 24, 5, 'Suuuuuiiiii', '2022-11-05 07:33:10', '2022-11-05 07:33:10'),
(18, 29, 5, 'Nice', '2022-11-05 09:17:53', '2022-11-05 09:17:53'),
(19, 22, 5, 'HELLO', '2022-11-07 09:04:44', '2022-11-07 09:04:44'),
(20, 29, 5, 'This is a cool anime. Highly recommend', '2022-11-11 07:45:39', '2022-11-11 07:45:39'),
(21, 26, 5, 'Sadio Maneeee', '2022-11-11 10:07:12', '2022-11-11 10:07:12'),
(22, 30, 13, 'I agree!!', '2022-11-11 14:08:35', '2022-11-11 14:08:35'),
(23, 24, 13, 'Suuuiiiiiii. factos!!', '2022-11-11 14:11:18', '2022-11-11 14:11:18'),
(24, 32, 14, 'Hello Ronaldo', '2022-11-26 08:51:02', '2022-11-26 08:51:02'),
(25, 33, 22, 'hello', '2022-11-26 10:21:35', '2022-11-26 10:21:35');

-- --------------------------------------------------------

--
-- Table structure for table `educationcredentials`
--

CREATE TABLE `educationcredentials` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `school` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_major` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_major` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `degree_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `graduation_year` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `educationcredentials`
--

INSERT INTO `educationcredentials` (`id`, `user_id`, `school`, `primary_major`, `secondary_major`, `degree_type`, `graduation_year`, `created_at`, `updated_at`) VALUES
(1, 4, 'educationCredentials.school', 'educationCredentials.primary_major', 'educationCredentials.secondary_major', 'educationCredentials', '12', '2022-10-07 05:47:17', '2022-10-12 08:05:01'),
(3, 2, 'Blue Sea Uni', 'Devil Fruit', 'Haki', 'Yonko', '2020', '2022-10-12 08:08:26', '2022-10-14 10:08:22'),
(4, 2, 'Blue Sea Uni', 'Devil Fruit', 'Haki', 'Yonko', '2020', '2022-10-14 09:24:20', '2022-10-14 10:08:22'),
(5, 3, 'University of Port-harcourt', 'Geography', 'Geography and environmental management', 'Bsc', '2019', '2022-10-14 13:56:14', '2022-10-14 13:56:14'),
(6, 5, 'Gojo High', 'Cursed Energy', 'Domain Expansion', 'Masters', '2021', '2022-11-11 13:14:08', '2022-11-11 13:14:08'),
(7, 5, 'Gojo High', 'Cursed Energy', 'Domain Expansion', 'Masters', '2021', '2022-11-11 13:15:32', '2022-11-11 13:15:32'),
(8, 5, 'Gojo High', 'Cursed Energy', 'Domain Expansion', 'Masters', '2021', '2022-11-11 13:18:02', '2022-11-11 13:18:02');

-- --------------------------------------------------------

--
-- Table structure for table `employment_credentials`
--

CREATE TABLE `employment_credentials` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_year` int DEFAULT NULL,
  `end_year` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employment_credentials`
--

INSERT INTO `employment_credentials` (`id`, `user_id`, `position`, `company`, `start_year`, `end_year`, `created_at`, `updated_at`) VALUES
(1, 4, 'backend developer', 'walexbiz', 2022, 2023, '2022-10-07 03:58:57', '2022-10-07 03:58:57'),
(2, 4, 'Pirate King', 'One Piece Wano arc', 1994, 2023, '2022-10-07 05:18:42', '2022-10-14 09:47:08'),
(3, 6, 'Students', 'Demon High', 2013, 2023, '2022-10-08 08:42:04', '2022-11-04 06:49:42'),
(4, 5, 'Teacher', 'Jujutsu High', 2022, 2022, '2022-10-08 08:50:08', '2022-10-24 07:25:37'),
(5, 5, 'Teacher', 'Jujutsu High', 2022, 2022, '2022-10-08 09:24:43', '2022-10-24 07:25:37'),
(6, 5, 'Teacher', 'Jujutsu High', 2022, 2022, '2022-10-08 11:14:35', '2022-10-24 07:25:37'),
(7, 2, 'Fifth Emperor', 'Wano arc', 2015, 2021, '2022-10-11 13:59:45', '2022-10-14 10:06:40'),
(10, 3, 'Frontend Developer', 'Walex Biz Nig', 2021, 2022, '2022-10-14 13:53:52', '2022-10-14 13:54:10'),
(11, 13, 'Striker', 'Manchester United', 2021, 2023, '2022-11-11 14:09:16', '2022-11-11 14:09:16');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `followings`
--

CREATE TABLE `followings` (
  `id` bigint UNSIGNED NOT NULL,
  `follower_id` int UNSIGNED NOT NULL,
  `following_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `followings`
--

INSERT INTO `followings` (`id`, `follower_id`, `following_id`, `created_at`, `updated_at`) VALUES
(1, 5, 2, '2022-11-09 11:02:09', '2022-11-09 11:02:09'),
(2, 5, 1, '2022-11-11 11:24:13', '2022-11-11 11:24:13'),
(4, 1, 2, '2022-11-11 12:11:56', '2022-11-11 12:11:56'),
(5, 1, 3, '2022-11-11 12:13:27', '2022-11-11 12:13:27'),
(7, 5, 6, '2022-11-11 12:55:40', '2022-11-11 12:55:40'),
(8, 13, 12, '2022-11-11 14:07:20', '2022-11-11 14:07:20'),
(9, 5, 13, '2022-11-12 07:28:46', '2022-11-12 07:28:46'),
(10, 5, 12, '2022-11-12 07:47:44', '2022-11-12 07:47:44'),
(11, 5, 3, '2022-11-12 08:09:48', '2022-11-12 08:09:48'),
(12, 14, 13, '2022-11-26 08:28:14', '2022-11-26 08:28:14'),
(13, 14, 12, '2022-11-26 08:43:57', '2022-11-26 08:43:57'),
(14, 14, 5, '2022-11-26 08:47:22', '2022-11-26 08:47:22'),
(15, 14, 6, '2022-11-26 08:48:22', '2022-11-26 08:48:22');

-- --------------------------------------------------------

--
-- Table structure for table `likecomments`
--

CREATE TABLE `likecomments` (
  `id` bigint UNSIGNED NOT NULL,
  `comment_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `like` tinyint(1) NOT NULL DEFAULT '0',
  `dislike` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likeposts`
--

CREATE TABLE `likeposts` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `like` tinyint(1) DEFAULT '0',
  `dislike` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `likeposts`
--

INSERT INTO `likeposts` (`id`, `post_id`, `user_id`, `like`, `dislike`, `created_at`, `updated_at`) VALUES
(7, 5, 5, 1, 0, '2022-10-14 12:44:38', '2022-10-14 12:48:23'),
(8, 4, 5, 1, 0, '2022-10-14 12:55:55', '2022-10-14 12:55:55'),
(9, 3, 5, 1, 0, '2022-10-14 12:56:47', '2022-10-14 12:56:47'),
(10, 5, 4, 1, 0, '2022-10-14 13:10:58', '2022-10-14 13:10:58'),
(11, 6, 5, 1, 0, '2022-10-31 14:15:12', '2022-10-31 14:15:12'),
(12, 33, 22, 1, 0, '2022-11-26 10:56:00', '2022-11-26 10:56:00'),
(13, 32, 22, 1, 0, '2022-11-26 11:19:52', '2022-11-26 11:19:52'),
(14, 30, 22, 1, 0, '2022-11-26 11:20:31', '2022-11-26 11:20:31'),
(15, 29, 22, 1, 0, '2022-11-26 11:21:05', '2022-11-26 11:21:05');

-- --------------------------------------------------------

--
-- Table structure for table `locationcredentials`
--

CREATE TABLE `locationcredentials` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_year` int DEFAULT NULL,
  `end_year` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locationcredentials`
--

INSERT INTO `locationcredentials` (`id`, `user_id`, `location`, `start_year`, `end_year`, `created_at`, `updated_at`) VALUES
(4, 2, 'Wano, One Piece', 2015, 2020, '2022-10-12 09:12:33', '2022-10-14 10:49:08'),
(5, 3, 'Abuja, Nigeria', 2014, 5000, '2022-10-14 13:56:48', '2022-10-14 13:56:48'),
(6, 7, 'abuja', 2019, 5000, '2022-10-14 14:29:11', '2022-10-14 14:29:11'),
(7, 5, 'Japan', 2007, 5000, '2022-11-11 13:19:14', '2022-11-11 13:19:14'),
(8, 5, 'Japan', 2007, 5000, '2022-11-11 13:21:01', '2022-11-11 13:21:01'),
(9, 5, 'Japan', 2007, 5000, '2022-11-11 13:22:17', '2022-11-11 13:22:17'),
(10, 5, 'Japan', 2007, 5000, '2022-11-11 13:24:36', '2022-11-11 13:24:36'),
(11, 5, 'Japan', 2007, 5000, '2022-11-11 13:25:30', '2022-11-11 13:25:30');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
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
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'jontoken', 'fb49a2a913d044e0e14129773e0f784c5d75512985e8e5cedfde4b4c195c97e8', '[\"*\"]', NULL, '2022-09-28 04:47:04', '2022-09-28 04:47:04'),
(2, 'App\\Models\\User', 1, 'myapptoken', 'e6e4488a452cf533e05bc51ffced44046d95e2bc661f41101ac2833fb52fdd0c', '[\"*\"]', NULL, '2022-09-28 06:57:42', '2022-09-28 06:57:42'),
(3, 'App\\Models\\User', 2, 'jontoken', '7311288f213e2cc5182f9ab376fff18084ac0809aa57083c366104b4067d5675', '[\"*\"]', '2022-09-30 06:08:09', '2022-09-30 04:34:31', '2022-09-30 06:08:09'),
(4, 'App\\Models\\User', 3, 'jontoken', '1b0aca6d19ed3158b5c85598086c1180e3ffcfe11fd2789f34fcd3aca310191d', '[\"*\"]', '2022-10-04 23:48:03', '2022-10-03 22:35:03', '2022-10-04 23:48:03'),
(5, 'App\\Models\\User', 4, 'jontoken', '5a8d01ed8d92bf4b0a5eecc80a92e93bfb4b7108745c7b8c2080113e1a1f3ffd', '[\"*\"]', '2022-10-07 05:47:17', '2022-10-07 03:08:54', '2022-10-07 05:47:17'),
(6, 'App\\Models\\User', 5, 'jontoken', '0f532b41df7b4b7d32397cbadaeaee2d1611e4b7a8b6cb0a3edfbaaafa678934', '[\"*\"]', NULL, '2022-10-08 07:53:53', '2022-10-08 07:53:53'),
(7, 'App\\Models\\User', 5, 'myapptoken', '9bc42fc3192786e3897c0429d70bf6d4182f627bac81a90c5885a8a570d09ec2', '[\"*\"]', NULL, '2022-10-08 07:58:43', '2022-10-08 07:58:43'),
(8, 'App\\Models\\User', 5, 'myapptoken', 'c4df003d94e0ee63d7535a981677794012dc741ab61c67707e709dea8eb659c5', '[\"*\"]', '2022-10-08 07:59:57', '2022-10-08 07:59:26', '2022-10-08 07:59:57'),
(9, 'App\\Models\\User', 6, 'jontoken', '2a99571da700a67a4594744184097c34c5b69152ea0bf5d1c1ae14312142e8ca', '[\"*\"]', NULL, '2022-10-08 08:00:29', '2022-10-08 08:00:29'),
(10, 'App\\Models\\User', 6, 'jontoken', '3ae67f2d506b587e3a20992d036e39f98c32c0eaf667ee555519426228d50391', '[\"*\"]', '2022-10-08 08:42:40', '2022-10-08 08:01:00', '2022-10-08 08:42:40'),
(11, 'App\\Models\\User', 5, 'myapptoken', '5bff22683ff43d33fb7c21a56af0235692f63004bf26c790b41b07c37f8ef845', '[\"*\"]', NULL, '2022-10-08 08:45:28', '2022-10-08 08:45:28'),
(12, 'App\\Models\\User', 5, 'myapptoken', '9e6ef5be693739c0479d651df756401efd4528215d0a7e804297d7c94d786b1c', '[\"*\"]', '2022-10-10 11:31:29', '2022-10-08 08:45:38', '2022-10-10 11:31:29'),
(13, 'App\\Models\\User', 2, 'myapptoken', '1a56f37241502940a7ae3257084e575f549edf5959197f52d2c7128c9fc1131a', '[\"*\"]', '2022-10-14 13:35:47', '2022-10-10 11:32:59', '2022-10-14 13:35:47'),
(14, 'App\\Models\\User', 3, 'myapptoken', '56c323c2fb29f30ae18ac748b4f54577ab58047ca6cfb222e29d22bad524bdf5', '[\"*\"]', '2022-10-14 14:22:44', '2022-10-14 13:37:16', '2022-10-14 14:22:44'),
(15, 'App\\Models\\User', 7, 'jontoken', '587b169c1a6039f760bb0f2db5ba8a25ce24ee81d68c42e0072b01cb0c5f9c02', '[\"*\"]', NULL, '2022-10-14 14:26:13', '2022-10-14 14:26:13'),
(16, 'App\\Models\\User', 7, 'jontoken', '7a8e9c1aad3d5418dc5625a55ecc9e9a2018df1f5a763700e77011d0dcdbbc96', '[\"*\"]', '2022-10-15 07:10:10', '2022-10-14 14:27:26', '2022-10-15 07:10:10'),
(17, 'App\\Models\\User', 5, 'myapptoken', '5eaaf809de8b085a5b04188055e236c2c4fd4bcab10fa2d3f7e10f87f6b8c4a2', '[\"*\"]', '2022-10-24 09:08:56', '2022-10-24 07:07:23', '2022-10-24 09:08:56'),
(18, 'App\\Models\\User', 8, 'jontoken', 'ef980f5b838764d0f579c8c663b08b1b5dc5fb28f88491e391b767774c7405e4', '[\"*\"]', '2022-10-31 09:18:06', '2022-10-31 07:58:57', '2022-10-31 09:18:06'),
(19, 'App\\Models\\User', 5, 'myapptoken', 'c15c00e8f822f21d03cbb114c7fba42c68f8ab61635c8f7523a14cd229eac902', '[\"*\"]', '2022-11-02 08:18:06', '2022-10-31 08:19:26', '2022-11-02 08:18:06'),
(20, 'App\\Models\\User', 9, 'jontoken', 'de1e6107a329d56aef5945fcf8e658f67581c874de20dfef85a85cd0fc099a78', '[\"*\"]', NULL, '2022-10-31 10:59:48', '2022-10-31 10:59:48'),
(21, 'App\\Models\\User', 9, 'jontoken', '9f3a108122cba9922877303c524f1b6486d9668f18f995cbdf0e272fec5e1a1f', '[\"*\"]', NULL, '2022-10-31 11:07:40', '2022-10-31 11:07:40'),
(22, 'App\\Models\\User', 9, 'myapptoken', '4eaaf7db34d46e87abfd6d3bea7627cd209aec6b58d2251f20ed4c4228f0645d', '[\"*\"]', '2022-10-31 15:11:38', '2022-10-31 12:55:48', '2022-10-31 15:11:38'),
(23, 'App\\Models\\User', 5, 'myapptoken', 'ab797c08db6928d8b3fcbd4c8a053a8c1ea7de9ce71207b316a11cf7ac0de9bf', '[\"*\"]', '2022-11-01 14:36:08', '2022-11-01 14:16:11', '2022-11-01 14:36:08'),
(24, 'App\\Models\\User', 5, 'myapptoken', 'a329110edf731ea9813ebf4eb1b4df4d68d2653ccba873d282b1e7bda5592be7', '[\"*\"]', '2022-11-01 15:10:38', '2022-11-01 14:46:30', '2022-11-01 15:10:38'),
(25, 'App\\Models\\User', 5, 'myapptoken', '638217dd5843e368cc2832d318edaa907f08928356e6eb3c384ac5e08679a911', '[\"*\"]', '2022-11-04 11:12:26', '2022-11-02 07:22:04', '2022-11-04 11:12:26'),
(26, 'App\\Models\\User', 6, 'myapptoken', '8c6c6f5467b66cd44fce4583ba8b8ca3ec7e2f2f031350dd081302461da76a07', '[\"*\"]', '2022-11-04 11:28:52', '2022-11-02 08:19:23', '2022-11-04 11:28:52'),
(27, 'App\\Models\\User', 5, 'myapptoken', '61dda12307f745c9b9bd07868e44e287c79dd1498fb1696a83cb04c3d36ec7d1', '[\"*\"]', '2022-11-04 12:43:13', '2022-11-04 11:13:24', '2022-11-04 12:43:13'),
(28, 'App\\Models\\User', 5, 'myapptoken', '97da2166da74fa8efa344504547de2b99867b52878fcd2df4f03c1b54583af44', '[\"*\"]', '2022-11-11 13:28:08', '2022-11-04 12:28:18', '2022-11-11 13:28:08'),
(29, 'App\\Models\\User', 5, 'myapptoken', '7ef4002605125931d83f3b4ee964e6f59f7655e60591f5cbfed54ff085d00b0b', '[\"*\"]', '2022-11-09 11:02:09', '2022-11-09 10:58:06', '2022-11-09 11:02:09'),
(30, 'App\\Models\\User', 1, 'myapptoken', 'fc4703868c4197a7e94cd33273f6e5fdd8b6ee6079d449f737fd2809c4ea81b9', '[\"*\"]', '2022-11-11 12:38:24', '2022-11-11 10:59:04', '2022-11-11 12:38:24'),
(31, 'App\\Models\\User', 10, 'jontoken', '9a8f0177f5209fb431d90252f5e4e624d356975d2301d8536a74961df3deafda', '[\"*\"]', NULL, '2022-11-11 13:45:54', '2022-11-11 13:45:54'),
(32, 'App\\Models\\User', 5, 'myapptoken', '57213035edb6aa90709ccdb0f89b9e3f62e2dd889ad63dc80027b85058f8c64a', '[\"*\"]', NULL, '2022-11-11 13:49:06', '2022-11-11 13:49:06'),
(33, 'App\\Models\\User', 5, 'myapptoken', '6c63dec59f1bc746e39c55ed2efb0cb6d8223e44f67630b8fcecce038be7c139', '[\"*\"]', NULL, '2022-11-11 13:49:25', '2022-11-11 13:49:25'),
(34, 'App\\Models\\User', 5, 'myapptoken', '3fda4fd5a853b23db22dc5566f57b3b94daff153674a653f238b10158c6fe58a', '[\"*\"]', NULL, '2022-11-11 13:49:40', '2022-11-11 13:49:40'),
(35, 'App\\Models\\User', 5, 'myapptoken', '6b68aed33fa7d2937f8a4dc01394c7b106d9ecef2fdf53f6622770181fdd83c6', '[\"*\"]', NULL, '2022-11-11 13:49:58', '2022-11-11 13:49:58'),
(36, 'App\\Models\\User', 5, 'myapptoken', '0861d559441034fc93e44bca6e589ec84ac1786723101c74dc19bee3132bda43', '[\"*\"]', NULL, '2022-11-11 13:50:15', '2022-11-11 13:50:15'),
(37, 'App\\Models\\User', 10, 'myapptoken', '89caa0f38f6163b1f37b9b858d43934bdec2a4ab8bb2c323fcbc936a883c67b0', '[\"*\"]', NULL, '2022-11-11 13:51:00', '2022-11-11 13:51:00'),
(38, 'App\\Models\\User', 10, 'myapptoken', 'cd1e97eced3cb385a689a45b48b8abea7f8f5579f82bc85970684830bd27f26d', '[\"*\"]', NULL, '2022-11-11 13:51:44', '2022-11-11 13:51:44'),
(39, 'App\\Models\\User', 5, 'myapptoken', '3241b5094c0453e646155a3b4dfc1f1479f702acb38da760d8c84e33116ae001', '[\"*\"]', NULL, '2022-11-11 13:51:50', '2022-11-11 13:51:50'),
(40, 'App\\Models\\User', 5, 'myapptoken', '419911c002a53c6b34bb1c4b36f93e301fc2714faa177ea745c5bd5c1838c860', '[\"*\"]', '2022-11-11 13:53:44', '2022-11-11 13:53:35', '2022-11-11 13:53:44'),
(41, 'App\\Models\\User', 10, 'myapptoken', 'd89b4bea7b53cb8337a1501c2616d401b16444e498d7a242fb562f6e870661ba', '[\"*\"]', '2022-11-11 13:55:41', '2022-11-11 13:55:03', '2022-11-11 13:55:41'),
(42, 'App\\Models\\User', 11, 'jontoken', '443e63fb9f4ab9bce3596a06aba288a0fa8c9b6d3edfb5908e36dac59e4265f0', '[\"*\"]', NULL, '2022-11-11 13:56:11', '2022-11-11 13:56:11'),
(43, 'App\\Models\\User', 11, 'myapptoken', '2e907fb350acbff20d1048ed524b964d77519bfc87bbfc912133f2942687e9a4', '[\"*\"]', NULL, '2022-11-11 13:57:22', '2022-11-11 13:57:22'),
(44, 'App\\Models\\User', 11, 'myapptoken', '641f506044c83424ef1f1dfb1da17f6874530ff494412dd932c0ca5f32c0708e', '[\"*\"]', NULL, '2022-11-11 13:57:59', '2022-11-11 13:57:59'),
(45, 'App\\Models\\User', 11, 'myapptoken', 'ef0f59e4d8f15fb4f368d4cc028a7e189344f9fbc2beef36aa9961961e3749e8', '[\"*\"]', '2022-11-11 13:58:52', '2022-11-11 13:58:21', '2022-11-11 13:58:52'),
(46, 'App\\Models\\User', 12, 'jontoken', '9f5d7dfce88f90da782b0778415944f59333c4f5a0eeee765b6778cca4eb4451', '[\"*\"]', NULL, '2022-11-11 14:02:20', '2022-11-11 14:02:20'),
(47, 'App\\Models\\User', 12, 'myapptoken', '4f4d33a27277ad5766dc71d36abd7d25a3a39e9e4acbb5caa03ec43a2fed5f18', '[\"*\"]', '2022-11-11 14:05:36', '2022-11-11 14:02:51', '2022-11-11 14:05:36'),
(48, 'App\\Models\\User', 13, 'jontoken', 'bb3ef5a62baf816cbc2188f4fb00752939069fb37568cbd8e133c867c61dfca6', '[\"*\"]', NULL, '2022-11-11 14:06:02', '2022-11-11 14:06:02'),
(49, 'App\\Models\\User', 13, 'myapptoken', '50728e3b2d78578bacc1710ee3b1b1680bf8bfd9f9a3eb530541315b585d9a05', '[\"*\"]', NULL, '2022-11-11 14:06:27', '2022-11-11 14:06:27'),
(50, 'App\\Models\\User', 13, 'myapptoken', 'f6b2fa04282ac8149c835fb0345d285e66763bb58f579f98caba3e6dc167b2c6', '[\"*\"]', '2022-11-11 14:34:55', '2022-11-11 14:06:54', '2022-11-11 14:34:55'),
(51, 'App\\Models\\User', 5, 'myapptoken', '7d5d3c45eafdbd1946151b8c9811f1cfe68db1ca862b6320eb11ccbc52356a0f', '[\"*\"]', '2022-11-12 09:34:30', '2022-11-12 07:04:02', '2022-11-12 09:34:30'),
(52, 'App\\Models\\User', 5, 'myapptoken', 'ace07d9d87ccf2c5816184834a7a1e905e7fd1c6267ad3e14854c87424d9d8f3', '[\"*\"]', '2022-11-21 11:09:11', '2022-11-21 10:56:20', '2022-11-21 11:09:11'),
(53, 'App\\Models\\User', 5, 'myapptoken', '604c552761b4eeb00afe0c859ce68879242035b79ca01cfa2ceb48958d3895e4', '[\"*\"]', '2022-11-21 13:11:58', '2022-11-21 11:12:44', '2022-11-21 13:11:58'),
(54, 'App\\Models\\User', 14, 'jontoken', '0b71634f39b75fc233b7e33a27e2cfe2d7d0d4f430ada7a62722a469ffc85719', '[\"*\"]', NULL, '2022-11-26 08:22:13', '2022-11-26 08:22:13'),
(55, 'App\\Models\\User', 14, 'myapptoken', '00f0317c7bfbc7a4cd6ad1e87c4f0140f60ffa4e7f0ac18e4d655d1137411df6', '[\"*\"]', '2022-11-26 08:51:04', '2022-11-26 08:23:24', '2022-11-26 08:51:04'),
(56, 'App\\Models\\User', 14, 'myapptoken', '0f13b1daec175e9e799dd1424c432dfe957ada277e3af982cc663e600dbd8cd6', '[\"*\"]', '2022-11-26 09:14:12', '2022-11-26 08:55:52', '2022-11-26 09:14:12'),
(57, 'App\\Models\\User', 15, 'jontoken', '2ef1322b43a6a9dfbf42a9fdb68090d8f1b1cc4400373698801ad3317f314812', '[\"*\"]', NULL, '2022-11-26 09:20:14', '2022-11-26 09:20:14'),
(58, 'App\\Models\\User', 16, 'jontoken', 'c799367f01bcadad4917272a35b6db998adb1436517d4575a98331bfd7746d0f', '[\"*\"]', NULL, '2022-11-26 09:22:59', '2022-11-26 09:22:59'),
(59, 'App\\Models\\User', 17, 'jontoken', 'c2792711df1bdce435ad79be2491280a2aa71c1b69370107c259c882ae960ae8', '[\"*\"]', NULL, '2022-11-26 09:30:56', '2022-11-26 09:30:56'),
(60, 'App\\Models\\User', 18, 'jontoken', 'd4fd701218dfcba0b0c337524bff1f5d2b0fb6822d4f2f592d049cb622838b80', '[\"*\"]', NULL, '2022-11-26 09:32:34', '2022-11-26 09:32:34'),
(61, 'App\\Models\\User', 19, 'jontoken', '3654c1ea02a57f2c59c13c2c841c0f1cc189fee55aea592ed990320b7b5a0f7d', '[\"*\"]', NULL, '2022-11-26 09:35:35', '2022-11-26 09:35:35'),
(62, 'App\\Models\\User', 20, 'jontoken', 'b02467d18c40e8a64070c2a2ff5532ebaa8ccacd636d0a10928f6a7e5e7d4d78', '[\"*\"]', NULL, '2022-11-26 09:40:11', '2022-11-26 09:40:11'),
(63, 'App\\Models\\User', 21, 'jontoken', '5289ce8efd5a76d9eb3762c66df3022724570baef39f9cabec61e1fdd2f18d7e', '[\"*\"]', NULL, '2022-11-26 09:48:21', '2022-11-26 09:48:21'),
(64, 'App\\Models\\User', 21, 'myapptoken', 'ebb7806a6b46953bbfed20ce600b44f9463a335f84d277117d49dd669c29dc5a', '[\"*\"]', NULL, '2022-11-26 09:48:56', '2022-11-26 09:48:56'),
(65, 'App\\Models\\User', 21, 'myapptoken', '20f3d5de32ff2815c710c0f2c1d5d6dec8ab3e54047b116a32e636dadeed5b8e', '[\"*\"]', '2022-11-26 10:15:03', '2022-11-26 09:50:03', '2022-11-26 10:15:03'),
(66, 'App\\Models\\User', 22, 'jontoken', '419a18dafcd4057101aad4d6b6114e3f6810d7aeb24e4b80c6b4a8d764bda375', '[\"*\"]', NULL, '2022-11-26 10:17:34', '2022-11-26 10:17:34'),
(67, 'App\\Models\\User', 22, 'myapptoken', '2fbf681ea082ec051c4c435b9c011f707ca2ceedc82ddffbfe0e7d70fd748412', '[\"*\"]', '2022-11-26 11:21:11', '2022-11-26 10:18:24', '2022-11-26 11:21:11'),
(68, 'App\\Models\\User', 21, 'myapptoken', '53106f78362a4f5334cfa96c530eead11d59fa8ccfc2d843f4b46f70fc67d937', '[\"*\"]', '2022-11-26 12:11:28', '2022-11-26 11:59:00', '2022-11-26 12:11:28');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `body`, `post_image`, `created_at`, `updated_at`) VALUES
(21, 5, 'Sorry bro', 'bruv mendem', 'post_image-1667378260.png', '2022-11-02 07:37:40', '2022-11-02 07:37:40'),
(22, 5, 'PSG go win Bayern Munich', 'Thats not cap!!', 'post_image-1667378564.jpg', '2022-11-02 07:42:44', '2022-11-02 07:42:44'),
(24, 5, 'CRISTIANO RONALDO SUII', 'Since returning to the Premier League last summer, Ronaldo has bailed his side out a number of times with some crucial goals..The Portuguese smashed through the 20-goal barrier last season and that gave him more opportunities to perform his now infamous \'Siu\' celebration..Ronaldo\'s signature celebration has become a viral hit after his move back to Manchester United. From school playgrounds to courts at the Australian Open, kids and athletes alike have been mimicking the Portuguese by throwing their arms out and yelling \'Siuuu\' at the top of their lungs. But it\'s certainly nothing new and has been used by Ronaldo during his time at Real Madrid and Juventus, as well as when scoring for Portugal.', 'post_image-1667379053.jpg', '2022-11-02 07:50:53', '2022-11-02 07:50:53'),
(25, 6, 'Jujutsu beats Naruto!', 'I said what I said!!', 'post_image-1667380883.jpg', '2022-11-02 08:21:23', '2022-11-02 08:21:23'),
(26, 6, 'Joshua Takashi', 'i\'m being serious!', 'post_image-1667561148.jpg', '2022-11-04 10:25:48', '2022-11-04 10:25:48'),
(29, 5, 'Mob Psycho 100', 'Mob Psycho 100 is a Japanese manga series written and illustrated by One. It was serialized on Shogakukan\'s Ura Sunday website from April 2012 to December ...', 'post_image-1667564854.jpg', '2022-11-04 11:27:34', '2022-11-04 11:27:34'),
(30, 12, 'Messi!', 'I am the greatest Player.', 'post_image-1668179062.jpg', '2022-11-11 14:04:22', '2022-11-11 14:04:22'),
(32, 13, 'GOAT', 'The best player of all time!.', 'post_image-1668179294.jpg', '2022-11-11 14:08:14', '2022-11-11 14:08:14'),
(33, 14, 'FIFA World Cup!', 'I love football and basketball. I would love messi to win the world cup.', 'post_image-1669456648.jpg', '2022-11-26 08:57:28', '2022-11-26 08:57:28');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `question_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `user_id`, `question_desc`, `created_at`, `updated_at`) VALUES
(1, 3, 'What\'s the best backend language', '2022-10-04 06:59:36', '2022-10-04 06:59:36'),
(2, 3, 'What\'s the best backend language', '2022-10-04 23:05:26', '2022-10-04 23:05:26'),
(3, 4, 'Hentai and slice of life which is better', '2022-10-07 03:16:17', '2022-10-07 03:16:17');

-- --------------------------------------------------------

--
-- Table structure for table `spaces`
--

CREATE TABLE `spaces` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `space_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `spaces`
--

INSERT INTO `spaces` (`id`, `user_id`, `space_name`, `image`, `created_at`, `updated_at`) VALUES
(2, 3, 'HOLLYWOOD', 'image-1664959683.png', '2022-10-04 23:48:03', '2022-10-04 23:48:03'),
(3, 4, 'Anime', 'image-1665144856.png', '2022-10-07 03:14:16', '2022-10-07 03:14:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `profile_credential` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `provider_name`, `provider_id`, `is_verified`, `email_verified_at`, `password`, `remember_token`, `otp`, `created_at`, `updated_at`, `profile_credential`, `profile_desc`, `profile_photo`) VALUES
(1, 'JonLee', 'jonlee@gmail.com', NULL, NULL, 1, NULL, '$2y$10$1N01vhRlg66b1oPJEv8TY.hkfaRkoSZ3yvGDeFKCh9OPLSeiTKzum', NULL, '276689', '2022-09-28 04:47:04', '2022-09-28 04:52:00', NULL, NULL, NULL),
(2, 'Jon D Lee', 'jonathan@gmail.com', NULL, NULL, 1, NULL, '$2y$10$sLlsgfBUzQkTCMCUMoB5LeuFDuqiBSya1ZCm1Svb4vjH8ClCUvafy', NULL, '441943', '2022-09-30 04:34:31', '2022-10-14 11:44:54', 'Backend Developer Walex', 'I am a good developer', 'profile_photo-1664546261.jpg'),
(3, 'Joshua Clifford', 'joshua@email', NULL, NULL, 1, NULL, '$2y$10$j/vTNA5HKwYGGBUIdsRQj.QrRAy2V9eUO7EAelN9LTa.Y27F8Jyd2', NULL, '793878', '2022-10-03 22:35:02', '2022-10-14 13:41:51', 'Frontend Developer', 'I am a Full Stack web developer. I specialize in the Frontend aspect. Familiar with ReactJS and Redux.', 'profile_photo-1665758385.jpg'),
(4, 'Dave', 'david@email.com', NULL, NULL, 1, NULL, '$2y$10$JdqikjWPxdNZntDr4wGN0.GAsRZ4R47hhqKx6a5ZSA4WwzDzxUjuO', NULL, '461503', '2022-10-07 03:08:54', '2022-10-07 03:12:06', 'backend guy', 'Hentai lover', 'profile_photo-1665144726.jpg'),
(5, 'Gojo Sensei', 'Gojo@mail.com', NULL, NULL, 1, NULL, '$2y$10$7DTKh/cLlIcP8ISgKUlzg.WDvm82rBZuK7zKMXpHtOSrYyqFKHZcm', NULL, '393451', '2022-10-08 07:53:53', '2022-11-11 13:27:34', 'Jujtsu High', 'I am the Greatest.', 'profile_photo-1668175663.jpg'),
(6, 'Itadori Yuji', 'itadori@mail.com', NULL, NULL, 1, NULL, '$2y$10$nzD1bEvGBA1k/yxkyM4s2ObL.rph2BQ/vlnPsl7erW4CZoUIVl/SG', NULL, '899062', '2022-10-08 08:00:29', '2022-11-02 08:20:09', NULL, 'Hi i\'m Itadori.', 'profile_photo-1667380809.jpg'),
(7, 'valentine', 'valentine4d@gmail', NULL, NULL, 1, NULL, '$2y$10$dl0KJ84tt7ZCp1prmDjkNOAbQimqQW//x7nIAQ9HQrlF7lz.wdyCK', NULL, '822097', '2022-10-14 14:26:13', '2022-10-14 14:31:09', 'Backend', 'I just want to be left alone....unless you be fine girl.', 'profile_photo-1665761469.jpg'),
(9, 'J', 'jojo@gmail.com', NULL, NULL, 1, NULL, '$2y$10$pqka0ubmZGTDfcfMsWJDou4Wql0zTA44G5QwhVuLjQlPFRa.XeLDq', NULL, '220103', '2022-10-31 10:59:48', '2022-10-31 11:07:40', NULL, NULL, NULL),
(12, 'Lionel Messi', 'messi@mail.com', NULL, NULL, 1, NULL, '$2y$10$ShkaphIckAbk5TJXk4e0reCtu4PcnpifqnnaQzhrFcU2YHJXpqH1a', NULL, '563212', '2022-11-11 14:02:20', '2022-11-11 14:03:25', 'The greatest of all time.', NULL, 'profile_photo-1668178990.jpg'),
(13, 'Cristiano Ronaldo', 'ronaldo@mail.com', NULL, NULL, 1, NULL, '$2y$10$EXXJMY9T3THvhj8JWRkofu0.tfxF/NFAT/fjhM.7ZjxrV6PiMEJb.', NULL, '319518', '2022-11-11 14:06:02', '2022-11-11 14:10:25', 'Suuiiiiii', 'The only one that can beat me is me!', 'profile_photo-1668179252.jpg'),
(14, 'Aomine Daiki', 'aomine@mail.com', NULL, NULL, 1, NULL, '$2y$10$95qnt0xB7/pbxMi3mSgpyOHifvTpXLP2tmRobN2LSJ4zvlzAvaFM2', NULL, '787989', '2022-11-26 08:22:13', '2022-11-26 08:23:24', NULL, NULL, NULL),
(21, 'Naruto Uzumaki', 'Naruto@mail.com', NULL, NULL, 1, NULL, '$2y$10$e1fxMqb7dDP2u0Dv5H7VVesWfmcIEgx7JpRcJmo9sTFw2kLoGyIjG', NULL, '951954', '2022-11-26 09:48:21', '2022-11-26 09:48:56', NULL, NULL, NULL),
(22, 'BlueLock', 'bluelock@mail.com', NULL, NULL, 1, NULL, '$2y$10$JDbSwi1ZPKHd9MzxdC0ox.qB54HecY8mpV7qAFsx76gsRzaW6929S', NULL, '114330', '2022-11-26 10:17:34', '2022-11-26 10:18:24', NULL, NULL, NULL);

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
-- Indexes for table `followings`
--
ALTER TABLE `followings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likecomments`
--
ALTER TABLE `likecomments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likeposts`
--
ALTER TABLE `likeposts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locationcredentials`
--
ALTER TABLE `locationcredentials`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `educationcredentials`
--
ALTER TABLE `educationcredentials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `employment_credentials`
--
ALTER TABLE `employment_credentials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `followings`
--
ALTER TABLE `followings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `likeposts`
--
ALTER TABLE `likeposts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `locationcredentials`
--
ALTER TABLE `locationcredentials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `spaces`
--
ALTER TABLE `spaces`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
