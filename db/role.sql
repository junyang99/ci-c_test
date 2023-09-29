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
-- Database: `Role`
--
CREATE DATABASE IF NOT EXISTS `Role` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `Role`;

-- --------------------------------------------------------

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
CREATE TABLE IF NOT EXISTS `Role` (
  `Role_Name` Varchar(20) NOT NULL,
  `Role_Desc` Varchar(100) NOT NULL,
  `Dept` Varchar(50) NOT NULL,
  PRIMARY KEY (`Role_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `Role` (`Role_Name`,`Role_Desc`, `Dept`) VALUES
	('Human_Resource_Manager', "Manage Human Resource team", "Human Resource");

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
