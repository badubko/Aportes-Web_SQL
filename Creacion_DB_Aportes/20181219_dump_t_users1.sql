-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 19, 2018 at 12:29 PM
-- Server version: 5.7.24
-- PHP Version: 7.0.32-0ubuntu0.16.04.1

quit

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aportes_V3_2`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_users1`
--

CREATE TABLE `t_users1` (
  `dni` int(10) UNSIGNED NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `profesion` varchar(25) NOT NULL DEFAULT 'N/D',
  `email_1` varchar(50) NOT NULL DEFAULT 'N/D',
  `email_2` varchar(50) NOT NULL DEFAULT 'N/D',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_users1`
--

INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES
(120130, 'Cocacola', 'Beba', 'Chantologa', 'coca@hotmail.com', '', '2018-12-17 01:39:53'),
(9128500, 'Porongova', 'Ana', 'Chanta', 'aptk@gmail.com', '', '2018-12-17 00:57:51'),
(10101000, 'Nocamina', 'Yamimoto', 'Ingeniero', 'ymnc@gmail.com', '', '2018-12-16 03:32:25'),
(10232343, 'Constructor', 'Juancito', 'Ingeniero', 'jcon@gmail.com', '', '2018-12-17 01:19:21'),
(11141112, 'Sacallama', 'Tuculito', 'Abogado', 'tk@gmail.com', '', '2018-12-17 00:56:49'),
(12344007, 'Porongetti', 'Alberto', 'Chantologo', 'apor@laporonga.com', '', '2018-12-19 14:06:22'),
(32124356, 'Quito', 'Esteban', 'Chantologo', 'eq@gmail.com', '', '2018-12-17 19:29:53'),
(32333556, 'Lame', 'Elsa', 'Lic RRHH', 'es@gmail.com', '', '2018-12-17 01:24:36'),
(34234765, 'Gonzalez', 'Tambucho', 'Chanta', '', '', '2018-12-19 14:22:40'),
(69696907, 'Lacaliente', 'Juana', 'Contadora', 'jcal@gmail.com.ar', 'jcal@hot.com', '2018-12-17 01:25:11'),
(69696969, 'Cachuchova', 'Maria', 'Chantologa', 'maria@lacachucha.com', '', '2018-12-17 19:47:33'),
(91285555, 'Du Bois', 'Juan Carlos Nepomuceno ', 'Chantologo', 'adb@gmail.com', '', '2018-12-17 01:39:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_users1`
--
ALTER TABLE `t_users1`
  ADD PRIMARY KEY (`dni`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
