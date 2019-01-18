-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 14, 2019 at 10:05 PM
-- Server version: 5.7.24
-- PHP Version: 7.0.32-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "-03:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aportes_V3_6`
--

-- --------------------------------------------------------



INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`,  `osc_notas`, `last_update`) VALUES
('APA', 'Rodriguez Peña', '1674', 'CABA', 'C1021ABJ', NULL, NULL, NULL, NULL, NULL, NULL, 'apa.org.ar',  'No hay notas', '2019-01-14 23:41:09'),
('Aportes de Gestion', 'Working Ocampo', 'Edificio 3', 'CABA', 'ND', NULL, NULL, NULL, NULL, NULL, NULL, 'aportesdegestion.org.ar',   'No hay notas', '2019-01-14 23:41:09');



INSERT INTO `t_osc_contactos` (`osc_nombre`, `osc_contacto_apellido`, `osc_contacto_nombres`, `osc_contacto_cel`, `osc_contacto_tel_fijo`, `osc_contacto_email`, `osc_contacto_posicion`, `osc_contacto_horario`, `last_update`) VALUES
('Aportes de Gestion', 'Stilerman', 'David', '+54-11-4790-5990', 'N/D', 'contacto@aportesdegestion.org.ar', 'Presidente CD', 'No hay detalle', '2019-01-14 23:55:26'),
('Aportes de Gestion', 'Eichel', 'Eduardo', '+54-911-4416-8011', 'N/D', 'eduardo.eichel@aportesdegestion.org.ar', 'Director de Proyectos', 'No hay detalle', '2019-01-14 23:55:26'),
('APA', 'Borensztejn', 'Claudia Lucia', '+54-911-4047-0996', 'N/D', 'claudiaborensztejn@gmail.com', 'Presidenta CD', 'No hay detalle', '2019-01-14 23:55:26'),
('APA', 'Safdie', 'Eduardo', 'N/D', 'N/D', 'eduardosafdie@gmail.com', 'Tesorero', 'No hay detalle', '2019-01-14 23:56:37'),
('APA', 'Escapa', 'Laura', 'N/D', 'N/D', 'lauraescapa@gmail.com', 'Secretaria CD', 'No hay detalle', '2019-01-15 00:00:24');

Insert into t_osc_logs_dc
(`dni`,`osc_nombre`,`osc_rol_dc`)
Values
('1000200','APA','Primario')
;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
