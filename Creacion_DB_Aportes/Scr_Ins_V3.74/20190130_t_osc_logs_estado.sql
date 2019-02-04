-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 30, 2019 at 04:07 PM
-- Server version: 5.7.24
-- PHP Version: 7.0.32-0ubuntu0.16.04.1

\. ./Scr_Ins_V3.74/que_base_V1.4.sql

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aportes_V3_72`
--

-- --------------------------------------------------------


--
-- Dumping data for table `t_osc_logs_estado`
--

INSERT INTO `t_osc_logs_estado` (`osc_nombre`, `osc_estado`, `dni`, `osc_coment_estado`, `last_update`) VALUES
('ADOBE', 'En_Conversacion', 1000200, 'No Comments', '2019-01-29 01:02:12'),
('ALDEAS INFANTILES', 'En_Conversacion', 1000200, 'No Comments', '2019-01-29 01:02:29'),
('ALPI', 'En_Actividad', 1000200, 'No Comments', '2019-01-29 01:03:52'),
('APA (Asoc.Psicoanalitica Argentina)', 'En_Actividad', 1000200, 'No Comments', '2019-01-29 01:04:31');



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
