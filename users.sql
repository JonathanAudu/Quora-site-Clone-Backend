-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2022 at 11:40 AM
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
-- Database: `intern_jon_lee`
--

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
(1, 'oma', 'davetoo@gmail.com', 1, NULL, '$2y$10$1KaafJFpcVdmjMP9kHwEx.mzWTX1sscKqfkKTiHxedNtox5LtIZLi', NULL, '879390', '2022-09-19 13:02:53', '2022-09-24 09:25:06', 'Web Developer', 'Josh don sabi Frontend', 'uploads/profile_images/profile_photo-1664015106.png'),
(2, 'Josh', 'Davidtoosabi@gmail.com', 1, NULL, '$2y$10$LHVCRPLFzS7rcJUgdBki2.frF5aHY.eJzrRePOrRWLdVZ/kTknI/a', NULL, '687194', '2022-09-19 13:49:19', '2022-09-20 12:20:36', NULL, NULL, NULL),
(3, 'gozie', 'gozie@gmail.com', 1, NULL, '$2y$10$UXAN2TooOb3fhQv3hoxQDOktuiuYMI1xWqtppY9EuajWlbzfylpVK', NULL, '953167', '2022-09-20 12:17:04', '2022-09-20 12:20:02', NULL, NULL, NULL),
(4, 'jon', 'jontoosabi@gmai', 0, NULL, '$2y$10$WOz9crEq3JW3BUeBzOWxl.Ami03C7NfE8BWafPpKjsY55x4dTIJM6', NULL, '829991', '2022-09-20 12:36:27', '2022-09-20 12:46:22', NULL, NULL, NULL),
(5, 'jon', 'jontoosabi@gmail.com', 1, NULL, '$2y$10$MYQHqsVm.Rouzi5hYcTWJ.YiKF1npFnheI5Y3kf2JqAmj38x1ZTrG', NULL, '472657', '2022-09-20 12:39:14', '2022-09-20 12:45:52', NULL, NULL, NULL),
(6, 'josh', 'josh@gmail.com', 0, NULL, NULL, NULL, '939377', '2022-09-26 15:44:48', '2022-09-26 15:44:48', NULL, NULL, NULL),
(7, 'darkpayne', 'darkpayne@email.com', 0, NULL, NULL, NULL, '864591', '2022-09-26 15:48:07', '2022-09-26 15:48:07', NULL, NULL, NULL),
(8, 'darkpayne', 'darkpayne111@email.com', 0, NULL, NULL, NULL, '116104', '2022-09-26 15:48:32', '2022-09-26 15:48:32', NULL, NULL, NULL),
(9, 'maid', 'maid@mail.com', 0, NULL, NULL, NULL, '865334', '2022-09-26 15:50:01', '2022-09-26 15:50:01', NULL, NULL, NULL),
(10, 'action', 'action@email.com', 0, NULL, NULL, NULL, '721694', '2022-09-26 16:02:39', '2022-09-26 16:02:39', NULL, NULL, NULL),
(11, 'winner', 'winner@email.com', 0, NULL, NULL, NULL, '829424', '2022-09-26 16:04:23', '2022-09-26 16:04:23', NULL, NULL, NULL),
(12, 'luffy', 'luffy@email.com', 1, NULL, NULL, NULL, '987349', '2022-09-26 16:18:27', '2022-09-26 16:19:15', NULL, NULL, NULL),
(13, 'Pirate Hunter Zoro', 'zoro@mail.com', 1, NULL, '$2y$10$MdTIU8a04qLSLwaN7QbdEOjT0k6z.JiMlGo14pT2ZJUekpJhGxJyi', NULL, '380649', '2022-09-26 16:49:48', '2022-09-26 17:41:22', 'Straw Hats Pirates', 'Future Pirate King right hand man', 'profile_photo-1664188882.jpg'),
(14, 'david', 'david@email.com', 0, NULL, NULL, NULL, '280372', '2022-09-26 18:13:12', '2022-09-26 18:13:12', NULL, NULL, NULL),
(15, 'joshua', 'joshua@mail.com', 0, NULL, NULL, NULL, '138047', '2022-09-26 18:14:31', '2022-09-26 18:14:31', NULL, NULL, NULL),
(16, 'gozie', 'gozie@mail.com', 1, NULL, '$2y$10$GVlner8vSIs8l5N7mzzyCOMvYecznEEMSYInDC3Ia0jSmvBphSDpC', NULL, '867875', '2022-09-26 18:19:41', '2022-09-26 18:20:38', NULL, NULL, NULL),
(17, 'zoro', 'zoroo@mail.com', 1, NULL, '$2y$10$OSfJse4zZpHD91Bh.zckbutRQ/56kPYWSCFSSTUVLhSGBlPU.KYjm', NULL, '442067', '2022-09-26 18:28:49', '2022-09-26 18:58:03', NULL, NULL, NULL),
(18, 'chigozie', 'chigozie@mail.com', 0, NULL, NULL, NULL, '452563', '2022-09-26 18:42:13', '2022-09-26 18:42:13', NULL, NULL, NULL),
(19, 'jonathan', 'jonathan@mail.com', 0, NULL, NULL, NULL, '250209', '2022-09-26 18:45:31', '2022-09-26 18:45:31', NULL, NULL, NULL),
(20, 'Michael Full-stack', 'micheal@mail.com', 0, NULL, NULL, NULL, '947313', '2022-09-26 18:53:44', '2022-09-26 18:53:44', NULL, NULL, NULL),
(21, 'yemi', 'yemi@mail.com', 0, NULL, NULL, NULL, '654747', '2022-09-26 18:55:16', '2022-09-26 18:55:16', NULL, NULL, NULL),
(22, 'madara', 'madara@mail.com', 1, NULL, '$2y$10$REVFPrVqrIGszIj3FgRwBeeGJ.hiw3DaAMWQtc8IhJeR/VZ4RLqm.', NULL, '970721', '2022-09-26 18:59:03', '2022-09-26 19:01:01', NULL, NULL, NULL),
(23, 'Nami', 'nami@mail.com', 1, NULL, '$2y$10$7MSEndKfz8A.LF8kf7O72u8d7AArS8xuQK2qfUIud61uW93TXB7Qy', NULL, '663741', '2022-09-26 19:03:55', '2022-09-26 19:04:39', NULL, NULL, NULL),
(24, 'Boss Sam', 'sam@mail.com', 1, NULL, '$2y$10$XDOHpynArxGOuslLcAoFIOWBaczRmgi/CVikfL0drS6lt4cRgwBAa', NULL, '192447', '2022-09-26 21:39:00', '2022-09-26 21:39:48', NULL, NULL, NULL),
(25, 'Val', 'Val@mail.com', 1, NULL, '$2y$10$8Y1W5nVm6x4CZkKPNiLZau4pLxxG84Mjgz98SMgts/PhbRPoInsx2', NULL, '342545', '2022-09-26 22:55:52', '2022-09-26 22:56:34', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
