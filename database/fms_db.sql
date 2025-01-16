-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2025 at 12:03 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` int(11) NOT NULL,
  `activity_title` varchar(255) NOT NULL,
  `activity_date` date NOT NULL,
  `activity_time` time NOT NULL,
  `venue` varchar(255) DEFAULT NULL,
  `directorate` varchar(255) DEFAULT NULL,
  `number_of_attendees` int(11) DEFAULT NULL,
  `approved_by` varchar(255) DEFAULT NULL,
  `remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `activity_title`, `activity_date`, `activity_time`, `venue`, `directorate`, `number_of_attendees`, `approved_by`, `remarks`) VALUES
(0, 'Trial', '2025-01-06', '16:33:00', 'UHAS', 'Directorate of ICT', NULL, NULL, 'fjgj'),
(0, 'Trial', '2025-01-06', '16:33:00', 'UHAS', 'Directorate of ICT', NULL, NULL, 'fjgj');

-- --------------------------------------------------------

--
-- Table structure for table `calendar`
--

CREATE TABLE `calendar` (
  `id_calendar` int(11) NOT NULL,
  `calendar_name` varchar(400) NOT NULL,
  `date_to` date NOT NULL,
  `date_from` date NOT NULL,
  `venue` text NOT NULL,
  `supervisory` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(30) NOT NULL,
  `folder_id` int(30) NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `file_path` text NOT NULL,
  `is_public` tinyint(1) DEFAULT 0,
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `name`, `description`, `user_id`, `folder_id`, `file_type`, `file_path`, `is_public`, `date_updated`) VALUES
(2, 'fms_db', '', 1, 13, 'sql', '1736163420_fms_db.sql', 0, '2025-01-06 11:37:48'),
(3, 'fms_db', 'SAMPLE FILE UPLOAD', 1, 0, 'sql', '1736168400_fms_db.sql', 0, '2025-01-06 13:00:32'),
(4, '11111020078_basic_all_students', 'TRIAL ', 1, 13, 'xlsm', '1736168580_11111020078_basic_all_students.xlsm', 1, '2025-01-06 13:03:57'),
(5, 'uhas_logo', '', 5, 15, 'png', '1736168700_uhas_logo.png', 0, '2025-01-06 13:05:17'),
(6, 'proj', 'TRIAL UPLOAD', 5, 15, 'jpg', '1736168760_proj.jpg', 1, '2025-01-06 13:06:16'),
(7, 'uhas_logo', 'TRIAL', 1, 14, 'png', '1736177820_uhas_logo.png', 1, '2025-01-06 15:37:39'),
(8, 'New Microsoft PowerPoint Presentation', '', 1, 18, 'pptx', '1736178900_New Microsoft PowerPoint Presentation.pptx', 1, '2025-01-06 15:55:18');

-- --------------------------------------------------------

--
-- Table structure for table `folders`
--

CREATE TABLE `folders` (
  `id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `parent_id` int(30) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `folders`
--

INSERT INTO `folders` (`id`, `user_id`, `name`, `parent_id`) VALUES
(10, 3, 'My Folder', 0),
(11, 1, 'MEMOS OUT', 0),
(13, 1, 'GENERAL DOCX', 0),
(14, 1, 'MEMOS IN', 0),
(15, 5, 'Gabby Kwabena', 0),
(16, 1, 'ALLNIGHT', 0),
(17, 1, 'STAFF FOLDERS', 0),
(18, 1, 'GABBY', 17);

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `image_video_title` varchar(255) NOT NULL,
  `file` blob DEFAULT NULL,
  `description` text DEFAULT NULL,
  `upload_date` datetime DEFAULT current_timestamp(),
  `uploaded_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `letters_in`
--

CREATE TABLE `letters_in` (
  `id` int(11) NOT NULL,
  `letter_title` varchar(255) NOT NULL,
  `from` varchar(255) NOT NULL,
  `received_by` varchar(255) NOT NULL,
  `date_received` date NOT NULL,
  `letter_file` blob DEFAULT NULL,
  `uploaded_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `letters_out`
--

CREATE TABLE `letters_out` (
  `id` int(11) NOT NULL,
  `letter_title` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `dispatched_by` varchar(255) NOT NULL,
  `date_dispatched` date NOT NULL,
  `letter_file` blob DEFAULT NULL,
  `uploaded_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `memo_in`
--

CREATE TABLE `memo_in` (
  `id` int(11) NOT NULL,
  `memo_title` varchar(255) NOT NULL,
  `from` varchar(255) NOT NULL,
  `received_by` varchar(255) NOT NULL,
  `memo_file` blob DEFAULT NULL,
  `date_on_memo` date NOT NULL,
  `upload_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `memo_out`
--

CREATE TABLE `memo_out` (
  `id` int(11) NOT NULL,
  `memo_title` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `dispatched_by` varchar(255) NOT NULL,
  `memo_file` blob DEFAULT NULL,
  `date_on_memo` date NOT NULL,
  `upload_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `minutes`
--

CREATE TABLE `minutes` (
  `id` int(11) NOT NULL,
  `meeting_title` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `attendees` text DEFAULT NULL,
  `minutes_file` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `staff_id` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `qualifications` text DEFAULT NULL,
  `highest_qualification` varchar(255) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `present_appointment` varchar(255) DEFAULT NULL,
  `staff_category` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `campus` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `staff_id`, `title`, `full_name`, `qualifications`, `highest_qualification`, `gender`, `email`, `dob`, `present_appointment`, `staff_category`, `department`, `campus`, `phone`) VALUES
(1, 'UHAS-01233', 'MR.', 'GABBY KWABENA JNR', 'PROFESSIONAL CERT', 'DEGREE', 'MALE', 'GABBY@UHAS.EDU.GH', '2005-01-06', 'ICT ASSISTANT', 'SENIOR PROFESSIONAL STAFF', 'ADMIN COMPUTING', 'MAIN CAMPUS PHASE 2', '0241129660');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1+admin , 2 = users'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'Administrator', 'admin', 'admin', 1),
(3, 'ICT', 'user', '3', 2),
(4, 'Gabby', 'gabby', 'gabby', 2),
(5, 'Allnight', 'Allnight', 'Allnight', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `folders`
--
ALTER TABLE `folders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `letters_in`
--
ALTER TABLE `letters_in`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `letters_out`
--
ALTER TABLE `letters_out`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `memo_in`
--
ALTER TABLE `memo_in`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `memo_out`
--
ALTER TABLE `memo_out`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `minutes`
--
ALTER TABLE `minutes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `staff_id` (`staff_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `folders`
--
ALTER TABLE `folders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `letters_in`
--
ALTER TABLE `letters_in`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `letters_out`
--
ALTER TABLE `letters_out`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `memo_in`
--
ALTER TABLE `memo_in`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `memo_out`
--
ALTER TABLE `memo_out`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `minutes`
--
ALTER TABLE `minutes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
