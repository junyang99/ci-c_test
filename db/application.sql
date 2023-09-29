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
-- Database: `Role_Skill`
--
CREATE DATABASE IF NOT EXISTS `Application` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `Application`;

-- --------------------------------------------------------

--
-- Table structure for table `Application`
--

DROP TABLE IF EXISTS `Application`;
CREATE TABLE IF NOT EXISTS `Application` (
  `Application_ID` Varchar(20) NOT NULL,
  `Role_Name` Varchar(20) NOT NULL,
  `Staff_ID` Integer(10) NOT NULL,
  `Application_Date` Date NOT NULL,
  `Cover_Letter` Varchar(1000) NOT NULL,
  `Application_Status` Varchar(50) NOT NULL,
  PRIMARY KEY (`Application_ID`),
  Foreign Key (`Role_Name`) REFERENCES Role(`Role_Name`),
  Foreign Key (`Staff_ID`) REFERENCES Staff(`Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `Application` (`Application_ID`, `Role_Name`, `Staff_ID`, `Application_Date`, `Cover_Letter`,`Application_Status` ) VALUES
	('1010', 'Human_Resource_Manager','1', "2023-08-10", "Hi Sir its a priviledge to be applying for this position. Yours Sincerely, Tang", "pending" );

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
