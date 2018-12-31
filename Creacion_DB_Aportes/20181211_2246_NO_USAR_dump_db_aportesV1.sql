-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 11, 2018 at 11:46 PM
-- Server version: 5.7.24
-- PHP Version: 7.0.32-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aportesV1`
--
CREATE DATABASE IF NOT EXISTS `aportesV1` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `aportesV1`;

-- --------------------------------------------------------

--
-- Table structure for table `t_especialidades`
--

DROP TABLE IF EXISTS `t_especialidades`;
CREATE TABLE `t_especialidades` (
  `especialidad` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_especialidades`
--

INSERT INTO `t_especialidades` (`especialidad`) VALUES
('Administración'),
('Aeronautica'),
('Chantologia'),
('Coaching'),
('Comercial'),
('Comunicacion'),
('Contable'),
('Desconocida'),
('Diagnostico'),
('Educacion'),
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

DROP TABLE IF EXISTS `t_especialidad_user`;
CREATE TABLE `t_especialidad_user` (
  `dni` int(10) UNSIGNED NOT NULL,
  `especialidad` varchar(14) DEFAULT 'Desconocida',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_especialidad_user`
--

INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES
(11077171, 'Estrategia', '2018-11-01 23:53:37'),
(11077171, 'Comercial', '2018-11-01 23:53:37'),
(11077171, 'Negocios', '2018-11-01 23:53:37'),
(11077171, 'Diagnostico', '2018-11-01 23:53:37'),
(11023715, 'Estrategia', '2018-11-01 23:53:37'),
(11023715, 'Comercial', '2018-11-01 23:53:37'),
(11023715, 'Negocios', '2018-11-01 23:53:37'),
(11023715, 'Procesos', '2018-11-01 23:53:37'),
(93345440, 'Estrategia', '2018-11-01 23:53:37'),
(93345440, 'Procesos', '2018-11-01 23:53:37'),
(93345440, 'Diagnostico', '2018-11-01 23:53:37'),
(93345440, 'Indicadores', '2018-11-01 23:53:37'),
(4383620, 'Estrategia', '2018-11-01 23:53:38'),
(4383620, 'Procesos', '2018-11-01 23:53:38'),
(11788722, 'Estrategia', '2018-11-01 23:53:38'),
(11788722, 'Procesos', '2018-11-01 23:53:38'),
(11788722, 'Diagnostico', '2018-11-01 23:53:38'),
(11788722, 'Indicadores', '2018-11-01 23:53:38'),
(7837645, 'Estrategia', '2018-11-01 23:53:38'),
(4437727, 'Administración', '2018-11-01 23:53:38'),
(14026826, 'Estrategia', '2018-11-01 23:53:38'),
(8591589, 'Comercial', '2018-11-01 23:53:38'),
(8591589, 'Negocios', '2018-11-01 23:53:38'),
(8591589, 'Comunicacion', '2018-11-01 23:53:38'),
(4514672, 'RRHH', '2018-11-01 23:53:38'),
(1, 'Estrategia', '2018-11-01 23:53:38'),
(1, 'Comercial', '2018-11-01 23:53:38'),
(1, 'Negocios', '2018-11-01 23:53:38'),
(1, 'Sistemas', '2018-11-01 23:53:38'),
(1, 'Procesos', '2018-11-01 23:53:38'),
(4373628, 'Procesos', '2018-11-01 23:53:38'),
(4373628, 'Indicadores', '2018-11-01 23:53:38'),
(6153590, 'RRHH', '2018-11-01 23:53:38'),
(6153590, 'Procesos', '2018-11-01 23:53:38'),
(6153590, 'Coaching', '2018-11-01 23:53:38'),
(16412832, 'Negocios', '2018-11-01 23:53:38'),
(4543686, 'Estrategia', '2018-11-01 23:53:38'),
(4543686, 'RRHH', '2018-11-01 23:53:38'),
(10125826, 'Estrategia', '2018-11-01 23:53:38'),
(10125826, 'Procesos', '2018-11-01 23:53:38'),
(10125826, 'Comunicacion', '2018-11-01 23:53:38'),
(10128986, 'Logistica', '2018-11-01 23:53:38'),
(10128986, 'Procesos', '2018-11-01 23:53:38'),
(10128986, 'Indicadores', '2018-11-01 23:53:38'),
(11285447, 'Sistemas', '2018-11-01 23:53:38'),
(4403493, 'Sistemas', '2018-11-01 23:53:38'),
(4403493, 'Procesos', '2018-11-01 23:53:38'),
(12062579, 'Comercial', '2018-11-01 23:53:38'),
(12062579, 'Logistica', '2018-11-01 23:53:38'),
(12062579, 'Procesos', '2018-11-01 23:53:38'),
(10161593, 'Estrategia', '2018-11-01 23:53:38'),
(10161593, 'Comercial', '2018-11-01 23:53:38'),
(10161593, 'Negocios', '2018-11-01 23:53:38'),
(10161593, 'Procesos', '2018-11-01 23:53:38'),
(4368430, 'Estrategia', '2018-11-01 23:53:38'),
(4368430, 'RRHH', '2018-11-01 23:53:38'),
(13980034, 'Negocios', '2018-11-01 23:53:38'),
(13980034, 'Procesos', '2018-11-01 23:53:38'),
(13980034, 'Contable', '2018-11-01 23:53:38'),
(12865409, 'Estrategia', '2018-11-01 23:53:38'),
(12865409, 'Procesos', '2018-11-01 23:53:38'),
(12865409, 'Diagnostico', '2018-11-01 23:53:38'),
(21764250, 'Estrategia', '2018-11-01 23:53:38'),
(21764250, 'Comercial', '2018-11-01 23:53:38'),
(21764250, 'Negocios', '2018-11-01 23:53:38'),
(21764250, 'Procesos', '2018-11-01 23:53:38'),
(21764250, 'Diagnostico', '2018-11-01 23:53:38'),
(17812861, 'Administración', '2018-11-01 23:53:38'),
(17812861, 'Procesos', '2018-11-01 23:53:38'),
(17812861, 'Contable', '2018-11-01 23:53:38'),
(8261239, 'Estrategia', '2018-11-01 23:53:38'),
(8261239, 'RRHH', '2018-11-01 23:53:38'),
(8261239, 'Procesos', '2018-11-01 23:53:38'),
(8261239, 'Coaching', '2018-11-01 23:53:38'),
(8261239, 'Diagnostico', '2018-11-01 23:53:38'),
(11815205, 'Estrategia', '2018-11-01 23:53:38'),
(11815205, 'RRHH', '2018-11-01 23:53:38'),
(11815205, 'Procesos', '2018-11-01 23:53:38'),
(11815205, 'Coaching', '2018-11-01 23:53:38'),
(10661746, 'Estrategia', '2018-11-01 23:53:38'),
(10661746, 'Comercial', '2018-11-01 23:53:38'),
(10661746, 'Negocios', '2018-11-01 23:53:38'),
(4381690, 'Estrategia', '2018-11-01 23:53:38'),
(4381690, 'Administración', '2018-11-01 23:53:38'),
(4381690, 'Procesos', '2018-11-01 23:53:38'),
(4381690, 'Diagnostico', '2018-11-01 23:53:38'),
(4381690, 'Contable', '2018-11-01 23:53:38'),
(26115457, 'Estrategia', '2018-11-01 23:53:38'),
(26115457, 'Comercial', '2018-11-01 23:53:38'),
(26115457, 'Negocios', '2018-11-01 23:53:38'),
(26115457, 'Sistemas', '2018-11-01 23:53:38'),
(26115457, 'Procesos', '2018-11-01 23:53:38'),
(26115457, 'Diagnostico', '2018-11-01 23:53:38'),
(12861175, 'Procesos', '2018-11-01 23:53:38'),
(12861175, 'Diagnostico', '2018-11-01 23:53:38'),
(12861175, 'Indicadores', '2018-11-01 23:53:38'),
(11467178, 'Estrategia', '2018-11-01 23:53:38'),
(11467178, 'RRHH', '2018-11-01 23:53:38'),
(10123767, 'Estrategia', '2018-11-01 23:53:38'),
(10123767, 'Administración', '2018-11-01 23:53:38'),
(10123767, 'Procesos', '2018-11-01 23:53:38'),
(10123767, 'Contable', '2018-11-01 23:53:38'),
(4747813, 'Estrategia', '2018-11-01 23:53:38'),
(4747813, 'RRHH', '2018-11-01 23:53:38'),
(4747813, 'Procesos', '2018-11-01 23:53:38'),
(18475365, 'Estrategia', '2018-11-01 23:53:38'),
(18475365, 'RRHH', '2018-11-01 23:53:38'),
(18475365, 'Administración', '2018-11-01 23:53:38'),
(18475365, 'Sistemas', '2018-11-01 23:53:38'),
(18475365, 'Procesos', '2018-11-01 23:53:38'),
(18475365, 'Coaching', '2018-11-01 23:53:38'),
(92334192, 'Sistemas', '2018-11-01 23:53:38'),
(92334192, 'Procesos', '2018-11-01 23:53:38'),
(7375447, 'Estrategia', '2018-11-01 23:53:38'),
(7375447, 'Administración', '2018-11-01 23:53:38'),
(7375447, 'Negocios', '2018-11-01 23:53:38'),
(7375447, 'Procesos', '2018-11-01 23:53:38'),
(29217019, 'RRHH', '2018-11-01 23:53:38'),
(29217019, 'Comunicacion', '2018-11-01 23:53:38'),
(7638418, 'Estrategia', '2018-11-01 23:53:38'),
(7638418, 'Procesos', '2018-11-01 23:53:38'),
(8406769, 'Estrategia', '2018-11-01 23:53:38'),
(8406769, 'Procesos', '2018-11-01 23:53:38'),
(6082141, 'Estrategia', '2018-11-01 23:53:38'),
(6082141, 'Administración', '2018-11-01 23:53:38'),
(6082141, 'Procesos', '2018-11-01 23:53:38'),
(6082141, 'Contable', '2018-11-01 23:53:38'),
(17481570, 'Administración', '2018-11-01 23:53:38'),
(11368729, 'Estrategia', '2018-11-01 23:53:38'),
(11368729, 'Comercial', '2018-11-01 23:53:38'),
(11368729, 'Procesos', '2018-11-01 23:53:38'),
(12107641, 'RRHH', '2018-11-01 23:53:38'),
(12107641, 'Coaching', '2018-11-01 23:53:38'),
(11524703, 'Estrategia', '2018-11-01 23:53:38'),
(11802203, 'Estrategia', '2018-11-01 23:53:38'),
(11802203, 'Comercial', '2018-11-01 23:53:38'),
(11802203, 'Negocios', '2018-11-01 23:53:38'),
(11802203, 'Procesos', '2018-11-01 23:53:38'),
(4412265, 'Negocios', '2018-11-01 23:53:38'),
(4412265, 'Procesos', '2018-11-01 23:53:38'),
(10558702, 'Administración', '2018-11-01 23:53:38'),
(10558702, 'Procesos', '2018-11-01 23:53:38'),
(10558702, 'Diagnostico', '2018-11-01 23:53:38'),
(10558702, 'Contable', '2018-11-01 23:53:38'),
(6714305, 'Negocios', '2018-11-01 23:53:38'),
(6714305, 'Logistica', '2018-11-01 23:53:38'),
(6714305, 'Procesos', '2018-11-01 23:53:38'),
(11997550, 'Negocios', '2018-11-01 23:53:38'),
(11997550, 'Procesos', '2018-11-01 23:53:38'),
(4556079, 'Estrategia', '2018-11-01 23:53:38'),
(4556079, 'Procesos', '2018-11-01 23:53:38'),
(10110647, 'Estrategia', '2018-11-01 23:53:38'),
(10110647, 'Comercial', '2018-11-01 23:53:38'),
(10110647, 'Negocios', '2018-11-01 23:53:38'),
(10110647, 'Logistica', '2018-11-01 23:53:38'),
(7685597, 'Estrategia', '2018-11-01 23:53:38'),
(7685597, 'Administración', '2018-11-01 23:53:38'),
(7685597, 'Negocios', '2018-11-01 23:53:38'),
(7685597, 'Procesos', '2018-11-01 23:53:38'),
(7685597, 'Diagnostico', '2018-11-01 23:53:38'),
(4553179, 'Estrategia', '2018-11-01 23:53:38'),
(4553179, 'Administración', '2018-11-01 23:53:38'),
(4553179, 'Comercial', '2018-11-01 23:53:38'),
(4553179, 'Negocios', '2018-11-01 23:53:38'),
(7704808, 'Estrategia', '2018-11-01 23:53:38'),
(7704808, 'Negocios', '2018-11-01 23:53:38'),
(7704808, 'Procesos', '2018-11-01 23:53:38'),
(7704808, 'Diagnostico', '2018-11-01 23:53:38'),
(4444524, 'Negocios', '2018-11-01 23:53:38'),
(4444524, 'Procesos', '2018-11-01 23:53:38'),
(93445268, 'RRHH', '2018-11-01 23:53:38'),
(11362109, 'Estrategia', '2018-11-01 23:53:38'),
(11362109, 'Negocios', '2018-11-01 23:53:38'),
(11362109, 'Logistica', '2018-11-01 23:53:38'),
(11362109, 'Procesos', '2018-11-01 23:53:38'),
(12601664, 'Estrategia', '2018-11-01 23:53:38'),
(12601664, 'Procesos', '2018-11-01 23:53:38'),
(14927381, 'Estrategia', '2018-11-01 23:53:38'),
(14927381, 'Negocios', '2018-11-01 23:53:38'),
(14927381, 'Procesos', '2018-11-01 23:53:38'),
(14927381, 'Coaching', '2018-11-01 23:53:38'),
(22759102, 'Estrategia', '2018-11-01 23:53:38'),
(22759102, 'Sistemas', '2018-11-01 23:53:38'),
(22759102, 'Procesos', '2018-11-01 23:53:38'),
(22759102, 'Diagnostico', '2018-11-01 23:53:38'),
(4548676, 'Estrategia', '2018-11-01 23:53:38'),
(4548676, 'Negocios', '2018-11-01 23:53:38'),
(4548676, 'Procesos', '2018-11-01 23:53:38'),
(12463662, 'Estrategia', '2018-11-01 23:53:38'),
(12463662, 'Administración', '2018-11-01 23:53:38'),
(12463662, 'Procesos', '2018-11-01 23:53:38'),
(12463662, 'Contable', '2018-11-01 23:53:38'),
(24569384, 'RRHH', '2018-11-01 23:53:38'),
(17233641, 'Administración', '2018-11-01 23:53:38'),
(17233641, 'Comercial', '2018-11-01 23:53:38'),
(17233641, 'Logistica', '2018-11-01 23:53:38'),
(17233641, 'Procesos', '2018-11-01 23:53:38'),
(12865523, 'Sistemas', '2018-11-01 23:53:38'),
(12865523, 'Procesos', '2018-11-01 23:53:38'),
(4536924, 'Sistemas', '2018-11-01 23:53:38'),
(4536924, 'Procesos', '2018-11-01 23:53:38'),
(12001693, 'Negocios', '2018-11-01 23:53:38'),
(13211906, 'Estrategia', '2018-11-01 23:53:38'),
(13211906, 'Negocios', '2018-11-01 23:53:38'),
(13211906, 'Procesos', '2018-11-01 23:53:38'),
(11710217, 'Comercial', '2018-11-01 23:53:38'),
(11710217, 'Negocios', '2018-11-01 23:53:38'),
(8627432, 'Estrategia', '2018-11-01 23:53:38'),
(8627432, 'Administración', '2018-11-01 23:53:38'),
(8627432, 'Procesos', '2018-11-01 23:53:38'),
(8627432, 'Coaching', '2018-11-01 23:53:38'),
(8627432, 'Contable', '2018-11-01 23:53:38'),
(4520142, 'Estrategia', '2018-11-01 23:53:39'),
(4520142, 'Negocios', '2018-11-01 23:53:39'),
(4520142, 'Logistica', '2018-11-01 23:53:39'),
(4520142, 'Procesos', '2018-11-01 23:53:39'),
(4357215, 'Negocios', '2018-11-01 23:53:39'),
(4357215, 'Procesos', '2018-11-01 23:53:39'),
(11478659, 'Administración', '2018-11-01 23:53:39'),
(11478659, 'Negocios', '2018-11-01 23:53:39'),
(11478659, 'Procesos', '2018-11-01 23:53:39'),
(4981277, 'Administración', '2018-11-01 23:53:39'),
(4981277, 'Procesos', '2018-11-01 23:53:39'),
(17446349, 'Estrategia', '2018-11-01 23:53:39'),
(17446349, 'RRHH', '2018-11-01 23:53:39'),
(17446349, 'Sistemas', '2018-11-01 23:53:39'),
(17446349, 'Procesos', '2018-11-01 23:53:39'),
(7604925, 'Estrategia', '2018-11-01 23:53:39'),
(7604925, 'Administración', '2018-11-01 23:53:39'),
(7604925, 'Procesos', '2018-11-01 23:53:39'),
(7604925, 'Diagnostico', '2018-11-01 23:53:39'),
(7604925, 'Contable', '2018-11-01 23:53:39'),
(222222, 'Chantologia', '2018-11-07 03:15:28'),
(69696969, 'Pajas Mentales', '2018-12-04 02:34:39'),
(7660708, 'Diagnostico', '2018-12-07 21:25:16'),
(14026826, 'Sistemas', '2018-12-07 22:53:54'),
(14026826, 'Procesos', '2018-12-07 22:56:00'),
(14026826, 'Chantologia', '2018-12-08 00:08:44'),
(14026826, 'Comercial', '2018-12-08 00:19:29'),
(14026826, 'Pajas Mentales', '2018-12-08 03:01:52'),
(7660708, 'Sistemas', '2018-12-10 02:29:07'),
(7660708, 'Procesos', '2018-12-10 02:29:45'),
(7660708, 'Coaching', '2018-12-10 02:45:43'),
(7660708, 'Chantologia', '2018-12-10 03:03:28'),
(7660708, 'Pajas Mentales', '2018-12-10 03:05:36'),
(7660708, 'Estrategia', '2018-12-10 03:10:43'),
(222222, 'Pajas Mentales', '2018-12-10 03:16:00'),
(69696969, 'Procesos', '2018-12-10 03:36:05'),
(69696969, 'Chantologia', '2018-12-10 03:36:19'),
(11285447, 'Pajas Mentales', '2018-12-10 03:42:47'),
(11285447, 'Chantologia', '2018-12-10 03:42:57'),
(11285447, 'Procesos', '2018-12-10 03:43:35'),
(21800800, 'Chantologia', '2018-12-10 04:12:39'),
(21800800, 'Pajas Mentales', '2018-12-10 04:12:44'),
(4437727, 'Sistemas', '2018-12-10 04:13:42'),
(222222, 'Procesos', '2018-12-10 21:48:09'),
(222222, 'Diagnostico', '2018-12-10 22:43:19'),
(222222, 'Contable', '2018-12-10 22:56:27'),
(11141112, 'Diagnostico', '2018-12-10 23:08:06'),
(11141112, 'Procesos', '2018-12-10 23:08:09'),
(222222, 'Onanismo', '2018-12-11 01:14:22'),
(222222, 'Pura Paja', '2018-12-11 01:24:38'),
(222222, 'Aeronautica', '2018-12-11 03:49:56');

-- --------------------------------------------------------

--
-- Table structure for table `t_estado_user`
--

DROP TABLE IF EXISTS `t_estado_user`;
CREATE TABLE `t_estado_user` (
  `dni` int(10) UNSIGNED NOT NULL,
  `estado` enum('Asignado','Disponible','ND_Temp','De_Baja','Con_Restricc','Interno','Puntual','Desconoc') DEFAULT 'Desconoc',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `consideraciones` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_estado_user`
--

INSERT INTO `t_estado_user` (`dni`, `estado`, `last_update`, `consideraciones`) VALUES
(11077171, 'Asignado', '2018-11-01 23:53:37', NULL),
(11023715, 'Asignado', '2018-11-01 23:53:37', NULL),
(7660708, 'Asignado', '2018-11-01 23:53:37', NULL),
(93345440, 'Asignado', '2018-11-01 23:53:37', NULL),
(4383620, 'Asignado', '2018-11-01 23:53:38', NULL),
(11788722, 'ND_Temp', '2018-11-01 23:53:38', NULL),
(5315515, 'Interno', '2018-11-01 23:53:38', NULL),
(7837645, 'Asignado', '2018-11-01 23:53:38', NULL),
(4437727, 'ND_Temp', '2018-11-01 23:53:38', NULL),
(14026826, 'Asignado', '2018-11-01 23:53:38', NULL),
(8591589, 'ND_Temp', '2018-11-01 23:53:38', NULL),
(4514672, 'Interno', '2018-11-01 23:53:38', NULL),
(1, 'ND_Temp', '2018-11-01 23:53:38', NULL),
(4373628, 'Asignado', '2018-11-01 23:53:38', NULL),
(6153590, 'Asignado', '2018-11-01 23:53:38', NULL),
(16412832, 'ND_Temp', '2018-11-01 23:53:38', NULL),
(4543686, 'ND_Temp', '2018-11-01 23:53:38', NULL),
(10125826, 'ND_Temp', '2018-11-01 23:53:38', NULL),
(10128986, 'Asignado', '2018-11-01 23:53:38', NULL),
(11285447, 'Interno', '2018-11-01 23:53:38', NULL),
(4403493, 'Disponible', '2018-11-01 23:53:38', NULL),
(12062579, 'Asignado', '2018-11-01 23:53:38', NULL),
(10161593, 'Disponible', '2018-11-01 23:53:38', NULL),
(4368430, 'Disponible', '2018-11-01 23:53:38', NULL),
(13980034, 'ND_Temp', '2018-11-01 23:53:38', NULL),
(12865409, 'Disponible', '2018-11-01 23:53:38', NULL),
(21764250, 'Asignado', '2018-11-01 23:53:38', NULL),
(17812861, 'Interno', '2018-11-01 23:53:38', NULL),
(8261239, 'Asignado', '2018-11-01 23:53:38', NULL),
(11815205, 'Asignado', '2018-11-01 23:53:38', NULL),
(10661746, 'Disponible', '2018-11-01 23:53:38', NULL),
(4381690, 'ND_Temp', '2018-11-01 23:53:38', NULL),
(26115457, 'Asignado', '2018-11-01 23:53:38', NULL),
(12861175, 'Disponible', '2018-11-01 23:53:38', NULL),
(11467178, 'Disponible', '2018-11-01 23:53:38', NULL),
(10123767, 'Asignado', '2018-11-01 23:53:38', NULL),
(4311689, 'Disponible', '2018-11-01 23:53:38', NULL),
(4747813, 'ND_Temp', '2018-11-01 23:53:38', NULL),
(18475365, 'Asignado', '2018-11-01 23:53:38', NULL),
(92334192, 'Disponible', '2018-11-01 23:53:38', NULL),
(7375447, 'Asignado', '2018-11-01 23:53:38', NULL),
(29217019, 'Asignado', '2018-11-01 23:53:38', NULL),
(7638418, 'Asignado', '2018-11-01 23:53:38', NULL),
(8406769, 'Asignado', '2018-11-01 23:53:38', NULL),
(6082141, 'Asignado', '2018-11-01 23:53:38', NULL),
(14809026, 'Asignado', '2018-11-01 23:53:38', NULL),
(17481570, 'ND_Temp', '2018-11-01 23:53:38', NULL),
(11368729, 'Con_Restricc', '2018-11-01 23:53:38', NULL),
(12107641, 'Asignado', '2018-11-01 23:53:38', NULL),
(11524703, 'Disponible', '2018-11-01 23:53:38', NULL),
(11802203, 'Asignado', '2018-11-01 23:53:38', NULL),
(4412265, 'Disponible', '2018-11-01 23:53:38', NULL),
(10558702, 'Asignado', '2018-11-01 23:53:38', NULL),
(6714305, 'ND_Temp', '2018-11-01 23:53:38', NULL),
(11997550, 'Disponible', '2018-11-01 23:53:38', NULL),
(4556079, 'ND_Temp', '2018-11-01 23:53:38', NULL),
(10110647, 'Asignado', '2018-11-01 23:53:38', NULL),
(7685597, 'Asignado', '2018-11-01 23:53:38', NULL),
(4553179, 'Disponible', '2018-11-01 23:53:38', NULL),
(7704808, 'Disponible', '2018-11-01 23:53:38', NULL),
(4444524, 'Disponible', '2018-11-01 23:53:38', NULL),
(93445268, 'Asignado', '2018-11-01 23:53:38', NULL),
(94602041, 'Asignado', '2018-11-01 23:53:38', NULL),
(11362109, 'Asignado', '2018-11-01 23:53:38', NULL),
(12601664, 'ND_Temp', '2018-11-01 23:53:38', NULL),
(14927381, 'Asignado', '2018-11-01 23:53:38', NULL),
(22759102, 'Asignado', '2018-11-01 23:53:38', NULL),
(4548676, 'Disponible', '2018-11-01 23:53:38', NULL),
(12463662, 'ND_Temp', '2018-11-01 23:53:38', NULL),
(24569384, 'ND_Temp', '2018-11-01 23:53:38', NULL),
(17233641, 'Disponible', '2018-11-01 23:53:38', NULL),
(12600203, 'Asignado', '2018-11-01 23:53:38', NULL),
(12865523, 'ND_Temp', '2018-11-01 23:53:38', NULL),
(4536924, 'Disponible', '2018-11-01 23:53:38', NULL),
(13237942, 'Disponible', '2018-11-01 23:53:38', NULL),
(11997550, 'Interno', '2018-11-01 23:53:38', NULL),
(12001693, 'Asignado', '2018-11-01 23:53:38', NULL),
(13211906, 'ND_Temp', '2018-11-01 23:53:38', NULL),
(11710217, 'Disponible', '2018-11-01 23:53:38', NULL),
(8627432, 'Asignado', '2018-11-01 23:53:39', NULL),
(4520142, 'Asignado', '2018-11-01 23:53:39', NULL),
(4357215, 'Disponible', '2018-11-01 23:53:39', NULL),
(11478659, 'Asignado', '2018-11-01 23:53:39', NULL),
(4981277, 'Disponible', '2018-11-01 23:53:39', NULL),
(17446349, 'Asignado', '2018-11-01 23:53:39', NULL),
(7604925, 'ND_Temp', '2018-11-01 23:53:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_roles`
--

DROP TABLE IF EXISTS `t_roles`;
CREATE TABLE `t_roles` (
  `rol` varchar(8) CHARACTER SET utf8 DEFAULT NULL,
  `desc_rol` varchar(64) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_roles`
--

INSERT INTO `t_roles` (`rol`, `desc_rol`) VALUES
('DP', NULL),
('DC', NULL),
('PMO', NULL),
('DPI', NULL),
('ASIST', NULL),
('VOL', NULL),
('VC', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_users1`
--

DROP TABLE IF EXISTS `t_users1`;
CREATE TABLE `t_users1` (
  `dni` int(10) UNSIGNED NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `profesion` enum('Ingeniero','Contador','Medico','Abogado','Sicologo','Escribano','Lic Admin Empresas','Arquitecto','Otra','N/D','Chanta','Trucho','Compositor','Mentiroso','Mentirosa','Ingeniera','Arquitecta','Escribana','Sicologa') DEFAULT 'N/D',
  `email_1` varchar(50) DEFAULT NULL,
  `email_2` varchar(50) DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_users1`
--

INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES
(1, 'Croxatto', 'Horacio Luis', 'N/D', 'hcroxatto@yahoo.com', 'N/D', '2018-11-01 23:53:38'),
(10, 'Bach', 'Juan Sebastian', 'Compositor', 'masalla@elcielo.org', 'N/D', '2018-11-26 19:20:27'),
(111111, 'Porelorti', 'Aquiles', 'Trucho', 'aquiles.porelorti@telapongo.com', 'axlo@ortiz.com', '2018-11-27 12:16:38'),
(222222, 'Cachuchova', 'Maria', 'Chanta', 'maria@lacachucha.com', 'superc@hotmail.com', '2018-11-26 19:19:46'),
(4311689, 'Leschinsky', 'Lazaro', 'N/D', 'lazaro.leschinsky@gmail.com', 'N/D', '2018-11-01 23:53:38'),
(4357215, 'Vilate', 'Roberto', 'N/D', 'rvilate@gmail.com', 'N/D', '2018-11-01 23:53:39'),
(4368430, 'Fiocchi', 'Mario Alberto', 'N/D', 'mario.fiocchi@petrobras.com', 'N/D', '2018-11-01 23:53:38'),
(4373628, 'D Alessio', 'Enrique', 'N/D', 'enrique.a.dalessio@gmail.com', 'N/D', '2018-11-01 23:53:38'),
(4381690, 'Jalfen', 'Norberto Benjamin', 'N/D', 'jalfens@hotmail.com', 'N/D', '2018-11-01 23:53:38'),
(4383620, 'Blumenthal', 'Roberto Jose', 'N/D', 'rblumenthal9@gmail.com', 'N/D', '2018-11-01 23:53:37'),
(4403493, 'Falicoff', 'Eduardo', 'N/D', 'efalicoff@gmail.com', 'N/D', '2018-11-01 23:53:38'),
(4412265, 'Pampillo', 'Raul Francisco Jose', 'N/D', 'pampillo@fibertel.com.ar', 'N/D', '2018-11-01 23:53:38'),
(4437727, 'Castillo', 'Eduardo', 'N/D', 'eduardocastillo13@gmail.com', 'N/D', '2018-11-01 23:53:38'),
(4444524, 'Romero', 'Norberto', 'N/D', 'n.romero@ar.inter.net', 'N/D', '2018-11-01 23:53:38'),
(4514672, 'Cortes', 'Eduardo', 'N/D', 'ecortes229@hotmail.com', 'N/D', '2018-11-01 23:53:38'),
(4520142, 'Vicente', 'Carlos Alberto', 'N/D', 'Cvicente45@outlook.com', 'N/D', '2018-11-01 23:53:39'),
(4536924, 'Sorrosal', 'Gustavo', 'N/D', 'gustavo.sorrosal@fibertel.com.ar', ' gsorrosal@proveedores.siderca.com', '2018-11-01 23:53:38'),
(4543686, 'Deleonardis', 'Godofredo', 'N/D', 'gdeleonardis@fibertel.com.ar', 'N/D', '2018-11-01 23:53:38'),
(4548676, 'Sarno', 'Rodolfo', 'N/D', 'rodsrn@gmail.com', 'N/D', '2018-11-01 23:53:38'),
(4553179, 'Quintana Aguilar', 'Jose Alberto', 'N/D', 'jquintana.ar@fibertel.com.ar', 'N/D', '2018-11-01 23:53:38'),
(4556079, 'Philipps', 'Roberto', 'N/D', 'rphilipps@ternium.com', 'N/D', '2018-11-01 23:53:38'),
(4747813, 'Liendo', 'Jose Maria', 'N/D', 'jose_liendo@yahoo.com.ar', 'N/D', '2018-11-01 23:53:38'),
(4981277, 'Vogel', 'Guillermo Enrique', 'N/D', 'guillermo_vogel@hotmail.com', 'N/D', '2018-11-01 23:53:39'),
(5315515, 'Cabo', 'Celia', 'N/D', 'celia.cabo@yahoo.com.ar', 'N/D', '2018-11-01 23:53:38'),
(6082141, 'Marcer', 'Jose Luis', 'N/D', 'jlmarcer@dow.com', 'N/D', '2018-11-01 23:53:38'),
(6153590, 'D Avola', 'Marta Ines', 'N/D', 'marta@retisrrhh.com.ar', 'N/D', '2018-11-01 23:53:38'),
(6714305, 'Pezzolla', 'Cecilia', 'N/D', 'cpezzolla@fibertel.com.ar', 'N/D', '2018-11-01 23:53:38'),
(7375447, 'Lopez', 'Horacio', 'N/D', 'hlopez1@fibertel.com.ar', 'N/D', '2018-11-01 23:53:38'),
(7604925, 'Zucchino', 'Cesar', 'N/D', 'cesar.zucchino@gmail.com', 'N/D', '2018-11-01 23:53:39'),
(7638418, 'Lopez Marti', 'Juan Carlos', 'N/D', 'jclmarti@itba.edu.ar', 'jclopezmarti@gmail.com', '2018-11-01 23:53:38'),
(7660708, 'Bagg', 'Luis Eugenio', 'N/D', 'eugenio.bagg@gmail.com', 'N/D', '2018-12-07 15:54:28'),
(7685597, 'Pujals', 'Fernando', 'N/D', 'pujals9@gmail.com', 'N/D', '2018-11-01 23:53:38'),
(7704808, 'Rabinovich', 'Delfin', 'N/D', 'delfin@fibertel.com.ar', 'N/D', '2018-11-01 23:53:38'),
(7837645, 'Carchak Canes', 'Rafael Angel', 'N/D', 'rafael.carchak@energeia.com.ar', ' rcarchak@fibertel.com.ar', '2018-11-01 23:53:38'),
(8261239, 'Hall', 'Peter', 'N/D', 'peter.hall.arg@gmail.com', 'N/D', '2018-11-01 23:53:38'),
(8406769, 'Magnus', 'Tomás Rubén', 'N/D', 'elianeytommy@gmail.com', 'N/D', '2018-11-01 23:53:38'),
(8591589, 'Conde', 'Roberto Pablo', 'N/D', 'rpconde@fibertel.com.ar', 'N/D', '2018-11-01 23:53:38'),
(8627432, 'Vega', 'Ruben Oscar', 'N/D', 'rvega706@gmail.com', 'N/D', '2018-11-01 23:53:38'),
(10110647, 'Prado', 'Pablo Raul', 'N/D', 'N/D', 'N/D', '2018-11-01 23:53:38'),
(10123767, 'Larralde', 'Roberto', 'N/D', 'larralde@abe.org.ar', 'N/D', '2018-11-01 23:53:38'),
(10125826, 'Di Nucci', 'Jorge Nicolas', 'N/D', 'jndinucci@gmail.com', 'N/D', '2018-11-01 23:53:38'),
(10128986, 'Donzelli', 'Alejandro', 'N/D', 'adonzelli@fibertel.com.ar', 'N/D', '2018-11-01 23:53:38'),
(10161593, 'Fidalgo', 'Ruben Omar', 'N/D', 'rufidalgo@gmail.com', 'N/D', '2018-11-01 23:53:38'),
(10558702, 'Peña', 'Maria del Carmen', 'N/D', 'mcpena34@gmail.com', 'N/D', '2018-11-01 23:53:38'),
(10661746, 'Indaco', 'Alfredo Antonio', 'N/D', 'alfredo.in@gmail.com', 'N/D', '2018-11-01 23:53:38'),
(11023715, 'Arco', 'Alberto', 'N/D', 'arcoalberto@hotmail.com', 'N/D', '2018-11-01 23:53:37'),
(11077171, 'Albisetti', 'Carlos Jose', 'N/D', 'calbisetti@gmail.com', 'N/D', '2018-11-01 23:53:37'),
(11141112, 'Benz', 'Mercedes', 'Arquitecta', 'mb@gmail.com', '', '2018-12-10 23:00:12'),
(11285447, 'Dubko', 'Basilio', 'Chanta', 'basilio_dubko@yahoo.com', 'N/D', '2018-11-07 02:48:18'),
(11362109, 'Sabban Cohen', 'Rafael', 'N/D', 'litorcs@gmail.com', 'N/D', '2018-11-01 23:53:38'),
(11368729, 'Niemetz', 'Jorge Alberto', 'N/D', 'mailto:jniemetz@gmail.com', 'N/D', '2018-11-01 23:53:38'),
(11467178, 'Kievsky', 'Ariel', 'N/D', 'ariel.kievsky@tec-consultores.com.ar', 'N/D', '2018-11-01 23:53:38'),
(11478659, 'Villahoz', 'Carlos Alberto', 'N/D', 'carlos.villahoz@gmail.com', 'N/D', '2018-11-01 23:53:39'),
(11524703, 'Oxoby', 'Marta Elena', 'N/D', 'moxoby@dianthus.com.ar  ', '   oxobymarthe03@gmail.com', '2018-11-01 23:53:38'),
(11710217, 'Vasaro', 'Vilma', 'N/D', 'Vilmava09@yahoo.com.ar', 'N/D', '2018-11-01 23:53:38'),
(11788722, 'Brandt', 'Roberto Daniel', 'N/D', 'robertodbrandt@googlemail.com', 'N/D', '2018-11-01 23:53:38'),
(11802203, 'Pages', 'Jose', 'N/D', 'jose.pages@itau.com.ar', 'N/D', '2018-11-01 23:53:38'),
(11815205, 'Iglesias', 'Alicia Josefina', 'N/D', 'aigle955@gmail.com', 'N/D', '2018-11-01 23:53:38'),
(11997550, 'Pfister', 'Arnoldo', 'N/D', 'aopfister@hotmail.com', 'N/D', '2018-11-01 23:53:38'),
(12001693, 'Valchi', 'Elvio', 'N/D', 'elvio.valchi@gmail.com', 'N/D', '2018-11-01 23:53:38'),
(12062579, 'Fernandez', 'Carlos Ezequiel', 'N/D', 'N/D', 'N/D', '2018-11-01 23:53:38'),
(12107641, 'Nuevo', 'Susana', 'N/D', 'snuevo@gmail.com', 'N/D', '2018-11-01 23:53:38'),
(12463662, 'Schargorodsky', 'Gregorio', 'N/D', 'gregorio.schargorodsky@ar.ey.com', 'N/D', '2018-11-01 23:53:38'),
(12600203, 'Serebrennik', 'Diego', 'N/D', 'diegoserebre@gmail.com', 'N/D', '2018-11-01 23:53:38'),
(12601664, 'San Gil', 'Ernesto', 'N/D', 'ernesto.san.gil@gmail.com', ' vivimbecerra@gmail.com', '2018-11-01 23:53:38'),
(12861175, 'KEBLERIS', 'SILVIA MARCELA', 'N/D', 'smkebleris@gmail.com', 'N/D', '2018-11-01 23:53:38'),
(12865409, 'Fuster', 'Patricia Maria', 'N/D', 'mpfuster@gmail.com', 'N/D', '2018-11-01 23:53:38'),
(12865523, 'Sgro', 'Silvia', 'N/D', 'ssgro@redhat.com', 'N/D', '2018-11-01 23:53:38'),
(13211906, 'Valotta', 'Carlos Augusto', 'N/D', 'carlosvalotta@hotmail.com', 'N/D', '2018-11-01 23:53:38'),
(13237942, 'Soula', 'Gerardo Augusto', 'N/D', 'gerynet@icloud.com', 'N/D', '2018-11-01 23:53:38'),
(13980034, 'Flores', 'Osvaldo Antonio', 'N/D', 'osvaldo.flores@ar.ey.com', 'N/D', '2018-11-01 23:53:38'),
(14026826, 'CASTILLO', 'Maria Estela', 'N/D', 'mariaestelacastillo@gmail.com', 'N/D', '2018-12-01 13:07:05'),
(14809026, 'Marine', 'Jorge', 'N/D', 'jorge_marine@hotmail.com', 'N/D', '2018-11-01 23:53:38'),
(14927381, 'Sanchez', 'Gustavo', 'N/D', 'mailto:gsanchez.ar@gmail.com', 'N/D', '2018-11-01 23:53:38'),
(16412832, 'De Paul', 'Fabian', 'N/D', 'depaulfabian@gmail.com', 'N/D', '2018-11-01 23:53:38'),
(17233641, 'Segura', 'Jorge Gustavo', 'N/D', 'segurajorgegustavo@gmail.com', 'N/D', '2018-11-01 23:53:38'),
(17446349, 'Zamora', 'Diana', 'N/D', 'dianazamora@gmail.com', 'N/D', '2018-11-01 23:53:39'),
(17481570, 'Moya', 'Claudia', 'N/D', 'moya_claudia@hotmail.com', 'N/D', '2018-11-01 23:53:38'),
(17812861, 'Gaston', 'Laura', 'N/D', 'gastonlaura@hotmail.com', 'N/D', '2018-11-01 23:53:38'),
(18475365, 'Lijtman', 'Daniel', 'N/D', 'daniel.lijtman@gmail.com', 'N/D', '2018-11-01 23:53:38'),
(21764250, 'GARDELLA', 'Alejandro P.', 'N/D', 'Newtango1970@yahoo.com', 'N/D', '2018-11-01 23:53:38'),
(21800800, 'Meo', 'Aquiles', 'Chanta', 'aquilesmeo@gmail.com', '', '2018-12-10 03:26:22'),
(22333555, 'Truchinsky', 'Luciano', 'Chanta', 'lt@gmail.com', 'salame@gmail.com', '2018-11-24 13:42:34'),
(22759102, 'Sarabia', 'Esteban', 'N/D', 'esteban@sarabia.com', 'N/D', '2018-11-01 23:53:38'),
(24569384, 'Scquizzato', 'Natalia', 'N/D', 'natalia.scquizzato@ar.ey.com', 'N/D', '2018-11-01 23:53:38'),
(26115457, 'Jejcic', 'Guillermo', 'N/D', 'guillermo.jejcic@itau.com.ar', 'N/D', '2018-11-01 23:53:38'),
(29217019, 'Lopez Dagan', 'Maria Eugenia', 'N/D', 'N/D', 'N/D', '2018-11-01 23:53:38'),
(31313414, 'Lame', 'Elsa', 'Mentirosa', 'es@gmail.com', 'elsalame@gmail.com', '2018-11-26 19:56:34'),
(44111999, 'Takayama', 'Isoroku', 'Mentiroso', 'it@gmail.com', 'it@japon.com', '2018-11-26 20:52:37'),
(44222888, 'Quito', 'Estaban', 'Chanta', 'ea@gmail.com', 'eq@gmail.com', '2018-11-26 22:29:06'),
(44333666, 'Horia', 'Susana', 'Arquitecta', 'sh@gmail.com', 'sh@hotmail.com', '2018-11-26 22:27:10'),
(69000001, 'Porongova', 'Gloria', 'Mentirosa', 'gpor@gmail.com', 'sal@gmail.com', '2018-12-10 03:25:30'),
(69696969, 'Lacaliente', 'Juana', 'Chanta', 'jlc@gmail.com', 'hot@gmail.com', '2018-12-10 03:37:34'),
(77000777, 'Sucio', 'Tuculito', 'Chanta', 'tc@gmail.com', '', '2018-12-10 23:06:59'),
(77777777, 'Sacallama', 'Tuculito', 'Ingeniero', 'tku@gmail.com', 'sllama@gmail.com', '2018-11-26 22:38:25'),
(92334192, 'LLano Leguizamon', 'Carmen Ines', 'N/D', 'carmen.llano@gmail.com', 'N/D', '2018-11-01 23:53:38'),
(93345440, 'Bernardini', 'Maria Elizabeth', 'N/D', 'ebernardini@kenwin.net', 'N/D', '2018-11-01 23:53:37'),
(93445268, 'Rosenfeld', 'Zoltan', 'N/D', 'zoltan.cyb@gmail.com', 'N/D', '2018-11-01 23:53:38'),
(94602041, 'Rovira Cubillo', 'Alejandro Enrique', 'N/D', 'alejandro.rovirac@gmail.com', 'N/D', '2018-11-01 23:53:38'),
(99111222, 'Nocamina', 'Yamimoto', 'Contador', 'ym@gmail.com', 'ym@japon.com', '2018-11-24 13:40:29');

-- --------------------------------------------------------

--
-- Table structure for table `t_users2`
--

DROP TABLE IF EXISTS `t_users2`;
CREATE TABLE `t_users2` (
  `dni` int(10) UNSIGNED NOT NULL,
  `cuil` varchar(14) DEFAULT NULL,
  `rol` varchar(10) DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_users2`
--

INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `last_update`) VALUES
(1, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(4311689, '20-04311689-5', 'VOL', '2018-11-26 18:22:30'),
(4357215, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(4368430, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(4373628, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(4381690, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(4383620, '20-04383620-0', 'VOL', '2018-11-26 18:22:30'),
(4403493, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(4412265, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(4437727, '20-04437727-7', 'VOL', '2018-11-26 18:22:30'),
(4444524, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(4514672, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(4520142, '20-04520142-3', 'VOL', '2018-11-26 18:22:30'),
(4536924, '20-04536924-3', 'VOL', '2018-11-26 18:22:30'),
(4543686, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(4548676, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(4553179, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(4747813, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(4981277, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(5315515, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(6082141, '20-06082141-1', 'VOL', '2018-11-26 18:22:30'),
(6153590, '27-06153590-5', 'VOL', '2018-11-26 18:22:30'),
(6714305, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(7375447, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(7604925, '20-07604925-5', 'VOL', '2018-11-26 18:22:30'),
(7638418, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(7660708, '20-07660708-8', 'VOL', '2018-11-26 18:22:30'),
(7685597, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(7704808, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(7837645, '20-07837645-8', 'VOL', '2018-11-26 18:22:30'),
(8261239, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(8406769, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(8591589, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(8627432, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(10110647, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(10123767, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(10125826, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(10128986, '23-10128986-9', 'VOL', '2018-11-26 18:22:30'),
(10161593, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(10558702, '27-10558702-9', 'VOL', '2018-11-26 18:22:30'),
(10661746, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(11023715, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(11077171, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(11285447, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(11362109, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(11368729, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(11467178, '23-11467178-9', 'VOL', '2018-11-26 18:22:30'),
(11478659, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(11524703, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(11710217, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(11788722, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(11802203, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(11815205, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(11997550, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(12001693, '20-12001693-9', 'VOL', '2018-11-26 18:22:30'),
(12062579, '23-12062579-9', 'VOL', '2018-11-26 18:22:30'),
(12107641, '27-12107641-7', 'VOL', '2018-11-26 18:22:30'),
(12463662, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(12600203, '20-12600203-4', 'VOL', '2018-11-26 18:22:30'),
(12601664, '20-12601664-7', 'VOL', '2018-11-26 18:22:30'),
(12861175, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(12865409, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(12865523, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(13211906, '20-13211906-7', 'VOL', '2018-11-26 18:22:30'),
(13237942, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(13980034, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(14026826, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(14809026, '20-14809026-3', 'VOL', '2018-11-26 18:22:30'),
(14927381, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(16412832, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(17233641, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(17446349, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(17481570, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(17812861, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(18475365, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(21764250, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(22759102, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(24569384, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(26115457, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(29217019, '27-29217019-5', 'VOL', '2018-11-26 18:22:30'),
(92334192, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(93345440, 'N/D', 'VOL', '2018-11-26 18:22:30'),
(93445268, '20-93445268-3', 'VOL', '2018-11-26 18:22:30'),
(94602041, 'N/D', 'VOL', '2018-11-26 18:22:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_especialidades`
--
ALTER TABLE `t_especialidades`
  ADD PRIMARY KEY (`especialidad`) USING BTREE,
  ADD KEY `especialidad` (`especialidad`);

--
-- Indexes for table `t_especialidad_user`
--
ALTER TABLE `t_especialidad_user`
  ADD KEY `idx_fk_dni` (`dni`),
  ADD KEY `idx_fk_especialidad` (`especialidad`);

--
-- Indexes for table `t_estado_user`
--
ALTER TABLE `t_estado_user`
  ADD KEY `idx_fk_dni` (`dni`);

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
-- Constraints for table `t_estado_user`
--
ALTER TABLE `t_estado_user`
  ADD CONSTRAINT `fk_estado_dni` FOREIGN KEY (`dni`) REFERENCES `t_users1` (`dni`) ON UPDATE CASCADE;

--
-- Constraints for table `t_users2`
--
ALTER TABLE `t_users2`
  ADD CONSTRAINT `fk_users2_dni` FOREIGN KEY (`dni`) REFERENCES `t_users1` (`dni`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
