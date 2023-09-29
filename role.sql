-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 23, 2023 at 01:35 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `role`
--
CREATE DATABASE IF NOT EXISTS `role` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `role`;
-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `role_name_char` varchar(20),
  `role_desc` text not null,
  `role_dept` varchar(20) not null,
  PRIMARY KEY (`role_name_char`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_name_char`, `role_desc`, `role_dept`) VALUES
('Software Engineer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin eget lorem eu justo consectetur sodales quis sit amet nisl. Morbi sem est, ultrices ut orci in, porta eleifend magna. Vivamus non vehicula eros. Suspendisse scelerisque erat et nisi dignissim tempus. Vivamus diam lectus, mollis nec ullamcorper nec, varius in purus. Curabitur erat dolor, aliquam quis diam ac, euismod pharetra lectus. Morbi lobortis tellus quis faucibus convallis. Aenean volutpat id metus a pulvinar. Mauris id tincidunt arcu. Fusce venenatis dictum ante, vitae mattis tellus molestie vel. Phasellus in lobortis urna. In imperdiet, purus sed egestas posuere, lacus nulla pulvinar dui, et cursus lacus tellus sit amet justo. In purus elit, aliquam ac elementum in, porta non ex. Nam non massa convallis, ultrices libero quis, iaculis eros. Fusce vitae leo augue. Sed blandit diam ac ullamcorper vulputate.', 'Technology'),
('Data Analyst', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin eget lorem eu justo consectetur sodales quis sit amet nisl. Morbi sem est, ultrices ut orci in, porta eleifend magna. Vivamus non vehicula eros. Suspendisse scelerisque erat et nisi dignissim tempus. Vivamus diam lectus, mollis nec ullamcorper nec, varius in purus. Curabitur erat dolor, aliquam quis diam ac, euismod pharetra lectus. Morbi lobortis tellus quis faucibus convallis. Aenean volutpat id metus a pulvinar. Mauris id tincidunt arcu. Fusce venenatis dictum ante, vitae mattis tellus molestie vel. Phasellus in lobortis urna. In imperdiet, purus sed egestas posuere, lacus nulla pulvinar dui, et cursus lacus tellus sit amet justo. In purus elit, aliquam ac elementum in, porta non ex. Nam non massa convallis, ultrices libero quis, iaculis eros. Fusce vitae leo augue. Sed blandit diam ac ullamcorper vulputate.', 'Technology'),
('Product Manager', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin eget lorem eu justo consectetur sodales quis sit amet nisl. Morbi sem est, ultrices ut orci in, porta eleifend magna. Vivamus non vehicula eros. Suspendisse scelerisque erat et nisi dignissim tempus.', 'Business Development');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

select * from role;