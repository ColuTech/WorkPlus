-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 02, 2023 at 02:15 AM
-- Server version: 5.7.41
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `montera1_WorkPlus`
--

-- --------------------------------------------------------

--
-- Table structure for table `BUSINESS`
--

CREATE TABLE `BUSINESS` (
  `Business_id` int(11) NOT NULL,
  `Business_name` varchar(255) NOT NULL,
  `Business_username` varchar(255) NOT NULL,
  `Business_email` varchar(319) NOT NULL,
  `Business_password` varchar(232) NOT NULL,
  `Business_image` mediumblob,
  `Business_biography` text,
  `Address_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `BUSINESS_ADDRESS`
--

CREATE TABLE `BUSINESS_ADDRESS` (
  `Address_id` int(11) NOT NULL,
  `Business_state` char(2) NOT NULL,
  `Business_city` varchar(255) NOT NULL,
  `Business_street` varchar(255) NOT NULL,
  `Business_zip` char(5) NOT NULL,
  `Phone_number` varchar(25) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `JOB`
--

CREATE TABLE `JOB` (
  `Job_id` int(11) NOT NULL,
  `Business_id` int(11) NOT NULL,
  `Job_category_id` int(11) NOT NULL,
  `Job_title` varchar(255) NOT NULL,
  `Job_type` varchar(100) NOT NULL,
  `Job_location` varchar(150) NOT NULL,
  `Job_salary` varchar(100) NOT NULL,
  `Job_description` text NOT NULL,
  `Job_skills` text NOT NULL,
  `Job_experience` text NOT NULL,
  `Job_posted_date` date NOT NULL,
  `Job_application_deadline` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `JOB_APPLICATION`
--

CREATE TABLE `JOB_APPLICATION` (
  `Job_application_id` int(11) NOT NULL,
  `Student_id` int(11) NOT NULL,
  `Job_id` int(11) NOT NULL,
  `Job_application_cv` text NOT NULL,
  `Job_application_date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `JOB_CATEGORIES`
--

CREATE TABLE `JOB_CATEGORIES` (
  `Job_category_id` int(255) NOT NULL,
  `Category` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `JOB_CATEGORIES`
--

INSERT INTO `JOB_CATEGORIES` (`Job_category_id`, `Category`) VALUES
(1, 'Administration, business and management'),
(2, 'Animals, land and environment'),
(3, 'Computing and ICT'),
(4, 'Construction and building'),
(5, 'Design, arts and crafts'),
(6, 'Education and training'),
(7, 'Engineering'),
(8, 'Facilities and property services'),
(9, 'Financial services'),
(10, 'Garage services'),
(11, 'Beauty'),
(12, 'Healthcare'),
(13, 'Heritage, culture and libraries'),
(14, 'Hospitality, catering and tourism'),
(15, 'Languages'),
(16, 'Legal and court services'),
(17, 'Manufacturing and production'),
(18, 'Performing arts and media'),
(19, 'Print and publishing, marketing and advertising'),
(20, 'Retail and customer services'),
(21, 'Science, mathematics and statistics'),
(22, 'Security, uniformed and protective services'),
(23, 'Social sciences and religion'),
(24, 'Social work and caring services'),
(25, 'Sport and leisure'),
(26, 'Transport, distribution and logistics'),
(27, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `STUDENT`
--

CREATE TABLE `STUDENT` (
  `Student_id` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Student_email` varchar(319) NOT NULL,
  `Student_password` varchar(232) NOT NULL,
  `First_name` varchar(255) NOT NULL,
  `Last_name` varchar(255) NOT NULL,
  `Middle_name` varchar(255) DEFAULT NULL,
  `Student_image` mediumblob,
  `Student_biography` text,
  `Student_address_id` int(11) DEFAULT NULL,
  `Student_skills` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `STUDENT_ADDRESS`
--

CREATE TABLE `STUDENT_ADDRESS` (
  `Student_address_id` int(11) NOT NULL,
  `Student_state` char(2) DEFAULT NULL,
  `Student_city` varchar(255) DEFAULT NULL,
  `Student_street` varchar(255) DEFAULT NULL,
  `Student_zip` char(5) DEFAULT NULL,
  `Phone_number` varchar(25) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `BUSINESS`
--
ALTER TABLE `BUSINESS`
  ADD PRIMARY KEY (`Business_id`),
  ADD KEY `Address_id` (`Address_id`);

--
-- Indexes for table `BUSINESS_ADDRESS`
--
ALTER TABLE `BUSINESS_ADDRESS`
  ADD PRIMARY KEY (`Address_id`);

--
-- Indexes for table `JOB`
--
ALTER TABLE `JOB`
  ADD PRIMARY KEY (`Job_id`),
  ADD KEY `Business_id` (`Business_id`),
  ADD KEY `Job_category_id` (`Job_category_id`);

--
-- Indexes for table `JOB_APPLICATION`
--
ALTER TABLE `JOB_APPLICATION`
  ADD PRIMARY KEY (`Job_application_id`),
  ADD KEY `Student_id` (`Student_id`),
  ADD KEY `Job_id` (`Job_id`);

--
-- Indexes for table `JOB_CATEGORIES`
--
ALTER TABLE `JOB_CATEGORIES`
  ADD PRIMARY KEY (`Job_category_id`);

--
-- Indexes for table `STUDENT`
--
ALTER TABLE `STUDENT`
  ADD PRIMARY KEY (`Student_id`),
  ADD KEY `Student_address_id` (`Student_address_id`);

--
-- Indexes for table `STUDENT_ADDRESS`
--
ALTER TABLE `STUDENT_ADDRESS`
  ADD PRIMARY KEY (`Student_address_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `BUSINESS`
--
ALTER TABLE `BUSINESS`
  MODIFY `Business_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `BUSINESS_ADDRESS`
--
ALTER TABLE `BUSINESS_ADDRESS`
  MODIFY `Address_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `JOB`
--
ALTER TABLE `JOB`
  MODIFY `Job_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `JOB_APPLICATION`
--
ALTER TABLE `JOB_APPLICATION`
  MODIFY `Job_application_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `JOB_CATEGORIES`
--
ALTER TABLE `JOB_CATEGORIES`
  MODIFY `Job_category_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `STUDENT`
--
ALTER TABLE `STUDENT`
  MODIFY `Student_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `STUDENT_ADDRESS`
--
ALTER TABLE `STUDENT_ADDRESS`
  MODIFY `Student_address_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
