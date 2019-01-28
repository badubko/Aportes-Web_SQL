-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 28, 2019 at 04:17 PM
-- Server version: 5.7.24
-- PHP Version: 7.0.32-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "-03:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;



--
-- Dumping data for table `t_p_logs_estado_proy`
--
use aportes_V3_7;

INSERT INTO `t_p_logs_estado_proy` (`p_num_corr_proy`, `p_estado_proy`, `p_fecha`, `p_signif_fecha`, `p_audio_cambio`, `last_update`) VALUES
(1001, 'En_Ejecucion', '2019-01-24', 'Fecha prox reun', 'N/D', '2019-01-28 02:31:46'),
(1002, 'En_Ejecucion', '2019-01-23', 'Fecha prox reun', 'N/D','2019-01-28 02:32:28'),
(1003, 'En_Ejecucion', '2019-01-23', 'Fecha prox reun', 'N/D', '2019-01-28 02:33:14'),
(1004, 'En_Ejecucion', '2019-01-23', 'Fecha prox reun', 'N/D', '2019-01-28 02:33:47'),
(999, 'Terminado', '2019-01-01', 'Fecha terminac', 'N/D', '2019-01-28 03:01:36'),
(998, 'Cancelado', '2019-01-23', 'Fecha cancelacion', 'N/D', '2019-01-28 03:07:12'),
(1005, 'En_Ejecucion', '2019-01-01', 'Fecha prox reun', 'N/D', '2019-01-28 03:09:35'),
(1005, 'Terminado', '2019-01-15', 'Fecha terminac', 'N/D', '2019-01-28 06:09:35'),
(1006, 'Pre-Proyecto', '2019-01-23', 'Fecha prox reun', 'N/D', '2019-01-28 16:12:46');



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
