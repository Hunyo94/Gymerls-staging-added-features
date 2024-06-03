-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql-174001-db.mysql-174001:10045
-- Generation Time: Jun 03, 2024 at 11:58 AM
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

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`id`, `title`, `description`, `status`, `added_by`, `event_date`, `event_time`, `date_added`) VALUES
(1, 'final defense', 'final defense on wednesday', 1, 'super_admin', '2024-06-05', '12:00pm', '2024-06-03 05:12:54');

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
(10, 'user_a', 'Prothin Whey Prothin Ripped Chocolate', 'https://res.cloudinary.com/dpruj7bhk/image/upload/v1709177426/i335lbprq7xjm8y03yll.png', '4.5kg 151sachets', '4199.00', 1, '4199.00', 'cart', '2024-06-03');

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
(16, 'user_a', 'Cuts for overweight', '3,000', 'Salt Water + 5 Almonds, Barramundi Fish\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Any Seasonal Fruits\npost workout: 100 Gms Fish Curry + 50 Gms Rice, Chamomile Tea', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds, 2 White Eggs + 8 Soaked Almonds + 1 Banana', 'Tofu Capsicum Bhurji, Protein Shake With Water\npre workout: Tofu Scrambled\npost workout: Any Seasonal Fruits', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Chicken Breast Roasted – 150 Gms\npost workout: Protein Shake With Water\n\n', 'Panner Wrap With Apple, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds, Vegetable Oats With 3 Egg Whites\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n'),
(17, 'userB', 'Body recomposition overweight', '2500', 'Protein pancakes with light syrup, peanut butter, and raspberries', 'Hard-boiled eggs and an apple\npre workout:  Protein shake and a peach\npost workout: Ground turkey and marinara sauce over pasta, with a side of cauliflower', 'Sirloin steak, sweet potato, and spinach salad with vinaigrette', 'Chicken sausage with egg, roasted potatoes, and an apple', 'Greek yogurt, strawberries, and almonds\npre workout:  Protein shake and grapes\npost workout: Mackerel, brown rice, asparagus, and salad leaves with vinaigrette', 'Sirloin steak, sweet potato, and spinach salad with vinaigrette', 'Ground turkey, egg, cheese, and salsa in a whole-grain tortilla', 'Yogurt with granola and a pear\npre workout: Chicken breast, baked potato, sour cream, and broccoli\npost workout: Protein shake and mixed berries\n', 'Stir-fry with shrimp, egg, brown rice, bell peppers, peas, and carrots', 'Blueberries, strawberries, and Greek yogurt on overnight oats', 'Jerky and mixed nuts with an orange\npre workout: Protein shake and watermelon\npost workout: Ground beef with corn, brown rice, green peas, and beans', 'Tilapia fillets with lime juice, black and pinto beans, and seasonal veggies', 'crambled eggs with mushrooms, oatmeal, and a pear', 'Low-fat cottage cheese with blueberries\nbefore workout: Protein shake and a banana\npost workout: Salmon, quinoa, and asparagus', 'Venison burger, white rice, and broccoli', 'Pork tenderloin slices with roasted garlic potatoes, green beans, and carrots', 'Protein balls with almond butter and an orange\npre workout: Protein shake and strawberries\npost workout: Turkey meatballs, marinara sauce, and parmesan cheese over pasta, with a side of sautéed kale', 'Eggs sunny-side up and avocado toast with fresh fruit', 'crambled eggs with mushrooms, oatmeal, and a pear', 'Low-fat cottage cheese with blueberries\nbefore workout: Protein shake and a banana\npost workout: Salmon, quinoa, and asparagus', 'Venison burger, white rice, and broccoli'),
(18, 'sofia', 'Bulking normal classification', '2600', 'crambled eggs with mushrooms, oatmeal, and a pear', 'Low-fat cottage cheese with blueberries\nbefore workout: Protein shake and a banana\npost workout: Salmon, quinoa, and asparagus', 'Venison burger, white rice, and broccoli', 'Protein pancakes with light syrup, peanut butter, and raspberries', 'Hard-boiled eggs and an apple\npre workout:  Protein shake and a peach\npost workout: Ground turkey and marinara sauce over pasta, with a side of cauliflower', 'Venison burger, white rice, and broccoli', 'Chicken sausage with egg, roasted potatoes, and an apple', 'Greek yogurt, strawberries, and almonds\npre workout:  Protein shake and grapes\npost workout: Mackerel, brown rice, asparagus, and salad leaves with vinaigrette', ' Turkey breast, basmati rice, and mushrooms', 'Ground turkey, egg, cheese, and salsa in a whole-grain tortilla', 'Yogurt with granola and a pear\npre workout: Chicken breast, baked potato, sour cream, and broccoli\npost workout: Protein shake and mixed berries\n', 'Stir-fry with shrimp, egg, brown rice, bell peppers, peas, and carrots', 'Blueberries, strawberries, and Greek yogurt on overnight oats', 'Jerky and mixed nuts with an orange\npre workout: Protein shake and watermelon\npost workout: Ground beef with corn, brown rice, green peas, and beans', 'Tilapia fillets with lime juice, black and pinto beans, and seasonal veggies', 'Ground turkey and egg with corn, bell peppers, cheese, and salsa\n', 'Can of tuna with crackers and an apple\npre workout: Protein shake and pear\npost workout: Diced beef with rice, black beans, bell peppers, onions, cheese, and pico de gallo', 'Tilapia fillet and potato wedges with steamed broccoli and cauliflower', 'Eggs sunny-side up and avocado toast with fresh fruit', 'Protein balls with almond butter and an orange\npre workout: Protein shake and strawberries\npost workout: Turkey meatballs, marinara sauce, and parmesan cheese over pasta, with a side of sautéed kale', 'Pork tenderloin slices with roasted garlic potatoes, green beans, and carrots'),
(19, 'mazi1', 'Cuts for normal ', '2300', 'Salt Water + 5 Almonds, Barramundi Fish\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Any Seasonal Fruits\npost workout: 100 Gms Fish Curry + 50 Gms Rice, Chamomile Tea', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds, 2 White Eggs + 8 Soaked Almonds + 1 Banana', 'Tofu Capsicum Bhurji, Protein Shake With Water\npre workout: Tofu Scrambled\npost workout: Any Seasonal Fruits', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Chicken Breast Roasted – 150 Gms\npost workout: Protein Shake With Water\n\n', 'Panner Wrap With Apple, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds, Vegetable Oats With 3 Egg Whites\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n'),
(20, 'kenneth', 'Body recomposition overweight', '2700', 'Protein pancakes with light syrup, peanut butter, and raspberries', 'Hard-boiled eggs and an apple\npre workout:  Protein shake and a peach\npost workout: Ground turkey and marinara sauce over pasta, with a side of cauliflower', 'Sirloin steak, sweet potato, and spinach salad with vinaigrette', 'Chicken sausage with egg, roasted potatoes, and an apple', 'Greek yogurt, strawberries, and almonds\npre workout:  Protein shake and grapes\npost workout: Mackerel, brown rice, asparagus, and salad leaves with vinaigrette', 'Sirloin steak, sweet potato, and spinach salad with vinaigrette', 'Ground turkey, egg, cheese, and salsa in a whole-grain tortilla', 'Yogurt with granola and a pear\npre workout: Chicken breast, baked potato, sour cream, and broccoli\npost workout: Protein shake and mixed berries\n', 'Stir-fry with shrimp, egg, brown rice, bell peppers, peas, and carrots', 'Blueberries, strawberries, and Greek yogurt on overnight oats', 'Jerky and mixed nuts with an orange\npre workout: Protein shake and watermelon\npost workout: Ground beef with corn, brown rice, green peas, and beans', 'Tilapia fillets with lime juice, black and pinto beans, and seasonal veggies', 'crambled eggs with mushrooms, oatmeal, and a pear', 'Low-fat cottage cheese with blueberries\nbefore workout: Protein shake and a banana\npost workout: Salmon, quinoa, and asparagus', 'Venison burger, white rice, and broccoli', 'Pork tenderloin slices with roasted garlic potatoes, green beans, and carrots', 'Protein balls with almond butter and an orange\npre workout: Protein shake and strawberries\npost workout: Turkey meatballs, marinara sauce, and parmesan cheese over pasta, with a side of sautéed kale', 'Eggs sunny-side up and avocado toast with fresh fruit', 'crambled eggs with mushrooms, oatmeal, and a pear', 'Low-fat cottage cheese with blueberries\nbefore workout: Protein shake and a banana\npost workout: Salmon, quinoa, and asparagus', 'Venison burger, white rice, and broccoli'),
(21, 'bimbers', 'Body recomposition overweight', '2500', 'Protein pancakes with light syrup, peanut butter, and raspberries', 'Hard-boiled eggs and an apple\npre workout:  Protein shake and a peach\npost workout: Ground turkey and marinara sauce over pasta, with a side of cauliflower', 'Sirloin steak, sweet potato, and spinach salad with vinaigrette', 'Chicken sausage with egg, roasted potatoes, and an apple', 'Greek yogurt, strawberries, and almonds\npre workout:  Protein shake and grapes\npost workout: Mackerel, brown rice, asparagus, and salad leaves with vinaigrette', 'Sirloin steak, sweet potato, and spinach salad with vinaigrette', 'Ground turkey, egg, cheese, and salsa in a whole-grain tortilla', 'Yogurt with granola and a pear\npre workout: Chicken breast, baked potato, sour cream, and broccoli\npost workout: Protein shake and mixed berries\n', 'Stir-fry with shrimp, egg, brown rice, bell peppers, peas, and carrots', 'Blueberries, strawberries, and Greek yogurt on overnight oats', 'Jerky and mixed nuts with an orange\npre workout: Protein shake and watermelon\npost workout: Ground beef with corn, brown rice, green peas, and beans', 'Tilapia fillets with lime juice, black and pinto beans, and seasonal veggies', 'crambled eggs with mushrooms, oatmeal, and a pear', 'Low-fat cottage cheese with blueberries\nbefore workout: Protein shake and a banana\npost workout: Salmon, quinoa, and asparagus', 'Venison burger, white rice, and broccoli', 'Pork tenderloin slices with roasted garlic potatoes, green beans, and carrots', 'Protein balls with almond butter and an orange\npre workout: Protein shake and strawberries\npost workout: Turkey meatballs, marinara sauce, and parmesan cheese over pasta, with a side of sautéed kale', 'Eggs sunny-side up and avocado toast with fresh fruit', 'crambled eggs with mushrooms, oatmeal, and a pear', 'Low-fat cottage cheese with blueberries\nbefore workout: Protein shake and a banana\npost workout: Salmon, quinoa, and asparagus', 'Venison burger, white rice, and broccoli'),
(22, 'kathleen', 'Body recomposition overweight', '2200', 'Protein pancakes with light syrup, peanut butter, and raspberries', 'Hard-boiled eggs and an apple\npre workout:  Protein shake and a peach\npost workout: Ground turkey and marinara sauce over pasta, with a side of cauliflower', 'Sirloin steak, sweet potato, and spinach salad with vinaigrette', 'Chicken sausage with egg, roasted potatoes, and an apple', 'Greek yogurt, strawberries, and almonds\npre workout:  Protein shake and grapes\npost workout: Mackerel, brown rice, asparagus, and salad leaves with vinaigrette', 'Sirloin steak, sweet potato, and spinach salad with vinaigrette', 'Ground turkey, egg, cheese, and salsa in a whole-grain tortilla', 'Yogurt with granola and a pear\npre workout: Chicken breast, baked potato, sour cream, and broccoli\npost workout: Protein shake and mixed berries\n', 'Stir-fry with shrimp, egg, brown rice, bell peppers, peas, and carrots', 'Blueberries, strawberries, and Greek yogurt on overnight oats', 'Jerky and mixed nuts with an orange\npre workout: Protein shake and watermelon\npost workout: Ground beef with corn, brown rice, green peas, and beans', 'Tilapia fillets with lime juice, black and pinto beans, and seasonal veggies', 'crambled eggs with mushrooms, oatmeal, and a pear', 'Low-fat cottage cheese with blueberries\nbefore workout: Protein shake and a banana\npost workout: Salmon, quinoa, and asparagus', 'Venison burger, white rice, and broccoli', 'Pork tenderloin slices with roasted garlic potatoes, green beans, and carrots', 'Protein balls with almond butter and an orange\npre workout: Protein shake and strawberries\npost workout: Turkey meatballs, marinara sauce, and parmesan cheese over pasta, with a side of sautéed kale', 'Eggs sunny-side up and avocado toast with fresh fruit', 'crambled eggs with mushrooms, oatmeal, and a pear', 'Low-fat cottage cheese with blueberries\nbefore workout: Protein shake and a banana\npost workout: Salmon, quinoa, and asparagus', 'Venison burger, white rice, and broccoli'),
(23, 'Sofiyuh', 'Cuts for overweight', '1800', 'Salt Water + 5 Almonds, Barramundi Fish\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Any Seasonal Fruits\npost workout: 100 Gms Fish Curry + 50 Gms Rice, Chamomile Tea', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds, 2 White Eggs + 8 Soaked Almonds + 1 Banana', 'Tofu Capsicum Bhurji, Protein Shake With Water\npre workout: Tofu Scrambled\npost workout: Any Seasonal Fruits', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Chicken Breast Roasted – 150 Gms\npost workout: Protein Shake With Water\n\n', 'Panner Wrap With Apple, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds, Vegetable Oats With 3 Egg Whites\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n'),
(24, 'Donalene', 'Bulking normal classification', '2400', 'crambled eggs with mushrooms, oatmeal, and a pear', 'Low-fat cottage cheese with blueberries\nbefore workout: Protein shake and a banana\npost workout: Salmon, quinoa, and asparagus', 'Venison burger, white rice, and broccoli', 'Protein pancakes with light syrup, peanut butter, and raspberries', 'Hard-boiled eggs and an apple\npre workout:  Protein shake and a peach\npost workout: Ground turkey and marinara sauce over pasta, with a side of cauliflower', 'Venison burger, white rice, and broccoli', 'Chicken sausage with egg, roasted potatoes, and an apple', 'Greek yogurt, strawberries, and almonds\npre workout:  Protein shake and grapes\npost workout: Mackerel, brown rice, asparagus, and salad leaves with vinaigrette', ' Turkey breast, basmati rice, and mushrooms', 'Ground turkey, egg, cheese, and salsa in a whole-grain tortilla', 'Yogurt with granola and a pear\npre workout: Chicken breast, baked potato, sour cream, and broccoli\npost workout: Protein shake and mixed berries\n', 'Stir-fry with shrimp, egg, brown rice, bell peppers, peas, and carrots', 'Blueberries, strawberries, and Greek yogurt on overnight oats', 'Jerky and mixed nuts with an orange\npre workout: Protein shake and watermelon\npost workout: Ground beef with corn, brown rice, green peas, and beans', 'Tilapia fillets with lime juice, black and pinto beans, and seasonal veggies', 'Ground turkey and egg with corn, bell peppers, cheese, and salsa\n', 'Can of tuna with crackers and an apple\npre workout: Protein shake and pear\npost workout: Diced beef with rice, black beans, bell peppers, onions, cheese, and pico de gallo', 'Tilapia fillet and potato wedges with steamed broccoli and cauliflower', 'Eggs sunny-side up and avocado toast with fresh fruit', 'Protein balls with almond butter and an orange\npre workout: Protein shake and strawberries\npost workout: Turkey meatballs, marinara sauce, and parmesan cheese over pasta, with a side of sautéed kale', 'Pork tenderloin slices with roasted garlic potatoes, green beans, and carrots'),
(25, 'Arianne', 'Bulking normal classification', '2400', 'crambled eggs with mushrooms, oatmeal, and a pear', 'Low-fat cottage cheese with blueberries\nbefore workout: Protein shake and a banana\npost workout: Salmon, quinoa, and asparagus', 'Venison burger, white rice, and broccoli', 'Protein pancakes with light syrup, peanut butter, and raspberries', 'Hard-boiled eggs and an apple\npre workout:  Protein shake and a peach\npost workout: Ground turkey and marinara sauce over pasta, with a side of cauliflower', 'Venison burger, white rice, and broccoli', 'Chicken sausage with egg, roasted potatoes, and an apple', 'Greek yogurt, strawberries, and almonds\npre workout:  Protein shake and grapes\npost workout: Mackerel, brown rice, asparagus, and salad leaves with vinaigrette', ' Turkey breast, basmati rice, and mushrooms', 'Ground turkey, egg, cheese, and salsa in a whole-grain tortilla', 'Yogurt with granola and a pear\npre workout: Chicken breast, baked potato, sour cream, and broccoli\npost workout: Protein shake and mixed berries\n', 'Stir-fry with shrimp, egg, brown rice, bell peppers, peas, and carrots', 'Blueberries, strawberries, and Greek yogurt on overnight oats', 'Jerky and mixed nuts with an orange\npre workout: Protein shake and watermelon\npost workout: Ground beef with corn, brown rice, green peas, and beans', 'Tilapia fillets with lime juice, black and pinto beans, and seasonal veggies', 'Ground turkey and egg with corn, bell peppers, cheese, and salsa\n', 'Can of tuna with crackers and an apple\npre workout: Protein shake and pear\npost workout: Diced beef with rice, black beans, bell peppers, onions, cheese, and pico de gallo', 'Tilapia fillet and potato wedges with steamed broccoli and cauliflower', 'Eggs sunny-side up and avocado toast with fresh fruit', 'Protein balls with almond butter and an orange\npre workout: Protein shake and strawberries\npost workout: Turkey meatballs, marinara sauce, and parmesan cheese over pasta, with a side of sautéed kale', 'Pork tenderloin slices with roasted garlic potatoes, green beans, and carrots'),
(26, 'Raven', 'Cuts for overweight', '1700', 'Salt Water + 5 Almonds, Barramundi Fish\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Any Seasonal Fruits\npost workout: 100 Gms Fish Curry + 50 Gms Rice, Chamomile Tea', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds, 2 White Eggs + 8 Soaked Almonds + 1 Banana', 'Tofu Capsicum Bhurji, Protein Shake With Water\npre workout: Tofu Scrambled\npost workout: Any Seasonal Fruits', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Chicken Breast Roasted – 150 Gms\npost workout: Protein Shake With Water\n\n', 'Panner Wrap With Apple, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds, Vegetable Oats With 3 Egg Whites\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n'),
(27, 'Maria', 'Cuts for normal ', '2300', 'Salt Water + 5 Almonds, Barramundi Fish\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Any Seasonal Fruits\npost workout: 100 Gms Fish Curry + 50 Gms Rice, Chamomile Tea', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds, 2 White Eggs + 8 Soaked Almonds + 1 Banana', 'Tofu Capsicum Bhurji, Protein Shake With Water\npre workout: Tofu Scrambled\npost workout: Any Seasonal Fruits', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Chicken Breast Roasted – 150 Gms\npost workout: Protein Shake With Water\n\n', 'Panner Wrap With Apple, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds, Vegetable Oats With 3 Egg Whites\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n'),
(28, 'Phillip', 'Cuts for overweight', '1800', 'Salt Water + 5 Almonds, Barramundi Fish\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Any Seasonal Fruits\npost workout: 100 Gms Fish Curry + 50 Gms Rice, Chamomile Tea', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds, 2 White Eggs + 8 Soaked Almonds + 1 Banana', 'Tofu Capsicum Bhurji, Protein Shake With Water\npre workout: Tofu Scrambled\npost workout: Any Seasonal Fruits', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Chicken Breast Roasted – 150 Gms\npost workout: Protein Shake With Water\n\n', 'Panner Wrap With Apple, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds, Vegetable Oats With 3 Egg Whites\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n'),
(29, 'Raul1', 'Bulking normal classification', '2300', 'crambled eggs with mushrooms, oatmeal, and a pear', 'Low-fat cottage cheese with blueberries\nbefore workout: Protein shake and a banana\npost workout: Salmon, quinoa, and asparagus', 'Venison burger, white rice, and broccoli', 'Protein pancakes with light syrup, peanut butter, and raspberries', 'Hard-boiled eggs and an apple\npre workout:  Protein shake and a peach\npost workout: Ground turkey and marinara sauce over pasta, with a side of cauliflower', 'Venison burger, white rice, and broccoli', 'Chicken sausage with egg, roasted potatoes, and an apple', 'Greek yogurt, strawberries, and almonds\npre workout:  Protein shake and grapes\npost workout: Mackerel, brown rice, asparagus, and salad leaves with vinaigrette', ' Turkey breast, basmati rice, and mushrooms', 'Ground turkey, egg, cheese, and salsa in a whole-grain tortilla', 'Yogurt with granola and a pear\npre workout: Chicken breast, baked potato, sour cream, and broccoli\npost workout: Protein shake and mixed berries\n', 'Stir-fry with shrimp, egg, brown rice, bell peppers, peas, and carrots', 'Blueberries, strawberries, and Greek yogurt on overnight oats', 'Jerky and mixed nuts with an orange\npre workout: Protein shake and watermelon\npost workout: Ground beef with corn, brown rice, green peas, and beans', 'Tilapia fillets with lime juice, black and pinto beans, and seasonal veggies', 'Ground turkey and egg with corn, bell peppers, cheese, and salsa\n', 'Can of tuna with crackers and an apple\npre workout: Protein shake and pear\npost workout: Diced beef with rice, black beans, bell peppers, onions, cheese, and pico de gallo', 'Tilapia fillet and potato wedges with steamed broccoli and cauliflower', 'Eggs sunny-side up and avocado toast with fresh fruit', 'Protein balls with almond butter and an orange\npre workout: Protein shake and strawberries\npost workout: Turkey meatballs, marinara sauce, and parmesan cheese over pasta, with a side of sautéed kale', 'Pork tenderloin slices with roasted garlic potatoes, green beans, and carrots'),
(30, 'danilo', 'Cuts for normal ', '2100', 'Salt Water + 5 Almonds, Barramundi Fish\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Any Seasonal Fruits\npost workout: 100 Gms Fish Curry + 50 Gms Rice, Chamomile Tea', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds, 2 White Eggs + 8 Soaked Almonds + 1 Banana', 'Tofu Capsicum Bhurji, Protein Shake With Water\npre workout: Tofu Scrambled\npost workout: Any Seasonal Fruits', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Chicken Breast Roasted – 150 Gms\npost workout: Protein Shake With Water\n\n', 'Panner Wrap With Apple, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds, Vegetable Oats With 3 Egg Whites\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n'),
(31, 'Christian', 'Cuts for normal ', '2300', 'Salt Water + 5 Almonds, Barramundi Fish\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Any Seasonal Fruits\npost workout: 100 Gms Fish Curry + 50 Gms Rice, Chamomile Tea', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds, 2 White Eggs + 8 Soaked Almonds + 1 Banana', 'Tofu Capsicum Bhurji, Protein Shake With Water\npre workout: Tofu Scrambled\npost workout: Any Seasonal Fruits', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Chicken Breast Roasted – 150 Gms\npost workout: Protein Shake With Water\n\n', 'Panner Wrap With Apple, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds, Vegetable Oats With 3 Egg Whites\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n'),
(32, 'Kiezel', 'Body recomposition overweight', '1900', 'Protein pancakes with light syrup, peanut butter, and raspberries', 'Hard-boiled eggs and an apple\npre workout:  Protein shake and a peach\npost workout: Ground turkey and marinara sauce over pasta, with a side of cauliflower', 'Sirloin steak, sweet potato, and spinach salad with vinaigrette', 'Chicken sausage with egg, roasted potatoes, and an apple', 'Greek yogurt, strawberries, and almonds\npre workout:  Protein shake and grapes\npost workout: Mackerel, brown rice, asparagus, and salad leaves with vinaigrette', 'Sirloin steak, sweet potato, and spinach salad with vinaigrette', 'Ground turkey, egg, cheese, and salsa in a whole-grain tortilla', 'Yogurt with granola and a pear\npre workout: Chicken breast, baked potato, sour cream, and broccoli\npost workout: Protein shake and mixed berries\n', 'Stir-fry with shrimp, egg, brown rice, bell peppers, peas, and carrots', 'Blueberries, strawberries, and Greek yogurt on overnight oats', 'Jerky and mixed nuts with an orange\npre workout: Protein shake and watermelon\npost workout: Ground beef with corn, brown rice, green peas, and beans', 'Tilapia fillets with lime juice, black and pinto beans, and seasonal veggies', 'crambled eggs with mushrooms, oatmeal, and a pear', 'Low-fat cottage cheese with blueberries\nbefore workout: Protein shake and a banana\npost workout: Salmon, quinoa, and asparagus', 'Venison burger, white rice, and broccoli', 'Pork tenderloin slices with roasted garlic potatoes, green beans, and carrots', 'Protein balls with almond butter and an orange\npre workout: Protein shake and strawberries\npost workout: Turkey meatballs, marinara sauce, and parmesan cheese over pasta, with a side of sautéed kale', 'Eggs sunny-side up and avocado toast with fresh fruit', 'crambled eggs with mushrooms, oatmeal, and a pear', 'Low-fat cottage cheese with blueberries\nbefore workout: Protein shake and a banana\npost workout: Salmon, quinoa, and asparagus', 'Venison burger, white rice, and broccoli'),
(33, 'Cedric', 'Bulking normal classification', '2300', 'crambled eggs with mushrooms, oatmeal, and a pear', 'Low-fat cottage cheese with blueberries\nbefore workout: Protein shake and a banana\npost workout: Salmon, quinoa, and asparagus', 'Venison burger, white rice, and broccoli', 'Protein pancakes with light syrup, peanut butter, and raspberries', 'Hard-boiled eggs and an apple\npre workout:  Protein shake and a peach\npost workout: Ground turkey and marinara sauce over pasta, with a side of cauliflower', 'Venison burger, white rice, and broccoli', 'Chicken sausage with egg, roasted potatoes, and an apple', 'Greek yogurt, strawberries, and almonds\npre workout:  Protein shake and grapes\npost workout: Mackerel, brown rice, asparagus, and salad leaves with vinaigrette', ' Turkey breast, basmati rice, and mushrooms', 'Ground turkey, egg, cheese, and salsa in a whole-grain tortilla', 'Yogurt with granola and a pear\npre workout: Chicken breast, baked potato, sour cream, and broccoli\npost workout: Protein shake and mixed berries\n', 'Stir-fry with shrimp, egg, brown rice, bell peppers, peas, and carrots', 'Blueberries, strawberries, and Greek yogurt on overnight oats', 'Jerky and mixed nuts with an orange\npre workout: Protein shake and watermelon\npost workout: Ground beef with corn, brown rice, green peas, and beans', 'Tilapia fillets with lime juice, black and pinto beans, and seasonal veggies', 'Ground turkey and egg with corn, bell peppers, cheese, and salsa\n', 'Can of tuna with crackers and an apple\npre workout: Protein shake and pear\npost workout: Diced beef with rice, black beans, bell peppers, onions, cheese, and pico de gallo', 'Tilapia fillet and potato wedges with steamed broccoli and cauliflower', 'Eggs sunny-side up and avocado toast with fresh fruit', 'Protein balls with almond butter and an orange\npre workout: Protein shake and strawberries\npost workout: Turkey meatballs, marinara sauce, and parmesan cheese over pasta, with a side of sautéed kale', 'Pork tenderloin slices with roasted garlic potatoes, green beans, and carrots'),
(34, 'Jerome ', 'Cuts for overweight', '1700', 'Salt Water + 5 Almonds, Barramundi Fish\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Any Seasonal Fruits\npost workout: 100 Gms Fish Curry + 50 Gms Rice, Chamomile Tea', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds, 2 White Eggs + 8 Soaked Almonds + 1 Banana', 'Tofu Capsicum Bhurji, Protein Shake With Water\npre workout: Tofu Scrambled\npost workout: Any Seasonal Fruits', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Chicken Breast Roasted – 150 Gms\npost workout: Protein Shake With Water\n\n', 'Panner Wrap With Apple, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds, Vegetable Oats With 3 Egg Whites\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n'),
(35, 'Clarence', 'Cuts for normal ', '2100', 'Salt Water + 5 Almonds, Barramundi Fish\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Any Seasonal Fruits\npost workout: 100 Gms Fish Curry + 50 Gms Rice, Chamomile Tea', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds, 2 White Eggs + 8 Soaked Almonds + 1 Banana', 'Tofu Capsicum Bhurji, Protein Shake With Water\npre workout: Tofu Scrambled\npost workout: Any Seasonal Fruits', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Chicken Breast Roasted – 150 Gms\npost workout: Protein Shake With Water\n\n', 'Panner Wrap With Apple, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds, Vegetable Oats With 3 Egg Whites\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n'),
(36, 'Diego', 'Cuts for normal ', '1900', 'Salt Water + 5 Almonds, Barramundi Fish\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Any Seasonal Fruits\npost workout: 100 Gms Fish Curry + 50 Gms Rice, Chamomile Tea', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds, 2 White Eggs + 8 Soaked Almonds + 1 Banana', 'Tofu Capsicum Bhurji, Protein Shake With Water\npre workout: Tofu Scrambled\npost workout: Any Seasonal Fruits', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Chicken Breast Roasted – 150 Gms\npost workout: Protein Shake With Water\n\n', 'Panner Wrap With Apple, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds, Vegetable Oats With 3 Egg Whites\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n'),
(37, 'Michael', 'Body recomposition underweight', '2300', 'Salt Water + 5 Almonds, Barramundi Fish\n\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Any Seasonal Fruits\npost workout: 100 Gms Fish Curry + 50 Gms Rice, Chamomile Tea', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds, 2 White Eggs + 8 Soaked Almonds + 1 Banana', 'Tofu Capsicum Bhurji, Protein Shake With Water\npre workout: Tofu Scrambled\npost workout: Any Seasonal Fruits', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds, Rice Cake + Peanut Butter\n', 'Boiled Chicken Marinated With Curd, Protein Shake With Water\npre workout: Mixed Vegetable Wrap\npost workout: Any Seasonal Fruits\n', '100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Salt Water + 5 Almonds, 2 White Eggs + 8 Soaked Almonds + 1 Banana\n', 'To 50 Gms Oats Add Peanut Butter And Nuts\npre workout: Protein Shake With Water\npost workout: Barramundi Fish\n', 'Baked Beans With Veggies, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Chicken Breast Roasted – 150 Gms\npost workout: Protein Shake With Water\n\n', 'Panner Wrap With Apple, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds, Vegetable Oats With 3 Egg Whites\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n'),
(38, 'Bryan ', 'Cuts for normal ', '1800', 'Salt Water + 5 Almonds, Barramundi Fish\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Any Seasonal Fruits\npost workout: 100 Gms Fish Curry + 50 Gms Rice, Chamomile Tea', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds, 2 White Eggs + 8 Soaked Almonds + 1 Banana', 'Tofu Capsicum Bhurji, Protein Shake With Water\npre workout: Tofu Scrambled\npost workout: Any Seasonal Fruits', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Chicken Breast Roasted – 150 Gms\npost workout: Protein Shake With Water\n\n', 'Panner Wrap With Apple, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds, Vegetable Oats With 3 Egg Whites\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n'),
(39, 'Maigan', 'Body recomposition underweight', '2300', 'Salt Water + 5 Almonds, Barramundi Fish\n\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Any Seasonal Fruits\npost workout: 100 Gms Fish Curry + 50 Gms Rice, Chamomile Tea', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds, 2 White Eggs + 8 Soaked Almonds + 1 Banana', 'Tofu Capsicum Bhurji, Protein Shake With Water\npre workout: Tofu Scrambled\npost workout: Any Seasonal Fruits', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds, Rice Cake + Peanut Butter\n', 'Boiled Chicken Marinated With Curd, Protein Shake With Water\npre workout: Mixed Vegetable Wrap\npost workout: Any Seasonal Fruits\n', '100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Salt Water + 5 Almonds, 2 White Eggs + 8 Soaked Almonds + 1 Banana\n', 'To 50 Gms Oats Add Peanut Butter And Nuts\npre workout: Protein Shake With Water\npost workout: Barramundi Fish\n', 'Baked Beans With Veggies, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Chicken Breast Roasted – 150 Gms\npost workout: Protein Shake With Water\n\n', 'Panner Wrap With Apple, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds, Vegetable Oats With 3 Egg Whites\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n'),
(40, 'Conde', 'Cuts for overweight', '1500', 'Salt Water + 5 Almonds, Barramundi Fish\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Any Seasonal Fruits\npost workout: 100 Gms Fish Curry + 50 Gms Rice, Chamomile Tea', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds, 2 White Eggs + 8 Soaked Almonds + 1 Banana', 'Tofu Capsicum Bhurji, Protein Shake With Water\npre workout: Tofu Scrambled\npost workout: Any Seasonal Fruits', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Chicken Breast Roasted – 150 Gms\npost workout: Protein Shake With Water\n\n', 'Panner Wrap With Apple, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds, Vegetable Oats With 3 Egg Whites\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n'),
(41, 'Njay1', 'Bulking normal classification', '1700', 'crambled eggs with mushrooms, oatmeal, and a pear', 'Low-fat cottage cheese with blueberries\nbefore workout: Protein shake and a banana\npost workout: Salmon, quinoa, and asparagus', 'Venison burger, white rice, and broccoli', 'Protein pancakes with light syrup, peanut butter, and raspberries', 'Hard-boiled eggs and an apple\npre workout:  Protein shake and a peach\npost workout: Ground turkey and marinara sauce over pasta, with a side of cauliflower', 'Venison burger, white rice, and broccoli', 'Chicken sausage with egg, roasted potatoes, and an apple', 'Greek yogurt, strawberries, and almonds\npre workout:  Protein shake and grapes\npost workout: Mackerel, brown rice, asparagus, and salad leaves with vinaigrette', ' Turkey breast, basmati rice, and mushrooms', 'Ground turkey, egg, cheese, and salsa in a whole-grain tortilla', 'Yogurt with granola and a pear\npre workout: Chicken breast, baked potato, sour cream, and broccoli\npost workout: Protein shake and mixed berries\n', 'Stir-fry with shrimp, egg, brown rice, bell peppers, peas, and carrots', 'Blueberries, strawberries, and Greek yogurt on overnight oats', 'Jerky and mixed nuts with an orange\npre workout: Protein shake and watermelon\npost workout: Ground beef with corn, brown rice, green peas, and beans', 'Tilapia fillets with lime juice, black and pinto beans, and seasonal veggies', 'Ground turkey and egg with corn, bell peppers, cheese, and salsa\n', 'Can of tuna with crackers and an apple\npre workout: Protein shake and pear\npost workout: Diced beef with rice, black beans, bell peppers, onions, cheese, and pico de gallo', 'Tilapia fillet and potato wedges with steamed broccoli and cauliflower', 'Eggs sunny-side up and avocado toast with fresh fruit', 'Protein balls with almond butter and an orange\npre workout: Protein shake and strawberries\npost workout: Turkey meatballs, marinara sauce, and parmesan cheese over pasta, with a side of sautéed kale', 'Pork tenderloin slices with roasted garlic potatoes, green beans, and carrots');
INSERT INTO `meal_plan` (`id`, `username`, `diet_type`, `calories`, `sun_bf_meal`, `sun_lunch_meal`, `sun_dinner_meal`, `mon_bf_meal`, `mon_lunch_meal`, `mon_dinner_meal`, `tue_bf_meal`, `tue_lunch_meal`, `tue_dinner_meal`, `wed_bf_meal`, `wed_lunch_meal`, `wed_dinner_meal`, `thurs_bf_meal`, `thurs_lunch_meal`, `thurs_dinner_meal`, `fri_bf_meal`, `fri_lunch_meal`, `fri_dinner_meal`, `sat_bf_meal`, `sat_lunch_meal`, `sat_dinner_meal`) VALUES
(42, 'James', 'Body recomposition underweight', '3000', 'Salt Water + 5 Almonds, Barramundi Fish\n\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Any Seasonal Fruits\npost workout: 100 Gms Fish Curry + 50 Gms Rice, Chamomile Tea', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds, 2 White Eggs + 8 Soaked Almonds + 1 Banana', 'Tofu Capsicum Bhurji, Protein Shake With Water\npre workout: Tofu Scrambled\npost workout: Any Seasonal Fruits', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds, Rice Cake + Peanut Butter\n', 'Boiled Chicken Marinated With Curd, Protein Shake With Water\npre workout: Mixed Vegetable Wrap\npost workout: Any Seasonal Fruits\n', '100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Salt Water + 5 Almonds, 2 White Eggs + 8 Soaked Almonds + 1 Banana\n', 'To 50 Gms Oats Add Peanut Butter And Nuts\npre workout: Protein Shake With Water\npost workout: Barramundi Fish\n', 'Baked Beans With Veggies, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Chicken Breast Roasted – 150 Gms\npost workout: Protein Shake With Water\n\n', 'Panner Wrap With Apple, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds, Vegetable Oats With 3 Egg Whites\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n');

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
(2, '25 to 30', 'Body recomposition overweight', 'for overweight', 1, 'Protein pancakes with light syrup, peanut butter, and raspberries', 'Hard-boiled eggs and an apple\npre workout:  Protein shake and a peach\npost workout: Ground turkey and marinara sauce over pasta, with a side of cauliflower', 'Sirloin steak, sweet potato, and spinach salad with vinaigrette', 'Chicken sausage with egg, roasted potatoes, and an apple', 'Greek yogurt, strawberries, and almonds\npre workout:  Protein shake and grapes\npost workout: Mackerel, brown rice, asparagus, and salad leaves with vinaigrette', ' Turkey breast, basmati rice, and mushrooms', 'Ground turkey, egg, cheese, and salsa in a whole-grain tortilla', 'Yogurt with granola and a pear\npre workout: Chicken breast, baked potato, sour cream, and broccoli\npost workout: Protein shake and mixed berries\n', 'Stir-fry with shrimp, egg, brown rice, bell peppers, peas, and carrots', 'Blueberries, strawberries, and Greek yogurt on overnight oats', 'Jerky and mixed nuts with an orange\npre workout: Protein shake and watermelon\npost workout: Ground beef with corn, brown rice, green peas, and beans', 'Tilapia fillets with lime juice, black and pinto beans, and seasonal veggies', 'crambled eggs with mushrooms, oatmeal, and a pear', 'Low-fat cottage cheese with blueberries\nbefore workout: Protein shake and a banana\npost workout: Salmon, quinoa, and asparagus', 'Venison burger, white rice, and broccoli', 'Pork tenderloin slices with roasted garlic potatoes, green beans, and carrots', 'Protein balls with almond butter and an orange\npre workout: Protein shake and strawberries\npost workout: Turkey meatballs, marinara sauce, and parmesan cheese over pasta, with a side of sautéed kale', 'Eggs sunny-side up and avocado toast with fresh fruit', 'crambled eggs with mushrooms, oatmeal, and a pear', 'Low-fat cottage cheese with blueberries\nbefore workout: Protein shake and a banana\npost workout: Salmon, quinoa, and asparagus', 'Venison burger, white rice, and broccoli', 'super_admin'),
(3, '17 to 18.5', 'Body recomposition underweight', 'for underweight body recom', 1, 'Salt Water + 5 Almonds, Barramundi Fish\n\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Any Seasonal Fruits\npost workout: 100 Gms Fish Curry + 50 Gms Rice, Chamomile Tea', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds, 2 White Eggs + 8 Soaked Almonds + 1 Banana', 'Tofu Capsicum Bhurji, Protein Shake With Water\npre workout: Tofu Scrambled\npost workout: Any Seasonal Fruits', 'Subway Veggies Delight, Chamomile Tea\n', 'Salt Water + 5 Almonds, Rice Cake + Peanut Butter\n', 'Boiled Chicken Marinated With Curd, Protein Shake With Water\npre workout: Mixed Vegetable Wrap\npost workout: Any Seasonal Fruits\n', '100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Salt Water + 5 Almonds, 2 White Eggs + 8 Soaked Almonds + 1 Banana\n', 'To 50 Gms Oats Add Peanut Butter And Nuts\npre workout: Protein Shake With Water\npost workout: Barramundi Fish\n', 'Baked Beans With Veggies, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Chicken Breast Roasted – 150 Gms\npost workout: Protein Shake With Water\n\n', 'Panner Wrap With Apple, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds, Vegetable Oats With 3 Egg Whites\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'super_admin'),
(4, '18.5 to 25', 'Cuts for normal ', 'Cuts for normal class', 1, 'Salt Water + 5 Almonds, Barramundi Fish\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Any Seasonal Fruits\npost workout: 100 Gms Fish Curry + 50 Gms Rice, Chamomile Tea', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds, 2 White Eggs + 8 Soaked Almonds + 1 Banana', 'Tofu Capsicum Bhurji, Protein Shake With Water\npre workout: Tofu Scrambled\npost workout: Any Seasonal Fruits', 'Subway Veggies Delight, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Chicken Breast Roasted – 150 Gms\npost workout: Protein Shake With Water\n\n', 'Panner Wrap With Apple, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds, Vegetable Oats With 3 Egg Whites\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'super_admin'),
(5, '25 to 30', 'Cuts for overweight', 'for overweight cuts', 1, 'Salt Water + 5 Almonds, Barramundi Fish\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Any Seasonal Fruits\npost workout: 100 Gms Fish Curry + 50 Gms Rice, Chamomile Tea', 'Lettuce Chicken Roll, Protein Shake With Water', 'Salt Water + 5 Almonds, 2 White Eggs + 8 Soaked Almonds + 1 Banana', 'Tofu Capsicum Bhurji, Protein Shake With Water\npre workout: Tofu Scrambled\npost workout: Any Seasonal Fruits', 'Subway Veggies Delight, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Chicken Breast Roasted – 150 Gms\npost workout: Protein Shake With Water\n\n', 'Panner Wrap With Apple, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Salt Water + 5 Almonds\n', 'Rice Cake + Peanut Butter\npre workout: To 50 Gms Oats Add Peanut Butter & Nuts\npost workout: Protein Shake With Water\n', 'Protein Shake With Water, Any Seasonal Fruits, Egg Omlet + 2 Bread Sandwich\n', 'Salt Water + 5 Almonds, Vegetable Oats With 3 Egg Whites\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', '2 White Eggs + 8 Soaked Almonds + 1 Banana\npre workout: Protein Shake With Water\npost workout: Mixed Vegetable Wrap\n\n', 'Any Seasonal Fruits, 100 Gms Chicken Boiled With Salad, Chamomile Tea\n', 'super_admin'),
(6, '30 to 35', 'Obese Class I', 'For Obese to Lose Weight', 1, 'Idli (brown rice), sambhar/ 2 whole eggs + toast', 'Whole grain roti + mixed vegetable / chicken	\npost workout: 5 almonds + unsweetened tea or coffee	', 'Soup with sauteed veg + protein shake', 'Atta or moong dal chilla / scrambled eggs + toast	', 'Brown rice + gravy sabzi or dal	\npost workout: Fruits + unsweetened tea or coffee	', 'Porridge with salad	 + protein shake', 'Porridge / fruits with milk / omelette	', 'Whole grain roti + paneer / vegetable salad	\npost workout: 2 dates + unsweetened tea or coffee	', 'Brown rice + paneer or steamed fish + protein shake', 'Oats and yogurt/vegetable omelet	', 'Whole grain roti + vegetables / sauteed chicken roti wrap\npost workout: 5 almonds + 5 walnuts + buttermilk	', 'Brown rice + masala chana/chicken + protein shake', 'Daliya / French toast	', 'Sambar and rice	\npost workout: 5 almonds + 2 dates + unsweetened tea or coffee	', 'Vegetable pulao / chicken pulao + curd	+ protein shake', 'Parathas / egg + roti	', 'Whole grain roti + gravy sabzi/chicken curry with quinoa	\npost workout: Fruits + unsweetened tea or coffee	', 'Dal ka chilla with grilled paneer or fish + protein shake', 'Oats with milk and fruits\n', 'Whole grain roti + sabzi / soup + salad\npost workout: Yogurt with fruits\n', 'Tandoori paneer / chicken/ fish + protein shake', 'super_admin'),
(7, '35 to 40', 'Obese Class II', 'For Obese Class II to lose weight', 1, 'Oats with milk and fruits\n', 'Whole grain roti + sabzi / soup + salad\npost workout: Yogurt with fruits\n', 'Tandoori paneer / chicken/ fish + protein shake', 'Parathas / egg + roti	', 'Whole grain roti + gravy sabzi/chicken curry with quinoa	\npost workout: Fruits + unsweetened tea or coffee	', 'Dal ka chilla with grilled paneer or fish + protein shake ', 'Daliya / French toast	', 'Sambar and rice	\npost workout: 5 almonds + 2 dates + unsweetened tea or coffee	', 'Vegetable pulao / chicken pulao + curd	+ protein shake', 'Oats and yogurt/vegetable omelet	', 'Whole grain roti + vegetables / sauteed chicken roti wrap	\npost workout: 5 almonds + 5 walnuts + buttermilk	', 'Brown rice + masala chana/chicken + protein shake', 'Porridge / fruits with milk / omelette	', 'Whole grain roti + paneer / vegetable salad	\npost workout: 2 dates + unsweetened tea or coffee	', 'Brown rice + paneer or steamed fish + protein shake', 'Atta or moong dal chilla / scrambled eggs + toast	', 'Brown rice + gravy sabzi or dal\npost workout: Fruits + unsweetened tea or coffee	\n	', 'Porridge with salad	+ protein shake', 'Idli (brown rice), sambhar/ 2 whole eggs + toast	', 'Whole grain roti + mixed vegetable / chicken	\npost workout: Whole grain roti + mixed vegetable / chicken	', 'Soup with sauteed veg + protein shake', 'super_admin'),
(8, '>40', 'For Obese Class III', 'For Obese Class III to lose weight', 1, 'Porridge / fruits with milk / omelette	', 'Whole grain roti + paneer / vegetable salad\npost workout: 2 dates + unsweetened tea or coffee		', 'Brown rice + paneer or steamed fish + protein shake', 'Daliya / French toast	', 'Sambar and rice	\npost workout: 5 almonds + 2 dates + unsweetened tea or coffee	', 'Vegetable pulao / chicken pulao + curd	+ protein shake', 'Parathas / egg + roti	', 'Whole grain roti + gravy sabzi/chicken curry with quinoa	\npost workout: Fruits + unsweetened tea or coffee	', 'Dal ka chilla with grilled paneer or fish	+ protein shake', 'Oats with milk and fruits\n', 'Whole grain roti + sabzi / soup + salad\npost workout: Yogurt with fruits\n\n\n', 'Tandoori paneer / chicken/ fish\n', 'Idli (brown rice), sambhar/ 2 whole eggs + toast	', 'Whole grain roti + mixed vegetable / chicken\npre workout: 5 almonds + unsweetened tea or coffee		', 'Soup with sauteed veg + protein shake', 'Atta or moong dal chilla / scrambled eggs + toast	', 'Brown rice + gravy sabzi or dal	\npost workout: Fruits + unsweetened tea or coffee	', 'Porridge with salad	+ protein shake', 'Oats and yogurt/vegetable omelet	', 'Whole grain roti + vegetables / sauteed chicken roti wrap	\npost workout: 5 almonds + 5 walnuts + buttermilk	', 'Brown rice + masala chana/chicken + protein shake', 'super_admin'),
(9, '<16', 'Severre Thinnes I', 'diet for Severre Thinnes I to gain weight', 1, '2 egg brown bread sandwich + green chutney + 1 cup milk + 3 cashews + 4 almonds + 2 walnuts\nsnacks: 1.5 cup chicken curry + 3 chapatti + salad\n\n', '1 cup arhar dal + 1 cup potato curry + 3 chapatti + 1/2 cup rice + 1/2 cup low fat curd + salad\npre workout: 1 cup strawberry smoothie + 1 cup vegetable poha\npost workout: 1 cup banana shake\n', '1 cup arhar dal + 1 cup potato curry + 3 chapatti + 1/2 cup rice + 1/2 cup low fat curd + salad\n', '3 onion stuffed parantha + 1 cup curd + 3 cashews + 4 almonds + 2 walnuts\nsnacks: 1 cup mango shake\n', '1 cup moong dal/ chicken curry + 1 cup potato and caulifllower vegetable + 3 chapatti + 1/2 cup rice + salad\npre workout: 1 cup pomegranate juice + 2 butter toasted bread\npost workout: 1 cup mango shake\n', '1 cup beans potato vegetable + 3 chapatti + salad\n', '3 paneer stuffed besan cheela + green chutney + 1 cup curd + 3 cashews + 4 almonds + 2 walnuts\nsnacks: 1 apple smoothie with maple syrup\n', '1 cup masoor dal + 1 cup calocasia + 3 chapatti + 1/2 cup rice + 1 cup low curd + salad\npre workout: protein shake\npost workout: 1 cup tomato soup with bread crumbs + 1 cup aloo chaat\n', '1 cup carrot peas vegetable +3 chapatti + salad\n', '1.5 cup vegetable bread upma + 1 cup milk + 3 cashews + 4 almonds + 2 walnuts\nsnacks: 1 cup ripe banana with 2 tsp ghee\n', '1 cup rajma curry + 1 cup spinach potato + 3 chapatti + 1/2 cup rice + salad\npre workout: 1 cup vegetable juice + 1 cup upma\npost workout: whey mass', '1.5 cup parwal vegetable + 3 chapatti + salad\n', '2 cucmber potato sandwich + 1 tsp green chutney + 1 orange juice + 3 cshews + 2 walnuts + 4 almonds\nsnacks: 1 cup buttermilk + 1 cup sweet potato chaat\n', '1 cup white chana/ fish curry + 3 chapatti + 1/2 cup rice + salad\npre workout: 1 cup almond milk + banana\npost workout: protein shake', '1 cup cauliflower potato vegetable + 3 chapatti + salad\n', '2 cup vegetable poha + 1 cup curd + 3 cashews + 4 almonds + 2 walnuts\nsnacks: 2 cups watermelon juice\n', '1 cup chana dal + 1 cup bhindi vegetable + 3 chapatti + 1/2 cup rice + salad\npre workout: 1 cup sprouts salad + 2 potato cheela + green chutney\npost workout: protein shake', '1 cup peas mushroom vegetable + 3 chapatti + salad\n', '3 vegetable suji cheela + 1 cup strawberry shake + 4 cashews + 4 almonds + 3 walnuts\nsnacks: 1 cup coconut water + 1 cup pomegrate\n', '1 cup mix dal + 1 cup soybean curry + 3 chapatti + 1/2 cup curd + salad\npre workout: 1 cup fruit salad + 4 pc vegetable cutlets + green chutney\npost workout: protein shake', '1 cup karela vegetable + 3 chaptti + salad\n', 'super_admin'),
(10, '16 to 17', 'Moderate Thinnes', 'Moderate Thinnes to gain weight', 1, '2 servings Vegan Freezer Breakfast Burritos\nsnacks: 1 cup strawberries', '1 serving Almond-Honey Power Bar, 1 cup mango chunks\npre workout: 1 large apple\npost workout: protein shake, 1 Tbsp. natural peanut butter\n\n', '1 serving Sheet-Pan Maple-Mustard Pork Chops and Carrots\n1 1/2 cups Easy Brown Rice\n', '1 serving Raspberry Peach Mango Smoothie Bowl, 1 hard-boiled egg\nsnacks: 15 baby carrots, 3 Tbsp. hummus, 1 medium orange', '1 serving Roasted Butternut Squash & Root Vegetables with Cauliflower Gnocchi, 1 slice whole-wheat toast with 1 tsp. unsalted butter\nsnacks: 2 servings Philly Cheese Steak Sloppy Joes, 1 large banana\n', '1 slice whole-wheat toast with 1 tsp. unsalted butter\n', '2 servings Maple-Nut Granola\n1 cup 2% milk', '1 serving Roasted Butternut Squash & Root Vegetables with Cauliflower Gnocchi,1 slice whole-wheat toast with 1 tsp. unsalted butter\nsnacks: 1 slice Swiss cheese, 8 whole-wheat crackers\n', '2 servings Creamy Chicken, Brussels Sprouts and Mushroom One-Pot Pasta\nsnacks: 6 oz. 2% plain Greek yogurt,1 cup strawberries, 1 Tbsp. honey', '2 servings Maple-Nut Granola\n1 cup 2% milk', '1 serving Roasted Butternut Squash & Root Vegetables with Cauliflower Gnocchi,1 slice whole-wheat toast with 1 tsp. unsalted butter\nsnacks: 1 slice Swiss cheese, 8 whole-wheat crackers\n', '2 servings Creamy Chicken, Brussels Sprouts and Mushroom One-Pot Pasta\nsnacks: 6 oz. 2% plain Greek yogurt,1 cup strawberries, 1 Tbsp. honey', '2 servings Vegan Freezer Breakfast Burritos\nsnacks: 1 cup strawberries', '1 serving Roasted Butternut Squash & Root Vegetables with Cauliflower Gnocchi, 1 slice whole-wheat toast with 1 tsp. unsalted butter\nsnacks: 2 servings Philly Cheese Steak Sloppy Joes, 1 large banana\n', '2 servings Creamy Chicken, Brussels Sprouts and Mushroom One-Pot Pasta\nsnacks: 6 oz. 2% plain Greek yogurt,1 cup strawberries, 1 Tbsp. honey', '2 servings Vegan Freezer Breakfast Burritos\nsnacks: 1 cup strawberries', '1 serving Almond-Honey Power Bar, 1 cup mango chunks\npre workout: 1 large apple\npost workout: protein shake, 1 Tbsp. natural peanut butter\n\n', '1 serving Sheet-Pan Maple-Mustard Pork Chops and Carrots\n1 1/2 cups Easy Brown Rice\n', '2 servings Maple-Nut Granola\n1 cup 2% milk', '1 serving Roasted Butternut Squash & Root Vegetables with Cauliflower Gnocchi,1 slice whole-wheat toast with 1 tsp. unsalted butter\nsnacks: 1 slice Swiss cheese, 8 whole-wheat crackers\n', '1 slice whole-wheat toast with 1 tsp. unsalted butter\n', 'super_admin');

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

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id`, `username`, `notes`, `reservation_date`, `status`, `time_slot`, `coach_name`, `added_date`) VALUES
(1, 'user_a', 'Back and Chest day', '2024-06-03', 'Confirmed', '9-11AM', 'Coach Kenji', '2024-06-02'),
(2, 'user_a', 'Bicep, Triceps and leg day', '2024-06-04', 'Pending', '9-11AM', 'Coach Kenji', '2024-06-02'),
(3, 'user_a', 'Chest and Abs', '2024-06-05', 'Pending', '9-11AM', 'Coach Kenji', '2024-06-02'),
(4, 'Raul1', 'Chest day', '2024-06-03', 'Confirmed', '9-11AM', 'Coach Melai', '2024-06-03'),
(5, 'Christian', 'Back and leg day', '2024-06-03', 'Confirmed', '9-11AM', 'Coach ronna', '2024-06-03'),
(6, 'Christian', 'leg and chest', '2024-06-04', 'Confirmed', '3-5PM', 'Coach ronna', '2024-06-03');

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

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `username`, `fullname`, `contact`, `method`, `address`, `items`, `total_quantity`, `total`, `status`, `receipt_url`, `transaction_date`) VALUES
(1, 'user_a', 'UserA', 'N/A', 'Pickup', '3rd Floor , Dona Pacita Building beside PureGold Paniqui, M. H Del Pilar Street, Paniqui, Tarlac, Paniqui, Philippines', '2 X Prothin Whey Prothin Ripped Vanilla', 2, '3340.00', 'Completed', 'https://res.cloudinary.com/dpruj7bhk/image/upload/v1717345612/a6uzby8rq8vp6kq0zxz6.jpg', '2024-06-02'),
(2, 'userB', 'User_B', 'N/A', 'Pickup', '3rd Floor , Dona Pacita Building beside PureGold Paniqui, M. H Del Pilar Street, Paniqui, Tarlac, Paniqui, Philippines', '1 X Athlene Active Creatine,1 X Prothin Whey Prothin Ripped Vanilla', 2, '2069.00', 'Completed', 'https://res.cloudinary.com/dpruj7bhk/image/upload/v1717324194/mr0uwq6vurpfy8getzzb.png', '2024-06-02'),
(3, 'mazi1', 'mazikeen', 'N/A', 'Pickup', '3rd Floor , Dona Pacita Building beside PureGold Paniqui, M. H Del Pilar Street, Paniqui, Tarlac, Paniqui, Philippines', '1 X Prothin Whey Prothin Ripped Vanilla,1 X Athlene Active Creatine', 2, '2069.00', 'Pending', 'image.jpg', '2024-06-03'),
(4, 'Raul1', 'Raul Benedicto', 'N/A', 'Pickup', '3rd Floor , Dona Pacita Building beside PureGold Paniqui, M. H Del Pilar Street, Paniqui, Tarlac, Paniqui, Philippines', '1 X Prothin Whey Prothin Ripped Vanilla', 1, '1670.00', 'Completed', 'https://res.cloudinary.com/dpruj7bhk/image/upload/v1717383545/sbk95oxckayxqpe2uobj.png', '2024-06-03');

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
(73, 'UserA', 'user_a', 'user', 1, 'user123'),
(74, 'User_B', 'userB', 'user', 1, 'userb123'),
(77, 'Jasper Rey Devera', 'jasper', 'admin', 1, 'usy96i7oi'),
(78, 'Rowien B. Guevarra', 'rowien', 'admin', 1, 'ypxwh85x'),
(79, 'MARCO JELL R. AGANON', 'marco', 'admin', 1, 'marco1'),
(80, 'Jansen Bautista', 'jansen', 'admin', 1, '97rbscvs'),
(81, 'Vanessa M.', 'vanessa', 'admin', 1, 'vanessa1'),
(82, 'Sofia Daileg', 'sofia', 'user', 1, 'fp3jqstmf'),
(83, 'mazikeen', 'mazi1', 'user', 1, 'mazi123'),
(84, 'Kenneth', 'kenneth', 'user', 1, 'o1lnoqtmg'),
(85, 'Bimbers Cacheco', 'bimbers', 'user', 1, 'fsnv7cuqf'),
(86, 'Kathleen', 'kathleen', 'user', 1, 'r7ch23lvf'),
(87, 'Sofiya villamor', 'Sofiyuh', 'user', 1, 'sofiyuh1'),
(88, 'Donalene Fabillar', 'Donalene', 'user', 1, '68jic3oz'),
(89, 'Arianne D.', 'Arianne', 'user', 1, '1etp5e2i'),
(90, 'Raven P.', 'Raven', 'user', 1, '4qcs2aro'),
(91, 'Maria Teresa V.', 'Maria', 'user', 1, '3eklfwnw'),
(92, 'John Phillip Miranda', 'Phillip', 'user', 1, 'nw28qxqi'),
(93, 'Raul Benedicto', 'Raul1', 'user', 1, 'raul123'),
(94, 'Jan Danilo Vanzuela', 'danilo', 'user', 1, '384qcghh'),
(95, 'Christian', 'Christian', 'user', 1, 'christian1'),
(96, 'Kiezel', 'Kiezel', 'user', 1, 'l8zznx4j'),
(97, 'Cedric', 'Cedric', 'user', 1, 'fbsyhjh3'),
(98, 'Jerome Granil', 'Jerome ', 'user', 1, 'mlfuaxe5'),
(99, 'Clarence', 'Clarence', 'user', 1, 'qr52pkd6'),
(100, 'Diego', 'Diego', 'user', 1, 'mcfv876'),
(101, 'Michael', 'Michael', 'user', 1, 'nmnddd2o'),
(102, 'Bryan Espirito', 'Bryan ', 'user', 1, 'f13sn90x'),
(103, 'Delacruz, Maigan', 'Maigan', 'user', 1, 'fbglaymxg'),
(104, 'Jen Conde', 'Conde', 'user', 1, 'npqfb8m1j'),
(105, 'Njay Param', 'Njay1', 'user', 1, 'uqzf57og'),
(106, 'James Dela cruz', 'James', 'user', 1, 'hcyc9rb6');

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
(293, 'super_admin', 'Logoff - success', '119.111.232.146', 'Windows', '2024-04-05 05:40:07'),
(294, 'super_admin', 'Logon - failed', '136.158.118.189', 'Linux', '2024-06-02 08:24:12'),
(295, 'super_admin', 'Logon - success', '136.158.118.189', 'Linux', '2024-06-02 08:24:24'),
(296, 'derrickagatep', 'Logon - success', '136.158.118.189', 'Linux', '2024-06-02 08:26:56'),
(297, 'derrickagatep', 'Logoff - success', '136.158.118.189', 'Linux', '2024-06-02 08:28:12'),
(298, 'rafaelrazon', 'Logon - failed', '136.158.118.189', 'Linux', '2024-06-02 08:28:22'),
(299, 'rafaelrazon', 'Logon - failed', '136.158.118.189', 'Linux', '2024-06-02 08:28:31'),
(300, 'rafael razon', 'Logon - failed', '136.158.118.189', 'Linux', '2024-06-02 08:28:43'),
(301, 'derrickagatep', 'Logon - success', '136.158.118.189', 'Linux', '2024-06-02 08:29:00'),
(302, 'derrickagatep', 'Logoff - success', '136.158.118.189', 'Linux', '2024-06-02 08:29:18'),
(303, 'Rafaelrazon', 'Logon - failed', '136.158.118.189', 'Linux', '2024-06-02 08:29:29'),
(304, 'Rafaelrazon', 'Logon - failed', '136.158.118.189', 'Linux', '2024-06-02 08:29:39'),
(305, 'derrickagatep', 'Logon - success', '136.158.118.189', 'Linux', '2024-06-02 08:29:56'),
(306, 'derrickagatep', 'Change - status of user \"Rafaelrazon\"', '136.158.118.189', 'Linux', '2024-06-02 08:30:12'),
(307, 'derrickagatep', 'Logoff - success', '136.158.118.189', 'Linux', '2024-06-02 08:30:22'),
(308, 'Rafaelrazon', 'Logon - success', '136.158.118.189', 'Linux', '2024-06-02 08:30:37'),
(309, 'Rafaelrazon', 'Add - Rule 1 Whey Protein in cart', '136.158.118.189', 'Linux', '2024-06-02 08:30:57'),
(310, 'Rafaelrazon', 'Logoff - success', '136.158.118.189', 'Linux', '2024-06-02 08:32:02'),
(311, 'derrickagatep', 'Logon - success', '136.158.118.189', 'Linux', '2024-06-02 08:32:15'),
(312, 'super_admin', 'Logon - success', '49.150.109.58', 'Linux', '2024-06-02 09:05:51'),
(313, 'super_admin', 'Logoff - success', '49.150.109.58', 'Linux', '2024-06-02 09:09:10'),
(314, 'Rafaelrazon', 'Logon - failed', '49.150.109.58', 'Linux', '2024-06-02 09:09:20'),
(315, 'Rafaelrazon', 'Logon - failed', '49.150.109.58', 'Linux', '2024-06-02 09:09:29'),
(316, 'super_admin', 'Logon - success', '49.150.109.58', 'Windows', '2024-06-02 09:53:46'),
(317, 'super_admin', 'Update - user \"Kaye1\"', '49.150.109.58', 'Windows', '2024-06-02 09:55:31'),
(318, 'super_admin', 'Update - user \"Kaye1\"', '49.150.109.58', 'Windows', '2024-06-02 09:57:34'),
(319, 'super_admin', 'Update - user \"Kaye1\"', '49.150.109.58', 'Windows', '2024-06-02 09:58:06'),
(320, 'super_admin', 'Update - user \"Kaye1\"', '49.150.109.58', 'Windows', '2024-06-02 09:59:21'),
(321, 'super_admin', 'Update - user \"Kaye1\"', '49.150.109.58', 'Windows', '2024-06-02 09:59:42'),
(322, 'super_admin', 'Create - new user \"user_a\"', '49.150.109.58', 'Windows', '2024-06-02 10:02:05'),
(323, 'super_admin', 'Update - password of user \"user_a\"', '49.150.109.58', 'Windows', '2024-06-02 10:02:26'),
(324, 'super_admin', 'Create - new user \"userB\"', '49.150.109.58', 'Windows', '2024-06-02 10:03:44'),
(325, 'super_admin', 'Update - password of user \"userB\"', '49.150.109.58', 'Windows', '2024-06-02 10:04:28'),
(326, 'super_admin', 'Create - meal plan for \"user_a\"', '49.150.109.58', 'Windows', '2024-06-02 10:07:07'),
(327, 'super_admin', 'Create - meal plan for \"userB\"', '49.150.109.58', 'Windows', '2024-06-02 10:07:33'),
(328, 'user_a', 'Logon - success', '49.150.109.58', 'Windows', '2024-06-02 10:09:27'),
(329, 'user_a', 'Add - Prothin Whey Prothin Ripped Vanilla in cart', '49.150.109.58', 'Windows', '2024-06-02 10:10:00'),
(330, 'user_a', 'Confirm - checkout', '49.150.109.58', 'Windows', '2024-06-02 10:10:40'),
(331, 'user_a', 'Create - new reservation', '49.150.109.58', 'Windows', '2024-06-02 10:12:03'),
(332, 'super_admin', 'Update - reservation for \"user_a\" with status = \"Confirmed\"', '49.150.109.58', 'Windows', '2024-06-02 10:15:39'),
(333, 'user_a', 'Create - new reservation', '49.150.109.58', 'Windows', '2024-06-02 10:17:12'),
(334, 'user_a', 'Logoff - success', '49.150.109.58', 'Windows', '2024-06-02 10:18:39'),
(335, 'userB', 'Logon - success', '49.150.109.58', 'Windows', '2024-06-02 10:18:50'),
(336, 'super_admin', 'Update - ready meal \"Body recomposition overweight\"', '49.150.109.58', 'Windows', '2024-06-02 10:20:16'),
(337, 'super_admin', 'Update - meal plan for \"userB\"', '49.150.109.58', 'Windows', '2024-06-02 10:21:08'),
(338, 'userB', 'Add - Athlene Active Creatine in cart', '49.150.109.58', 'Windows', '2024-06-02 10:21:36'),
(339, 'userB', 'Add - Prothin Whey Prothin Ripped Vanilla in cart', '49.150.109.58', 'Windows', '2024-06-02 10:21:52'),
(340, 'userB', 'Confirm - checkout', '49.150.109.58', 'Windows', '2024-06-02 10:22:13'),
(341, 'super_admin', 'Logoff - success', '49.150.109.58', 'Windows', '2024-06-02 10:22:34'),
(342, 'user_a', 'Logon - success', '192.168.1.7', 'Android', '2024-06-02 10:25:47'),
(343, 'user_a', 'Create new reservation', '192.168.1.7', 'Android', '2024-06-02 10:26:45'),
(344, 'super_admin', 'Logon - success', '49.150.109.58', 'Linux', '2024-06-02 10:28:33'),
(345, 'super_admin', 'Update - transaction as \"Completed\"', '49.150.109.58', 'Linux', '2024-06-02 10:29:29'),
(346, 'super_admin', 'Update - transaction as \"Completed\"', '49.150.109.58', 'Linux', '2024-06-02 10:29:56'),
(347, 'super_admin', 'Logoff - success', '49.150.109.58', 'Linux', '2024-06-02 10:30:15'),
(348, 'userB', 'Logoff - success', '49.150.109.58', 'Windows', '2024-06-02 10:39:10'),
(349, 'super_admin', 'Logon - success', '49.150.109.58', 'Windows', '2024-06-02 12:32:30'),
(350, 'super_admin', 'Delete - account \"MARCO JELL \"', '49.150.109.58', 'Windows', '2024-06-02 12:41:47'),
(351, 'super_admin', 'Create - new user \"Marco\"', '49.150.109.58', 'Windows', '2024-06-02 12:42:49'),
(352, 'super_admin', 'Delete - account \"Marco\"', '49.150.109.58', 'Windows', '2024-06-02 12:46:30'),
(353, 'super_admin', 'Update - user \"kimgutierrez\"', '49.150.109.58', 'Windows', '2024-06-02 12:47:52'),
(354, 'super_admin', 'Change - status of user \"kimgutierrez\"', '49.150.109.58', 'Windows', '2024-06-02 12:48:13'),
(355, 'kimguitierrez', 'Logon - failed', '49.150.109.58', 'Windows', '2024-06-02 12:48:54'),
(356, 'kimgutierrez', 'Logon - success', '49.150.109.58', 'Windows', '2024-06-02 12:49:05'),
(357, 'super_admin', 'Logoff - success', '49.150.109.58', 'Windows', '2024-06-02 12:54:32'),
(358, 'user_a', 'Logon - success', '49.150.109.58', 'Windows', '2024-06-02 12:55:03'),
(359, 'super_admin', 'Logoff - success', '49.150.104.206', 'Windows', '2024-06-02 12:56:16'),
(360, 'Jasperr', 'Logon - failed', '49.150.104.206', 'Windows', '2024-06-02 12:56:32'),
(361, 'super_admin', 'Logon - success', '49.150.109.58', 'Windows', '2024-06-02 12:56:40'),
(362, 'super_admin', 'Logon - success', '49.150.104.206', 'Windows', '2024-06-02 12:56:47'),
(363, 'ronlopez', 'Logoff - success', '136.158.118.24', 'Windows', '2024-06-02 12:57:14'),
(364, 'super', 'Logon - failed', '136.158.118.24', 'Windows', '2024-06-02 12:57:17'),
(365, 'super_admin', 'Logon - success', '136.158.118.24', 'Windows', '2024-06-02 12:57:22'),
(366, 'super_admin', 'Logoff - success', '49.150.109.58', 'Windows', '2024-06-02 13:01:55'),
(367, 'super_admin', 'Logon - success', '49.150.109.58', 'Windows', '2024-06-02 13:03:58'),
(368, 'super_admin', 'Update - user \"abellar\"', '49.150.109.58', 'Windows', '2024-06-02 13:05:14'),
(369, 'super_admin', 'Update - user \"Edward\"', '49.150.109.58', 'Windows', '2024-06-02 13:07:49'),
(370, 'super_admin', 'Delete - account \"Edward\"', '49.150.109.58', 'Windows', '2024-06-02 13:30:21'),
(371, 'super_admin', 'Logoff - success', '49.150.109.58', 'Windows', '2024-06-02 13:31:04'),
(372, 'super_admin', 'Logon - success', '49.150.109.58', 'Windows', '2024-06-02 13:31:11'),
(373, 'super_admin', 'Logoff - success', '49.150.109.58', 'Windows', '2024-06-02 13:39:07'),
(374, 'user_a', 'Logoff - success', '49.150.109.58', 'Windows', '2024-06-02 13:39:11'),
(375, 'super_admin', 'Logon - success', '49.150.109.58', 'Windows', '2024-06-02 13:39:34'),
(376, 'super_admin', 'Logoff - success', '49.150.109.58', 'Windows', '2024-06-02 13:42:00'),
(377, 'super_admin', 'Update - password of user \"edreiaaron\"', '49.150.104.206', 'Windows', '2024-06-02 14:32:20'),
(378, 'super_admin', 'Change - status of user \"kimgutierrez\"', '49.150.104.206', 'Windows', '2024-06-02 14:35:33'),
(379, 'super_admin', 'Change - status of user \"kimgutierrez\"', '49.150.104.206', 'Windows', '2024-06-02 14:36:27'),
(380, 'super_admin', 'Change - status of user \"derrickagatep\"', '49.150.104.206', 'Windows', '2024-06-02 14:36:50'),
(381, 'super_admin', 'Update - user \"derrickagatep\"', '49.150.104.206', 'Windows', '2024-06-02 14:39:06'),
(382, 'kimgutierrez', 'Logon - success', '49.150.104.206', 'Windows', '2024-06-02 14:39:42'),
(383, 'kimgutierrez', 'Change - status of user \"Maigan\"', '49.150.104.206', 'Windows', '2024-06-02 14:39:58'),
(384, 'kimgutierrez', 'Change - status of user \"Maigan\"', '49.150.104.206', 'Windows', '2024-06-02 14:40:06'),
(385, 'kimgutierrez', 'Update - user \"Maigan\"', '49.150.104.206', 'Windows', '2024-06-02 14:52:13'),
(386, 'kimgutierrez', 'Change - status of user \"Maigan\"', '49.150.104.206', 'Windows', '2024-06-02 14:52:26'),
(387, 'kimgutierrez', 'Change - status of user \"Maigan\"', '49.150.104.206', 'Windows', '2024-06-02 14:53:29'),
(388, 'kimgutierrez', 'Change - status of user \"Maigan\"', '49.150.104.206', 'Windows', '2024-06-02 15:00:39'),
(389, 'kimgutierrez', 'Change - status of user \"Julius\"', '49.150.104.206', 'Windows', '2024-06-02 15:01:11'),
(390, 'kimgutierrez', 'Change - status of user \"Julius\"', '49.150.104.206', 'Windows', '2024-06-02 15:02:02'),
(391, 'kimgutierrez', 'Update - user \"Maigan\"', '49.150.104.206', 'Windows', '2024-06-02 15:08:00'),
(392, 'kimgutierrez', 'Change - status of user \"Julius\"', '49.150.104.206', 'Windows', '2024-06-02 15:09:33'),
(393, 'kimgutierrez', 'Change - status of user \"Conde1\"', '49.150.104.206', 'Windows', '2024-06-02 15:09:39'),
(394, 'kimgutierrez', 'Change - status of user \"Vincent1\"', '49.150.104.206', 'Windows', '2024-06-02 15:09:45'),
(395, 'kimgutierrez', 'Change - status of user \"Njay1\"', '49.150.104.206', 'Windows', '2024-06-02 15:09:52'),
(396, 'kimgutierrez', 'Change - status of user \"James\"', '49.150.104.206', 'Windows', '2024-06-02 15:09:58'),
(397, 'kimgutierrez', 'Change - status of user \"Alvin1\"', '49.150.104.206', 'Windows', '2024-06-02 15:10:03'),
(398, 'kimgutierrez', 'Update - user \"Maigan\"', '49.150.104.206', 'Windows', '2024-06-02 15:11:14'),
(399, 'kimgutierrez', 'Update - user \"Julius\"', '49.150.104.206', 'Windows', '2024-06-02 15:11:53'),
(400, 'kimgutierrez', 'Update - user \"Conde1\"', '49.150.104.206', 'Windows', '2024-06-02 15:12:19'),
(401, 'kimgutierrez', 'Update - user \"Vincent1\"', '49.150.104.206', 'Windows', '2024-06-02 15:12:38'),
(402, 'super_admin', 'Delete - account \"Rafaelrazon\"', '49.150.104.206', 'Windows', '2024-06-02 15:14:04'),
(403, 'super_admin', 'Delete - account \"Maigan\"', '49.150.104.206', 'Windows', '2024-06-02 15:15:42'),
(404, 'super_admin', 'Delete - account \"Jansen \"', '49.150.104.206', 'Windows', '2024-06-02 15:16:07'),
(405, 'super_admin', 'Delete - account \"Rowien B. Guevarra\"', '49.150.104.206', 'Windows', '2024-06-02 15:18:58'),
(406, 'super_admin', 'Delete - account \"Vanessa\"', '49.150.104.206', 'Windows', '2024-06-02 15:19:12'),
(407, 'super_admin', 'Delete - account \"Mary Rose \"', '49.150.104.206', 'Windows', '2024-06-02 15:19:27'),
(408, 'super_admin', 'Delete - account \"Mazikeen\"', '49.150.104.206', 'Windows', '2024-06-02 15:19:38'),
(409, 'super_admin', 'Delete - account \"Christian1\"', '49.150.104.206', 'Windows', '2024-06-02 15:20:06'),
(410, 'kimgutierrez', 'Logoff - success', '49.150.104.206', 'Windows', '2024-06-02 15:20:51'),
(411, 'super_admin', 'Logoff - success', '49.150.104.206', 'Windows', '2024-06-02 15:20:56'),
(412, 'super_admin', 'Logon - success', '49.150.109.58', 'Windows', '2024-06-02 15:21:30'),
(413, 'super_admin', 'Delete - account \"derrickagatep\"', '49.150.109.58', 'Windows', '2024-06-02 15:22:35'),
(414, 'super_admin', 'Delete - account \"marquezbj\"', '49.150.109.58', 'Windows', '2024-06-02 15:22:46'),
(415, 'super_admin', 'Delete - account \"ronlopez\"', '49.150.109.58', 'Windows', '2024-06-02 15:22:56'),
(416, 'super_admin', 'Delete - account \"ljsantos\"', '49.150.109.58', 'Windows', '2024-06-02 15:23:06'),
(417, 'super_admin', 'Delete - account \"kimgutierrez\"', '49.150.109.58', 'Windows', '2024-06-02 15:23:20'),
(418, 'super_admin', 'Delete - account \"Jasper Rey Devera\"', '49.150.109.58', 'Windows', '2024-06-02 15:24:25'),
(419, 'super_admin', 'Delete - account \"edreiaaron\"', '49.150.109.58', 'Windows', '2024-06-02 15:25:12'),
(420, 'super_admin', 'Delete - account \"jessa1\"', '49.150.109.58', 'Windows', '2024-06-02 15:25:22'),
(421, 'super_admin', 'Delete - account \"Sofia\"', '49.150.109.58', 'Windows', '2024-06-02 15:25:33'),
(422, 'super_admin', 'Delete - account \"Kyle1\"', '49.150.109.58', 'Windows', '2024-06-02 15:25:42'),
(423, 'super_admin', 'Delete - account \"Kenneth\"', '49.150.109.58', 'Windows', '2024-06-02 15:25:51'),
(424, 'super_admin', 'Delete - account \"kyla1\"', '49.150.109.58', 'Windows', '2024-06-02 15:25:59'),
(425, 'super_admin', 'Delete - account \"Kyle Estrella\"', '49.150.109.58', 'Windows', '2024-06-02 15:26:07'),
(426, 'super_admin', 'Delete - account \"Bimbers\"', '49.150.109.58', 'Windows', '2024-06-02 15:26:18'),
(427, 'super_admin', 'Delete - account \"Kathleen1\"', '49.150.109.58', 'Windows', '2024-06-02 15:26:26'),
(428, 'super_admin', 'Delete - account \"Mjey1\"', '49.150.109.58', 'Windows', '2024-06-02 15:26:35'),
(429, 'super_admin', 'Delete - account \"Sofiyuh\"', '49.150.109.58', 'Windows', '2024-06-02 15:26:45'),
(430, 'super_admin', 'Delete - account \"Donalene \"', '49.150.109.58', 'Windows', '2024-06-02 15:26:54'),
(431, 'super_admin', 'Delete - account \"Bc Eterosa\"', '49.150.109.58', 'Windows', '2024-06-02 15:27:07'),
(432, 'super_admin', 'Delete - account \"abellar\"', '49.150.109.58', 'Windows', '2024-06-02 15:27:25'),
(433, 'super_admin', 'Delete - account \"Karen\"', '49.150.109.58', 'Windows', '2024-06-02 15:27:35'),
(434, 'super_admin', 'Delete - account \"Raven\"', '49.150.109.58', 'Windows', '2024-06-02 15:27:43'),
(435, 'super_admin', 'Delete - account \"Arvin \"', '49.150.109.58', 'Windows', '2024-06-02 15:27:52'),
(436, 'super_admin', 'Delete - account \"Kaii1\"', '49.150.109.58', 'Windows', '2024-06-02 15:28:01'),
(437, 'super_admin', 'Delete - account \"Kaye1\"', '49.150.109.58', 'Windows', '2024-06-02 15:28:10'),
(438, 'super_admin', 'Delete - account \"Maria \"', '49.150.109.58', 'Windows', '2024-06-02 15:28:21'),
(439, 'super_admin', 'Delete - account \"John Phillip\"', '49.150.109.58', 'Windows', '2024-06-02 15:28:30'),
(440, 'super_admin', 'Delete - account \"Raul1\"', '49.150.109.58', 'Windows', '2024-06-02 15:28:38'),
(441, 'super_admin', 'Delete - account \"Jan Danilo \"', '49.150.109.58', 'Windows', '2024-06-02 15:28:47'),
(442, 'super_admin', 'Delete - account \"Nicole Rianie \"', '49.150.109.58', 'Windows', '2024-06-02 15:28:56'),
(443, 'super_admin', 'Delete - account \"Roby1\"', '49.150.109.58', 'Windows', '2024-06-02 15:29:04'),
(444, 'super_admin', 'Delete - account \"Kiezel1\"', '49.150.109.58', 'Windows', '2024-06-02 15:29:12'),
(445, 'super_admin', 'Delete - account \"Marc Joven\"', '49.150.109.58', 'Windows', '2024-06-02 15:29:21'),
(446, 'super_admin', 'Delete - account \"Cedric\"', '49.150.109.58', 'Windows', '2024-06-02 15:29:30'),
(447, 'super_admin', 'Delete - account \"Jerome\"', '49.150.109.58', 'Windows', '2024-06-02 15:29:50'),
(448, 'super_admin', 'Delete - account \"Clarence \"', '49.150.109.58', 'Windows', '2024-06-02 15:29:58'),
(449, 'super_admin', 'Delete - account \"Diego1\"', '49.150.109.58', 'Windows', '2024-06-02 15:30:07'),
(450, 'super_admin', 'Delete - account \"Michael1\"', '49.150.109.58', 'Windows', '2024-06-02 15:30:18'),
(451, 'super_admin', 'Delete - account \"Hanz1\"', '49.150.109.58', 'Windows', '2024-06-02 15:30:28'),
(452, 'super_admin', 'Delete - account \"Jay Mark \"', '49.150.109.58', 'Windows', '2024-06-02 15:30:36'),
(453, 'super_admin', 'Delete - account \"Bryan \"', '49.150.109.58', 'Windows', '2024-06-02 15:30:44'),
(454, 'super_admin', 'Delete - account \"Jester\"', '49.150.109.58', 'Windows', '2024-06-02 15:30:53'),
(455, 'super_admin', 'Delete - account \"Julius\"', '49.150.109.58', 'Windows', '2024-06-02 15:31:15'),
(456, 'super_admin', 'Delete - account \"Vincent1\"', '49.150.109.58', 'Windows', '2024-06-02 15:31:40'),
(457, 'super_admin', 'Delete - account \"Njay1\"', '49.150.109.58', 'Windows', '2024-06-02 15:31:52'),
(458, 'super_admin', 'Delete - account \"James\"', '49.150.109.58', 'Windows', '2024-06-02 15:32:02'),
(459, 'super_admin', 'Delete - account \"Alvin1\"', '49.150.109.58', 'Windows', '2024-06-02 15:32:12'),
(460, 'super_admin', 'Logoff - success', '49.150.109.58', 'Windows', '2024-06-02 15:32:38'),
(461, 'super_admin', 'Logon - success', '136.158.118.189', 'Windows', '2024-06-02 15:46:28'),
(462, 'super_admin', 'Logon - success', '49.150.104.206', 'Windows', '2024-06-02 15:47:22'),
(463, 'super_admin', 'Create - new user \"jasper\"', '136.158.118.189', 'Windows', '2024-06-02 15:50:00'),
(464, 'super_admin', 'Create - new user \"rowien\"', '136.158.118.189', 'Windows', '2024-06-02 15:51:38'),
(465, 'super_admin', 'Update - user \"jasper\"', '136.158.118.189', 'Windows', '2024-06-02 15:51:52'),
(466, 'super_admin', 'Change - status of user \"jasper\"', '136.158.118.189', 'Windows', '2024-06-02 15:53:09'),
(467, 'super_admin', 'Change - status of user \"rowien\"', '136.158.118.189', 'Windows', '2024-06-02 15:53:15'),
(468, 'jasper', 'Logon - failed', '136.158.118.189', 'Windows', '2024-06-02 15:54:04'),
(469, 'super_admin', 'Update - user \"jasper\"', '136.158.118.189', 'Windows', '2024-06-02 15:55:16'),
(470, 'super_admin', 'Change - status of user \"jasper\"', '136.158.118.189', 'Windows', '2024-06-02 15:55:22'),
(471, 'super_admin', 'Update - user \"rowien\"', '136.158.118.189', 'Windows', '2024-06-02 15:56:00'),
(472, 'super_admin', 'Update - user \"rowien\"', '136.158.118.189', 'Windows', '2024-06-02 15:56:15'),
(473, 'super_admin', 'Update - user \"marco\"', '136.158.118.189', 'Windows', '2024-06-02 15:56:44'),
(474, 'jasper', 'Logon - success', '136.158.118.189', 'Windows', '2024-06-02 15:56:59'),
(475, 'super_admin', 'Create - new user \"jansen\"', '136.158.118.189', 'Windows', '2024-06-02 15:58:02'),
(476, 'super_admin', 'Change - status of user \"jansen\"', '136.158.118.189', 'Windows', '2024-06-02 15:58:08'),
(477, 'super_admin', 'Update - user \"jansen\"', '136.158.118.189', 'Windows', '2024-06-02 15:58:53'),
(478, 'super_admin', 'Change - status of user \"jansen\"', '136.158.118.189', 'Windows', '2024-06-02 15:58:59'),
(479, 'super_admin', 'Update - user \"jansen\"', '136.158.118.189', 'Windows', '2024-06-02 15:59:27'),
(480, 'super_admin', 'Create - new user \"vanessa\"', '136.158.118.189', 'Windows', '2024-06-02 16:00:48'),
(481, 'super_admin', 'Logoff - success', '136.158.118.189', 'Windows', '2024-06-02 16:01:14'),
(482, 'super_admin', 'Logon - success', '136.158.118.189', 'Windows', '2024-06-02 16:01:44'),
(483, 'jasper', 'Logon - success', '136.158.118.189', 'Windows', '2024-06-02 16:02:10'),
(484, 'jasper', 'Create - new user \"sofia\"', '136.158.118.189', 'Windows', '2024-06-02 16:03:40'),
(485, 'super_admin', 'Logon - success', '49.150.109.58', 'Windows', '2024-06-02 16:03:45'),
(486, 'jasper', 'Update - user \"sofia\"', '136.158.118.189', 'Windows', '2024-06-02 16:04:36'),
(487, 'jasper', 'Change - status of user \"sofia\"', '136.158.118.189', 'Windows', '2024-06-02 16:04:43'),
(488, 'super_admin', 'Update - user \"sofia\"', '49.150.109.58', 'Windows', '2024-06-02 16:08:12'),
(489, 'jasper', 'Create - new user \"mazi1\"', '136.158.118.189', 'Windows', '2024-06-02 16:09:04'),
(490, 'jasper', 'Create - new user \"kenneth\"', '136.158.118.189', 'Windows', '2024-06-02 16:10:07'),
(491, 'jasper', 'Create - new user \"bimbers\"', '136.158.118.189', 'Windows', '2024-06-02 16:11:45'),
(492, 'super_admin', 'Update - password of user \"vanessa\"', '49.150.109.58', 'Windows', '2024-06-02 16:13:48'),
(493, 'vannesa', 'Logon - failed', '49.150.109.58', 'Windows', '2024-06-02 16:14:20'),
(494, 'vanessa', 'Logon - success', '49.150.109.58', 'Windows', '2024-06-02 16:14:22'),
(495, 'vanessa', 'Logoff - success', '49.150.109.58', 'Windows', '2024-06-02 16:14:42'),
(496, 'jasper', 'Update - user \"bimbers\"', '136.158.118.189', 'Windows', '2024-06-02 16:14:43'),
(497, 'super_admin', 'Logon - success', '49.150.104.206', 'Windows', '2024-06-02 16:16:14');
INSERT INTO `user_logs` (`id`, `username`, `event_info`, `ip_address`, `platform`, `event_time`) VALUES
(498, 'super_admin', 'Logoff - success', '49.150.109.58', 'Windows', '2024-06-02 16:16:58'),
(499, 'jasper', 'Create - new user \"kathleen\"', '136.158.118.189', 'Windows', '2024-06-02 16:19:14'),
(500, 'jasper', 'Update - user \"kathleen\"', '136.158.118.189', 'Windows', '2024-06-02 16:20:44'),
(501, 'jasper', 'Logoff - success', '136.158.118.189', 'Windows', '2024-06-02 16:21:08'),
(502, 'rowien', 'Logon - success', '136.158.118.189', 'Windows', '2024-06-02 16:21:46'),
(503, 'super_admin', 'Logon - success', '49.150.109.58', 'Windows', '2024-06-02 16:21:46'),
(504, 'rowien', 'Create - new user \"Sofiyuh\"', '136.158.118.189', 'Windows', '2024-06-02 16:22:43'),
(505, 'rowien', 'Create - new user \"Donalene\"', '136.158.118.189', 'Windows', '2024-06-02 16:23:39'),
(506, 'rowien', 'Create - new user \"Arianne\"', '136.158.118.189', 'Windows', '2024-06-02 16:24:32'),
(507, 'rowien', 'Create - new user \"Raven\"', '136.158.118.189', 'Windows', '2024-06-02 16:25:21'),
(508, 'super_admin', 'Update - transaction as \"\"', '49.150.104.206', 'Windows', '2024-06-02 16:25:31'),
(509, 'rowien', 'Create - new user \"Maria\"', '136.158.118.189', 'Windows', '2024-06-02 16:26:30'),
(510, 'rowien', 'Update - user \"Sofiyuh\"', '136.158.118.189', 'Windows', '2024-06-02 16:26:43'),
(511, 'rowien', 'Update - user \"Donalene\"', '136.158.118.189', 'Windows', '2024-06-02 16:26:51'),
(512, 'super_admin', 'Update - transaction as \"Completed\"', '49.150.104.206', 'Windows', '2024-06-02 16:26:54'),
(513, 'rowien', 'Update - user \"Arianne\"', '136.158.118.189', 'Windows', '2024-06-02 16:26:59'),
(514, 'rowien', 'Update - user \"Raven\"', '136.158.118.189', 'Windows', '2024-06-02 16:27:08'),
(515, 'super_admin', 'Update - user \"bimbers\"', '136.158.118.189', 'Windows', '2024-06-02 16:29:06'),
(516, 'super_admin', 'Update - user \"Donalene\"', '136.158.118.189', 'Windows', '2024-06-02 16:29:44'),
(517, 'super_admin', 'Logoff - success', '49.150.109.58', 'Windows', '2024-06-02 16:29:49'),
(518, 'super_admin', 'Logon - success', '49.150.109.58', 'Windows', '2024-06-02 16:30:07'),
(519, 'super_admin', 'Update - user \"Raven\"', '136.158.118.189', 'Windows', '2024-06-02 16:30:26'),
(520, 'super_admin', 'Update - user \"Sofiyuh\"', '49.150.109.58', 'Windows', '2024-06-02 16:30:47'),
(521, 'super_admin', 'Update - user \"Arianne\"', '49.150.109.58', 'Windows', '2024-06-02 16:31:19'),
(522, 'super_admin', 'Update - user \"Sofiyuh\"', '136.158.118.189', 'Windows', '2024-06-02 16:31:31'),
(523, 'super_admin', 'Update - user \"Sofiyuh\"', '136.158.118.189', 'Windows', '2024-06-02 16:31:53'),
(524, 'rowien', 'Logoff - success', '136.158.118.189', 'Windows', '2024-06-02 16:34:41'),
(525, 'marco', 'Logon - failed', '136.158.118.189', 'Windows', '2024-06-02 16:36:04'),
(526, 'marco', 'Logon - failed', '136.158.118.189', 'Windows', '2024-06-02 16:36:17'),
(527, 'marco', 'Logon - success', '136.158.118.189', 'Windows', '2024-06-02 16:36:20'),
(528, 'marco', 'Create - new user \"Phillip\"', '136.158.118.189', 'Windows', '2024-06-02 16:37:30'),
(529, 'marco', 'Create - new user \"Raul1\"', '136.158.118.189', 'Windows', '2024-06-02 16:38:34'),
(530, 'super_admin', 'Logoff - success', '49.150.109.58', 'Windows', '2024-06-02 16:38:49'),
(531, 'marco', 'Create - new user \"danilo\"', '136.158.118.189', 'Windows', '2024-06-02 16:40:27'),
(532, 'marco', 'Create - new user \"Christian\"', '136.158.118.189', 'Windows', '2024-06-02 16:41:22'),
(533, 'super_admin', 'Logon - success', '49.150.109.58', 'Windows', '2024-06-02 16:41:27'),
(534, 'super_admin', 'Update - password of user \"Raul1\"', '49.150.109.58', 'Windows', '2024-06-02 16:41:58'),
(535, 'Raul1', 'Logon - success', '49.150.109.58', 'Windows', '2024-06-02 16:42:15'),
(536, 'marco', 'Create - new user \"Kiezel\"', '136.158.118.189', 'Windows', '2024-06-02 16:42:24'),
(537, 'marco', 'Logoff - success', '136.158.118.189', 'Windows', '2024-06-02 16:42:37'),
(538, 'Raul1', 'Create - new reservation', '49.150.109.58', 'Windows', '2024-06-02 16:42:44'),
(539, 'super_admin', 'Logon - success', '136.158.118.189', 'Windows', '2024-06-02 16:42:48'),
(540, 'super_admin', 'Logoff - success', '136.158.118.189', 'Windows', '2024-06-02 16:43:10'),
(541, 'super_admin', 'Update - reservation for \"Raul1\" with status = \"Confirmed\"', '49.150.109.58', 'Windows', '2024-06-02 16:43:12'),
(542, 'janse', 'Logon - failed', '136.158.118.189', 'Windows', '2024-06-02 16:43:21'),
(543, 'jansen', 'Logon - success', '136.158.118.189', 'Windows', '2024-06-02 16:43:22'),
(544, 'super_admin', 'Update - password of user \"Christian\"', '49.150.109.58', 'Windows', '2024-06-02 16:44:11'),
(545, 'Raul1', 'Logoff - success', '49.150.109.58', 'Windows', '2024-06-02 16:44:21'),
(546, 'Christian', 'Logon - success', '49.150.109.58', 'Windows', '2024-06-02 16:44:28'),
(547, 'jansen', 'Create - new user \"Cedric\"', '136.158.118.189', 'Windows', '2024-06-02 16:44:41'),
(548, 'Christian', 'Create - new reservation', '49.150.109.58', 'Windows', '2024-06-02 16:44:57'),
(549, 'Christian', 'Logoff - success', '49.150.109.58', 'Windows', '2024-06-02 16:45:03'),
(550, 'super_admin', 'Update - reservation for \"Christian\" with status = \"Confirmed\"', '49.150.109.58', 'Windows', '2024-06-02 16:45:16'),
(551, 'jansen', 'Create - new user \"Jerome \"', '136.158.118.189', 'Windows', '2024-06-02 16:45:29'),
(552, 'super_admin', 'Update - password of user \"Sofiyuh\"', '49.150.109.58', 'Windows', '2024-06-02 16:46:04'),
(553, 'Sofiyuh', 'Logon - success', '49.150.109.58', 'Windows', '2024-06-02 16:46:18'),
(554, 'jansen', 'Create - new user \"Clarence\"', '136.158.118.189', 'Windows', '2024-06-02 16:46:37'),
(555, 'super_admin', 'Update - user \"Sofiyuh\"', '49.150.109.58', 'Windows', '2024-06-02 16:47:21'),
(556, 'jansen', 'Create - new user \"Diego\"', '136.158.118.189', 'Windows', '2024-06-02 16:47:29'),
(557, 'jansen', 'Create - new user \"Michael\"', '136.158.118.189', 'Windows', '2024-06-02 16:48:23'),
(558, 'jansen', 'Logoff - success', '136.158.118.189', 'Windows', '2024-06-02 16:48:32'),
(559, 'super_admin', 'Logon - success', '136.158.118.189', 'Windows', '2024-06-02 16:48:39'),
(560, 'super_admin', 'Logoff - success', '136.158.118.189', 'Windows', '2024-06-02 16:49:00'),
(561, 'vanessa', 'Logon - success', '136.158.118.189', 'Windows', '2024-06-02 16:49:14'),
(562, 'Sofiyuh', 'Logoff - success', '49.150.109.58', 'Windows', '2024-06-02 16:49:41'),
(563, 'super_admin', 'Logoff - success', '49.150.109.58', 'Windows', '2024-06-02 16:50:05'),
(564, 'vanessa', 'Create - new user \"Bryan \"', '136.158.118.189', 'Windows', '2024-06-02 16:50:15'),
(565, 'vanessa', 'Create - new user \"Maigan\"', '136.158.118.189', 'Windows', '2024-06-02 16:51:05'),
(566, 'vanessa', 'Create - new user \"Conde\"', '136.158.118.189', 'Windows', '2024-06-02 16:52:12'),
(567, 'vanessa', 'Create - new user \"Njay1\"', '136.158.118.189', 'Windows', '2024-06-02 16:53:11'),
(568, 'vanessa', 'Create - new user \"James\"', '136.158.118.189', 'Windows', '2024-06-02 16:54:02'),
(569, 'vanessa', 'Logoff - success', '136.158.118.189', 'Windows', '2024-06-02 16:54:09'),
(570, 'super_admin', 'Logon - success', '136.158.118.189', 'Windows', '2024-06-02 16:54:23'),
(571, 'super_admin', 'Update - user \"Sofiyuh\"', '136.158.118.189', 'Windows', '2024-06-02 16:54:52'),
(572, 'super_admin', 'Logon - success', '49.150.109.58', 'Windows', '2024-06-02 16:55:46'),
(573, 'super_admin', 'Logoff - success', '136.158.118.189', 'Windows', '2024-06-02 16:59:55'),
(574, 'super_admin', 'Update - password of user \"mazi1\"', '49.150.109.58', 'Windows', '2024-06-02 17:11:19'),
(575, 'super_admin', 'Update - user \"mazi1\"', '49.150.109.58', 'Windows', '2024-06-02 17:11:47'),
(576, 'mazi1', 'Logon - success', '49.150.109.58', 'Windows', '2024-06-02 17:12:07'),
(577, 'super_admin', 'Update - user \"kenneth\"', '49.150.109.58', 'Windows', '2024-06-02 17:12:50'),
(578, 'super_admin', 'Update - user \"kenneth\"', '49.150.109.58', 'Windows', '2024-06-02 17:13:14'),
(579, 'super_admin', 'Update - user \"mazi1\"', '49.150.109.58', 'Windows', '2024-06-02 17:17:14'),
(580, 'super_admin', 'Delete - subscription \"W/promo Monthly membership\"', '49.150.109.58', 'Windows', '2024-06-02 17:17:26'),
(581, 'mazi1', 'Add - Prothin Whey Prothin Ripped Vanilla in cart', '49.150.109.58', 'Windows', '2024-06-02 17:23:22'),
(582, 'mazi1', 'Add - Athlene Active Creatine in cart', '49.150.109.58', 'Windows', '2024-06-02 17:23:24'),
(583, 'mazi1', 'Confirm - checkout', '49.150.109.58', 'Windows', '2024-06-02 17:23:42'),
(584, 'mazi1', 'Logoff - success', '49.150.109.58', 'Windows', '2024-06-02 17:25:36'),
(585, 'vanessa', 'Logon - success', '49.150.109.58', 'Windows', '2024-06-02 17:25:58'),
(586, 'vanessa', 'Logoff - success', '49.150.109.58', 'Windows', '2024-06-02 17:28:05'),
(587, 'Christian', 'Logon - success', '192.168.1.7', 'Android', '2024-06-02 17:29:32'),
(588, 'Christian', 'Create new reservation', '192.168.1.7', 'Android', '2024-06-02 17:30:09'),
(589, 'Christian', 'Logoff - success', '192.168.1.7', 'Android', '2024-06-02 17:30:14'),
(590, 'super_admin', 'Update - reservation for \"Christian\" with status = \"Confirmed\"', '49.150.109.58', 'Windows', '2024-06-02 17:30:39'),
(591, 'super_admin', 'Logoff - success', '49.150.109.58', 'Windows', '2024-06-02 17:32:45'),
(592, 'jasper', 'Logon - success', '49.150.104.206', 'Windows', '2024-06-02 22:13:22'),
(593, 'super_admin', 'Logon - success', '49.150.109.58', 'Linux', '2024-06-02 22:15:52'),
(594, 'super_admin', 'Update - user \"kenneth\"', '49.150.109.58', 'Linux', '2024-06-02 22:17:17'),
(595, 'super_admin', 'Update - user \"Bryan \"', '49.150.109.58', 'Linux', '2024-06-02 22:19:42'),
(596, 'super_admin', 'Update - ready meal \"Obese Class I\"', '49.150.104.206', 'Windows', '2024-06-02 22:21:01'),
(597, 'super_admin', 'Update - user \"Diego\"', '49.150.109.58', 'Linux', '2024-06-02 22:21:26'),
(598, 'super_admin', 'Update - user \"Jerome \"', '49.150.109.58', 'Linux', '2024-06-02 22:22:53'),
(599, 'super_admin', 'Update - user \"Jerome \"', '49.150.109.58', 'Linux', '2024-06-02 22:23:56'),
(600, 'super_admin', 'Update - user \"Bryan \"', '49.150.109.58', 'Linux', '2024-06-02 22:24:40'),
(601, 'super_admin', 'Update - user \"Diego\"', '49.150.109.58', 'Linux', '2024-06-02 22:25:24'),
(602, 'super_admin', 'Update - user \"Cedric\"', '49.150.109.58', 'Linux', '2024-06-02 22:27:12'),
(603, 'super_admin', 'Update - user \"Christian\"', '49.150.109.58', 'Linux', '2024-06-02 22:28:48'),
(604, 'super_admin', 'Update - user \"Christian\"', '49.150.109.58', 'Linux', '2024-06-02 22:29:40'),
(605, 'super_admin', 'Update - user \"Maria\"', '49.150.109.58', 'Linux', '2024-06-02 22:31:34'),
(606, 'super_admin', 'Update - user \"Raven\"', '49.150.109.58', 'Linux', '2024-06-02 22:32:45'),
(607, 'super_admin', 'Update - user \"Arianne\"', '49.150.109.58', 'Linux', '2024-06-02 22:34:06'),
(608, 'super_admin', 'Update - user \"sofia\"', '49.150.109.58', 'Linux', '2024-06-02 22:34:55'),
(609, 'super_admin', 'Update - user \"mazi1\"', '49.150.109.58', 'Linux', '2024-06-02 22:36:08'),
(610, 'super_admin', 'Update - user \"bimbers\"', '49.150.109.58', 'Linux', '2024-06-02 22:37:29'),
(611, 'super_admin', 'Update - user \"kathleen\"', '49.150.109.58', 'Linux', '2024-06-02 22:38:34'),
(612, 'super_admin', 'Update - user \"Donalene\"', '49.150.109.58', 'Linux', '2024-06-02 22:39:36'),
(613, 'super_admin', 'Logoff - success', '49.150.109.58', 'Linux', '2024-06-02 22:40:46'),
(614, 'jasper', 'Create - meal plan for \"mazi1\"', '49.150.104.206', 'Windows', '2024-06-02 22:45:53'),
(615, 'jasper', 'Create - meal plan for \"kenneth\"', '49.150.104.206', 'Windows', '2024-06-02 22:46:07'),
(616, 'jasper', 'Create - meal plan for \"bimbers\"', '49.150.104.206', 'Windows', '2024-06-02 22:46:18'),
(617, 'jasper', 'Create - meal plan for \"kathleen\"', '49.150.104.206', 'Windows', '2024-06-02 22:46:37'),
(618, 'jasper', 'Logoff - success', '49.150.104.206', 'Windows', '2024-06-02 22:47:01'),
(619, 'rowien', 'Logon - success', '49.150.104.206', 'Windows', '2024-06-02 22:47:16'),
(620, 'rowien', 'Create - meal plan for \"Sofiyuh\"', '49.150.104.206', 'Windows', '2024-06-02 22:47:39'),
(621, 'rowien', 'Create - meal plan for \"Donalene\"', '49.150.104.206', 'Windows', '2024-06-02 22:47:56'),
(622, 'rowien', 'Create - meal plan for \"Arianne\"', '49.150.104.206', 'Windows', '2024-06-02 22:48:07'),
(623, 'rowien', 'Create - meal plan for \"Raven\"', '49.150.104.206', 'Windows', '2024-06-02 22:48:22'),
(624, 'rowien', 'Create - meal plan for \"Maria\"', '49.150.104.206', 'Windows', '2024-06-02 22:48:34'),
(625, 'rowien', 'Logoff - success', '49.150.104.206', 'Windows', '2024-06-02 22:48:49'),
(626, 'marco', 'Logon - success', '49.150.104.206', 'Windows', '2024-06-02 22:48:56'),
(627, 'marco', 'Create - meal plan for \"Phillip\"', '49.150.104.206', 'Windows', '2024-06-02 22:49:11'),
(628, 'marco', 'Create - meal plan for \"Raul1\"', '49.150.104.206', 'Windows', '2024-06-02 22:49:23'),
(629, 'marco', 'Create - meal plan for \"danilo\"', '49.150.104.206', 'Windows', '2024-06-02 22:49:39'),
(630, 'marco', 'Create - meal plan for \"Christian\"', '49.150.104.206', 'Windows', '2024-06-02 22:49:56'),
(631, 'marco', 'Create - meal plan for \"Kiezel\"', '49.150.104.206', 'Windows', '2024-06-02 22:50:08'),
(632, 'marco', 'Logoff - success', '49.150.104.206', 'Windows', '2024-06-02 22:50:28'),
(633, 'jansen', 'Logon - success', '49.150.104.206', 'Windows', '2024-06-02 22:50:35'),
(634, 'jansen', 'Create - meal plan for \"Cedric\"', '49.150.104.206', 'Windows', '2024-06-02 22:50:50'),
(635, 'jansen', 'Create - meal plan for \"Jerome \"', '49.150.104.206', 'Windows', '2024-06-02 22:51:01'),
(636, 'jansen', 'Create - meal plan for \"Clarence\"', '49.150.104.206', 'Windows', '2024-06-02 22:51:16'),
(637, 'jansen', 'Create - meal plan for \"Diego\"', '49.150.104.206', 'Windows', '2024-06-02 22:51:27'),
(638, 'jansen', 'Create - meal plan for \"Michael\"', '49.150.104.206', 'Windows', '2024-06-02 22:51:40'),
(639, 'jansen', 'Logoff - success', '49.150.104.206', 'Windows', '2024-06-02 22:51:53'),
(640, 'jansen', 'Logon - success', '49.150.104.206', 'Windows', '2024-06-02 22:52:05'),
(641, 'jansen', 'Logoff - success', '49.150.104.206', 'Windows', '2024-06-02 22:52:27'),
(642, 'vanessa', 'Logon - success', '49.150.104.206', 'Windows', '2024-06-02 22:52:38'),
(643, 'vanessa', 'Create - meal plan for \"Bryan \"', '49.150.104.206', 'Windows', '2024-06-02 22:52:53'),
(644, 'vanessa', 'Create - meal plan for \"Maigan\"', '49.150.104.206', 'Windows', '2024-06-02 22:53:05'),
(645, 'vanessa', 'Create - meal plan for \"Conde\"', '49.150.104.206', 'Windows', '2024-06-02 22:53:22'),
(646, 'vanessa', 'Create - meal plan for \"Njay1\"', '49.150.104.206', 'Windows', '2024-06-02 22:53:33'),
(647, 'vanessa', 'Create - meal plan for \"James\"', '49.150.104.206', 'Windows', '2024-06-02 22:53:45'),
(648, 'vanessa', 'Logoff - success', '49.150.104.206', 'Windows', '2024-06-02 22:54:00'),
(649, 'kenneth', 'Logon - success', '49.150.104.206', 'Windows', '2024-06-02 22:54:14'),
(650, 'super_admin', 'Logoff - success', '49.150.104.206', 'Windows', '2024-06-02 22:54:31'),
(651, 'user_a', 'Logon - success', '0.0.0.0', 'Android', '2024-06-03 00:31:36'),
(652, 'user_a', 'Logoff - success', '0.0.0.0', 'Android', '2024-06-03 00:31:51'),
(653, 'super_admin', 'Logon - success', '110.54.155.155', 'Linux', '2024-06-03 00:40:33'),
(654, 'super_admin', 'Logoff - success', '110.54.155.155', 'Linux', '2024-06-03 00:42:04'),
(655, 'Raul1', 'Logon - success', '180.191.40.240', 'Windows', '2024-06-03 02:54:10'),
(656, 'Raul1', 'Add - Prothin Whey Prothin Ripped Vanilla in cart', '180.191.40.240', 'Windows', '2024-06-03 02:54:33'),
(657, 'Raul1', 'Confirm - checkout', '180.191.40.240', 'Windows', '2024-06-03 02:55:40'),
(658, 'super_admin', 'Update - password of user \"marco\"', '180.191.40.240', 'Windows', '2024-06-03 02:56:23'),
(659, 'super_admin', 'Logoff - success', '180.191.40.240', 'Windows', '2024-06-03 02:56:47'),
(660, 'marco', 'Logon - success', '180.191.40.240', 'Windows', '2024-06-03 02:56:53'),
(661, 'marco', 'Logoff - success', '180.191.40.240', 'Windows', '2024-06-03 02:57:55'),
(662, 'marco', 'Logon - success', '110.54.155.155', 'Linux', '2024-06-03 02:58:13'),
(663, 'marco', 'Update - transaction as \"Completed\"', '110.54.155.155', 'Linux', '2024-06-03 02:59:27'),
(664, 'marco', 'Logoff - success', '110.54.155.155', 'Linux', '2024-06-03 03:00:10'),
(665, 'user_a', 'Logon - success', '0.0.0.0', 'Android', '2024-06-03 03:24:44'),
(666, 'user_a', 'Add - Prothin Whey Prothin Ripped Chocolatein cart', '0.0.0.0', 'Android', '2024-06-03 03:27:27'),
(667, 'user_a', 'Logoff - success', '0.0.0.0', 'Android', '2024-06-03 03:28:12'),
(668, 'super_admin', 'Logoff - success', '136.158.118.189', 'Linux', '2024-06-03 05:09:58'),
(669, 'user_a', 'Logon - success', '136.158.118.189', 'Linux', '2024-06-03 05:10:09'),
(670, 'super_admin', 'Logon - success', '49.150.109.58', 'Linux', '2024-06-03 05:12:15'),
(671, 'super_admin', 'Create - announcement', '49.150.109.58', 'Linux', '2024-06-03 05:12:55'),
(672, 'super_admin', 'Logon - success', '136.158.118.189', 'Linux', '2024-06-03 05:13:12'),
(673, 'super_admin', 'Logoff - success', '49.150.109.58', 'Linux', '2024-06-03 05:13:16'),
(674, 'user_a', 'Logon - success', '192.168.1.7', 'Android', '2024-06-03 05:13:36'),
(675, 'user_a', 'Logoff - success', '192.168.1.7', 'Android', '2024-06-03 05:13:58'),
(676, 'user_a', 'Logoff - success', '136.158.118.189', 'Linux', '2024-06-03 05:15:29'),
(677, 'sofia', 'Logon - success', '136.158.118.189', 'Linux', '2024-06-03 05:15:39'),
(678, 'sofia', 'Logoff - success', '136.158.118.189', 'Linux', '2024-06-03 05:15:50'),
(679, 'Raul1', 'Logon - success', '136.158.118.189', 'Linux', '2024-06-03 05:16:25'),
(680, 'Raul1', 'Logoff - success', '136.158.118.189', 'Linux', '2024-06-03 05:21:30'),
(681, 'super_admin', 'Logon - success', '110.54.213.241', 'Linux', '2024-06-03 08:18:40'),
(682, 'super_admin', 'Logoff - success', '110.54.213.241', 'Linux', '2024-06-03 08:19:51');

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
(72, 'user_a', '2002-01-02', 22, 72, 166, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Premium', '1500.00', '2024-06-02', '2024-07-02', '2024-06-02 10:02:05', 'super_admin'),
(73, 'userB', '1999-05-04', 25, 74, 168, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-06-02', '2024-07-02', '2024-06-02 10:03:44', 'super_admin'),
(76, 'jasper', '1996-01-02', 28, 73, 165, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'admin', '0.00', '2024-01-01', '2025-01-01', '2024-06-02 15:50:00', 'super_admin'),
(77, 'rowien', '1994-03-11', 30, 80, 189, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '0.00', '2024-01-01', '2025-01-01', '2024-06-02 15:51:37', 'super_admin'),
(78, 'marco', '2000-05-18', 24, 76, 184, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'admin', '0.00', '2024-01-01', '2025-01-01', '2024-06-02 15:52:57', 'super_admin'),
(79, 'jansen', '1993-06-11', 31, 82, 187, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'admin', '0.00', '2023-10-12', '2024-10-12', '2024-06-02 15:58:01', 'super_admin'),
(80, 'vanessa', '1999-01-15', 25, 54, 145, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'admin', '0.00', '2023-09-06', '2024-09-06', '2024-06-02 16:00:48', 'super_admin'),
(81, 'sofia', '2003-05-08', 21, 60, 159, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-06-03', '2024-07-03', '2024-06-02 16:03:39', 'jasper'),
(82, 'mazi1', '1997-01-17', 0, 60, 161, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-06-02', '2024-07-02', '2024-06-02 16:09:03', 'jasper'),
(83, 'kenneth', '2001-01-01', 23, 72, 166, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-06-03', '2024-07-03', '2024-06-02 16:10:06', 'jasper'),
(84, 'bimbers', '1998-06-24', 26, 69, 160, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-06-02', '2024-07-02', '2024-06-02 16:11:44', 'jasper'),
(85, 'kathleen', '2002-12-19', 21, 62, 157, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Premium', '1500.00', '2024-06-03', '2024-07-03', '2024-06-02 16:19:13', 'jasper'),
(86, 'Sofiyuh', '2002-05-10', 22, 50, 130, 'Female', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Premium', '1500.00', '2024-06-03', '2024-07-03', '2024-06-02 16:22:42', 'rowien'),
(87, 'Donalene', '1998-01-22', 26, 51, 154, 'Female', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-06-03', '2024-07-03', '2024-06-02 16:23:38', 'rowien'),
(88, 'Arianne', '2000-08-18', 24, 56, 165, 'Female', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-06-03', '2024-07-03', '2024-06-02 16:24:32', 'rowien'),
(89, 'Raven', '1996-08-08', 28, 68, 164, 'Female', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-06-03', '2024-07-03', '2024-06-02 16:25:20', 'rowien'),
(90, 'Maria', '1999-06-17', 25, 63, 162, 'Female', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-06-03', '2024-07-03', '2024-06-02 16:26:30', 'rowien'),
(91, 'Phillip', '2006-05-11', 18, 60, 145, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-06-03', '2024-07-03', '2024-06-02 16:37:30', 'marco'),
(92, 'Raul1', '2000-06-09', 24, 70, 189, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Premium', '1500.00', '2024-06-03', '2024-07-03', '2024-06-02 16:38:34', 'marco'),
(93, 'danilo', '2001-11-09', 23, 52, 158, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-06-03', '2024-07-03', '2024-06-02 16:40:27', 'marco'),
(94, 'Christian', '2001-07-13', 23, 70, 168, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Premium', '1500.00', '2024-06-03', '2024-07-03', '2024-06-02 16:41:21', 'marco'),
(95, 'Kiezel', '1997-10-09', 27, 52, 137, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-06-03', '2024-07-03', '2024-06-02 16:42:24', 'marco'),
(96, 'Cedric', '2002-11-14', 22, 59, 165, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-06-03', '2024-07-03', '2024-06-02 16:44:41', 'jansen'),
(97, 'Jerome ', '2003-10-02', 21, 75, 172, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-06-03', '2024-07-03', '2024-06-02 16:45:28', 'jansen'),
(98, 'Clarence', '2004-07-08', 20, 45, 143, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Premium', '1500.00', '2024-06-03', '2024-07-03', '2024-06-02 16:46:37', 'jansen'),
(99, 'Diego', '2005-04-13', 19, 60, 165, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-06-03', '2024-07-03', '2024-06-02 16:47:28', 'jansen'),
(100, 'Michael', '2001-04-11', 23, 45, 157, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-06-03', '2024-07-03', '2024-06-02 16:48:22', 'jansen'),
(101, 'Bryan ', '2002-04-25', 22, 62, 168, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-06-03', '2024-07-03', '2024-06-02 16:50:14', 'vanessa'),
(102, 'Maigan', '1998-06-11', 26, 48, 163, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Premium', '1500.00', '2024-06-03', '2024-07-03', '2024-06-02 16:51:05', 'vanessa'),
(103, 'Conde', '2002-05-08', 22, 45, 134, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-06-03', '2024-07-03', '2024-06-02 16:52:12', 'vanessa'),
(104, 'Njay1', '1998-05-13', 26, 64, 186, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-06-03', '2024-07-03', '2024-06-02 16:53:10', 'vanessa'),
(105, 'James', '2003-10-16', 21, 54, 178, 'Male', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'Monthly', '500.00', '2024-06-03', '2024-07-03', '2024-06-02 16:54:01', 'vanessa');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `meal_plan`
--
ALTER TABLE `meal_plan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `membership`
--
ALTER TABLE `membership`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ready_meals`
--
ALTER TABLE `ready_meals`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `user_logs`
--
ALTER TABLE `user_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=683;

--
-- AUTO_INCREMENT for table `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
