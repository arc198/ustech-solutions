-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jun 15, 2020 at 10:51 AM
-- Server version: 5.7.26
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `matches`
--

-- --------------------------------------------------------

--
-- Table structure for table `am_matches`
--

CREATE TABLE `am_matches` (
  `id` int(11) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `slug` varchar(6) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `match_own_id` int(11) DEFAULT NULL,
  `team_one_id` int(11) DEFAULT NULL,
  `team_two_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `am_matches`
--

INSERT INTO `am_matches` (`id`, `deleted_at`, `slug`, `created_at`, `updated_at`, `match_own_id`, `team_one_id`, `team_two_id`) VALUES
(1, NULL, 'xNRvWS', '2020-06-15 10:24:03.483174', '2020-06-15 10:24:03.483210', 2, 1, 2),
(2, NULL, 'CHiyFu', '2020-06-15 10:25:27.964759', '2020-06-15 10:26:27.685598', 4, 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `am_points`
--

CREATE TABLE `am_points` (
  `id` int(11) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `match_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `am_points`
--

INSERT INTO `am_points` (`id`, `deleted_at`, `points`, `created_at`, `updated_at`, `match_id`) VALUES
(1, NULL, 2, '2020-06-15 10:27:23.755340', '2020-06-15 10:27:23.755368', 1),
(2, NULL, 2, '2020-06-15 10:47:26.957079', '2020-06-15 10:47:26.957109', 2);

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'game', '0001_initial', '2020-06-15 10:22:04.172549'),
(2, 'matches', '0001_initial', '2020-06-15 10:22:04.234497');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `am_matches`
--
ALTER TABLE `am_matches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `am_points`
--
ALTER TABLE `am_points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `am_matches`
--
ALTER TABLE `am_matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `am_points`
--
ALTER TABLE `am_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
