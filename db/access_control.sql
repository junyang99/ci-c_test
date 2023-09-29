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
CREATE DATABASE IF NOT EXISTS `Access_Control` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `Access_Control`;

-- --------------------------------------------------------

--
-- Table structure for table `Access_Control`
--

DROP TABLE IF EXISTS `Access_Control`;
CREATE TABLE IF NOT EXISTS `Access_Control` (
  `Access_ID` Integer(20) NOT NULL,
  `Access_Rights` Varchar(50) NOT NULL,
  PRIMARY KEY (`Access_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `Access_Control` (`Access_ID`,`Access_Rights` ) VALUES
    ('1234', 'Human Resource');

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
