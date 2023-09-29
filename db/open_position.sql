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
-- Database: `Open_Position`
--
CREATE DATABASE IF NOT EXISTS `Open_Position` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `Open_Position`;

-- --------------------------------------------------------

--
-- Table structure for table `Role_Skill`
--

DROP TABLE IF EXISTS `Open_Position`;
CREATE TABLE IF NOT EXISTS `Open_Position` (
  `Position_ID` Integer(5) NOT NULL,
  `Role_Name` Varchar(20) NOT NULL,
  `Deadline` Date NOT NULL,
  PRIMARY KEY (`Position_ID`),
  Foreign KEY (`Role_Name`) references Role_Skill(`Role_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- double check if deadline should be a foreign key with application

INSERT INTO `Open_Position` (`Position_ID`, `Role_Name`, `Deadline` ) VALUES
	('5321', 'Human_Resource_Manager','2023-11-01');

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
