-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2020 at 04:00 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`user_id`, `username`, `password`, `role`) VALUES
(1, 'admin', 'admin', 'administrator');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `image` varchar(200) NOT NULL,
  `option_a` text NOT NULL,
  `option_b` text NOT NULL,
  `option_c` text NOT NULL,
  `option_d` text NOT NULL,
  `answer` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`question_id`, `test_id`, `question`, `image`, `option_a`, `option_b`, `option_c`, `option_d`, `answer`) VALUES
(1, 1, 'que 1', 'questions/adobe-after-effects-master-creates-downloadable-version-of-windows-10-wallpaper-485537-2.jpg', 'as', 'qwerty', 'wqer', 'fcgvhbj', 'a'),
(2, 1, 'que 2', '', 'ghbjk', 'hbjnkm', 'jk', 'bjhnk', 'b'),
(3, 1, 'que 3', '', 'yguyhuj', 'ghbjnk', 'uyio', 'vbjn', 'c'),
(4, 1, 'que 4', '', 'tfryuhi', 'ty7u89', 'rftgyuh', 'rftygui', 'd'),
(5, 1, 'que 5', '', 'iou', '8uiuyt', '98', '9iy', 'a'),
(6, 1, 'que 6', '', 'trghjn', 'cfvgbhunji', 'ybguyhnijm', 'xdcfvgbhn', 'b'),
(7, 1, 'que 7', '', 'rdctfvyu', 'dctfvygbuh', 'ertyu', 'vbnnm', 'c'),
(8, 1, 'que 8', '', 'cvbnm', 'dfghjk', 'ertyui', 'dfghjk', 'd'),
(9, 1, 'What is this?', 'questions/555442.jpg', 'aaa', 'bbb', 'ccc', 'ddd', 'a'),
(10, 2, 'Select best suitable option', 'questions/', 'optiona', 'optionb', 'otionc', 'optiond', 'b');

-- --------------------------------------------------------

--
-- Table structure for table `questions_desc`
--

CREATE TABLE `questions_desc` (
  `question_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `question` varchar(400) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions_desc`
--

INSERT INTO `questions_desc` (`question_id`, `test_id`, `question`, `image`) VALUES
(20000, 1, 'What is JAVA?', 'questions/'),
(20001, 1, 'what th hell', 'questions_desc/818018-geek-wallpapers.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `subject` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subject`) VALUES
(1, 'CPP'),
(2, 'JAVA'),
(3, 'PHP');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `test_id` int(11) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `test_name` varchar(50) NOT NULL,
  `sdatetime` datetime NOT NULL,
  `edatetime` datetime NOT NULL,
  `test_duration` int(11) NOT NULL,
  `attempts` int(11) NOT NULL,
  `yes_no` varchar(3) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`test_id`, `subject`, `test_name`, `sdatetime`, `edatetime`, `test_duration`, `attempts`, `yes_no`, `created`) VALUES
(1, 'JAVA', 'Data Types and Variables', '2017-09-13 06:00:00', '2017-09-20 00:00:00', 20, 1, 'Yes', '2017-09-13 13:37:45'),
(2, 'CPP', 'CPP BASICS', '2017-09-13 06:00:00', '2017-09-17 00:00:00', 10, 1, 'Yes', '2017-09-13 15:58:07');

-- --------------------------------------------------------

--
-- Table structure for table `test_result`
--

CREATE TABLE `test_result` (
  `result_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `right_ans` int(11) NOT NULL,
  `wrong_ans` int(11) NOT NULL,
  `no_attempt` int(11) NOT NULL,
  `score` float NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `test_result_desc`
--

CREATE TABLE `test_result_desc` (
  `result_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `answer` text NOT NULL,
  `marks` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`) VALUES
(3, 'Abhiram', 'abhiram@gmail.com', 'ef55db7ea95b8281c276ca6084cd3ddc');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `questions_desc`
--
ALTER TABLE `questions_desc`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`test_id`);

--
-- Indexes for table `test_result`
--
ALTER TABLE `test_result`
  ADD PRIMARY KEY (`result_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `questions_desc`
--
ALTER TABLE `questions_desc`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20002;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `test_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `test_result`
--
ALTER TABLE `test_result`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
