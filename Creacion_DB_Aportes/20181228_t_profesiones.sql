-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 27, 2018 at 11:53 PM
-- Server version: 5.7.24
-- PHP Version: 7.0.32-0ubuntu0.16.04.1

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
('Antropologa'),
('Antropologo'),
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
('Mentirosa'),
('Mentiroso'),
('N/D'),
('Sicologa'),
('Sicologo'),
('Sociologa'),
('Sociologo'),
('Otra');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_profesiones`
--
ALTER TABLE `t_profesiones`
  ADD PRIMARY KEY (`profesion`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
