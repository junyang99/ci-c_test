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
CREATE DATABASE IF NOT EXISTS `Role_Skill` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `Role_Skill`;

-- --------------------------------------------------------

--
-- Table structure for table `Role_Skill`
--

DROP TABLE IF EXISTS `Role_Skill`;
CREATE TABLE IF NOT EXISTS `Role_Skill` (
  `Role_Name` Varchar(20) NOT NULL,
  `Skill_Name` Varchar(50) NOT NULL,
  PRIMARY KEY (`Role_Name`, `Skill_Name`),
  Foreign Key (`Role_Name`) references Role(`Role_Name`),
  Foreign Key (`Skill_Name`) references Skill(`Skill_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `Role_Skill`(`Role_Name`, `Skill_Name` ) VALUES
	('Human_Resource_Manager', 'Human Resource'),
  ('Human_Resource_Manager', 'Leadership')
  ;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
