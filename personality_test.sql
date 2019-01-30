-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2019 at 01:50 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `personality_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `updated_at`) VALUES
(1, 'hard_fact', '2019-01-20 03:30:43'),
(2, 'lifestyle', '2019-01-20 03:30:43'),
(3, 'introversion', '2019-01-20 03:31:12'),
(4, 'passion', '2019-01-20 03:31:12');

-- --------------------------------------------------------

--
-- Table structure for table `conditional_questions`
--

CREATE TABLE `conditional_questions` (
  `condition_id` int(10) NOT NULL,
  `question_id` int(10) DEFAULT NULL,
  `condition_text` varchar(100) DEFAULT NULL,
  `conditional_question` varchar(250) DEFAULT NULL,
  `options` text,
  `category_name` varchar(100) DEFAULT NULL,
  `question_type` enum('single_choice','single_choice_conditional','number_range') NOT NULL DEFAULT 'single_choice',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `conditional_questions`
--

INSERT INTO `conditional_questions` (`condition_id`, `question_id`, `condition_text`, `conditional_question`, `options`, `category_name`, `question_type`, `created_at`) VALUES
(1, 3, 'very important', 'What age should your potential partner be?', '18|140', 'hard_fact', 'number_range', '2019-01-20 11:19:50');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL,
  `question` text,
  `question_type` enum('single_choice','single_choice_conditional','number_range') NOT NULL DEFAULT 'single_choice',
  `is_condition` enum('yes','no') NOT NULL DEFAULT 'no',
  `condition_text` varchar(100) DEFAULT NULL,
  `condition_id` int(10) DEFAULT NULL,
  `options` text,
  `category_id` int(10) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`question_id`, `question`, `question_type`, `is_condition`, `condition_text`, `condition_id`, `options`, `category_id`, `created_at`) VALUES
(1, 'What is your gender?', 'single_choice', 'no', NULL, NULL, 'male|female|other', 1, '2019-01-20 10:35:24'),
(2, 'How important is the gender of your partner?', 'single_choice', 'no', NULL, NULL, 'not important|important|very important', 1, '2019-01-20 10:40:48'),
(3, 'How important is the age of your partner to you?', 'single_choice_conditional', 'yes', 'very important', 1, 'not important|important|very important', 1, '2019-01-20 10:40:48'),
(4, 'Do any children under the age of 18 live with you?', 'single_choice', 'no', NULL, NULL, 'yes|sometimes|no', 1, '2019-01-20 10:43:08'),
(5, 'How should your potential partner respond to this question?', 'single_choice', 'no', NULL, NULL, 'yes|sometimes|no', 2, '2019-01-20 10:43:08'),
(6, 'Could you imagine having children with your potential partner?', 'single_choice', 'no', NULL, NULL, 'yes|maybe|no', 2, '2019-01-20 10:44:58'),
(7, 'How should your potential partner respond to this question?', 'single_choice', 'no', NULL, NULL, 'yes|maybe|no', 2, '2019-01-20 10:44:58'),
(8, 'What is your marital status?', 'single_choice', 'no', NULL, NULL, 'never married|separated|divorced|widowed', 1, '2019-01-20 10:48:54'),
(9, 'How often do your drink alcohol?', 'single_choice', 'no', NULL, NULL, 'never|once or twice a year|once or twice a month,once or twice a week|I\'m drinking my 3rd mojito now, and it\'s only 11am', 2, '2019-01-20 10:48:54'),
(10, 'How often do you smoke?', 'single_choice', 'no', NULL, NULL, 'never|once or twice a year|socially|frequently', 2, '2019-01-20 11:12:29'),
(11, 'What is your attitude towards drugs?', 'single_choice', 'no', NULL, NULL, 'I\'m completely opposed|Ive been know to dabble|drugs enrich my life', 2, '2019-01-20 11:12:29'),
(12, 'You are looking for...', 'single_choice', 'no', NULL, NULL, 'friendship|a hot date|an affair|a short-term relationship|a long-term relationship', 2, '2019-01-20 11:12:29'),
(13, 'Would you like to get married?', 'single_choice', 'no', NULL, NULL, 'yes|probably|eventually|no', 2, '2019-01-20 11:12:29'),
(14, 'What is your ideal living arrangement?', 'single_choice', 'no', NULL, NULL, 'cohabitation|separate flat / room in the same building|separate flats in the same area|weekend-relationship|long distance relationship', 2, '2019-01-20 11:12:29'),
(15, 'Do you enjoy spending time alone?', 'single_choice', 'no', NULL, NULL, 'most of the time|often|sometimes|rarely|not at all', 3, '2019-01-20 11:12:29'),
(16, 'When you\'re alone, do you get lonely quickly?', 'single_choice', 'no', NULL, NULL, 'most of the time|often|sometimes|rarely|not at all', 3, '2019-01-20 11:12:29'),
(17, 'Do you enjoy going on holiday by yourself?', 'single_choice', 'no', NULL, NULL, 'most of the time|often|sometimes|rarely|not at all', 3, '2019-01-20 11:12:29'),
(18, 'Should one keep little secrets from one\'s partner?', 'single_choice', 'no', NULL, NULL, 'most of the time|often|sometimes|rarely|not at all', 4, '2019-01-20 11:12:29'),
(19, 'How often do you think about sex?', 'single_choice', 'no', NULL, NULL, 'a few times a day|daily|a few times a week|a few times a month|rarely', 4, '2019-01-20 11:12:29'),
(20, 'If you were alone on a desert island, how long would you last before pleasuring yourself?', 'single_choice', 'no', NULL, NULL, 'less than a day|one day|one week|one month|I\'d never do something like that', 4, '2019-01-20 11:12:29'),
(21, 'How often would you like to have sex with your prospective partner?', 'single_choice', 'no', NULL, NULL, 'every day|a few times a week|once a week|every two weeks|infrequently|rarely', 4, '2019-01-20 11:14:50'),
(22, 'Do you like trying out new things in bed and experimenting?', 'single_choice', 'no', NULL, NULL, 'Yes, definitely!|Now and then - why not?|I\'d give it a try|I don\'t know|Absolutely not', 4, '2019-01-20 11:14:50'),
(23, 'I can enjoy sex without love?', 'single_choice', 'no', NULL, NULL, 'always|often|sometimes|rarely|never', 4, '2019-01-20 11:17:10'),
(24, 'For me, a stable relationship is a prerequisite for really good sex', 'single_choice', 'no', NULL, NULL, 'always|often|sometimes|rarely|never', 4, '2019-01-20 11:17:10');

-- --------------------------------------------------------

--
-- Table structure for table `test_result`
--

CREATE TABLE `test_result` (
  `test_id` int(10) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `question_id` int(10) DEFAULT NULL,
  `condition_id` int(10) DEFAULT NULL,
  `question` text,
  `answer` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `conditional_questions`
--
ALTER TABLE `conditional_questions`
  ADD PRIMARY KEY (`condition_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `test_result`
--
ALTER TABLE `test_result`
  ADD PRIMARY KEY (`test_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `conditional_questions`
--
ALTER TABLE `conditional_questions`
  MODIFY `condition_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `test_result`
--
ALTER TABLE `test_result`
  MODIFY `test_id` int(10) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
