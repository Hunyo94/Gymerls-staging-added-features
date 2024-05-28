-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql-168156-db.mysql-168156:10021
-- Generation Time: Apr 09, 2024 at 11:00 AM
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

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `username`, `product_name`, `image_url`, `description`, `price`, `quantity`, `sub_total`, `status`, `added_date`) VALUES
(2, 'Jasper Rey Devera', 'Prothin Whey Prothin Ripped Chocolate', 'https://res.cloudinary.com/dpruj7bhk/image/upload/v1709177426/i335lbprq7xjm8y03yll.png', '4.5kg 151sachets', '4199.00', 1, '4199.00', 'cart', '2024-03-24');

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
(11, 'kyla1', 'Cuts for overweight', '2500', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A'),
(12, 'Rafaelrazon', 'Bulking normal classification', '3350', 'crambled eggs with mushrooms, oatmeal, and a pear', 'Low-fat cottage cheese with blueberries\nbefore workout: Protein shake and a banana\npost workout: Salmon, quinoa, and asparagus', 'Venison burger, white rice, and broccoli', 'Protein pancakes with light syrup, peanut butter, and raspberries', 'Hard-boiled eggs and an apple\npre workout:  Protein shake and a peach\npost workout: Ground turkey and marinara sauce over pasta, with a side of cauliflower', 'Venison burger, white rice, and broccoli', 'Chicken sausage with egg, roasted potatoes, and an apple', 'Greek yogurt, strawberries, and almonds\npre workout:  Protein shake and grapes\npost workout: Mackerel, brown rice, asparagus, and salad leaves with vinaigrette', ' Turkey breast, basmati rice, and mushrooms', 'Ground turkey, egg, cheese, and salsa in a whole-grain tortilla', 'Yogurt with granola and a pear\npre workout: Chicken breast, baked potato, sour cream, and broccoli\npost workout: Protein shake and mixed berries\n', 'Stir-fry with shrimp, egg, brown rice, bell peppers, peas, and carrots', 'Blueberries, strawberries, and Greek yogurt on overnight oats', 'Jerky and mixed nuts with an orange\npre workout: Protein shake and watermelon\npost workout: Ground beef with corn, brown rice, green peas, and beans', 'Tilapia fillets with lime juice, black and pinto beans, and seasonal veggies', 'Ground turkey and egg with corn, bell peppers, cheese, and salsa\n', 'Can of tuna with crackers and an apple\npre workout: Protein shake and pear\npost workout: Diced beef with rice, black beans, bell peppers, onions, cheese, and pico de gallo', 'Tilapia fillet and potato wedges with steamed broccoli and cauliflower', 'Eggs sunny-side up and avocado toast with fresh fruit', 'Protein balls with almond butter and an orange\npre workout: Protein shake and strawberries\npost workout: Turkey meatballs, marinara sauce, and parmesan cheese over pasta, with a side of sautéed kale', 'Pork tenderloin slices with roasted garlic potatoes, green beans, and carrots'),
(13, 'Jasper Rey Devera', 'Bulking normal classification', '2360', 'crambled eggs with mushrooms, oatmeal, and a pear', 'Low-fat cottage cheese with blueberries\nbefore workout: Protein shake and a banana\npost workout: Salmon, quinoa, and asparagus', 'Venison burger, white rice, and broccoli', 'Protein pancakes with light syrup, peanut butter, and raspberries', 'Hard-boiled eggs and an apple\npre workout:  Protein shake and a peach\npost workout: Ground turkey and marinara sauce over pasta, with a side of cauliflower', 'Venison burger, white rice, and broccoli', 'Chicken sausage with egg, roasted potatoes, and an apple', 'Greek yogurt, strawberries, and almonds\npre workout:  Protein shake and grapes\npost workout: Mackerel, brown rice, asparagus, and salad leaves with vinaigrette', ' Turkey breast, basmati rice, and mushrooms', 'Ground turkey, egg, cheese, and salsa in a whole-grain tortilla', 'Yogurt with granola and a pear\npre workout: Chicken breast, baked potato, sour cream, and broccoli\npost workout: Protein shake and mixed berries\n', 'Stir-fry with shrimp, egg, brown rice, bell peppers, peas, and carrots', 'Blueberries, strawberries, and Greek yogurt on overnight oats', 'Jerky and mixed nuts with an orange\npre workout: Protein shake and watermelon\npost workout: Ground beef with corn, brown rice, green peas, and beans', 'Tilapia fillets with lime juice, black and pinto beans, and seasonal veggies', 'Ground turkey and egg with corn, bell peppers, cheese, and salsa\n', 'Can of tuna with crackers and an apple\npre workout: Protein shake and pear\npost workout: Diced beef with rice, black beans, bell peppers, onions, cheese, and pico de gallo', 'Tilapia fillet and potato wedges with steamed broccoli and cauliflower', 'Eggs sunny-side up and avocado toast with fresh fruit', 'Protein balls with almond butter and an orange\npre workout: Protein shake and strawberries\npost workout: Turkey meatballs, marinara sauce, and parmesan cheese over pasta, with a side of sautéed kale', 'Pork tenderloin slices with roasted garlic potatoes, green beans, and carrots'),
(14, 'Rowien B. Guevarra', 'Bulking normal classification', '2700', 'crambled eggs with mushrooms, oatmeal, and a pear', 'Low-fat cottage cheese with blueberries\nbefore workout: Protein shake and a banana\npost workout: Salmon, quinoa, and asparagus', 'Venison burger, white rice, and broccoli', 'Protein pancakes with light syrup, peanut butter, and raspberries', 'Hard-boiled eggs and an apple\npre workout:  Protein shake and a peach\npost workout: Ground turkey and marinara sauce over pasta, with a side of cauliflower', 'Venison burger, white rice, and broccoli', 'Chicken sausage with egg, roasted potatoes, and an apple', 'Greek yogurt, strawberries, and almonds\npre workout:  Protein shake and grapes\npost workout: Mackerel, brown rice, asparagus, and salad leaves with vinaigrette', ' Turkey breast, basmati rice, and mushrooms', 'Ground turkey, egg, cheese, and salsa in a whole-grain tortilla', 'Yogurt with granola and a pear\npre workout: Chicken breast, baked potato, sour cream, and broccoli\npost workout: Protein shake and mixed berries\n', 'Stir-fry with shrimp, egg, brown rice, bell peppers, peas, and carrots', 'Blueberries, strawberries, and Greek yogurt on overnight oats', 'Jerky and mixed nuts with an orange\npre workout: Protein shake and watermelon\npost workout: Ground beef with corn, brown rice, green peas, and beans', 'Tilapia fillets with lime juice, black and pinto beans, and seasonal veggies', 'Ground turkey and egg with corn, bell peppers, cheese, and salsa\n', 'Can of tuna with crackers and an apple\npre workout: Protein shake and pear\npost workout: Diced beef with rice, black beans, bell peppers, onions, cheese, and pico de gallo', 'Tilapia fillet and potato wedges with steamed broccoli and cauliflower', 'Eggs sunny-side up and avocado toast with fresh fruit', 'Protein balls with almond butter and an orange\npre workout: Protein shake and strawberries\npost workout: Turkey meatballs, marinara sauce, and parmesan cheese over pasta, with a side of sautéed kale', 'Pork tenderloin slices with roasted garlic potatoes, green beans, and carrots'),
(15, 'MARCO JELL ', 'Cuts for normal ', '1870', 'Salt Water + 5 Almonds, Barramundi Fish\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Any Seasonal Fruits\npost workout: 100 Gms Fish Curry + 50 Gms Rice, Chamomile Tea', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds, 2 White Eggs + 8 Soaked Almonds + 1 Banana', 'Tofu Capsicum Bhurji, Protein Shake With Water\npre workout: Tofu Scrambled\npost workout: Any Seasonal Fruits', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Chicken Breast Roasted – 150 Gms\npost workout: Protein Shake With Water\n\n', 'Panner Wrap With Apple, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds, Vegetable Oats With 3 Egg Whites\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n');

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

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `image_url`, `description`, `price`, `added_by`, `added_date`) VALUES
(1, 'Rule 1 Whey Protein', 'https://res.cloudinary.com/dpruj7bhk/image/upload/v1709177289/dtjfd8acfuxcwfnk5qy7.jpg', '5lbs protein shake', '3199.00', 'super_admin', '2024-02-29'),
(2, 'Prothin Whey Prothin Ripped Chocolate', 'https://res.cloudinary.com/dpruj7bhk/image/upload/v1709177426/i335lbprq7xjm8y03yll.png', '4.5kg 151sachets', '4199.00', 'super_admin', '2024-02-29'),
(3, 'Prothin Whey Prothin Ripped Vanilla', 'https://res.cloudinary.com/dpruj7bhk/image/upload/v1709177502/crdpwipstecwpceipmnn.jpg', '60 servings', '1670.00', 'super_admin', '2024-02-29'),
(4, 'Muscletech Nitrotech Pro Performance Series Vanilla', 'https://res.cloudinary.com/dpruj7bhk/image/upload/v1709177583/tbi5mmkxcjbotow1jlxf.webp', '4lbs', '2000.00', 'super_admin', '2024-02-29'),
(5, 'Athlene Active Creatine', 'https://res.cloudinary.com/dpruj7bhk/image/upload/v1709177753/dhxrpfifmnsm2fevemny.jpg', '300g 20servings', '399.00', 'super_admin', '2024-02-29'),
(6, 'Optimum Nutrition Micronized Creatine Powder', 'https://res.cloudinary.com/dpruj7bhk/image/upload/v1709177831/f16zhs1z59irmzp193cw.jpg', '300g unflavored', '2199.00', 'super_admin', '2024-02-29');

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
(1, '18.5 to 25', 'Bulking normal classification', 'for normal bulking', 1, 'crambled eggs with mushrooms, oatmeal, and a pear', 'Low-fat cottage cheese with blueberries\nbefore workout: Protein shake and a banana\npost workout: Salmon, quinoa, and asparagus', 'Venison burger, white rice, and broccoli', 'Protein pancakes with light syrup, peanut butter, and raspberries', 'Hard-boiled eggs and an apple\npre workout:  Protein shake and a peach\npost workout: Ground turkey and marinara sauce over pasta, with a side of cauliflower', 'Sirloin steak, sweet potato, and spinach salad with vinaigrette', 'Chicken sausage with egg, roasted potatoes, and an apple', 'Greek yogurt, strawberries, and almonds\npre workout:  Protein shake and grapes\npost workout: Mackerel, brown rice, asparagus, and salad leaves with vinaigrette', ' Turkey breast, basmati rice, and mushrooms', 'Ground turkey, egg, cheese, and salsa in a whole-grain tortilla', 'Yogurt with granola and a pear\npre workout: Chicken breast, baked potato, sour cream, and broccoli\npost workout: Protein shake and mixed berries\n', 'Stir-fry with shrimp, egg, brown rice, bell peppers, peas, and carrots', 'Blueberries, strawberries, and Greek yogurt on overnight oats', 'Jerky and mixed nuts with an orange\npre workout: Protein shake and watermelon\npost workout: Ground beef with corn, brown rice, green peas, and beans', 'Tilapia fillets with lime juice, black and pinto beans, and seasonal veggies', 'Ground turkey and egg with corn, bell peppers, cheese, and salsa\n', 'Can of tuna with crackers and an apple\npre workout: Protein shake and pear\npost workout: Diced beef with rice, black beans, bell peppers, onions, cheese, and pico de gallo', 'Tilapia fillet and potato wedges with steamed broccoli and cauliflower', 'Eggs sunny-side up and avocado toast with fresh fruit', 'Protein balls with almond butter and an orange\npre workout: Protein shake and strawberries\npost workout: Turkey meatballs, marinara sauce, and parmesan cheese over pasta, with a side of sautéed kale', 'Pork tenderloin slices with roasted garlic potatoes, green beans, and carrots', 'super_admin'),
(2, '25 to 30', 'Body recomposition overweight', 'for overweight', 1, 'Protein pancakes with light syrup, peanut butter, and raspberries', 'Hard-boiled eggs and an apple\npre workout:  Protein shake and a peach\npost workout: Ground turkey and marinara sauce over pasta, with a side of cauliflower', 'Sirloin steak, sweet potato, and spinach salad with vinaigrette', 'Chicken sausage with egg, roasted potatoes, and an apple', 'Greek yogurt, strawberries, and almonds\npre workout:  Protein shake and grapes\npost workout: Mackerel, brown rice, asparagus, and salad leaves with vinaigrette', ' Turkey breast, basmati rice, and mushrooms', 'Ground turkey, egg, cheese, and salsa in a whole-grain tortilla', 'Yogurt with granola and a pear\npre workout: Chicken breast, baked potato, sour cream, and broccoli\npost workout: Protein shake and mixed berries\n', 'Stir-fry with shrimp, egg, brown rice, bell peppers, peas, and carrots', 'Blueberries, strawberries, and Greek yogurt on overnight oats', 'Jerky and mixed nuts with an orange\npre workout: Protein shake and watermelon\npost workout: Ground beef with corn, brown rice, green peas, and beans', 'Tilapia fillets with lime juice, black and pinto beans, and seasonal veggies', 'N/A', 'N/A', 'N/A', 'Pork tenderloin slices with roasted garlic potatoes, green beans, and carrots', 'Protein balls with almond butter and an orange\npre workout: Protein shake and strawberries\npost workout: Turkey meatballs, marinara sauce, and parmesan cheese over pasta, with a side of sautéed kale', 'Eggs sunny-side up and avocado toast with fresh fruit', 'crambled eggs with mushrooms, oatmeal, and a pear', 'Low-fat cottage cheese with blueberries\nbefore workout: Protein shake and a banana\npost workout: Salmon, quinoa, and asparagus', 'Venison burger, white rice, and broccoli', 'super_admin'),
(3, '17 to 18.5', 'Body recomposition underweight', 'for underweight body recom', 1, 'Salt Water + 5 Almonds, Barramundi Fish\n\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Any Seasonal Fruits\npost workout: 100 Gms Fish Curry + 50 Gms Rice, Chamomile Tea', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds, 2 White Eggs + 8 Soaked Almonds + 1 Banana', 'Tofu Capsicum Bhurji, Protein Shake With Water\npre workout: Tofu Scrambled\npost workout: Any Seasonal Fruits', 'Subway Veggies Delight, Chamomile Tea\n', 'Salt Water + 5 Almonds, Rice Cake + Peanut Butter\n', 'Boiled Chicken Marinated With Curd, Protein Shake With Water\npre workout: Mixed Vegetable Wrap\npost workout: Any Seasonal Fruits\n', '100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Salt Water + 5 Almonds, 2 White Eggs + 8 Soaked Almonds + 1 Banana\n', 'To 50 Gms Oats Add Peanut Butter And Nuts\npre workout: Protein Shake With Water\npost workout: Barramundi Fish\n', 'Baked Beans With Veggies, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Chicken Breast Roasted – 150 Gms\npost workout: Protein Shake With Water\n\n', 'Panner Wrap With Apple, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds, Vegetable Oats With 3 Egg Whites\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'super_admin'),
(4, '18.5 to 25', 'Cuts for normal ', 'Cuts for normal class', 1, 'Salt Water + 5 Almonds, Barramundi Fish\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Any Seasonal Fruits\npost workout: 100 Gms Fish Curry + 50 Gms Rice, Chamomile Tea', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds, 2 White Eggs + 8 Soaked Almonds + 1 Banana', 'Tofu Capsicum Bhurji, Protein Shake With Water\npre workout: Tofu Scrambled\npost workout: Any Seasonal Fruits', 'Subway Veggies Delight, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Chicken Breast Roasted – 150 Gms\npost workout: Protein Shake With Water\n\n', 'Panner Wrap With Apple, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds, Vegetable Oats With 3 Egg Whites\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'super_admin'),
(5, '25 to 30', 'Cuts for overweight', 'for overweight cuts', 1, 'Salt Water + 5 Almonds, Barramundi Fish\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Any Seasonal Fruits\npost workout: 100 Gms Fish Curry + 50 Gms Rice, Chamomile Tea', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds, 2 White Eggs + 8 Soaked Almonds + 1 Banana', 'Tofu Capsicum Bhurji, Protein Shake With Water\npre workout: Tofu Scrambled\npost workout: Any Seasonal Fruits', 'Subway Veggies Delight, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Chicken Breast Roasted – 150 Gms\npost workout: Protein Shake With Water\n\n', 'Panner Wrap With Apple, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds, Vegetable Oats With 3 Egg Whites\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'super_admin');

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
(14, 'Derrick Agatep', 'derrickagatep', 'admin', 1, 'derrick1'),
(15, 'BJ Marquez', 'marquezbj', 'admin', 1, 'marquez21'),
(16, 'Aaron Lopez', 'ronlopez', 'admin', 1, 'aaron11'),
(17, 'Eljay Santos', 'ljsantos', 'admin', 1, 'santos03'),
(18, 'Kimberly Gutierrez', 'kimgutierrez', 'admin', 0, 'kimberly01'),
(19, 'Rafael razon', 'Rafaelrazon', 'user', 1, 'rafael1'),
(20, 'Jasper Rey Devera', 'Jasper Rey Devera', 'user', 0, 'kpmxevio'),
(21, 'Rowien B. Guevarra', 'Rowien B. Guevarra', 'user', 0, 'vipj6mt'),
(22, 'MARCO JELL R. AGANON', 'MARCO JELL ', 'user', 1, 'p0u64cnx'),
(23, 'Jessa Mae P. Granadozin', 'jessa1', 'user', 0, 'jessa123'),
(24, 'Jansen Bautista', 'Jansen ', 'user', 0, 's0tgogap'),
(25, 'Vanessa M.', 'Vanessa', 'user', 0, 'mwkffnfz'),
(26, 'Mary Rose Bagain', 'Mary Rose ', 'user', 0, '6kitl9dv'),
(27, 'Sofia Daileg', 'Sofia', 'user', 0, 'l17htjh4h'),
(28, 'Mazikeen', 'Mazikeen', 'user', 0, 'u8np6zq1'),
(29, 'Kyle', 'Kyle1', 'user', 0, 'szxiizfh'),
(30, 'Kenneth P.', 'Kenneth', 'user', 0, 'vr8cywj4'),
(31, 'Kyla M.', 'kyla1', 'user', 0, 'kyla123'),
(32, 'Kyle Estrella', 'Kyle Estrella', 'user', 0, 'riivvt0o'),
(33, 'Bimbers', 'Bimbers', 'user', 0, 'c5pzrl2q'),
(34, 'Kathleen', 'Kathleen1', 'user', 0, '2prxa4ou'),
(35, 'Mjey', 'Mjey1', 'user', 0, 'kkv6d6bj'),
(36, 'Sofiyuh', 'Sofiyuh', 'user', 0, '3s2qv0ba'),
(37, 'Donalene Fabillar', 'Donalene ', 'user', 0, 'mgfvm17qk'),
(38, 'Bc Eterosa', 'Bc Eterosa', 'user', 0, 'is8ffq9h'),
(39, 'Arianne D.', 'Arianne', 'user', 0, 'csu5m9ul'),
(40, 'Ye M. Abellar', 'abellar', 'user', 0, 'pzqmaicg'),
(41, 'Karen R.', 'Karen', 'user', 0, 'jeps5wvr'),
(42, 'Raven P.', 'Raven', 'user', 0, '5pj1b7xy'),
(43, 'Arvin Mel Flores', 'Arvin ', 'user', 0, 'ywp4xdwig'),
(44, 'Kai', 'Kaii1', 'user', 0, 'qjsrv96c'),
(45, 'Kaye', 'Kaye1', 'user', 0, '5kjzxgyx'),
(46, 'Maria Teresa V.', 'Maria ', 'user', 0, 'o270iihm'),
(47, 'John Phillip Miranda', 'John Phillip', 'user', 0, 'kb7zxzqv'),
(48, 'Raul Benedicto', 'Raul1', 'user', 0, 'nya30mxl'),
(49, 'Jan Danilo ', 'Jan Danilo ', 'user', 0, 'gty1f9pw'),
(50, 'Nicole Rianie Tilos', 'Nicole Rianie ', 'user', 1, 'u7dbc26e'),
(51, 'Roby R.', 'Roby1', 'user', 0, '804expia'),
(52, 'Christian', 'Christian1', 'user', 0, '5j9a75za'),
(53, 'Kiezel', 'Kiezel1', 'user', 0, 'gvxamcvo'),
(54, 'Marc Joven F. Obiena', 'Marc Joven', 'user', 0, 'yzvt2ff8k'),
(55, 'Edward L.', 'Edward', 'user', 0, '84jea4hg'),
(56, 'Cedric B.', 'Cedric', 'user', 0, '9thytm8xg'),
(57, 'Jerome Granil', 'Jerome', 'user', 0, 'vzvxxfca'),
(58, 'Clarence Rombaoa', 'Clarence ', 'user', 0, '1b83z11i'),
(59, 'Diego', 'Diego1', 'user', 0, 'l9koypgc'),
(60, 'Michael', 'Michael1', 'user', 0, 'mta4eo14g'),
(61, 'Hanz', 'Hanz1', 'user', 0, 'oj5elvip'),
(62, 'Jay Mark Granil', 'Jay Mark ', 'user', 0, 'gf118vym'),
(63, 'Bryan Espirito', 'Bryan ', 'user', 0, 'y3rh841m'),
(64, 'Jester ', 'Jester', 'user', 0, 'shkj2c8ph'),
(65, 'MJay', 'MJay1', 'user', 0, 'g3h75ta6'),
(66, 'Delacruz, Maigan', 'Maigan', 'user', 0, 'zgv1ote3'),
(67, 'Julius Christian A. Aberin', 'Julius', 'user', 0, 'y2w53hwv'),
(68, 'Jen Conde', 'Conde1', 'user', 1, '82ulw0a'),
(69, 'Vincent M', 'Vincent1', 'user', 0, 'zcrqeum8'),
(70, 'Njay Param', 'Njay1', 'user', 1, 'ajif6xgn'),
(71, 'James dela cruz', 'James', 'user', 1, '0zgzw0bz'),
(72, 'Alvin M', 'Alvin1', 'user', 1, 'lvqdmpl6');

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
(68, 'super_admin', 'Logoff - success', '49.150.107.175', 'Linux', '2024-02-18 10:32:17'),
(69, 'super_admin', 'Logon - success', '49.150.103.84', 'Windows', '2024-02-29 03:04:16'),
(70, 'super_admin', 'Create - new product \"Rule 1 Whey Protein\"', '49.150.103.84', 'Windows', '2024-02-29 03:28:14'),
(71, 'super_admin', 'Create - new product \"Prothin Whey Prothin Ripped Chocolate\"', '49.150.103.84', 'Windows', '2024-02-29 03:30:28'),
(72, 'super_admin', 'Create - new product \"Prothin Whey Prothin Ripped Vanilla\"', '49.150.103.84', 'Windows', '2024-02-29 03:31:44'),
(73, 'super_admin', 'Create - new product \"Muscletech Nitrotech Pro Performance Series Vanilla\"', '49.150.103.84', 'Windows', '2024-02-29 03:33:05'),
(74, 'super_admin', 'Create - new product \"300g Athlene Active Creatine\"', '49.150.103.84', 'Windows', '2024-02-29 03:35:29'),
(75, 'super_admin', 'Update - product \"Athlene Active Creatine\"', '49.150.103.84', 'Windows', '2024-02-29 03:35:58'),
(76, 'super_admin', 'Update - user \"admin_A\"', '49.150.103.84', 'Windows', '2024-02-29 03:39:14'),
(77, 'super_admin', 'Delete - account \"admin_A\"', '49.150.103.84', 'Windows', '2024-02-29 03:39:52'),
(78, 'super_admin', 'Create - new user \"derrickagatep\"', '49.150.103.84', 'Windows', '2024-02-29 03:41:40'),
(79, 'super_admin', 'Delete - account \"admin_B\"', '49.150.103.84', 'Windows', '2024-02-29 03:42:11'),
(80, 'super_admin', 'Delete - account \"user_a\"', '49.150.103.84', 'Windows', '2024-02-29 03:42:23'),
(81, 'super_admin', 'Delete - account \"user_b\"', '49.150.103.84', 'Windows', '2024-02-29 03:43:04'),
(82, 'super_admin', 'Create - new user \"marquezbj\"', '49.150.103.84', 'Windows', '2024-02-29 03:45:23'),
(83, 'super_admin', 'Update - user \"marquezbj\"', '49.150.103.84', 'Windows', '2024-02-29 03:45:59'),
(84, 'super_admin', 'Delete - account \"user_c\"', '49.150.103.84', 'Windows', '2024-02-29 03:46:26'),
(85, 'super_admin', 'Delete - account \"user_d\"', '49.150.103.84', 'Windows', '2024-02-29 03:46:38'),
(86, 'super_admin', 'Delete - account \"user_e\"', '49.150.103.84', 'Windows', '2024-02-29 03:46:49'),
(87, 'super_admin', 'Delete - account \"user_1\"', '49.150.103.84', 'Windows', '2024-02-29 03:47:01'),
(88, 'super_admin', 'Delete - account \"user_2\"', '49.150.103.84', 'Windows', '2024-02-29 03:47:11'),
(89, 'super_admin', 'Delete - account \"user_3\"', '49.150.103.84', 'Windows', '2024-02-29 03:47:25'),
(90, 'super_admin', 'Delete - account \"user_4\"', '49.150.103.84', 'Windows', '2024-02-29 03:47:49'),
(91, 'super_admin', 'Delete - account \"user_5\"', '49.150.103.84', 'Windows', '2024-02-29 03:48:03'),
(92, 'super_admin', 'Create - new user \"ronlopez\"', '49.150.103.84', 'Windows', '2024-02-29 03:50:44'),
(93, 'super_admin', 'Update - user \"derrickagatep\"', '49.150.103.84', 'Windows', '2024-02-29 03:51:08'),
(94, 'super_admin', 'Change - status of user \"ronlopez\"', '49.150.103.84', 'Windows', '2024-02-29 03:51:31'),
(95, 'super_admin', 'Change - status of user \"derrickagatep\"', '49.150.103.84', 'Windows', '2024-02-29 03:51:37'),
(96, 'super_admin', 'Update - user \"ronlopez\"', '49.150.103.84', 'Windows', '2024-02-29 03:53:01'),
(97, 'super_admin', 'Change - status of user \"ronlopez\"', '49.150.103.84', 'Windows', '2024-02-29 03:53:32'),
(98, 'super_admin', 'Update - user \"marquezbj\"', '49.150.103.84', 'Windows', '2024-02-29 03:54:30'),
(99, 'super_admin', 'Change - status of user \"marquezbj\"', '49.150.103.84', 'Windows', '2024-02-29 03:54:38'),
(100, 'super_admin', 'Update - user \"derrickagatep\"', '49.150.103.84', 'Windows', '2024-02-29 03:55:09'),
(101, 'super_admin', 'Change - status of user \"derrickagatep\"', '49.150.103.84', 'Windows', '2024-02-29 03:55:18'),
(102, 'super_admin', 'Create - new user \"ljsantos\"', '49.150.103.84', 'Windows', '2024-02-29 03:58:45'),
(103, 'super_admin', 'Create - new user \"kimgutierrez\"', '49.150.103.84', 'Windows', '2024-02-29 04:01:38'),
(104, 'super_admin', 'Update - password of user \"derrickagatep\"', '49.150.103.84', 'Windows', '2024-02-29 04:02:15'),
(105, 'super_admin', 'Update - password of user \"marquezbj\"', '49.150.103.84', 'Windows', '2024-02-29 04:02:49'),
(106, 'super_admin', 'Update - password of user \"ronlopez\"', '49.150.103.84', 'Windows', '2024-02-29 04:03:20'),
(107, 'super_admin', 'Update - password of user \"ljsantos\"', '49.150.103.84', 'Windows', '2024-02-29 04:03:45'),
(108, 'super_admin', 'Update - password of user \"kimgutierrez\"', '49.150.103.84', 'Windows', '2024-02-29 04:04:08'),
(109, 'super_admin', 'Logon - success', '136.158.118.129', 'Windows', '2024-02-29 04:34:02'),
(110, 'super_admin', 'Logoff - success', '49.150.103.84', 'Windows', '2024-02-29 04:36:29'),
(111, 'super_admin', 'Logon - success', '119.111.233.64', 'Linux', '2024-03-02 05:02:31'),
(112, 'super_admin', 'Logoff - success', '119.111.233.64', 'Linux', '2024-03-02 05:03:16'),
(113, 'super_admin', 'Logon - success', '136.158.118.179', 'Windows', '2024-03-02 05:19:32'),
(114, 'super_admin', 'Change - status of user \"kimgutierrez\"', '136.158.118.179', 'Windows', '2024-03-02 05:20:19'),
(115, 'super_admin', 'Change - status of user \"kimgutierrez\"', '136.158.118.179', 'Windows', '2024-03-02 05:20:43'),
(116, 'super_admin', 'Update - user \"kimgutierrez\"', '136.158.118.179', 'Windows', '2024-03-02 05:21:43'),
(117, 'super_admin', 'Logoff - success', '136.158.118.179', 'Windows', '2024-03-02 05:22:53'),
(118, 'derrickagatep', 'Logon - success', '136.158.118.179', 'Windows', '2024-03-02 05:23:02'),
(119, 'derrickagatep', 'Create - new user \"Rafaelrazon\"', '136.158.118.179', 'Windows', '2024-03-02 05:25:50'),
(120, 'derrickagatep', 'Create - new user \"Jasper Rey Devera\"', '136.158.118.179', 'Windows', '2024-03-02 05:28:24'),
(121, 'derrickagatep', 'Update - user \"Rafaelrazon\"', '136.158.118.179', 'Windows', '2024-03-02 05:28:40'),
(122, 'derrickagatep', 'Create - new user \"Rowien B. Guevarra\"', '136.158.118.179', 'Windows', '2024-03-02 05:30:04'),
(123, 'derrickagatep', 'Create - new user \"MARCO JELL \"', '136.158.118.179', 'Windows', '2024-03-02 05:31:50'),
(124, 'derrickagatep', 'Create - new user \"jessa1\"', '136.158.118.179', 'Windows', '2024-03-02 05:33:42'),
(125, 'derrickagatep', 'Create - new user \"Jansen \"', '136.158.118.179', 'Windows', '2024-03-02 05:37:37'),
(126, 'derrickagatep', 'Create - new user \"Vanessa\"', '136.158.118.179', 'Windows', '2024-03-02 05:38:44'),
(127, 'derrickagatep', 'Create - new user \"Mary Rose \"', '136.158.118.179', 'Windows', '2024-03-02 05:40:14'),
(128, 'derrickagatep', 'Create - new user \"Sofia\"', '136.158.118.179', 'Windows', '2024-03-02 05:41:29'),
(129, 'derrickagatep', 'Create - new user \"Mazikeen\"', '136.158.118.179', 'Windows', '2024-03-02 05:42:34'),
(130, 'derrickagatep', 'Create - new user \"Kyle1\"', '136.158.118.179', 'Windows', '2024-03-02 05:44:14'),
(131, 'derrickagatep', 'Create - new user \"Kenneth\"', '136.158.118.179', 'Windows', '2024-03-02 05:45:40'),
(132, 'derrickagatep', 'Logoff - success', '136.158.118.179', 'Windows', '2024-03-02 05:46:01'),
(133, 'super_admin', 'Logon - success', '136.158.118.179', 'Windows', '2024-03-02 05:46:10'),
(134, 'super_admin', 'Logoff - success', '136.158.118.179', 'Windows', '2024-03-02 05:50:03'),
(135, 'super_admin', 'Logon - success', '136.158.118.179', 'Windows', '2024-03-02 05:50:28'),
(136, 'super_admin', 'Logoff - success', '136.158.118.179', 'Windows', '2024-03-02 05:51:38'),
(137, 'marquezbj', 'Logon - success', '136.158.118.179', 'Windows', '2024-03-02 05:52:48'),
(138, 'marquezbj', 'Create - new user \"kyla1\"', '136.158.118.179', 'Windows', '2024-03-02 05:54:51'),
(139, 'marquezbj', 'Create - new user \"Kyle Estrella\"', '136.158.118.179', 'Windows', '2024-03-02 05:57:31'),
(140, 'marquezbj', 'Create - new user \"Bimbers\"', '136.158.118.179', 'Windows', '2024-03-02 05:58:45'),
(141, 'marquezbj', 'Create - new user \"Kathleen1\"', '136.158.118.179', 'Windows', '2024-03-02 05:59:48'),
(142, 'marquezbj', 'Create - new user \"Mjey1\"', '136.158.118.179', 'Windows', '2024-03-02 06:01:16'),
(143, 'marquezbj', 'Create - new user \"Sofiyuh\"', '136.158.118.179', 'Windows', '2024-03-02 06:02:40'),
(144, 'marquezbj', 'Create - new user \"Donalene \"', '136.158.118.179', 'Windows', '2024-03-02 06:13:19'),
(145, 'marquezbj', 'Create - new user \"Bc Eterosa\"', '136.158.118.179', 'Windows', '2024-03-02 06:14:22'),
(146, 'marquezbj', 'Create - new user \"Arianne\"', '136.158.118.179', 'Windows', '2024-03-02 06:15:20'),
(147, 'marquezbj', 'Update - user \"abellar\"', '136.158.118.179', 'Windows', '2024-03-02 06:17:06'),
(148, 'marquezbj', 'Create - new user \"Karen\"', '136.158.118.179', 'Windows', '2024-03-02 06:18:14'),
(149, 'marquezbj', 'Create - new user \"Raven\"', '136.158.118.179', 'Windows', '2024-03-02 06:19:17'),
(150, 'marquezbj', 'Logoff - success', '136.158.118.179', 'Windows', '2024-03-02 06:19:32'),
(151, 'super_admin', 'Logon - success', '136.158.118.179', 'Windows', '2024-03-02 06:20:01'),
(152, 'super_admin', 'Logoff - success', '136.158.118.179', 'Windows', '2024-03-02 06:21:03'),
(153, 'ronlopez', 'Logon - success', '136.158.118.179', 'Windows', '2024-03-02 06:21:27'),
(154, 'ronlopez', 'Create - new user \"Arvin \"', '136.158.118.179', 'Windows', '2024-03-02 06:22:45'),
(155, 'ronlopez', 'Create - new user \"Kaii1\"', '136.158.118.179', 'Windows', '2024-03-02 06:23:53'),
(156, 'ronlopez', 'Create - new user \"Kaye1\"', '136.158.118.179', 'Windows', '2024-03-02 06:25:01'),
(157, 'ronlopez', 'Create - new user \"Maria \"', '136.158.118.179', 'Windows', '2024-03-02 06:26:12'),
(158, 'ronlopez', 'Create - new user \"John Phillip\"', '136.158.118.179', 'Windows', '2024-03-02 06:27:17'),
(159, 'ronlopez', 'Create - new user \"Raul1\"', '136.158.118.179', 'Windows', '2024-03-02 06:28:57'),
(160, 'ronlopez', 'Create - new user \"Jan Danilo \"', '136.158.118.179', 'Windows', '2024-03-02 06:30:16'),
(161, 'ronlopez', 'Create - new user \"Nicole Rianie \"', '136.158.118.179', 'Windows', '2024-03-02 06:31:16'),
(162, 'ronlopez', 'Create - new user \"Roby1\"', '136.158.118.179', 'Windows', '2024-03-02 06:32:30'),
(163, 'ronlopez', 'Create - new user \"Christian1\"', '136.158.118.179', 'Windows', '2024-03-02 06:33:23'),
(164, 'ronlopez', 'Create - new user \"Kiezel1\"', '136.158.118.179', 'Windows', '2024-03-02 06:34:27'),
(165, 'ronlopez', 'Create - new user \"Marc Joven\"', '136.158.118.179', 'Windows', '2024-03-02 06:35:26'),
(166, 'ronlopez', 'Logoff - success', '136.158.118.179', 'Windows', '2024-03-02 06:35:36'),
(167, 'super_admin', 'Logon - success', '136.158.118.179', 'Windows', '2024-03-02 06:35:46'),
(168, 'super_admin', 'Logoff - success', '136.158.118.179', 'Windows', '2024-03-02 06:37:21'),
(169, 'ljsantos', 'Logon - success', '136.158.118.179', 'Windows', '2024-03-02 06:37:38'),
(170, 'ljsantos', 'Create - new user \"Edward\"', '136.158.118.179', 'Windows', '2024-03-02 06:38:47'),
(171, 'ljsantos', 'Create - new user \"Cedric\"', '136.158.118.179', 'Windows', '2024-03-02 06:41:02'),
(172, 'ljsantos', 'Create - new user \"Jerome\"', '136.158.118.179', 'Windows', '2024-03-02 06:42:05'),
(173, 'ljsantos', 'Create - new user \"Clarence \"', '136.158.118.179', 'Windows', '2024-03-02 06:43:12'),
(174, 'ljsantos', 'Create - new user \"Diego1\"', '136.158.118.179', 'Windows', '2024-03-02 06:44:10'),
(175, 'ljsantos', 'Create - new user \"Michael1\"', '136.158.118.179', 'Windows', '2024-03-02 06:45:07'),
(176, 'ljsantos', 'Create - new user \"Hanz1\"', '136.158.118.179', 'Windows', '2024-03-02 06:45:58'),
(177, 'ljsantos', 'Create - new user \"Jay Mark \"', '136.158.118.179', 'Windows', '2024-03-02 06:46:53'),
(178, 'ljsantos', 'Create - new user \"Bryan \"', '136.158.118.179', 'Windows', '2024-03-02 06:47:53'),
(179, 'ljsantos', 'Create - new user \"Jester\"', '136.158.118.179', 'Windows', '2024-03-02 06:48:56'),
(180, 'ljsantos', 'Create - new user \"MJay1\"', '136.158.118.179', 'Windows', '2024-03-02 06:50:12'),
(181, 'ljsantos', 'Logoff - success', '136.158.118.179', 'Windows', '2024-03-02 06:50:20'),
(182, 'super_admin', 'Logon - success', '136.158.118.179', 'Windows', '2024-03-02 06:50:31'),
(183, 'super_admin', 'Logoff - success', '136.158.118.179', 'Windows', '2024-03-02 06:51:21'),
(184, 'kimgutierrez', 'Logon - success', '136.158.118.179', 'Windows', '2024-03-02 06:51:30'),
(185, 'kimgutierrez', 'Create - new user \"Maigan\"', '136.158.118.179', 'Windows', '2024-03-02 06:52:43'),
(186, 'kimgutierrez', 'Create - new user \"Julius\"', '136.158.118.179', 'Windows', '2024-03-02 06:53:35'),
(187, 'kimgutierrez', 'Create - new user \"Conde1\"', '136.158.118.179', 'Windows', '2024-03-02 06:54:48'),
(188, 'kimgutierrez', 'Create - new user \"Vincent1\"', '136.158.118.179', 'Windows', '2024-03-02 06:56:06'),
(189, 'kimgutierrez', 'Create - new user \"Njay1\"', '136.158.118.179', 'Windows', '2024-03-02 06:57:07'),
(190, 'kimgutierrez', 'Create - new user \"James\"', '136.158.118.179', 'Windows', '2024-03-02 06:58:27'),
(191, 'kimgutierrez', 'Create - new user \"Alvin1\"', '136.158.118.179', 'Windows', '2024-03-02 06:59:36'),
(192, 'kimgutierrez', 'Logoff - success', '136.158.118.179', 'Windows', '2024-03-02 06:59:43'),
(193, 'super_admin', 'Logon - failed', '136.158.118.179', 'Windows', '2024-03-02 06:59:53'),
(194, 'super_admin', 'Logon - failed', '136.158.118.179', 'Windows', '2024-03-02 07:00:00'),
(195, 'super_admin', 'Logon - success', '136.158.118.179', 'Windows', '2024-03-02 07:00:07'),
(196, 'super_admin', 'Logoff - success', '136.158.118.179', 'Windows', '2024-03-02 07:00:33'),
(197, 'super_admin', 'Logon - success', '119.111.233.64', 'Windows', '2024-03-02 07:11:28'),
(198, 'super_admin', 'Update - password of user \"kyla1\"', '119.111.233.64', 'Windows', '2024-03-02 07:12:40'),
(199, 'super_admin', 'Logoff - success', '119.111.233.64', 'Windows', '2024-03-02 07:12:45'),
(200, 'kyla1', 'Logon - success', '119.111.233.64', 'Windows', '2024-03-02 07:14:23'),
(201, 'super_admin', 'Logon - success', '119.111.233.64', 'Windows', '2024-03-02 07:17:34'),
(202, 'super_admin', 'Create - meal plan for \"kyla1\"', '119.111.233.64', 'Windows', '2024-03-02 07:18:44'),
(203, 'kyla1', 'Add - Muscletech Nitrotech Pro Performance Series Vanilla in cart', '119.111.233.64', 'Windows', '2024-03-02 07:20:44'),
(204, 'kyla1', 'Logoff - success', '119.111.233.64', 'Windows', '2024-03-02 07:24:02'),
(205, 'super_admin', 'Logon - success', '119.111.233.64', 'Windows', '2024-03-02 07:24:11'),
(206, 'ronlopez', 'Logon - success', '119.111.233.64', 'Windows', '2024-03-02 07:26:39'),
(207, 'super_admin', 'Logoff - success', '119.111.233.64', 'Windows', '2024-03-02 07:33:25'),
(208, 'super_admin', 'Logoff - success', '136.158.118.24', 'Windows', '2024-03-21 03:56:43'),
(209, 'super_admin', 'Logon - success', '136.158.118.24', 'Windows', '2024-03-21 04:00:01'),
(210, 'super_admin', 'Logoff - success', '136.158.118.24', 'Windows', '2024-03-21 04:00:41'),
(211, 'super_admin', 'Logon - success', '136.158.118.24', 'Windows', '2024-03-21 04:05:03'),
(212, 'super_admin', 'Logoff - success', '136.158.118.24', 'Windows', '2024-03-21 04:06:49'),
(213, 'super_admin', 'Logon - success', '136.158.118.24', 'Windows', '2024-03-21 04:20:39'),
(214, 'super_admin', 'Logoff - success', '136.158.118.24', 'Windows', '2024-03-21 04:22:53'),
(215, 'super_admin', 'Logon - failed', '136.158.118.24', 'Windows', '2024-03-21 04:27:16'),
(216, 'super_admin', 'Logon - success', '136.158.118.24', 'Windows', '2024-03-21 04:27:19'),
(217, 'super_admin', 'Logoff - success', '136.158.118.24', 'Windows', '2024-03-21 04:28:25'),
(218, '', 'Logon - failed', '136.158.118.24', 'Windows', '2024-03-21 04:39:48'),
(219, 'super_admin', 'Logon - success', '136.158.118.24', 'Windows', '2024-03-21 04:39:57'),
(220, 'super_admin', 'Logoff - success', '136.158.118.24', 'Windows', '2024-03-21 08:40:12'),
(221, 'super_admin', 'Logon - success', '136.158.118.29', 'Windows', '2024-03-21 09:08:59'),
(222, 'super_admin', 'Logoff - success', '136.158.118.29', 'Windows', '2024-03-21 09:10:57'),
(223, 'super_admin', 'Logon - success', '136.158.118.24', 'Windows', '2024-03-21 13:57:35'),
(224, 'super_admin', 'Logoff - success', '136.158.118.24', 'Windows', '2024-03-21 14:03:05'),
(225, 'super_admin', 'Logon - success', '136.158.118.24', 'Windows', '2024-03-21 15:01:42'),
(226, 'super_admin', 'Logon - success', '111.90.226.22', 'Windows', '2024-03-24 05:11:28'),
(227, 'super_admin', 'Update - ready meal \"Bulking normal classification\"', '111.90.226.22', 'Windows', '2024-03-24 05:29:02'),
(228, 'super_admin', 'Update - ready meal \"Bulking normal classification\"', '111.90.226.22', 'Windows', '2024-03-24 05:32:25'),
(229, 'super_admin', 'Update - ready meal \"Body recomposition overweight\"', '111.90.226.22', 'Windows', '2024-03-24 05:32:42'),
(230, 'super_admin', 'Update - ready meal \"Body recomposition underweight\"', '111.90.226.22', 'Windows', '2024-03-24 05:42:30'),
(231, 'super_admin', 'Update - ready meal \"Body recomposition underweight\"', '111.90.226.22', 'Windows', '2024-03-24 05:42:31'),
(232, 'super_admin', 'Update - ready meal \"Cuts for normal \"', '111.90.226.22', 'Windows', '2024-03-24 05:46:22'),
(233, 'super_admin', 'Update - ready meal \"Cuts for overweight\"', '111.90.226.22', 'Windows', '2024-03-24 05:55:34'),
(234, 'super_admin', 'Create - meal plan for \"Rafaelrazon\"', '111.90.226.22', 'Windows', '2024-03-24 05:57:01'),
(235, 'super_admin', 'Create - meal plan for \"Jasper Rey Devera\"', '111.90.226.22', 'Windows', '2024-03-24 05:57:20'),
(236, 'super_admin', 'Create - meal plan for \"Rowien B. Guevarra\"', '111.90.226.22', 'Windows', '2024-03-24 05:57:44'),
(237, 'super_admin', 'Create - meal plan for \"MARCO JELL \"', '111.90.226.22', 'Windows', '2024-03-24 05:58:13'),
(238, 'super_admin', 'Update - ready meal \"Cuts for overweight\"', '111.90.226.22', 'Windows', '2024-03-24 06:04:15'),
(239, 'super_admin', 'Update - ready meal \"Cuts for overweight\"', '111.90.226.22', 'Windows', '2024-03-24 06:04:15'),
(240, 'super_admin', 'Update - ready meal \"Cuts for overweight\"', '111.90.226.22', 'Windows', '2024-03-24 06:07:02'),
(241, 'Rafaelrazon', 'Logon - success', '111.90.226.22', 'Windows', '2024-03-24 06:08:26'),
(242, 'super_admin', 'Logon - success', '136.158.118.29', 'Linux', '2024-03-24 10:28:22'),
(243, 'super_admin', 'Logoff - success', '136.158.118.29', 'Linux', '2024-03-24 10:29:32'),
(244, 'Rafaelrazon', 'Logon - success', '136.158.118.29', 'Linux', '2024-03-24 10:29:43'),
(245, 'super_admin', 'Logon - success', '136.158.118.29', 'Windows', '2024-03-24 11:31:32'),
(246, 'super_admin', 'Logoff - success', '136.158.118.29', 'Windows', '2024-03-24 11:35:18'),
(247, 'derrickagatep', 'Logon - success', '136.158.118.29', 'Windows', '2024-03-24 11:35:24'),
(248, 'Jasper Rey Devera', 'Logon - success', '136.158.118.29', 'Windows', '2024-03-24 11:38:37'),
(249, 'derrickagatep', 'Logoff - success', '136.158.118.29', 'Windows', '2024-03-24 11:39:40'),
(250, 'super_admin', 'Logon - success', '136.158.118.29', 'Windows', '2024-03-24 11:39:48'),
(251, 'Jasper Rey Devera', 'Add - Prothin Whey Prothin Ripped Chocolate in cart', '136.158.118.29', 'Windows', '2024-03-24 11:40:30'),
(252, 'super_admin', 'Logoff - success', '136.158.118.29', 'Windows', '2024-03-24 11:42:23'),
(253, 'derrickagatep', 'Logon - success', '136.158.118.29', 'Windows', '2024-03-24 11:42:31'),
(254, 'derrickagatep', 'Logoff - success', '136.158.118.29', 'Windows', '2024-03-24 11:46:31'),
(255, 'super_admin', 'Logon - success', '119.111.230.179', 'Android', '2024-03-25 01:37:53'),
(256, 'super_admin', 'Logoff - success', '119.111.230.179', 'Android', '2024-03-25 01:38:40'),
(257, 'super_admin', 'Logoff - success', '180.191.40.240', 'Windows', '2024-03-25 03:23:35'),
(258, 'super_admin', 'Logon - success', '180.191.40.240', 'Windows', '2024-03-25 03:38:35'),
(259, 'derrickagatep', 'Logon - success', '180.191.40.240', 'Windows', '2024-03-25 03:40:02'),
(260, 'super_admin', 'Logoff - success', '180.191.40.240', 'Windows', '2024-03-25 03:41:41'),
(261, 'super_admin', 'Logon - success', '180.191.40.240', 'Windows', '2024-03-25 04:52:12'),
(262, 'super_admin', 'Update - password of user \"jessa1\"', '180.191.40.240', 'Windows', '2024-03-25 04:52:54'),
(263, 'super_admin', 'Logoff - success', '180.191.40.240', 'Windows', '2024-03-25 04:53:24'),
(264, 'jessa1', 'Logon - success', '180.191.40.240', 'Windows', '2024-03-25 04:53:33'),
(265, 'jessa1', 'Logoff - success', '180.191.40.240', 'Windows', '2024-03-25 04:54:27'),
(266, 'super_admin', 'Logon - success', '180.191.40.240', 'Windows', '2024-03-25 04:54:37'),
(267, 'super_admin', 'Logoff - success', '180.191.40.240', 'Windows', '2024-03-25 04:55:32'),
(268, 'Rafaelrazon', 'Logoff - success', '180.191.40.240', 'Windows', '2024-03-25 04:56:04'),
(269, 'Rafaelrazon', 'Logon - success', '180.191.40.240', 'Windows', '2024-03-25 04:56:38'),
(270, 'super_admin', 'Logon - success', '136.158.118.69', 'Windows', '2024-03-28 10:14:21'),
(271, 'user_c', 'Logoff - success', '136.158.118.69', 'Windows', '2024-04-02 12:57:10'),
(272, 'superadmin', 'Logon - failed', '136.158.119.132', 'Linux', '2024-04-04 10:39:02'),
(273, 'super_admin', 'Logon - success', '136.158.119.132', 'Linux', '2024-04-04 10:39:13'),
(274, 'undefined', 'Logon - failed', '192.168.100.121', 'Android', '2024-04-04 14:29:16'),
(275, 'undefined', 'Logon - failed', '192.168.100.121', 'Android', '2024-04-04 14:29:21'),
(276, 'super_admin', 'Logon - success', '119.111.232.146', 'Windows', '2024-04-05 05:26:43'),
(277, 'super_admin', 'Logoff - success', '119.111.232.146', 'Windows', '2024-04-05 05:28:50'),
(278, 'rafaelrazon', 'Logon - failed', '119.111.232.146', 'Windows', '2024-04-05 05:28:56'),
(279, 'Rafaelrazon', 'Logon - failed', '119.111.232.146', 'Windows', '2024-04-05 05:29:02'),
(280, 'super_admin', 'Logon - success', '119.111.232.146', 'Windows', '2024-04-05 05:29:11'),
(281, 'super_admin', 'Logoff - success', '119.111.232.146', 'Windows', '2024-04-05 05:29:36'),
(282, 'Rafaelrazon', 'Logon - failed', '119.111.232.146', 'Windows', '2024-04-05 05:29:41'),
(283, 'super_admin', 'Logon - success', '119.111.232.146', 'Windows', '2024-04-05 05:29:55'),
(284, 'super_admin', 'Update - user \"MARCO JELL \"', '119.111.232.146', 'Windows', '2024-04-05 05:31:18'),
(285, 'super_admin', 'Change - status of user \"Rafaelrazon\"', '119.111.232.146', 'Windows', '2024-04-05 05:31:33'),
(286, 'super_admin', 'Update - user \"Rafaelrazon\"', '119.111.232.146', 'Windows', '2024-04-05 05:32:07'),
(287, 'super_admin', 'Change - status of user \"Rafaelrazon\"', '119.111.232.146', 'Windows', '2024-04-05 05:32:44'),
(288, 'super_admin', 'Update - user \"Rafaelrazon\"', '119.111.232.146', 'Windows', '2024-04-05 05:33:10'),
(289, 'super_admin', 'Logoff - success', '119.111.232.146', 'Windows', '2024-04-05 05:33:36'),
(290, 'Rafaelrazon', 'Logon - success', '119.111.232.146', 'Windows', '2024-04-05 05:33:42'),
(291, 'Rafaelrazon', 'Logoff - success', '119.111.232.146', 'Windows', '2024-04-05 05:34:30'),
(292, 'super_admin', 'Logon - success', '119.111.232.146', 'Windows', '2024-04-05 05:39:58'),
(293, 'super_admin', 'Logoff - success', '119.111.232.146', 'Windows', '2024-04-05 05:40:07');

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
(13, 'derrickagatep', '1989-01-19', 35, 69, 175, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'admin', '0.00', '2024-01-01', '2025-01-01', '2024-02-29 03:41:40', 'super_admin'),
(14, 'marquezbj', '1993-06-13', 31, 66, 171, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'admin', '0.00', '2024-01-01', '2025-01-01', '2024-02-29 03:45:22', 'super_admin'),
(15, 'ronlopez', '1993-12-14', 30, 65, 168, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'admin', '0.00', '2024-01-01', '2025-01-01', '2024-02-29 03:50:44', 'super_admin'),
(16, 'ljsantos', '1995-09-09', 28, 71, 174, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'admin', '0.00', '2024-01-01', '2025-01-01', '2024-02-29 03:58:45', 'super_admin'),
(17, 'kimgutierrez', '1993-07-27', 31, 59, 165, 'Female', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'admin', '0.00', '2024-01-01', '2024-04-04', '2024-02-29 04:01:37', 'super_admin'),
(18, 'Rafaelrazon', '2000-07-12', 24, 78, 180, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Premium', '1500.00', '2024-04-05', '2024-05-05', '2024-03-02 05:25:50', 'derrickagatep'),
(19, 'Jasper Rey Devera', '2002-04-28', 22, 48, 156, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Premium', '1500.00', '2024-03-02', '2024-04-02', '2024-03-02 05:28:23', 'derrickagatep'),
(20, 'Rowien B. Guevarra', '1998-06-15', 26, 63, 165, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Premium', '1500.00', '2024-03-02', '2024-04-02', '2024-03-02 05:30:04', 'derrickagatep'),
(21, 'MARCO JELL ', '2001-05-22', 23, 68, 172, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '0.00', '2024-04-05', '2024-05-05', '2024-03-02 05:31:49', 'derrickagatep'),
(22, 'jessa1', '1997-02-15', 27, 60, 145, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-03-02', '2024-04-02', '2024-03-02 05:33:42', 'derrickagatep'),
(23, 'Jansen ', '2000-07-12', 24, 71, 160, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-02-26', '2024-03-26', '2024-03-02 05:37:36', 'derrickagatep'),
(24, 'Vanessa', '2003-05-25', 21, 55, 156, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-03-02', '2024-04-02', '2024-03-02 05:38:44', 'derrickagatep'),
(25, 'Mary Rose ', '1994-02-28', 30, 65, 173, 'Female', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-02-28', '2024-03-28', '2024-03-02 05:40:14', 'derrickagatep'),
(26, 'Sofia', '1999-05-18', 25, 53, 145, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-02-26', '2024-03-26', '2024-03-02 05:41:29', 'derrickagatep'),
(27, 'Mazikeen', '1998-06-14', 26, 76, 185, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-03-01', '2024-04-01', '2024-03-02 05:42:33', 'derrickagatep'),
(28, 'Kyle1', '1997-03-21', 27, 48, 156, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-03-02', '2024-04-02', '2024-03-02 05:44:14', 'derrickagatep'),
(29, 'Kenneth', '1996-06-27', 28, 74, 178, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-02-29', '2024-03-29', '2024-03-02 05:45:40', 'derrickagatep'),
(30, 'kyla1', '2005-04-16', 19, 52, 143, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Premium', '1500.00', '2024-02-24', '2024-03-24', '2024-03-02 05:54:51', 'marquezbj'),
(31, 'Kyle Estrella', '2001-07-25', 23, 45, 158, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Premium', '1500.00', '2024-03-01', '2024-04-01', '2024-03-02 05:57:31', 'marquezbj'),
(32, 'Bimbers', '2004-08-21', 20, 48, 135, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Premium', '1500.00', '2024-02-29', '2024-03-29', '2024-03-02 05:58:45', 'marquezbj'),
(33, 'Kathleen1', '2005-04-15', 19, 40, 146, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-02-27', '2024-03-27', '2024-03-02 05:59:48', 'marquezbj'),
(34, 'Mjey1', '2001-01-24', 23, 46, 138, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-02-20', '2024-03-20', '2024-03-02 06:01:15', 'marquezbj'),
(35, 'Sofiyuh', '1995-02-18', 29, 75, 183, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-03-01', '2024-04-01', '2024-03-02 06:02:39', 'marquezbj'),
(36, 'Donalene ', '2000-05-18', 24, 60, 172, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-03-02', '2024-04-02', '2024-03-02 06:13:19', 'marquezbj'),
(37, 'Bc Eterosa', '2004-06-15', 20, 40, 142, 'Male', 'N/A ', 'N/A ', 'N/A ', 'N/A ', 'N/A ', 'N/A ', 'N/A ', 'N/A ', 'N/A ', 'N/A ', 'Monthly', '500.00', '2024-02-23', '2024-03-23', '2024-03-02 06:14:21', 'marquezbj'),
(38, 'Arianne', '2000-08-17', 24, 50, 156, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-03-01', '2024-04-01', '2024-03-02 06:15:19', 'marquezbj'),
(39, 'abellar', '2005-09-15', 18, 48, 158, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Monthly', '0.00', '2024-02-21', '2024-03-21', '2024-03-02 06:16:46', 'marquezbj'),
(40, 'Karen', '2000-06-24', 24, 50, 141, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Monthly', '500.00', '2024-02-20', '2024-03-20', '2024-03-02 06:18:13', 'marquezbj'),
(41, 'Raven', '2005-05-14', 19, 43, 134, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Monthly', '500.00', '2024-02-23', '2024-03-23', '2024-03-02 06:19:16', 'marquezbj'),
(42, 'Arvin ', '2006-08-16', 18, 38, 145, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Premium', '1500.00', '2024-02-28', '2024-03-28', '2024-03-02 06:22:44', 'ronlopez'),
(43, 'Kaii1', '1999-05-13', 25, 58, 165, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Premium', '1500.00', '2024-03-02', '2024-04-02', '2024-03-02 06:23:53', 'ronlopez'),
(44, 'Kaye1', '2000-12-29', 23, 45, 152, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Premium', '1500.00', '2024-02-26', '2024-03-26', '2024-03-02 06:25:01', 'ronlopez'),
(45, 'Maria ', '2000-05-16', 24, 58, 147, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Monthly', '500.00', '2024-02-16', '2024-03-16', '2024-03-02 06:26:12', 'ronlopez'),
(46, 'John Phillip', '1997-03-17', 27, 68, 154, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Monthly', '500.00', '2024-02-13', '2024-03-13', '2024-03-02 06:27:17', 'ronlopez'),
(47, 'Raul1', '2007-09-23', 16, 45, 138, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Monthly', '500.00', '2024-02-17', '2024-03-17', '2024-03-02 06:28:56', 'ronlopez'),
(48, 'Jan Danilo ', '2003-08-15', 21, 63, 184, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Monthly', '500.00', '2024-02-23', '2024-03-23', '2024-03-02 06:30:16', 'ronlopez'),
(49, 'Nicole Rianie ', '2001-06-15', 23, 50, 135, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Monthly', '500.00', '2024-02-21', '2024-04-21', '2024-03-02 06:31:16', 'ronlopez'),
(50, 'Roby1', '2000-01-13', 24, 95, 170, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Monthly', '500.00', '2024-02-28', '2024-03-28', '2024-03-02 06:32:30', 'ronlopez'),
(51, 'Christian1', '2000-12-23', 23, 85, 162, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Monthly', '500.00', '2024-02-22', '2024-03-22', '2024-03-02 06:33:22', 'ronlopez'),
(52, 'Kiezel1', '2003-07-15', 21, 45, 126, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Monthly', '500.00', '2024-02-29', '2024-03-29', '2024-03-02 06:34:27', 'ronlopez'),
(53, 'Marc Joven', '2001-08-02', 23, 90, 176, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Monthly', '500.00', '2024-02-27', '2024-03-27', '2024-03-02 06:35:26', 'ronlopez'),
(54, 'Edward', '2001-05-18', 23, 93, 187, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Premium', '1500.00', '2024-02-23', '2024-03-23', '2024-03-02 06:38:47', 'ljsantos'),
(55, 'Cedric', '2001-01-28', 23, 58, 165, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Premium', '1500.00', '2024-02-22', '2024-03-22', '2024-03-02 06:41:02', 'ljsantos'),
(56, 'Jerome', '1999-12-19', 24, 73, 158, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Premium', '1500.00', '2024-02-29', '2024-03-29', '2024-03-02 06:42:05', 'ljsantos'),
(57, 'Clarence ', '2001-06-18', 23, 53, 135, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Monthly', '500.00', '2024-03-02', '2024-04-02', '2024-03-02 06:43:11', 'ljsantos'),
(58, 'Diego1', '1997-05-23', 27, 69, 158, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Monthly', '500.00', '2024-03-02', '2024-04-02', '2024-03-02 06:44:10', 'ljsantos'),
(59, 'Michael1', '2005-07-15', 19, 74, 154, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Monthly', '500.00', '2024-03-01', '2024-04-01', '2024-03-02 06:45:07', 'ljsantos'),
(60, 'Hanz1', '2000-12-17', 23, 90, 178, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Monthly', '500.00', '2024-03-01', '2024-04-01', '2024-03-02 06:45:58', 'ljsantos'),
(61, 'Jay Mark ', '1998-04-17', 26, 83, 152, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Monthly', '500.00', '2024-02-28', '2024-03-28', '2024-03-02 06:46:53', 'ljsantos'),
(62, 'Bryan ', '2000-12-05', 23, 71, 147, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Monthly', '500.00', '2024-03-01', '2024-04-01', '2024-03-02 06:47:53', 'ljsantos'),
(63, 'Jester', '1996-05-17', 28, 86, 175, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Monthly', '500.00', '2024-02-29', '2024-03-29', '2024-03-02 06:48:55', 'ljsantos'),
(64, 'MJay1', '2003-08-14', 21, 56, 174, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Monthly', '500.00', '2024-03-30', '2024-03-30', '2024-03-02 06:50:12', 'ljsantos'),
(65, 'Maigan', '2001-04-13', 23, 68, 143, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Premium', '1500.00', '2024-03-02', '2024-04-02', '2024-03-02 06:52:42', 'kimgutierrez'),
(66, 'Julius', '2003-06-17', 21, 45, 154, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Monthly', '500.00', '2024-02-29', '2024-03-29', '2024-03-02 06:53:35', 'kimgutierrez'),
(67, 'Conde1', '1999-12-05', 24, 69, 159, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Premium', '1500.00', '2024-03-06', '2024-04-06', '2024-03-02 06:54:48', 'kimgutierrez'),
(68, 'Vincent1', '2000-08-29', 24, 98, 178, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Monthly', '500.00', '2024-03-05', '2024-04-05', '2024-03-02 06:56:06', 'kimgutierrez'),
(69, 'Njay1', '1997-05-17', 27, 85, 167, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Monthly', '500.00', '2024-03-08', '2024-04-08', '2024-03-02 06:57:07', 'kimgutierrez'),
(70, 'James', '1997-06-14', 27, 86, 162, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Monthly', '500.00', '2024-03-06', '2024-04-06', '2024-03-02 06:58:27', 'kimgutierrez'),
(71, 'Alvin1', '2002-01-28', 22, 82, 168, 'Male', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'Monthly', '500.00', '2024-03-09', '2024-04-09', '2024-03-02 06:59:36', 'kimgutierrez');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `meal_plan`
--
ALTER TABLE `meal_plan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `membership`
--
ALTER TABLE `membership`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `user_logs`
--
ALTER TABLE `user_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=294;

--
-- AUTO_INCREMENT for table `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
