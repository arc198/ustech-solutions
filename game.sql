-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jun 15, 2020 at 10:50 AM
-- Server version: 5.7.26
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `game`
--

-- --------------------------------------------------------

--
-- Table structure for table `am_constants`
--

CREATE TABLE `am_constants` (
  `id` int(11) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `constant_type` varchar(255) NOT NULL,
  `value` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `is_editable` tinyint(1) NOT NULL,
  `is_visible` tinyint(1) NOT NULL,
  `remarks` longtext,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_player`
--

CREATE TABLE `am_player` (
  `id` int(11) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `slug` varchar(6) NOT NULL,
  `jersey_number` int(11) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `no_of_matches` int(11) DEFAULT NULL,
  `runs` int(11) DEFAULT NULL,
  `hieghest_score` int(11) DEFAULT NULL,
  `fifties` int(11) DEFAULT NULL,
  `hundreds` int(11) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `am_player`
--

INSERT INTO `am_player` (`id`, `deleted_at`, `first_name`, `last_name`, `logo`, `slug`, `jersey_number`, `country`, `no_of_matches`, `runs`, `hieghest_score`, `fifties`, `hundreds`, `created_at`, `updated_at`, `team_id`) VALUES
(1, NULL, 'Asghar', 'Afghan', 'players/Asghar_Afghan.png', 'zGgzbt', 44, 'AFGHANISTAN', 102, 2078, 101, 11, 1, '2020-06-15 08:32:53.501582', '2020-06-15 08:32:53.501618', 1),
(2, NULL, 'Hazratullah', 'Zazai', 'players/Hazratullah_Zazai_.png', 'QsMKcV', 3, 'AFGHANISTAN', 6, 378, 162, 2, 1, '2020-06-15 08:34:47.708905', '2020-06-15 08:34:47.708941', 1),
(3, NULL, 'Najibullah', 'Zadran', 'players/Najibullah_Zadran.png', 'gQeUrk', 27, 'AFGHANISTAN', 50, 764, 69, 3, NULL, '2020-06-15 08:37:52.291668', '2020-06-15 08:37:52.291707', 1),
(4, NULL, 'Ibrahim', 'Zadran', 'players/Ibrahim_Zadran.jpg', 'IFgSsj', 48, 'AFGHANISTAN', NULL, NULL, NULL, NULL, NULL, '2020-06-15 08:38:40.985165', '2020-06-15 08:38:40.985196', 1),
(5, NULL, 'Virat', 'Kohli', 'players/Virat_Kohli.jpg', 'IXUdId', 18, 'INDIA', 248, 11867, 183, 58, 43, '2020-06-15 08:42:48.798620', '2020-06-15 08:42:48.798652', 5),
(6, NULL, 'Rohit', 'Sharma', 'players/Rohit_Sharma.jpg', 'flBcxh', 45, 'INDIA', 224, 9115, 264, 43, 29, '2020-06-15 08:44:36.655247', '2020-06-15 08:44:36.655278', 5),
(7, NULL, 'K. L.', 'Rahul', 'players/K._L._Rahul.jpg', 'PVZlOB', 1, 'INDIA', 32, 1239, 112, 7, 4, '2020-06-15 08:47:32.801712', '2020-06-15 08:47:32.801746', 5);

-- --------------------------------------------------------

--
-- Table structure for table `am_team`
--

CREATE TABLE `am_team` (
  `id` int(11) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `slug` varchar(6) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `am_team`
--

INSERT INTO `am_team` (`id`, `deleted_at`, `name`, `logo`, `slug`, `country`, `created_at`, `updated_at`) VALUES
(1, NULL, 'AFGHANISTAN', 'teams/AFGHANISTAN.png', 'TGHlHF', 'AFGHANISTAN', '2020-06-15 08:07:34.377287', '2020-06-15 08:07:34.377324'),
(2, NULL, 'AUSTRALIA', 'teams/AUSTRALIA.png', 'YIXjpG', 'AUSTRALIA', '2020-06-15 08:07:56.718468', '2020-06-15 08:07:56.718501'),
(3, NULL, 'BANGLADESH', 'teams/BANGLADESH.png', 'PZIexL', 'BANGLADESH', '2020-06-15 08:08:18.383929', '2020-06-15 08:08:18.383962'),
(4, NULL, 'ENGLAND', 'teams/ENGLAND.png', 'EjBARg', 'ENGLAND', '2020-06-15 08:08:33.966105', '2020-06-15 08:08:33.966133'),
(5, NULL, 'INDIA', 'teams/INDIA.png', 'pHJApY', 'INDIA', '2020-06-15 08:08:47.091120', '2020-06-15 08:08:47.091147'),
(6, NULL, 'IRELAND', 'teams/IRELAND.jpg', 'SIUIpD', 'IRELAND', '2020-06-15 08:09:11.974182', '2020-06-15 08:09:11.974214'),
(7, NULL, 'NEW ZEALAND', 'teams/NEW_ZEALAND.png', 'vtbuaE', 'NEW ZEALAND', '2020-06-15 08:09:27.000871', '2020-06-15 08:09:27.000904'),
(8, NULL, 'PAKISTAN', 'teams/PAKISTAN.jpg', 'AhuOxf', 'PAKISTAN', '2020-06-15 08:09:45.898346', '2020-06-15 08:09:45.898379'),
(9, NULL, 'SOUTH AFRICA', 'teams/SOUTH_AFRICA.png', 'vimTTo', 'SOUTH AFRICA', '2020-06-15 08:10:14.462819', '2020-06-15 08:10:14.462852'),
(10, NULL, 'SRI LANKA', 'teams/SRI_LANKA.png', 'iUwUcs', 'SRI LANKA', '2020-06-15 08:10:27.709268', '2020-06-15 08:10:27.709306'),
(11, NULL, 'WEST INDIES', 'teams/WEST_INDIES.jpg', 'PJwxiX', 'WEST INDIES', '2020-06-15 08:10:46.652270', '2020-06-15 08:10:46.652300'),
(12, NULL, 'ZIMBABWE', 'teams/ZIMBABWE.png', 'LIGchd', 'ZIMBABWE', '2020-06-15 08:11:02.335671', '2020-06-15 08:11:02.335703');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add Constant', 7, 'add_amconstants'),
(26, 'Can change Constant', 7, 'change_amconstants'),
(27, 'Can delete Constant', 7, 'delete_amconstants'),
(28, 'Can view Constant', 7, 'view_amconstants'),
(29, 'Can add Team', 8, 'add_amteam'),
(30, 'Can change Team', 8, 'change_amteam'),
(31, 'Can delete Team', 8, 'delete_amteam'),
(32, 'Can view Team', 8, 'view_amteam'),
(33, 'Can add Player', 9, 'add_amplayer'),
(34, 'Can change Player', 9, 'change_amplayer'),
(35, 'Can delete Player', 9, 'delete_amplayer'),
(36, 'Can view Player', 9, 'view_amplayer'),
(37, 'Can add Matches', 10, 'add_ammatches'),
(38, 'Can change Matches', 10, 'change_ammatches'),
(39, 'Can delete Matches', 10, 'delete_ammatches'),
(40, 'Can view Matches', 10, 'view_ammatches'),
(41, 'Can add Points', 11, 'add_ampoints'),
(42, 'Can change Points', 11, 'change_ampoints'),
(43, 'Can delete Points', 11, 'delete_ampoints'),
(44, 'Can view Points', 11, 'view_ampoints');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'game', 'amconstants'),
(9, 'game', 'amplayer'),
(8, 'game', 'amteam'),
(10, 'matches', 'ammatches'),
(11, 'matches', 'ampoints'),
(6, 'sessions', 'session');

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
(1, 'contenttypes', '0001_initial', '2020-06-15 07:48:22.021621'),
(2, 'auth', '0001_initial', '2020-06-15 07:48:22.177340'),
(3, 'admin', '0001_initial', '2020-06-15 07:48:22.436055'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-06-15 07:48:22.491253'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-06-15 07:48:22.498520'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-06-15 07:48:22.556000'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-06-15 07:48:22.581517'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-06-15 07:48:22.611217'),
(9, 'auth', '0004_alter_user_username_opts', '2020-06-15 07:48:22.620196'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-06-15 07:48:22.656261'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-06-15 07:48:22.657919'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-06-15 07:48:22.667311'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-06-15 07:48:22.701771'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-06-15 07:48:22.729848'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-06-15 07:48:22.762500'),
(16, 'auth', '0011_update_proxy_permissions', '2020-06-15 07:48:22.774547'),
(17, 'game', '0001_initial', '2020-06-15 07:48:22.849077'),
(18, 'matches', '0001_initial', '2020-06-15 07:48:22.930635'),
(19, 'sessions', '0001_initial', '2020-06-15 07:48:23.047612'),
(20, 'matches', '0002_auto_20200615_0923', '2020-06-15 09:23:50.324953'),
(21, 'matches', '0003_remove_ampoints_team', '2020-06-15 10:18:57.344568');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `am_constants`
--
ALTER TABLE `am_constants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `am_player`
--
ALTER TABLE `am_player`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `am_player_team_id_2a5d0f8c_fk_am_team_id` (`team_id`);

--
-- Indexes for table `am_team`
--
ALTER TABLE `am_team`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `am_constants`
--
ALTER TABLE `am_constants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `am_player`
--
ALTER TABLE `am_player`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `am_team`
--
ALTER TABLE `am_team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `am_player`
--
ALTER TABLE `am_player`
  ADD CONSTRAINT `am_player_team_id_2a5d0f8c_fk_am_team_id` FOREIGN KEY (`team_id`) REFERENCES `am_team` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
