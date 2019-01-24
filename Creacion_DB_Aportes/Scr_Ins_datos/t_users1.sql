-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 23, 2019 at 08:18 PM
-- Server version: 5.7.24
-- PHP Version: 7.0.32-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aportes_V3_7`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de datos PUBLICOS de los voluntarios de Aportes';

--
-- Dumping data for table `t_users1`
--

INSERT INTO `t_users1` (`dni`, `apellido`) VALUES
1000200,Kurlat
1000201,Elizalde
1000202,Cameo
1000203,Iglesias
1000204,Stilerman
1000205,Canabal
1000206,Almiron
1000207,Codara
12332887,Scheuer
13394776,Maletta
14772995,Tournier
93609657,Testa

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_users1`
--
ALTER TABLE `t_users1`
  ADD PRIMARY KEY (`dni`),
  ADD KEY `idx_fk_prof` (`profesion`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_users1`
--
ALTER TABLE `t_users1`
  ADD CONSTRAINT `fk_profesiones_profesion` FOREIGN KEY (`profesion`) REFERENCES `t_profesiones` (`profesion`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
