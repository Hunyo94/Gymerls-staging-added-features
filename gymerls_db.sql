-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql-163721-db.mysql-163721:19884
-- Generation Time: Feb 23, 2024 at 01:13 AM
-- Server version: 8.0.26
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gymerls_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `id` int NOT NULL,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `added_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `event_date` date NOT NULL,
  `event_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `product_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image_url` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(30,2) NOT NULL,
  `quantity` int NOT NULL,
  `sub_total` decimal(30,2) NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `added_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meal_plan`
--

CREATE TABLE `meal_plan` (
  `id` int NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `diet_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `calories` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sun_bf_meal` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sun_lunch_meal` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sun_dinner_meal` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mon_bf_meal` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mon_lunch_meal` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mon_dinner_meal` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tue_bf_meal` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tue_lunch_meal` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tue_dinner_meal` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `wed_bf_meal` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `wed_lunch_meal` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `wed_dinner_meal` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `thurs_bf_meal` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `thurs_lunch_meal` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `thurs_dinner_meal` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fri_bf_meal` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fri_lunch_meal` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fri_dinner_meal` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sat_bf_meal` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sat_lunch_meal` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sat_dinner_meal` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meal_plan`
--

INSERT INTO `meal_plan` (`id`, `username`, `diet_type`, `calories`, `sun_bf_meal`, `sun_lunch_meal`, `sun_dinner_meal`, `mon_bf_meal`, `mon_lunch_meal`, `mon_dinner_meal`, `tue_bf_meal`, `tue_lunch_meal`, `tue_dinner_meal`, `wed_bf_meal`, `wed_lunch_meal`, `wed_dinner_meal`, `thurs_bf_meal`, `thurs_lunch_meal`, `thurs_dinner_meal`, `fri_bf_meal`, `fri_lunch_meal`, `fri_dinner_meal`, `sat_bf_meal`, `sat_lunch_meal`, `sat_dinner_meal`) VALUES
(1, 'user_a', 'Bulking normal classification', '1000', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(2, 'user_b', 'Bulking normal classification', '1000', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(3, 'user_c', 'Bulking normal classification', '1000', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(4, 'user_d', 'Cuts for normal ', '1000', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(5, 'user_e', 'Bulking normal classification', '1000', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(6, 'user_1', 'Body recomposition overweight', '1000', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(7, 'user_2', 'Bulking normal classification', '1000', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(8, 'user_3', 'Cuts for normal ', '10000', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(9, 'user_4', 'Bulking normal classification', '1000', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(10, 'user_5', 'Bulking normal classification', '10000', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A');

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `id` int NOT NULL,
  `name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` double NOT NULL,
  `status` int NOT NULL,
  `created_by` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`id`, `name`, `description`, `price`, `status`, `created_by`) VALUES
(5, 'Monthly', 'no Promo', 500, 1, 'super_admin'),
(6, 'Premium', 'All access', 1500, 1, 'super_admin'),
(33, 'admin', 'admin subs', 0, 1, 'super_admin');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `product_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image_url` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(30,2) NOT NULL,
  `added_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `added_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ready_meals`
--

CREATE TABLE `ready_meals` (
  `id` int NOT NULL,
  `bmi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `diet_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `descriptions` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL,
  `ready_sunday_breakfast` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ready_sunday_lunch` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ready_sunday_dinner` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ready_monday_breakfast` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ready_monday_lunch` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ready_monday_dinner` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ready_tuesday_breakfast` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ready_tuesday_lunch` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ready_tuesday_dinner` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ready_wednesday_breakfast` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ready_wednesday_lunch` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ready_wednesday_dinner` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ready_thursday_breakfast` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ready_thursday_lunch` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ready_thursday_dinner` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ready_friday_breakfast` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ready_friday_lunch` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ready_friday_dinner` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ready_saturday_breakfast` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ready_saturday_lunch` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ready_saturday_dinner` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `added_by` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ready_meals`
--

INSERT INTO `ready_meals` (`id`, `bmi`, `diet_type`, `descriptions`, `status`, `ready_sunday_breakfast`, `ready_sunday_lunch`, `ready_sunday_dinner`, `ready_monday_breakfast`, `ready_monday_lunch`, `ready_monday_dinner`, `ready_tuesday_breakfast`, `ready_tuesday_lunch`, `ready_tuesday_dinner`, `ready_wednesday_breakfast`, `ready_wednesday_lunch`, `ready_wednesday_dinner`, `ready_thursday_breakfast`, `ready_thursday_lunch`, `ready_thursday_dinner`, `ready_friday_breakfast`, `ready_friday_lunch`, `ready_friday_dinner`, `ready_saturday_breakfast`, `ready_saturday_lunch`, `ready_saturday_dinner`, `added_by`) VALUES
(1, '18.5 to 25', 'Bulking normal classification', 'for normal bulking', 1, 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'admin_A'),
(2, '25 to 30', 'Body recomposition overweight', 'for overweight', 1, 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'admin_A'),
(3, '17 to 18.5', 'Body recomposition underweight', 'for underweight body recom', 1, 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'admin_A'),
(4, '18.5 to 25', 'Cuts for normal ', 'Cuts for normal class', 1, 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'admin_A'),
(5, '25 to 30', 'Cuts for overweight', 'for overweight cuts', 1, 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'admin_A');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id` int NOT NULL,
  `username` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `notes` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `reservation_date` date NOT NULL,
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time_slot` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `coach_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `added_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `isActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `value`, `isActive`) VALUES
(1, 'super_admin', 1),
(2, 'admin', 1),
(3, 'staff', 0),
(4, 'user', 1),
(5, 'user_access', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contact` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `method` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `items` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `total_quantity` int NOT NULL,
  `total` decimal(30,2) NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `receipt_url` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `transaction_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `role`, `isActive`, `password`) VALUES
(1, 'JKfanem', 'super_admin', 'super_admin', 1, 'password123'),
(2, 'admin_A', 'admin_A', 'admin', 1, 'admin_a123'),
(3, 'admin_B', 'admin_B', 'admin', 1, 'admin_b123'),
(4, 'user_a', 'user_a', 'user', 1, 'user_a123'),
(5, 'user_b', 'user_b', 'user', 1, 'user_b123'),
(6, 'user_c', 'user_c', 'user', 1, 'user_c123'),
(7, 'user_d', 'user_d', 'user', 1, 'user_d123'),
(8, 'user_e', 'user_e', 'user', 0, 'user_e123'),
(9, 'user_1', 'user_1', 'user', 1, 'user_1123'),
(10, 'user_2', 'user_2', 'user', 1, 'user_2123'),
(11, 'user_3', 'user_3', 'user', 1, 'user_3123'),
(12, 'user_4', 'user_4', 'user', 1, 'user_4123'),
(13, 'user_5', 'user_5', 'user', 1, 'user_5123');

-- --------------------------------------------------------

--
-- Table structure for table `user_logs`
--

CREATE TABLE `user_logs` (
  `id` int NOT NULL,
  `username` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `event_info` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ip_address` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `platform` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `event_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_logs`
--

INSERT INTO `user_logs` (`id`, `username`, `event_info`, `ip_address`, `platform`, `event_time`) VALUES
(1, 'super_admin', 'Logon - success', '136.158.118.217', 'Windows', '2024-01-29 12:49:13'),
(2, 'super_admin', 'Logoff - success', '136.158.118.217', 'Windows', '2024-01-30 04:17:10'),
(3, 'super_admin', 'Logon - success', '136.158.118.217', 'Windows', '2024-01-30 04:17:16'),
(4, 'super_admin', 'Create - new user \"admin_A\"', '136.158.118.217', 'Windows', '2024-01-30 04:19:22'),
(5, 'super_admin', 'Create - new user \"admin_B\"', '136.158.118.217', 'Windows', '2024-01-30 04:20:11'),
(6, 'super_admin', 'Update - password of user \"admin_A\"', '136.158.118.217', 'Windows', '2024-01-30 04:20:24'),
(7, 'super_admin', 'Update - password of user \"admin_B\"', '136.158.118.217', 'Windows', '2024-01-30 04:20:35'),
(8, 'admin_A', 'Logon - success', '136.158.118.217', 'Windows', '2024-01-30 04:20:59'),
(9, 'admin_A', 'Logon - success', '136.158.118.217', 'Windows', '2024-01-30 04:24:13'),
(10, 'admin_A', 'Logon - success', '136.158.118.217', 'Windows', '2024-01-30 04:25:05'),
(11, 'admin_A', 'Create - new user \"user_a\"', '136.158.118.217', 'Windows', '2024-01-30 04:30:48'),
(12, 'admin_A', 'Create - new user \"user_b\"', '136.158.118.217', 'Windows', '2024-01-30 04:31:46'),
(13, 'admin_A', 'Create - new user \"user_c\"', '136.158.118.217', 'Windows', '2024-01-30 04:32:27'),
(14, 'admin_A', 'Create - new user \"user_d\"', '136.158.118.217', 'Windows', '2024-01-30 04:33:11'),
(15, 'admin_A', 'Create - new user \"user_e\"', '136.158.118.217', 'Windows', '2024-01-30 04:34:00'),
(16, 'admin_A', 'Created - new ready meal \"Body recomposition overweight\"', '136.158.118.217', 'Windows', '2024-01-30 04:36:22'),
(17, 'admin_A', 'Created - new ready meal \"Body recomposition underweight\"', '136.158.118.217', 'Windows', '2024-01-30 04:37:14'),
(18, 'admin_A', 'Created - new ready meal \"Cuts for normal \"', '136.158.118.217', 'Windows', '2024-01-30 04:38:16'),
(19, 'admin_A', 'Created - new ready meal \"Cuts for overweight\"', '136.158.118.217', 'Windows', '2024-01-30 04:39:00'),
(20, 'admin_A', 'Create - meal plan for \"user_a\"', '136.158.118.217', 'Windows', '2024-01-30 04:39:18'),
(21, 'admin_A', 'Create - meal plan for \"user_b\"', '136.158.118.217', 'Windows', '2024-01-30 04:39:29'),
(22, 'admin_A', 'Create - meal plan for \"user_c\"', '136.158.118.217', 'Windows', '2024-01-30 04:39:43'),
(23, 'admin_A', 'Create - meal plan for \"user_d\"', '136.158.118.217', 'Windows', '2024-01-30 04:39:53'),
(24, 'admin_A', 'Create - meal plan for \"user_e\"', '136.158.118.217', 'Windows', '2024-01-30 04:40:06'),
(25, 'admin_A', 'Update - password of user \"user_a\"', '136.158.118.217', 'Windows', '2024-01-30 04:40:46'),
(26, 'admin_A', 'Update - password of user \"user_b\"', '136.158.118.217', 'Windows', '2024-01-30 04:40:54'),
(27, 'admin_A', 'Update - password of user \"user_c\"', '136.158.118.217', 'Windows', '2024-01-30 04:41:03'),
(28, 'admin_A', 'Update - password of user \"user_d\"', '136.158.118.217', 'Windows', '2024-01-30 04:41:11'),
(29, 'admin_A', 'Update - password of user \"user_e\"', '136.158.118.217', 'Windows', '2024-01-30 04:41:22'),
(30, 'admin_A', 'Logoff - success', '136.158.118.217', 'Windows', '2024-01-30 04:41:56'),
(31, 'admin_B', 'Logon - success', '136.158.118.217', 'Windows', '2024-01-30 04:42:04'),
(32, 'admin_B', 'Create - new user \"user_1\"', '136.158.118.217', 'Windows', '2024-01-30 04:43:08'),
(33, 'admin_B', 'Create - new user \"user_2\"', '136.158.118.217', 'Windows', '2024-01-30 04:43:47'),
(34, 'admin_B', 'Create - new user \"user_3\"', '136.158.118.217', 'Windows', '2024-01-30 04:44:41'),
(35, 'admin_B', 'Update - user \"user_2\"', '136.158.118.217', 'Windows', '2024-01-30 04:44:54'),
(36, 'admin_B', 'Create - new user \"user_4\"', '136.158.118.217', 'Windows', '2024-01-30 04:45:39'),
(37, 'admin_B', 'Create - new user \"user_5\"', '136.158.118.217', 'Windows', '2024-01-30 04:46:22'),
(38, 'admin_B', 'Create - meal plan for \"user_1\"', '136.158.118.217', 'Windows', '2024-01-30 04:46:34'),
(39, 'admin_B', 'Create - meal plan for \"user_2\"', '136.158.118.217', 'Windows', '2024-01-30 04:46:44'),
(40, 'admin_B', 'Create - meal plan for \"user_3\"', '136.158.118.217', 'Windows', '2024-01-30 04:46:54'),
(41, 'admin_B', 'Create - meal plan for \"user_4\"', '136.158.118.217', 'Windows', '2024-01-30 04:47:04'),
(42, 'admin_B', 'Create - meal plan for \"user_5\"', '136.158.118.217', 'Windows', '2024-01-30 04:47:12'),
(43, 'super_admin', 'Update - user \"user_2\"', '136.158.118.217', 'Windows', '2024-01-30 04:48:24'),
(44, 'admin_B', 'Update - password of user \"user_1\"', '136.158.118.217', 'Windows', '2024-01-30 04:49:12'),
(45, 'admin_B', 'Update - password of user \"user_2\"', '136.158.118.217', 'Windows', '2024-01-30 04:49:20'),
(46, 'admin_B', 'Update - password of user \"user_3\"', '136.158.118.217', 'Windows', '2024-01-30 04:49:28'),
(47, 'admin_B', 'Update - password of user \"user_4\"', '136.158.118.217', 'Windows', '2024-01-30 04:49:35'),
(48, 'admin_B', 'Update - password of user \"user_5\"', '136.158.118.217', 'Windows', '2024-01-30 04:49:42'),
(49, 'user_a', 'Logon - success', '136.158.118.217', 'Windows', '2024-01-30 04:57:22'),
(50, 'super_admin', 'Logon - success', '49.150.103.27', 'Android', '2024-02-17 03:56:22'),
(51, 'super_admin', 'Logoff - success', '49.150.103.27', 'Linux', '2024-02-17 04:06:30'),
(52, 'super_admin', 'Logon - failed', '49.150.103.27', 'Linux', '2024-02-17 04:06:58'),
(53, 'super_admin', 'Logon - success', '49.150.103.27', 'Linux', '2024-02-17 04:07:28'),
(54, 'super_admin', 'Logoff - success', '49.150.103.27', 'Linux', '2024-02-17 04:10:45'),
(55, 'user_a', 'Logon - success', '192.168.1.9', 'Android', '2024-02-17 04:11:04'),
(56, 'User_a', 'Logon - failed', '49.150.103.27', 'Linux', '2024-02-17 04:13:27'),
(57, 'user_a', 'Logon - success', '49.150.103.27', 'Linux', '2024-02-17 04:13:38'),
(58, 'user_a', 'Logon - success', '49.150.103.27', 'Linux', '2024-02-17 04:14:35'),
(59, 'user_a', 'Logoff - success', '49.150.103.27', 'Linux', '2024-02-17 04:17:35'),
(60, 'user_a', 'Logoff - success', '192.168.1.9', 'Android', '2024-02-17 04:19:01'),
(61, 'super_admin', 'Logon - failed', '49.150.107.175', 'Windows', '2024-02-18 08:20:36'),
(62, 'super_admin', 'Logon - success', '49.150.107.175', 'Windows', '2024-02-18 08:21:14'),
(63, 'admin_A', 'Logon - success', '49.150.107.175', 'Windows', '2024-02-18 08:27:44'),
(64, 'super_admin', 'Logoff - success', '49.150.107.175', 'Windows', '2024-02-18 08:47:26'),
(65, 'user_a', 'Logon - success', '49.150.107.175', 'Windows', '2024-02-18 08:48:01'),
(66, 'user_a', 'Logoff - success', '49.150.107.175', 'Windows', '2024-02-18 08:52:06'),
(67, 'super_admin', 'Logon - success', '49.150.107.175', 'Android', '2024-02-18 10:30:04'),
(68, 'super_admin', 'Logoff - success', '49.150.107.175', 'Linux', '2024-02-18 10:32:17');

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE `user_profile` (
  `id` int NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `birthdate` date NOT NULL,
  `age` int NOT NULL,
  `weight` double NOT NULL,
  `height` double NOT NULL,
  `gender` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contact` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `medical_conditions` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `allergies` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `current_medication` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `family_doctor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `doctor_contact` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `parent_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `parent_contact` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `parent_address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `membership_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `mem_start_date` date NOT NULL,
  `mem_end_date` date NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `added_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`id`, `username`, `birthdate`, `age`, `weight`, `height`, `gender`, `contact`, `address`, `medical_conditions`, `allergies`, `current_medication`, `family_doctor`, `doctor_contact`, `parent_name`, `parent_contact`, `parent_address`, `membership_type`, `price`, `mem_start_date`, `mem_end_date`, `date_added`, `added_by`) VALUES
(1, 'admin_A', '1987-01-13', 37, 65, 175, 'Male', '09654898527', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'admin', '0.00', '2024-01-30', '2025-01-01', '2024-01-30 04:19:21', 'super_admin'),
(2, 'admin_B', '1995-01-13', 29, 60, 165, 'Male', '09654898527', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'admin', '0.00', '2024-01-30', '2025-01-01', '2024-01-30 04:20:11', 'super_admin'),
(3, 'user_a', '2002-01-10', 22, 69, 178, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Premium', '1500.00', '2024-01-30', '2024-03-30', '2024-01-30 04:30:47', 'admin_A'),
(4, 'user_b', '2000-01-01', 24, 60, 165, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-01-30', '2024-03-01', '2024-01-30 04:31:46', 'admin_A'),
(5, 'user_c', '1998-01-03', 26, 68, 176, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Premium', '1500.00', '2024-01-30', '2024-04-30', '2024-01-30 04:32:27', 'admin_A'),
(6, 'user_d', '2002-01-30', 22, 63, 170, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-01-30', '2024-03-01', '2024-01-30 04:33:10', 'admin_A'),
(7, 'user_e', '2002-01-03', 22, 64, 164, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-01-30', '2024-02-01', '2024-01-30 04:34:00', 'admin_A'),
(8, 'user_1', '2002-01-03', 22, 69, 165, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Premium', '1500.00', '2024-01-30', '2024-03-31', '2024-01-30 04:43:08', 'admin_B'),
(9, 'user_2', '1997-01-03', 27, 75, 176, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-01-30', '2024-03-01', '2024-01-30 04:43:46', 'admin_B'),
(10, 'user_3', '1995-01-21', 29, 63, 159, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Premium', '1500.00', '2024-01-30', '2024-03-01', '2024-01-30 04:44:41', 'admin_B'),
(11, 'user_4', '2003-01-11', 21, 60, 165, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Premium', '1500.00', '2024-01-30', '2024-04-30', '2024-01-30 04:45:38', 'admin_B'),
(12, 'user_5', '1993-01-29', 31, 76, 176, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Premium', '1500.00', '2024-01-30', '2024-04-30', '2024-01-30 04:46:21', 'admin_B');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meal_plan`
--
ALTER TABLE `meal_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ready_meals`
--
ALTER TABLE `ready_meals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_logs`
--
ALTER TABLE `user_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meal_plan`
--
ALTER TABLE `meal_plan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `membership`
--
ALTER TABLE `membership`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ready_meals`
--
ALTER TABLE `ready_meals`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_logs`
--
ALTER TABLE `user_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
