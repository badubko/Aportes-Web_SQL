-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 27, 2018 at 12:13 PM
-- Server version: 5.7.24
-- PHP Version: 7.0.32-0ubuntu0.16.04.1

-- SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "-03:00";


-- /*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
-- /*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
-- /*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
-- /*!40101 SET NAMES utf8mb4 */;

--
-- Viene de Database: `aportes_V3_2`


--
-- Dumping data for table `t_users1`
--

use aportes_V3_5;

INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES
('1000001', 'Cocacola', 'Beba', 'Chantologa', 'coca@hotmail.com', 'N/D', '2018-12-17 01:39:53'),
('1000002', 'Porongova', 'Ana', 'Chanta', 'aptk@gmail.com', 'N/D', '2018-12-17 00:57:51'),
('1000003', 'Nocamina', 'Yamimoto', 'Ingeniero', 'ymnc@gmail.com', 'N/D', '2018-12-16 03:32:25');

-- (1000004, 'Constructor', 'Bob', 'Ingeniero', 'jcon@gmail.com', 'N/D', '2018-12-24 03:05:46'),
-- (1000005, 'Sacallama', 'Tuculito', 'Abogado', 'tk@gmail.com', 'N/D', '2018-12-17 00:56:49'),
-- (1000006, 'Pepsicola', 'Beba', 'Chantologa', 'coca@hotmail.com', 'N/D', '2018-12-19 14:32:13'),
-- (1000007, 'Porongetti', 'Alberto', 'Ingeniero', 'apor@laporonga.com', 'porongetti@gmai.com', '2018-12-19 14:41:49'),
-- (1000008, 'Quito', 'Esteban', 'Chantologo', 'eq@gmail.com', 'N/D', '2018-12-17 19:29:53'),
-- (1000009, 'Lame', 'Elsa', 'Lic RRHH', 'es@gmail.com', 'N/D', '2018-12-17 01:24:36'),
-- (1000010, 'Gonzalez', 'Tambucho', 'Chanta', 'tamb@gmail.com', 'N/D', '2018-12-24 03:05:02'),
-- (1000011, 'Lacaliente', 'Juana', 'Contadora', 'jcal@gmail.com.ar', 'jcal@hot.com', '2018-12-17 01:25:11'),
-- (1000012, 'Cachuchova', 'Maria', 'Antropologa', 'maria@lacachucha.com', 'N/D', '2018-12-24 03:04:13'),
-- (1000013, 'Du Bois', 'Juan Carlos Nepomuceno ', 'Chantologo', 'adb@gmail.com', 'N/D', '2018-12-17 01:39:05');

INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES 
('1000020', 'Cachuchova', 'Julia', 'Ingeniera', 'jc@gmail.com', 'N/D', CURRENT_TIMESTAMP);
--


-- /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
-- /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
-- /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
