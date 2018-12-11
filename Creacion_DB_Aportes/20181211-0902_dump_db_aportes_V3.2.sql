-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 11, 2018 at 10:01 AM
-- Server version: 5.7.24
-- PHP Version: 7.0.32-0ubuntu0.16.04.1

DROP SCHEMA IF EXISTS aportes_V3_2;
CREATE SCHEMA aportes_V3_2;
USE aportes_V3_2;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "-03:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aportes_V3_2`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_especialidades`
--

CREATE TABLE `t_especialidades` (
  `especialidad` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_especialidades`
--

INSERT INTO `t_especialidades` (`especialidad`) VALUES
('Administracion'),
('Chantologia'),
('Coaching'),
('Comercial'),
('Comunicacion'),
('Contable'),
('Diagnostico'),
('Estrategia'),
('Indicadores'),
('Logistica'),
('Negocios'),
('Onanismo'),
('Pajas Mentales'),
('Procesos'),
('Pura Paja'),
('RRHH'),
('Sistemas');

-- --------------------------------------------------------

--
-- Table structure for table `t_especialidad_user`
--

CREATE TABLE `t_especialidad_user` (
  `dni` int(10) UNSIGNED NOT NULL,
  `especialidad` varchar(20) DEFAULT 'Desconocida',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `t_estados`
--

CREATE TABLE `t_estados` (
  `estado` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_estados`
--

INSERT INTO `t_estados` (`estado`) VALUES
('Asignado'),
('Con_Restricc'),
('Desconoc'),
('De_Baja'),
('Disponible'),
('Interno'),
('ND_Temp'),
('Puntual');

-- --------------------------------------------------------

--
-- Table structure for table `t_logs_estado_user`
--

CREATE TABLE `t_logs_estado_user` (
  `dni` int(10) UNSIGNED NOT NULL,
  `estado` varchar(14) DEFAULT 'Desconoc',
  `consideraciones` varchar(256) DEFAULT 'No Comments',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `t_profesiones`
--

CREATE TABLE `t_profesiones` (
  `profesion` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_profesiones`
--

INSERT INTO `t_profesiones` (`profesion`) VALUES
('Abogada'),
('Abogado'),
('Arquitecta'),
('Arquitecto'),
('Chanta'),
('Chantologa'),
('Chantologo'),
('Contador'),
('Contadora'),
('Ingeniera'),
('Ingeniero'),
('Lic RRHH'),
('Lic RRPP'),
('Medica'),
('Medico'),
('N/D'),
('Sicologa'),
('Sicologo'),
('Sociologa'),
('Sociologo');

-- --------------------------------------------------------

--
-- Table structure for table `t_roles`
--

CREATE TABLE `t_roles` (
  `rol` varchar(6) NOT NULL DEFAULT 'Vol'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_roles`
--

INSERT INTO `t_roles` (`rol`) VALUES
('Asist'),
('Col'),
('DC'),
('DP'),
('DPI'),
('PMO'),
('VC'),
('Vol');

-- --------------------------------------------------------

--
-- Table structure for table `t_users1`
--

CREATE TABLE `t_users1` (
  `dni` int(10) UNSIGNED NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `profesion` varchar(25) NOT NULL DEFAULT 'N/D',
  `email_1` varchar(50) DEFAULT 'N/D',
  `email_2` varchar(50) DEFAULT 'N/D',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `t_users2`
--

CREATE TABLE `t_users2` (
  `dni` int(10) UNSIGNED NOT NULL,
  `rol` varchar(6) DEFAULT 'Vol',
  `cuil` varchar(14) DEFAULT 'N/D',
  `a_socio` year(4) DEFAULT '0000',
  `f_ingreso` date DEFAULT '2004-01-01',
  `comentarios` varchar(256) DEFAULT 'N/C',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_especialidades`
--
ALTER TABLE `t_especialidades`
  ADD PRIMARY KEY (`especialidad`);

--
-- Indexes for table `t_especialidad_user`
--
ALTER TABLE `t_especialidad_user`
  ADD KEY `idx_fk_dni` (`dni`),
  ADD KEY `idx_fk_especialidad` (`especialidad`);

--
-- Indexes for table `t_estados`
--
ALTER TABLE `t_estados`
  ADD PRIMARY KEY (`estado`);

--
-- Indexes for table `t_logs_estado_user`
--
ALTER TABLE `t_logs_estado_user`
  ADD KEY `idx_fk_dni` (`dni`);

--
-- Indexes for table `t_profesiones`
--
ALTER TABLE `t_profesiones`
  ADD PRIMARY KEY (`profesion`);

--
-- Indexes for table `t_roles`
--
ALTER TABLE `t_roles`
  ADD PRIMARY KEY (`rol`);

--
-- Indexes for table `t_users1`
--
ALTER TABLE `t_users1`
  ADD PRIMARY KEY (`dni`);

--
-- Indexes for table `t_users2`
--
ALTER TABLE `t_users2`
  ADD UNIQUE KEY `dni` (`dni`),
  ADD KEY `idx_fk_dni` (`dni`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_especialidad_user`
--
ALTER TABLE `t_especialidad_user`
  ADD CONSTRAINT `fk_especialidad_dni` FOREIGN KEY (`dni`) REFERENCES `t_users1` (`dni`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_especialidades_especialidad` FOREIGN KEY (`especialidad`) REFERENCES `t_especialidades` (`especialidad`);

--
-- Constraints for table `t_logs_estado_user`
--
ALTER TABLE `t_logs_estado_user`
  ADD CONSTRAINT `fk_estado_dni` FOREIGN KEY (`dni`) REFERENCES `t_users1` (`dni`) ON UPDATE CASCADE;

--
-- Constraints for table `t_users2`
--
ALTER TABLE `t_users2`
  ADD CONSTRAINT `fk_users2_dni` FOREIGN KEY (`dni`) REFERENCES `t_users1` (`dni`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
