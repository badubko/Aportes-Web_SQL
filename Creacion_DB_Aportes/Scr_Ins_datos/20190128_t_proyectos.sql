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
-- Database: `aportes_V3_7`
--

-- --------------------------------------------------------

use aportes_V3_7;
--

INSERT INTO `t_proyectos` (`p_num_corr_proy`, `p_nombre_proy`, `osc_nombre`, `p_fecha_pre_proy`, `p_fecha_present_vol`, `p_fecha_dup`, `p_fecha_mitad_proy`, `p_fecha_cierre_proy`, `p_dup_si_no`, `p_link_a_dup`, `last_update`) VALUES
(998, 'ALPI ', 'ALPI', '2004-01-01', '2004-01-01', '2004-01-01', '2004-01-01', '2004-01-01', 'No', 'N/D', '2019-01-28 03:06:42'),
(999, 'ALPI I', 'ALPI', '2004-01-01', '2004-01-01', '2004-01-01', '2004-01-01', '2004-01-01', 'No', 'N/D', '2019-01-28 03:00:29'),
(1001, 'APA I', 'APA (Asoc.Psicoanalitica Argentina)', '2019-01-01', '2004-01-01', '2004-01-01', '2004-01-01', '2004-01-01', 'Si', 'N/D', '2019-01-28 02:26:03'),
(1002, 'Adobe I', 'ADOBE', '2004-01-01', '2004-01-01', '2004-01-01', '2004-01-01', '2004-01-01', 'No', 'N/D', '2019-01-28 02:27:11'),
(1003, 'ALPI II', 'ALPI', '2004-01-01', '2004-01-01', '2004-01-01', '2004-01-01', '2004-01-01', 'No', 'N/D', '2019-01-28 03:00:41'),
(1004, 'ALDEAS I', 'ALDEAS INFANTILES', '2004-01-01', '2004-01-01', '2004-01-01', '2004-01-01', '2004-01-01', 'No', 'N/D', '2019-01-28 02:29:37'),
(1005, 'ALPI III', 'ALPI', '2004-01-01', '2004-01-01', '2004-01-01', '2004-01-01', '2004-01-01', 'No', 'N/D', '2019-01-28 03:09:12'),
(1006, 'ALPI IV', 'ALPI', '2004-01-01', '2004-01-01', '2004-01-01', '2004-01-01', '2004-01-01', 'No', 'N/D', '2019-01-28 16:11:54');



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
