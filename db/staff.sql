-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 12, 2020 at 02:17 AM
-- Server version: 5.7.19
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `staff`
--
CREATE DATABASE IF NOT EXISTS `Staff` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `Staff`;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `Staff`;
CREATE TABLE IF NOT EXISTS `Staff` (
  `Staff_ID` Integer(10) NOT NULL,
  `Staff_FName` Varchar(50) NOT NULL,
  `Staff_LName` Varchar(50) NOT NULL,
  `Dept` Varchar(50) NOT NULL,
  `Country` Varchar(50) NOT NULL,
  `Email` Varchar(50) NOT NULL,
  `Access_ID` Integer(10) NOT NULL,
  PRIMARY KEY (`Staff_ID`),
  Foreign Key (`Access_ID`) REFERENCES Access_Control(`Access_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `Staff` (`Staff_ID`, `Staff_FName`, `Staff_LName`, `Dept`, `Country`, `Email`, `Access_ID`) VALUES
	('1', 'jie', 'yin', 'Human Resource', 'Singapore', 'kooing@gmail.com',  '1234');

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
