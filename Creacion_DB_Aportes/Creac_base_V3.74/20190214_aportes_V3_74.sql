-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 14, 2019 at 05:45 PM
-- Server version: 5.7.24
-- PHP Version: 7.0.33-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aportes_V3_74`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `list_osc_dc_supl`
--
CREATE TABLE `list_osc_dc_supl` (
`osc_nombre` varchar(128)
,`osc_f_supl` date
,`dni` int(10) unsigned
,`apellido` varchar(45)
,`nombres` varchar(45)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `list_osc_dc_tit`
--
CREATE TABLE `list_osc_dc_tit` (
`osc_nombre` varchar(128)
,`osc_f_titular` date
,`dni` int(10) unsigned
,`apellido` varchar(45)
,`nombres` varchar(45)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `osc_proy`
--
CREATE TABLE `osc_proy` (
`dni` int(10) unsigned
,`p_num_corr_proy` int(10) unsigned
,`osc_nombre` varchar(128)
,`p_nombre_proy` varchar(128)
,`p_ultimo_estado` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `t_cambios_estado`
--

CREATE TABLE `t_cambios_estado` (
  `estado_actual` varchar(14) NOT NULL,
  `estado_proximo` varchar(14) NOT NULL,
  `id_truch` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de relacion de estado_actual y estado_proximo posible';

--
-- Dumping data for table `t_cambios_estado`
--

INSERT INTO `t_cambios_estado` (`estado_actual`, `estado_proximo`, `id_truch`) VALUES('Disponible', 'Con_Restricc', 1);
INSERT INTO `t_cambios_estado` (`estado_actual`, `estado_proximo`, `id_truch`) VALUES('Disponible', 'Puntual', 2);
INSERT INTO `t_cambios_estado` (`estado_actual`, `estado_proximo`, `id_truch`) VALUES('Disponible', 'ND_Temp', 3);
INSERT INTO `t_cambios_estado` (`estado_actual`, `estado_proximo`, `id_truch`) VALUES('Disponible', 'De_Baja', 4);
INSERT INTO `t_cambios_estado` (`estado_actual`, `estado_proximo`, `id_truch`) VALUES('Asignado', 'Cambio Imposib', 5);
INSERT INTO `t_cambios_estado` (`estado_actual`, `estado_proximo`, `id_truch`) VALUES('Con_Restricc', 'Disponible', 6);
INSERT INTO `t_cambios_estado` (`estado_actual`, `estado_proximo`, `id_truch`) VALUES('Con_Restricc', 'Puntual', 7);
INSERT INTO `t_cambios_estado` (`estado_actual`, `estado_proximo`, `id_truch`) VALUES('Con_Restricc', 'ND_Temp', 8);
INSERT INTO `t_cambios_estado` (`estado_actual`, `estado_proximo`, `id_truch`) VALUES('Con_Restricc', 'De_Baja', 9);
INSERT INTO `t_cambios_estado` (`estado_actual`, `estado_proximo`, `id_truch`) VALUES('Puntual', 'Disponible', 10);
INSERT INTO `t_cambios_estado` (`estado_actual`, `estado_proximo`, `id_truch`) VALUES('Puntual', 'Con_Restricc', 11);
INSERT INTO `t_cambios_estado` (`estado_actual`, `estado_proximo`, `id_truch`) VALUES('Puntual', 'ND_Temp', 12);
INSERT INTO `t_cambios_estado` (`estado_actual`, `estado_proximo`, `id_truch`) VALUES('Puntual', 'De_Baja', 13);
INSERT INTO `t_cambios_estado` (`estado_actual`, `estado_proximo`, `id_truch`) VALUES('ND_Temp', 'Disponible', 14);
INSERT INTO `t_cambios_estado` (`estado_actual`, `estado_proximo`, `id_truch`) VALUES('ND_Temp', 'Con_Restricc', 15);
INSERT INTO `t_cambios_estado` (`estado_actual`, `estado_proximo`, `id_truch`) VALUES('ND_Temp', 'Puntual', 16);
INSERT INTO `t_cambios_estado` (`estado_actual`, `estado_proximo`, `id_truch`) VALUES('ND_Temp', 'De_Baja', 17);
INSERT INTO `t_cambios_estado` (`estado_actual`, `estado_proximo`, `id_truch`) VALUES('De_Baja', 'Cambio Imposib', 18);

-- --------------------------------------------------------

--
-- Table structure for table `t_especialidades`
--

CREATE TABLE `t_especialidades` (
  `especialidad` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de datos de las posibles especialidades de un voluntario';

--
-- Dumping data for table `t_especialidades`
--

INSERT INTO `t_especialidades` (`especialidad`) VALUES('Administracion');
INSERT INTO `t_especialidades` (`especialidad`) VALUES('Chantologia');
INSERT INTO `t_especialidades` (`especialidad`) VALUES('Coaching');
INSERT INTO `t_especialidades` (`especialidad`) VALUES('Comercial');
INSERT INTO `t_especialidades` (`especialidad`) VALUES('Comunicacion');
INSERT INTO `t_especialidades` (`especialidad`) VALUES('Contable');
INSERT INTO `t_especialidades` (`especialidad`) VALUES('Diagnostico');
INSERT INTO `t_especialidades` (`especialidad`) VALUES('Enroscar la vibora');
INSERT INTO `t_especialidades` (`especialidad`) VALUES('Estrategia');
INSERT INTO `t_especialidades` (`especialidad`) VALUES('Indicadores');
INSERT INTO `t_especialidades` (`especialidad`) VALUES('Logistica');
INSERT INTO `t_especialidades` (`especialidad`) VALUES('Negocios');
INSERT INTO `t_especialidades` (`especialidad`) VALUES('Procastinacion');
INSERT INTO `t_especialidades` (`especialidad`) VALUES('Procesos');
INSERT INTO `t_especialidades` (`especialidad`) VALUES('Pura Fantasia');
INSERT INTO `t_especialidades` (`especialidad`) VALUES('RRHH');
INSERT INTO `t_especialidades` (`especialidad`) VALUES('Sistemas');
INSERT INTO `t_especialidades` (`especialidad`) VALUES('Versotica');

-- --------------------------------------------------------

--
-- Table structure for table `t_especialidad_user`
--

CREATE TABLE `t_especialidad_user` (
  `dni` int(10) UNSIGNED NOT NULL,
  `especialidad` varchar(20) DEFAULT 'Desconocida',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de las especialidades que tiene un voluntario';

--
-- Dumping data for table `t_especialidad_user`
--

INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11077171, 'Estrategia', '2019-02-04 17:21:00');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11077171, 'Comercial', '2019-02-04 17:21:00');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11077171, 'Negocios', '2019-02-04 17:21:00');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11077171, 'Diagnostico', '2019-02-04 17:21:00');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11023715, 'Estrategia', '2019-02-04 17:21:00');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11023715, 'Comercial', '2019-02-04 17:21:00');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11023715, 'Negocios', '2019-02-04 17:21:00');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11023715, 'Procesos', '2019-02-04 17:21:00');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(7660708, 'Estrategia', '2019-02-04 17:21:00');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(7660708, 'Diagnostico', '2019-02-04 17:21:00');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(93345440, 'Estrategia', '2019-02-04 17:21:00');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(93345440, 'Procesos', '2019-02-04 17:21:00');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(93345440, 'Diagnostico', '2019-02-04 17:21:00');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(93345440, 'Indicadores', '2019-02-04 17:21:00');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4383620, 'Estrategia', '2019-02-04 17:21:00');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4383620, 'Procesos', '2019-02-04 17:21:00');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11788722, 'Estrategia', '2019-02-04 17:21:00');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11788722, 'Procesos', '2019-02-04 17:21:00');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11788722, 'Diagnostico', '2019-02-04 17:21:00');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11788722, 'Indicadores', '2019-02-04 17:21:00');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(7837645, 'Estrategia', '2019-02-04 17:21:00');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(7837645, 'Negocios', '2019-02-04 17:21:00');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(7837645, 'Procesos', '2019-02-04 17:21:00');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(7837645, 'Coaching', '2019-02-04 17:21:00');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(7837645, 'Diagnostico', '2019-02-04 17:21:00');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4437727, 'Administracion', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4437727, 'Procesos', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4437727, 'Contable', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(14026826, 'Estrategia', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(14026826, 'Sistemas', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(14026826, 'Procesos', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(8591589, 'Comercial', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(8591589, 'Negocios', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(8591589, 'Comunicacion', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4514672, 'RRHH', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(999999, 'Estrategia', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(999999, 'Comercial', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(999999, 'Negocios', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(999999, 'Sistemas', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(999999, 'Procesos', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4373628, 'Procesos', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4373628, 'Indicadores', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(6153590, 'RRHH', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(6153590, 'Procesos', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(6153590, 'Coaching', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(16412832, 'Negocios', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4543686, 'Estrategia', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4543686, 'RRHH', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(10125826, 'Estrategia', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(10125826, 'Procesos', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(10125826, 'Comunicacion', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(10128986, 'Logistica', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(10128986, 'Procesos', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(10128986, 'Indicadores', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11285447, 'Sistemas', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11285447, 'Procesos', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11285447, 'Versotica', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4403493, 'Sistemas', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4403493, 'Procesos', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(12062579, 'Comercial', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(12062579, 'Logistica', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(12062579, 'Procesos', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(10161593, 'Estrategia', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(10161593, 'Comercial', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(10161593, 'Negocios', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(10161593, 'Procesos', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4368430, 'Estrategia', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4368430, 'RRHH', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(13980034, 'Negocios', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(13980034, 'Procesos', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(13980034, 'Contable', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(12865409, 'Estrategia', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(12865409, 'Procesos', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(12865409, 'Diagnostico', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(21764250, 'Estrategia', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(21764250, 'Comercial', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(21764250, 'Negocios', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(21764250, 'Procesos', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(21764250, 'Diagnostico', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(17812861, 'Administracion', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(17812861, 'Procesos', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(17812861, 'Contable', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(8261239, 'Estrategia', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(8261239, 'RRHH', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(8261239, 'Procesos', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(8261239, 'Coaching', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(8261239, 'Diagnostico', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11815205, 'Estrategia', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11815205, 'RRHH', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11815205, 'Procesos', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11815205, 'Coaching', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(10661746, 'Estrategia', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(10661746, 'Comercial', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(10661746, 'Negocios', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4381690, 'Estrategia', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4381690, 'Administracion', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4381690, 'Procesos', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4381690, 'Diagnostico', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4381690, 'Contable', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(26115457, 'Estrategia', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(26115457, 'Comercial', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(26115457, 'Negocios', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(26115457, 'Sistemas', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(26115457, 'Procesos', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(26115457, 'Diagnostico', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(12861175, 'Procesos', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(12861175, 'Diagnostico', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(12861175, 'Indicadores', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11467178, 'Estrategia', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11467178, 'RRHH', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(10123767, 'Estrategia', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(10123767, 'Administracion', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(10123767, 'Procesos', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(10123767, 'Contable', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4747813, 'Estrategia', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4747813, 'RRHH', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4747813, 'Procesos', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(18475365, 'Estrategia', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(18475365, 'RRHH', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(18475365, 'Administracion', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(18475365, 'Sistemas', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(18475365, 'Procesos', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(18475365, 'Coaching', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(92334192, 'Sistemas', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(92334192, 'Procesos', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(7375447, 'Estrategia', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(7375447, 'Administracion', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(7375447, 'Negocios', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(7375447, 'Procesos', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(29217019, 'RRHH', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(29217019, 'Comunicacion', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(7638418, 'Estrategia', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(7638418, 'Procesos', '2019-02-04 17:21:01');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(8406769, 'Estrategia', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(8406769, 'Procesos', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(6082141, 'Estrategia', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(6082141, 'Administracion', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(6082141, 'Procesos', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(6082141, 'Contable', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(17481570, 'Administracion', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11368729, 'Estrategia', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11368729, 'Comercial', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11368729, 'Procesos', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(12107641, 'RRHH', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(12107641, 'Coaching', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11524703, 'Estrategia', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11802203, 'Estrategia', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11802203, 'Comercial', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11802203, 'Negocios', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11802203, 'Procesos', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4412265, 'Negocios', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4412265, 'Procesos', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(10558702, 'Administracion', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(10558702, 'Procesos', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(10558702, 'Diagnostico', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(10558702, 'Contable', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(6714305, 'Negocios', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(6714305, 'Logistica', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(6714305, 'Procesos', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11997550, 'Negocios', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11997550, 'Procesos', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4556079, 'Estrategia', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4556079, 'Procesos', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(10110647, 'Estrategia', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(10110647, 'Comercial', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(10110647, 'Negocios', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(10110647, 'Logistica', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(7685597, 'Estrategia', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(7685597, 'Administracion', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(7685597, 'Negocios', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(7685597, 'Procesos', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(7685597, 'Diagnostico', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4553179, 'Estrategia', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4553179, 'Administracion', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4553179, 'Comercial', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4553179, 'Negocios', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(7704808, 'Estrategia', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(7704808, 'Negocios', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(7704808, 'Procesos', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(7704808, 'Diagnostico', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4444524, 'Negocios', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4444524, 'Procesos', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(93445268, 'RRHH', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11362109, 'Estrategia', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11362109, 'Negocios', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11362109, 'Logistica', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11362109, 'Procesos', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(12601664, 'Estrategia', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(12601664, 'Procesos', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(14927381, 'Estrategia', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(14927381, 'Negocios', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(14927381, 'Procesos', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(14927381, 'Coaching', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(22759102, 'Estrategia', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(22759102, 'Sistemas', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(22759102, 'Procesos', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(22759102, 'Diagnostico', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4548676, 'Estrategia', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4548676, 'Negocios', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4548676, 'Procesos', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(12463662, 'Estrategia', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(12463662, 'Administracion', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(12463662, 'Procesos', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(12463662, 'Contable', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(24569384, 'RRHH', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(17233641, 'Administracion', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(17233641, 'Comercial', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(17233641, 'Logistica', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(17233641, 'Procesos', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(12865523, 'Sistemas', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(12865523, 'Procesos', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4536924, 'Sistemas', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4536924, 'Procesos', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(12001693, 'Negocios', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(13211906, 'Estrategia', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(13211906, 'Negocios', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(13211906, 'Procesos', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11710217, 'Comercial', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11710217, 'Negocios', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(8627432, 'Estrategia', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(8627432, 'Administracion', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(8627432, 'Procesos', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(8627432, 'Coaching', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(8627432, 'Contable', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4520142, 'Estrategia', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4520142, 'Negocios', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4520142, 'Logistica', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4520142, 'Procesos', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4357215, 'Negocios', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4357215, 'Procesos', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11478659, 'Administracion', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11478659, 'Negocios', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(11478659, 'Procesos', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4981277, 'Administracion', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(4981277, 'Procesos', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(17446349, 'Estrategia', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(17446349, 'RRHH', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(17446349, 'Sistemas', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(17446349, 'Procesos', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(7604925, 'Estrategia', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(7604925, 'Administracion', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(7604925, 'Procesos', '2019-02-04 17:21:02');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(7604925, 'Diagnostico', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(7604925, 'Contable', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000210, 'Estrategia', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000210, 'Procesos', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000210, 'Diagnostico', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000211, 'Estrategia', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000211, 'Negocios', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000211, 'Procesos', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000211, 'Coaching', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(7621101, 'Administración', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(7621101, 'Procesos', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(7621101, 'Contable', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000212, 'Estrategia', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000212, 'Procesos', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(5931630, 'Estrategia', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000213, 'RRHH', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(20665260, 'Estrategia', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(20665260, 'Administración', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(20665260, 'Procesos', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000214, 'Estrategia', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000214, 'Indicadores', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000215, 'Estrategia', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000215, 'Sistemas', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000215, 'Procesos', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000216, 'Estrategia', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000216, 'Procesos', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000217, 'Estrategia', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000217, 'Procesos', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000218, 'Procesos', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000219, 'Negocios', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000221, 'Comunicacion', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000200, 'Procesos', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000200, 'Sistemas', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000200, 'Diagnostico', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000205, 'RRHH', '2019-02-04 17:21:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000020, 'Chantologia', '2019-02-04 17:50:59');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000020, 'Enroscar la vibora', '2019-02-04 17:51:03');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000020, 'Pura Fantasia', '2019-02-04 17:51:06');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000020, 'Procastinacion', '2019-02-04 17:51:10');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000031, 'Chantologia', '2019-02-04 20:53:44');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000031, 'Enroscar la vibora', '2019-02-04 20:53:48');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000031, 'Procastinacion', '2019-02-04 20:53:52');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000031, 'Versotica', '2019-02-04 20:53:56');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000033, 'Chantologia', '2019-02-11 00:56:06');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000033, 'Versotica', '2019-02-11 01:49:26');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000033, 'Pura Fantasia', '2019-02-11 01:50:37');
INSERT INTO `t_especialidad_user` (`dni`, `especialidad`, `last_update`) VALUES(1000033, 'Procastinacion', '2019-02-11 01:50:45');

-- --------------------------------------------------------

--
-- Table structure for table `t_estados`
--

CREATE TABLE `t_estados` (
  `estado` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de datos de los posibles estados de un voluntario';

--
-- Dumping data for table `t_estados`
--

INSERT INTO `t_estados` (`estado`) VALUES('Asignado');
INSERT INTO `t_estados` (`estado`) VALUES('Con_Restricc');
INSERT INTO `t_estados` (`estado`) VALUES('Desconoc');
INSERT INTO `t_estados` (`estado`) VALUES('De_Baja');
INSERT INTO `t_estados` (`estado`) VALUES('Disponible');
INSERT INTO `t_estados` (`estado`) VALUES('Interno');
INSERT INTO `t_estados` (`estado`) VALUES('ND_Temp');
INSERT INTO `t_estados` (`estado`) VALUES('Puntual');

-- --------------------------------------------------------

--
-- Table structure for table `t_hist_user_proy`
--

CREATE TABLE `t_hist_user_proy` (
  `dni` int(10) UNSIGNED NOT NULL,
  `p_num_corr_proy` int(10) UNSIGNED DEFAULT NULL,
  `f_asignac` date NOT NULL DEFAULT '2000-01-01',
  `f_desasign` date NOT NULL DEFAULT '2100-01-01',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `coment_asignac` varchar(256) DEFAULT 'No Comments',
  `coment_desasign` varchar(256) DEFAULT 'No Comments',
  `id_truch` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla registro de la asignacion y desasignacion de un voluntario a un proyecto';

--
-- Dumping data for table `t_hist_user_proy`
--

INSERT INTO `t_hist_user_proy` (`dni`, `p_num_corr_proy`, `f_asignac`, `f_desasign`, `last_update`, `coment_asignac`, `coment_desasign`, `id_truch`) VALUES(1000020, 1003, '2019-02-04', '2100-01-01', '2019-02-04 17:51:42', 'Vamos a ver si sabe', 'No Comments', 1);
INSERT INTO `t_hist_user_proy` (`dni`, `p_num_corr_proy`, `f_asignac`, `f_desasign`, `last_update`, `coment_asignac`, `coment_desasign`, `id_truch`) VALUES(1000020, 1006, '2019-02-04', '2100-01-01', '2019-02-04 17:52:25', 'Ojala se lo banque', 'No Comments', 2);
INSERT INTO `t_hist_user_proy` (`dni`, `p_num_corr_proy`, `f_asignac`, `f_desasign`, `last_update`, `coment_asignac`, `coment_desasign`, `id_truch`) VALUES(11285447, 1001, '2019-02-04', '2019-02-06', '2019-02-07 19:40:00', 'Ojala se lo banque a esta gente\r\nNo se los banco', 'No Comments', 3);
INSERT INTO `t_hist_user_proy` (`dni`, `p_num_corr_proy`, `f_asignac`, `f_desasign`, `last_update`, `coment_asignac`, `coment_desasign`, `id_truch`) VALUES(11285447, 1006, '2019-02-04', '2019-02-07', '2019-02-09 02:43:52', 'Ojala se lo banque Pero se canso y se fue', 'No quiere mas', 4);
INSERT INTO `t_hist_user_proy` (`dni`, `p_num_corr_proy`, `f_asignac`, `f_desasign`, `last_update`, `coment_asignac`, `coment_desasign`, `id_truch`) VALUES(1000031, 1002, '2019-02-04', '2100-01-01', '2019-02-04 20:54:31', 'Vamos a ver que hace aqui', 'No Comments', 5);
INSERT INTO `t_hist_user_proy` (`dni`, `p_num_corr_proy`, `f_asignac`, `f_desasign`, `last_update`, `coment_asignac`, `coment_desasign`, `id_truch`) VALUES(1000031, 1004, '2019-02-06', '2100-01-01', '2019-02-06 13:50:16', 'Vamos a ver que hace', 'No Comments', 6);
INSERT INTO `t_hist_user_proy` (`dni`, `p_num_corr_proy`, `f_asignac`, `f_desasign`, `last_update`, `coment_asignac`, `coment_desasign`, `id_truch`) VALUES(1000033, 1003, '2019-02-07', '2019-02-09', '2019-02-09 03:10:20', 'Ojala se lo banque', 'Se pudrio MALLL', 7);
INSERT INTO `t_hist_user_proy` (`dni`, `p_num_corr_proy`, `f_asignac`, `f_desasign`, `last_update`, `coment_asignac`, `coment_desasign`, `id_truch`) VALUES(1000033, 1006, '2019-02-07', '2019-02-09', '2019-02-09 03:03:44', 'Vamos a ver si se lo banca en serio', 'No quiere mas LOLA ALLI', 8);
INSERT INTO `t_hist_user_proy` (`dni`, `p_num_corr_proy`, `f_asignac`, `f_desasign`, `last_update`, `coment_asignac`, `coment_desasign`, `id_truch`) VALUES(1000033, 1002, '2019-02-07', '2019-02-09', '2019-02-09 02:59:44', 'Ojala se lo banque', 'Se pudrio de estos Plomos', 9);
INSERT INTO `t_hist_user_proy` (`dni`, `p_num_corr_proy`, `f_asignac`, `f_desasign`, `last_update`, `coment_asignac`, `coment_desasign`, `id_truch`) VALUES(11285447, 1006, '2019-02-08', '2019-02-09', '2019-02-09 02:58:13', 'Reincide', 'No quiere mas LOLA', 11);
INSERT INTO `t_hist_user_proy` (`dni`, `p_num_corr_proy`, `f_asignac`, `f_desasign`, `last_update`, `coment_asignac`, `coment_desasign`, `id_truch`) VALUES(11285447, 1002, '2019-02-07', '2019-02-09', '2019-02-09 12:29:25', 'Vamos a ver que hace aqui', 'Se pudrio de estos Plomos', 12);
INSERT INTO `t_hist_user_proy` (`dni`, `p_num_corr_proy`, `f_asignac`, `f_desasign`, `last_update`, `coment_asignac`, `coment_desasign`, `id_truch`) VALUES(1000033, 1001, '2019-02-08', '2100-01-01', '2019-02-08 11:47:01', 'A ver como se comporta aqui', 'No Comments', 15);

-- --------------------------------------------------------

--
-- Table structure for table `t_logs_estado_user`
--

CREATE TABLE `t_logs_estado_user` (
  `dni` int(10) UNSIGNED NOT NULL,
  `estado` varchar(14) NOT NULL DEFAULT 'Disponible',
  `consideraciones` varchar(256) DEFAULT 'No Comments',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_truch` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla registro del estado de un voluntario';

--
-- Dumping data for table `t_logs_estado_user`
--

INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(11077171, 'Asignado', 'Carga inicial', '2019-02-04 17:21:00', 1);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(11023715, 'Asignado', 'Carga inicial', '2019-02-04 17:21:00', 2);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(7660708, 'Asignado', 'Carga inicial', '2019-02-04 17:21:00', 3);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(93345440, 'Asignado', 'Carga inicial', '2019-02-04 17:21:00', 4);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(4383620, 'Asignado', 'Carga inicial', '2019-02-04 17:21:00', 5);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(11788722, 'ND_Temp', 'Carga inicial', '2019-02-04 17:21:00', 6);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(5315515, 'Interno', 'Carga inicial', '2019-02-04 17:21:00', 7);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(7837645, 'Asignado', 'Carga inicial', '2019-02-04 17:21:00', 8);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(4437727, 'ND_Temp', 'Carga inicial', '2019-02-04 17:21:01', 9);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(14026826, 'Asignado', 'Carga inicial', '2019-02-04 17:21:01', 10);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(8591589, 'ND_Temp', 'Carga inicial', '2019-02-04 17:21:01', 11);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(4514672, 'Interno', 'Carga inicial', '2019-02-04 17:21:01', 12);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(999999, 'ND_Temp', 'Carga inicial', '2019-02-04 17:21:01', 13);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(4373628, 'Asignado', 'Carga inicial', '2019-02-04 17:21:01', 14);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(6153590, 'Asignado', 'Carga inicial', '2019-02-04 17:21:01', 15);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(16412832, 'ND_Temp', 'Carga inicial', '2019-02-04 17:21:01', 16);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(4543686, 'ND_Temp', 'Carga inicial', '2019-02-04 17:21:01', 17);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(10125826, 'ND_Temp', 'Carga inicial', '2019-02-04 17:21:01', 18);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(10128986, 'Asignado', 'Carga inicial', '2019-02-04 17:21:01', 19);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(11285447, 'Interno', 'Carga inicial', '2019-02-04 17:21:01', 20);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(4403493, 'Disponible', 'Carga inicial', '2019-02-04 17:21:01', 21);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(12062579, 'Asignado', 'Carga inicial', '2019-02-04 17:21:01', 22);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(10161593, 'Disponible', 'Carga inicial', '2019-02-04 17:21:01', 23);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(4368430, 'Disponible', 'Carga inicial', '2019-02-04 17:21:01', 24);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(13980034, 'ND_Temp', 'Carga inicial', '2019-02-04 17:21:01', 25);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(12865409, 'Disponible', 'Carga inicial', '2019-02-04 17:21:01', 26);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(21764250, 'Asignado', 'Carga inicial', '2019-02-04 17:21:01', 27);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(17812861, 'Interno', 'Carga inicial', '2019-02-04 17:21:01', 28);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(8261239, 'Asignado', 'Carga inicial', '2019-02-04 17:21:01', 29);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(11815205, 'Asignado', 'Carga inicial', '2019-02-04 17:21:01', 30);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(10661746, 'Disponible', 'Carga inicial', '2019-02-04 17:21:01', 31);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(4381690, 'ND_Temp', 'Carga inicial', '2019-02-04 17:21:01', 32);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(26115457, 'Asignado', 'Carga inicial', '2019-02-04 17:21:01', 33);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(12861175, 'Disponible', 'Carga inicial', '2019-02-04 17:21:01', 34);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(11467178, 'Disponible', 'Carga inicial', '2019-02-04 17:21:01', 35);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(10123767, 'Asignado', 'Carga inicial', '2019-02-04 17:21:01', 36);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(4311689, 'Disponible', 'Carga inicial', '2019-02-04 17:21:01', 37);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(4747813, 'ND_Temp', 'Carga inicial', '2019-02-04 17:21:01', 38);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(18475365, 'Asignado', 'Carga inicial', '2019-02-04 17:21:01', 39);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(92334192, 'Disponible', 'Carga inicial', '2019-02-04 17:21:01', 40);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(7375447, 'Asignado', 'Carga inicial', '2019-02-04 17:21:01', 41);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(29217019, 'Asignado', 'Carga inicial', '2019-02-04 17:21:01', 42);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(7638418, 'Asignado', 'Carga inicial', '2019-02-04 17:21:01', 43);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(8406769, 'Asignado', 'Carga inicial', '2019-02-04 17:21:02', 44);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(6082141, 'Asignado', 'Carga inicial', '2019-02-04 17:21:02', 45);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(14809026, 'Asignado', 'Carga inicial', '2019-02-04 17:21:02', 46);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(17481570, 'ND_Temp', 'Carga inicial', '2019-02-04 17:21:02', 47);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(11368729, 'Con_Restricc', 'Carga inicial', '2019-02-04 17:21:02', 48);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(12107641, 'Asignado', 'Carga inicial', '2019-02-04 17:21:02', 49);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(11524703, 'Disponible', 'Carga inicial', '2019-02-04 17:21:02', 50);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(11802203, 'Asignado', 'Carga inicial', '2019-02-04 17:21:02', 51);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(4412265, 'Disponible', 'Carga inicial', '2019-02-04 17:21:02', 52);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(10558702, 'Asignado', 'Carga inicial', '2019-02-04 17:21:02', 53);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(6714305, 'ND_Temp', 'Carga inicial', '2019-02-04 17:21:02', 54);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(11997550, 'Disponible', 'Carga inicial', '2019-02-04 17:21:02', 55);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(4556079, 'ND_Temp', 'Carga inicial', '2019-02-04 17:21:02', 56);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(10110647, 'Asignado', 'Carga inicial', '2019-02-04 17:21:02', 57);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(7685597, 'Asignado', 'Carga inicial', '2019-02-04 17:21:02', 58);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(4553179, 'Disponible', 'Carga inicial', '2019-02-04 17:21:02', 59);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(7704808, 'Disponible', 'Carga inicial', '2019-02-04 17:21:02', 60);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(4444524, 'Disponible', 'Carga inicial', '2019-02-04 17:21:02', 61);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(93445268, 'Asignado', 'Carga inicial', '2019-02-04 17:21:02', 62);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(94602041, 'Asignado', 'Carga inicial', '2019-02-04 17:21:02', 63);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(11362109, 'Asignado', 'Carga inicial', '2019-02-04 17:21:02', 64);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(12601664, 'ND_Temp', 'Carga inicial', '2019-02-04 17:21:02', 65);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(14927381, 'Asignado', 'Carga inicial', '2019-02-04 17:21:02', 66);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(22759102, 'Asignado', 'Carga inicial', '2019-02-04 17:21:02', 67);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(4548676, 'Disponible', 'Carga inicial', '2019-02-04 17:21:02', 68);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(12463662, 'ND_Temp', 'Carga inicial', '2019-02-04 17:21:02', 69);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(24569384, 'ND_Temp', 'Carga inicial', '2019-02-04 17:21:02', 70);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(17233641, 'Disponible', 'Carga inicial', '2019-02-04 17:21:02', 71);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(12600203, 'Asignado', 'Carga inicial', '2019-02-04 17:21:02', 72);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(12865523, 'ND_Temp', 'Carga inicial', '2019-02-04 17:21:02', 73);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(4536924, 'Disponible', 'Carga inicial', '2019-02-04 17:21:02', 74);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(13237942, 'Disponible', 'Carga inicial', '2019-02-04 17:21:02', 75);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(10260310, 'Interno', 'Carga inicial', '2019-02-04 17:21:02', 76);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(12001693, 'Asignado', 'Carga inicial', '2019-02-04 17:21:02', 77);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(13211906, 'ND_Temp', 'Carga inicial', '2019-02-04 17:21:02', 78);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(11710217, 'Disponible', 'Carga inicial', '2019-02-04 17:21:02', 79);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(8627432, 'Asignado', 'Carga inicial', '2019-02-04 17:21:02', 80);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(4520142, 'Asignado', 'Carga inicial', '2019-02-04 17:21:02', 81);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(4357215, 'Disponible', 'Carga inicial', '2019-02-04 17:21:02', 82);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(11478659, 'Asignado', 'Carga inicial', '2019-02-04 17:21:02', 83);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(4981277, 'Disponible', 'Carga inicial', '2019-02-04 17:21:02', 84);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(17446349, 'Asignado', 'Carga inicial', '2019-02-04 17:21:02', 85);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(7604925, 'ND_Temp', 'Carga inicial', '2019-02-04 17:21:03', 86);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000210, 'ND_Temp', 'No Comments', '2019-02-04 17:21:03', 87);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000211, 'ND_Temp', 'No Comments', '2019-02-04 17:21:03', 88);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(7621101, 'Disponible', 'No Comments', '2019-02-04 17:21:03', 89);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000212, 'ND_Temp', 'No Comments', '2019-02-04 17:21:03', 90);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(5931630, 'Disponible', 'No Comments', '2019-02-04 17:21:03', 91);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000213, 'Puntual', 'No Comments', '2019-02-04 17:21:03', 92);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(20665260, 'Asignado', 'No Comments', '2019-02-04 17:21:03', 93);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000214, 'Disponible', 'No Comments', '2019-02-04 17:21:03', 94);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000215, 'ND_Temp', 'No Comments', '2019-02-04 17:21:03', 95);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000216, 'ND_Temp', 'No Comments', '2019-02-04 17:21:03', 96);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000217, 'Disponible', 'No Comments', '2019-02-04 17:21:03', 97);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000218, 'ND_Temp', 'No Comments', '2019-02-04 17:21:03', 98);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000219, 'Disponible', 'No Comments', '2019-02-04 17:21:03', 99);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000220, 'Asignado', 'No Comments', '2019-02-04 17:21:03', 100);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000221, 'ND_Temp', 'No Comments', '2019-02-04 17:21:03', 101);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000200, 'Disponible', 'Carga Inicial DC', '2019-02-04 17:21:03', 103);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(13394776, 'Disponible', 'Carga Inicial DC', '2019-02-04 17:21:03', 104);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(93609657, 'Disponible', 'Carga Inicial DC', '2019-02-04 17:21:03', 105);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(12332887, 'Disponible', 'Carga Inicial DC', '2019-02-04 17:21:03', 106);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(14772995, 'Disponible', 'Carga Inicial DC', '2019-02-04 17:21:03', 107);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000201, 'Disponible', 'Carga Inicial DC', '2019-02-04 17:21:03', 108);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000202, 'Disponible', 'Carga Inicial DC', '2019-02-04 17:21:03', 109);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000203, 'Disponible', 'Carga Inicial DC', '2019-02-04 17:21:03', 110);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000204, 'Disponible', 'Carga Inicial DC', '2019-02-04 17:21:03', 111);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000205, 'Disponible', 'Carga Inicial DC', '2019-02-04 17:21:03', 112);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000206, 'Disponible', 'Carga Inicial DC', '2019-02-04 17:21:03', 113);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000207, 'Disponible', 'Carga Inicial DC', '2019-02-04 17:21:03', 114);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1, 'Desconoc', 'Carga Inicial DC Titular ficticio', '2019-02-04 17:24:33', 115);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(2, 'Desconoc', 'Carga Inicial DC Suplente ficticio', '2019-02-04 17:24:51', 116);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000020, 'Disponible', 'Estado Inicial de Nuevo Voluntario', '2019-02-04 17:49:25', 117);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000020, 'Asignado', 'Vamos a ver si sabe', '2019-02-04 17:51:42', 118);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000020, 'Asignado', 'Ojala se lo banque', '2019-02-04 17:52:25', 119);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(11285447, 'Disponible', 'Estaba regustrado como Interno', '2019-02-04 18:31:34', 120);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(11285447, 'Asignado', 'Ojala se lo banque a esta gente', '2019-02-04 18:32:48', 121);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(11285447, 'Asignado', 'Ojala se lo banque', '2019-02-04 20:51:10', 122);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000031, 'Disponible', 'Estado Inicial de Nuevo Voluntario', '2019-02-04 20:53:26', 123);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000031, 'Asignado', 'Vamos a ver que hace aqui', '2019-02-04 20:54:31', 124);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000031, 'Asignado', 'Vamos a ver que hace', '2019-02-06 13:50:16', 125);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000033, 'Disponible', 'Estado Inicial de Nuevo Voluntario', '2019-02-07 13:35:37', 126);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000033, 'Asignado', 'Ojala se lo banque', '2019-02-07 13:36:00', 127);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000033, 'Asignado', 'Vamos a ver si se lo banca en serio', '2019-02-07 13:36:23', 128);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000033, 'Asignado', 'Ojala se lo banque', '2019-02-07 13:42:41', 129);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(11285447, 'Asignado', 'Vamos a ver que hace aqui', '2019-02-07 19:20:07', 130);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(11285447, 'Asignado', 'Otra vez por aqui!!!!', '2019-02-07 20:46:47', 131);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000033, 'Asignado', 'A ver como se comporta aqui', '2019-02-08 11:47:01', 132);
INSERT INTO `t_logs_estado_user` (`dni`, `estado`, `consideraciones`, `last_update`, `id_truch`) VALUES(1000225, 'Disponible', 'Estado Inicial de Nuevo Voluntario', '2019-02-13 20:33:36', 133);

--
-- Triggers `t_logs_estado_user`
--
DELIMITER $$
CREATE TRIGGER `after_t_logs_estado_user_insert` AFTER INSERT ON `t_logs_estado_user` FOR EACH ROW BEGIN
    UPDATE  t_users2
    SET 
     dni = NEW.dni,
     estado = NEW.estado,
     last_update = NOW()
     WHERE dni=NEW.dni ; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_t_logs_estado_user_update` AFTER UPDATE ON `t_logs_estado_user` FOR EACH ROW BEGIN
    UPDATE t_users2
    SET 
    dni = OLD.dni,
     estado = NEW.estado,
     last_update = NOW()
     WHERE OLD.dni=NEW.dni ;  
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `t_osc`
--

CREATE TABLE `t_osc` (
  `osc_nombre` varchar(128) NOT NULL,
  `osc_calle_1` varchar(64) DEFAULT NULL,
  `osc_num_1` varchar(6) DEFAULT NULL,
  `osc_ciudad_1` varchar(32) DEFAULT NULL,
  `osc_cp_1` varchar(8) DEFAULT NULL,
  `osc_prov_1` varchar(12) DEFAULT NULL,
  `osc_calle_2` varchar(64) DEFAULT NULL,
  `osc_num_2` varchar(6) DEFAULT NULL,
  `osc_ciudad_2` varchar(32) DEFAULT NULL,
  `osc_cp_2` varchar(8) DEFAULT NULL,
  `osc_prov_2` varchar(12) DEFAULT NULL,
  `osc_pag_web` varchar(128) DEFAULT NULL,
  `osc_estado` varchar(16) NOT NULL DEFAULT 'Identificada',
  `osc_acuerdo` enum('Firmado','Pendiente','N/D') DEFAULT 'N/D',
  `osc_notas` varchar(256) DEFAULT 'No hay notas',
  `osc_dc_tit` int(10) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'El numero de dni del DC Titular',
  `osc_f_titular` date NOT NULL DEFAULT '2000-01-01' COMMENT 'Fecha asignacion del DC Titular',
  `osc_dc_supl` int(10) UNSIGNED NOT NULL DEFAULT '2' COMMENT 'El numero de dni del DC Suplente',
  `osc_f_supl` date NOT NULL DEFAULT '2000-01-01' COMMENT 'Fecha asignacion del DC Suplente',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de los datos basicos de una OSC';

--
-- Dumping data for table `t_osc`
--

INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('A.C.I.A.P.O.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 1000203, '2019-02-04', 1000202, '2019-02-04', '2019-02-04 19:41:22');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('AAA Los Falsos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Que haran estos', 1000201, '2019-02-04', 2, '2019-02-04', '2019-02-04 20:58:15');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('AAA Los Truchos ORG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Vamos a ver que hacen', 1000203, '2019-02-04', 2, '2019-02-04', '2019-02-04 21:29:49');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('AAAEPAD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit\r\nCambio DC Suplente', 1000205, '2019-01-01', 1000200, '2000-01-01', '2019-02-04 19:43:20');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('AAPPG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000200, '2019-01-01', 1000201, '2019-02-04', '2019-02-04 19:51:23');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ABRIL SOLIDARIO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000205, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ACCERVIL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 14772995, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ACDE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 1000206, '2019-01-01', 1000204, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ACEPAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 1000202, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ACIFAD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000207, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ADC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 13394776, '2019-01-01', 93609657, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ADESAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 14772995, '2019-01-01', 1000206, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ADOBE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'En_Conversacion', 'Firmado', 'Asignacion DC Supl', 1000202, '2019-01-01', 13394776, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ADOPTARE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('AEDIN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 13394776, '2019-01-01', 1000201, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('AEDROS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 1000206, '2019-01-01', 1000204, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('AEPSO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000207, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('AGAPAO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 14772995, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('AIKEN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 14772995, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('AL REPARO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000207, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ALANON', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000207, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ALDEAS INFANTILES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'En_Conversacion', 'N/D', 'Asignacion DC Supl', 14772995, '2019-01-01', 1000203, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ALEGRIA INTENSIVA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000207, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ALIMENTARIS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 1000200, '2019-01-01', 1000201, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ALMA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 93609657, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ALPAD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000207, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ALPI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'En_Actividad', 'Firmado', 'Asignacion DC Supl', 1000202, '2019-01-01', 1000201, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ALTERNATIVA 3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 1000202, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('AMA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('AMARANTA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 13394776, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('AMARTYA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 1000202, '2019-01-01', 93609657, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('AMERICAN JOINT DISTRIBUTION COMMITTEE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 1000204, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('AMIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 1000204, '2019-01-01', 1000203, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('AMJA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 1000205, '2019-01-01', 1000204, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ANDARES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 1000204, '2019-01-01', 13394776, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ANIDAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ANUAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 1000207, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('Anybody Argentina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 14772995, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('APA (Asoc.Psicoanalitica Argentina)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'En_Actividad', 'Pendiente', 'Asignacion DC Tit', 1000200, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('APAER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 1000204, '2019-01-01', 14772995, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ARGENTINA NARRADA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 1000200, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ARPA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ARTE Y ESPERANZA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 93609657, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ARTESANIAS ARGENTINAS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000207, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ARTICULAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ASAC Asoc.Ayuda al Ciego', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 13394776, '2019-01-01', 1000201, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ASCINUEN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000205, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ASDRA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 1000206, '2019-01-01', 1000207, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ASHOKA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 1000202, '2019-01-01', 93609657, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ASOCIACION ARGENTINA DE EDUCADORES SEXUALES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000207, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ASOCIACION ARGENTINA DE KARATE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000205, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ASOCIACIÓN CIVIL ORY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ASOCIACION FILANTROPICA ISRAELITA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000204, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ASOCIACION MUTUAL SENDEROS (MTE)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ASPERGER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('AVANZAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 13394776, '2019-01-01', 1000200, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('AVES ARGENTINAS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 13394776, '2019-01-01', 1000203, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('BANCO DE ALIMENTOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 1000204, '2019-01-01', 13394776, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('BASTONES VERDES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000204, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('BOCA SOCIAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 1000206, '2019-01-01', 1000201, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('BRINCAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 93609657, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CAII', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 1000205, '2019-01-01', 1000207, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CAMBIO DEMOCRATICO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000201, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CAMINANDO JUNTOS (UNITED WAY)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 13394776, '2019-01-01', 12332887, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CANALES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000202, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CARE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000201, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CARITAS NACIONAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 1000200, '2019-01-01', 1000202, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CARLOS DIAZ VELEZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 1000204, '2019-01-01', 93609657, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CASA DEL ENCUENTRO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000205, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CASA DEL NIÑO NUEVA FAMILIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 93609657, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CASA DEL TEATRO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 1000204, '2019-01-01', 14772995, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CASA RAFAEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 1000202, '2019-01-01', 1000200, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CAZADORES DE ARTE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CENTRO THEVENET', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 14772995, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CERO A LA DERECHA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 14772995, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CESUM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 14772995, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CHAP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 14772995, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CHICOS NATURALISTAS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CIENCIA PARA TODOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 13394776, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CILSA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 1000202, '2019-01-01', 93609657, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CIMIENTOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 13394776, '2019-01-01', 1000204, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CIRCO SOCIAL DEL SUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 13394776, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CIUDADANOS DEL MUNDO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('Club de amigos mios', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 1000202, '2019-01-01', 12332887, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CLUB DEPORTIVO BONGIOVANNI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 1000205, '2019-01-01', 13394776, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('COLEGIO DE ESCRIBANOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 1000204, '2019-01-01', 1000200, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('COLEGIO MADRE TERESA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 14772995, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('Comprometerse mas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 93609657, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('COMPROMISO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 93609657, '2019-01-01', 1000202, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('COMUNIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 1000200, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CONCIENCIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 93609657, '2019-01-01', 1000204, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CONIN LUJAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 93609657, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CONVIVIR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 13394776, '2019-01-01', 1000202, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('COOPERATIVA DECAPOLIS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 14772995, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('COSIENDO REDES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 13394776, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CREANDO LAZOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 93609657, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CREAR CAMINOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CREAR VALE LA PENA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 1000202, '2019-01-01', 1000201, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CRUZ ROJA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 1000207, '2019-01-01', 93609657, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CUENTA CONMIGO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CULTIVARTE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000207, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('CURAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('DAD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 1000201, '2019-01-01', 93609657, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('DALE TU MANO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 93609657, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('DAMAS ROSADAS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000201, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('DAR ES DAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000207, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('DE LA NADA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 13394776, '2019-01-01', 1000201, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('DEBRA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 1000205, '2019-01-01', 93609657, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('DEFENSORES DEL CHACO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 13394776, '2019-01-01', 1000200, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('DEHUM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 13394776, '2019-01-01', 14772995, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('DESAFIO E IGUALDAD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 13394776, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('DETODOSPARATODOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000201, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('DIAGONAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 14772995, '2019-01-01', 1000205, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('DIGNIDAD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000205, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('DISCAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 1000204, '2019-01-01', 1000202, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('Don Orione', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 1000204, '2019-01-01', 13394776, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('DONAR SANGRE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('DONCEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 1000202, '2019-01-01', 93609657, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('DONDE QUIERO ESTAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 13394776, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ECOCLUBES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 1000204, '2019-01-01', 1000200, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('EDUCACION PARA COMPARTIR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 1000202, '2019-01-01', 93609657, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('EDUCAR Y CRECER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 13394776, '2019-01-01', 14772995, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('EJERCITO DE SALVACION', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 1000203, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('EL ALMENDRO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 13394776, '2019-01-01', 93609657, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('EL ARRANQUE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 93609657, '2019-01-01', 13394776, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('EL PUENTE POSIBLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 13394776, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('EL REPARO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 93609657, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('EMAUS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 14772995, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('EMILIE JENECHERU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ENABLIS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 1000204, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ENDEAVOR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 1000204, '2019-01-01', 1000203, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ENSEÑA POR ARG.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 13394776, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('EQUIDAD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000202, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ESCLEROSIS MULTIPLE ARGENTINA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 1000203, '2019-01-01', 93609657, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ESCOLARES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000204, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ESCUELA TALLER FATIMA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 93609657, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ESCUELAS DEL BICENTENARIO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 13394776, '2019-01-01', 1000204, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('Espacio de Escucha', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 1000200, '2019-01-01', 14772995, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ESPERANZA VIVA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 14772995, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ETIS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 13394776, '2019-01-01', 1000201, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('EVE (Eduacación en Valores)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000200, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('FADEPOF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('FAIAM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000202, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('FANDA   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 93609657, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('FARN -Ambiente y Recursos Naturales', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 1000207, '2019-01-01', 1000202, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('FE Y ALEGRIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000201, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('FEPAIS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000205, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('FERIADO AL PLANETA ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 14772995, '2019-01-01', 13394776, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('FIORIRE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 1000200, '2019-01-01', 1000207, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('FLEXER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 1000206, '2019-01-01', 1000203, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('FLOR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000207, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('FOC  (Fund.Org.Comunitaria)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('FONGA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 13394776, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('FORES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 1000204, '2019-01-01', 1000201, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('FORGE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 13394776, '2019-01-01', 12332887, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('FORO DEL SECTOR SOCIAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 1000204, '2019-01-01', 13394776, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('FOVEFOMI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 93609657, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('FRENTE JOVEN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000205, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('FUCA - Fundación para la Investigación y la Prevención del Cáncer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 1000202, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('FUND.TODAVIA ES TIEMPO - HOGAR EL ARCA DE NOE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000207, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('FUNDACION DE TRANSPLANTE HEPATICO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 13394776, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('FUNDACION DIGNAMENTE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('FUNDACION EVOLUCION', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000200, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('Fundacion Inter Americana del Corazón - Argentina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000200, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('Fundación Lebensohn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 14772995, '2019-01-01', 1000205, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('FUNDACION MARIA CECILIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 14772995, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('FUNDACION MONTESSORI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('FUNDACIÓN PARA EL BIENESTAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('Fundacion Ronald McDonald', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 1000204, '2019-01-01', 1000203, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('FUNDACION SENDERO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('Fundacion Sistema B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 1000204, '2019-01-01', 93609657, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('FUNDACION SUMA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000204, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('FUNDACIÓN VIDA y ESPERANZA (FUNDAVE)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('FUPREMUS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('GARRAHAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 1000204, '2019-01-01', 1000203, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('GDFE (Grupo de FUndaciones y Empresas)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 1000206, '2019-01-01', 1000204, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('GERMINAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('GERMINARE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 1000202, '2019-01-01', 1000204, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('GRAN CHACO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 93609657, '2019-01-01', 1000204, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('GRANJA ANDAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 13394776, '2019-01-01', 1000200, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('GRANO DE MOSTAZA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 93609657, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('GREENPEACE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 1000202, '2019-01-01', 1000206, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('GUIDO BUFFO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 93609657, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('HABITAT PARA LA HUMANIDAD ARGENTINA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('HACIENDO CAMINO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 1000207, '2019-01-01', 1000205, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('HACIENDO LIO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000207, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('HAMPATU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000207, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('Hecho por Nosotros/Animana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 1000207, '2019-01-01', 1000200, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('HELP ARG.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 93609657, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('HERMANAS HOSPITALARIAS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 93609657, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('HOGAR DE SAN JOSE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('HOGAR MA.DEL ROSARIO DE SAN NICOLAS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 93609657, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('HOGAR MARIA LUISA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 93609657, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('HOGAR NIÑO JESUS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 14772995, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('HOGAR SAGRADA FAMILIA/PILAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 93609657, '2019-01-01', 13394776, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('HOGAR SANTA RAFAELA MARIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 93609657, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('HORIZONTE DE MAXIMA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 13394776, '2019-01-01', 1000207, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('HUERTA NIÑO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 13394776, '2019-01-01', 1000201, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('HUESPED', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 1000204, '2019-01-01', 1000202, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('IDEALISTAS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000201, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('IDEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000207, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('IELADEINU  (Jabad Lubavitch)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000204, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('IMPULSAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 1000204, '2019-01-01', 1000204, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('INAC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 1000201, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('INCLUBYTE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('INFANT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 1000202, '2019-01-01', 1000204, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('INTEGRAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 13394776, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('IONKOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 1000202, '2019-01-01', 93609657, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('JOVENES EN ACCION', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000205, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('L.A.L.C.E.C.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 1000202, '2019-01-01', 93609657, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('LA BASE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 93609657, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('LA COLIFATA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 1000203, '2019-01-01', 1000202, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('LA FLECHA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 13394776, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('LA LIGA DE LA LECHE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 1000207, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('LA NACION D1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 1000202, '2019-01-01', 1000201, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('LA NUBE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 14772995, '2019-01-01', 1000203, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('LA REVISTITA MULTICULTURAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 13394776, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('LA SCALA DE SAN TELMO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000204, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('LA USINA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('LAPDI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000207, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('LAS CARITAS DEL TUYU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000205, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('LAS TUNAS ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 93609657, '2019-01-01', 1000204, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('LEER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000204, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('LEKOTEK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 14772995, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('LOS HIJOS DEL CAMPO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('LOS NARANJOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 1000204, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('LUCERO DEL ALBA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 93609657, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('LUZ DE ESPERANZA ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 14772995, '2019-01-01', 13394776, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('MADRE TIERRA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 1000205, '2019-01-01', 1000200, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('MADRES DE SAN LORENZO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 13394776, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('MANOS ABIERTAS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000201, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('MANOS DE LA CAVA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 14772995, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('MANOS EN ACCION', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 1000200, '2019-01-01', 14772995, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('MANOS VERDES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('MARIA DE LAS CARCELES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 1000202, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('MARIA DE OS ANGELES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 13394776, '2019-01-01', 1000201, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('MATERNA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000207, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('MATRIARCADO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 13394776, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('MEDIA  PILA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 93609657, '2019-01-01', 1000204, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('MENSAJEROS DE LA PAZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 14772995, '2019-01-01', 1000207, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('MICROJUSTICIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 13394776, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('MINKAI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 14772995, '2019-01-01', 1000200, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('MISIONES RURALES ARGENTINAS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 93609657, '2019-01-01', 13394776, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('MISSING CHILDREN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000202, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('MOVILIZARSE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 13394776, '2019-01-01', 93609657, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('MUJERES 2000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 12332887, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('MUNDO SANO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 1000204, '2019-01-01', 1000200, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('MUSEO DE ARTE MODERNO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 1000206, '2019-01-01', 1000205, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('MUSEO DEL HOLOCAUSTO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 1000204, '2019-01-01', 1000200, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('MUSEO MUJICA LAINEZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 93609657, '2019-01-01', 1000200, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('NORDELTA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 1000203, '2019-01-01', 1000204, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('NOSOTROS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 13394776, '2019-01-01', 1000204, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('NUTRIR LA VIDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 1000204, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('OAJNU (org.arg.jov.para nac unidas)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 93609657, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('OBRA DEL PADRE MARIO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 1000207, '2019-01-01', 14772995, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('OLIMPIADAS ESPECIALES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 13394776, '2019-01-01', 93609657, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('PALLIUM LATINOAMERICA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000201, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('PANZAS LLENAS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000205, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('PAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 93609657, '2019-01-01', 1000201, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('PARROQUIA SANTA MARIA DEL CAMINO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000207, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('PASTORAL SOCIAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 1000206, '2019-01-01', 1000201, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('PATA PILA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 14772995, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('PELOTA DE TRAPO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 1000204, '2019-01-01', 1000201, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('PEREGRINA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 1000205, '2019-01-01', 14772995, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('PESCAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 13394776, '2019-01-01', 1000203, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('PH 15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 1000201, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('PIEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('PIES DESCALZOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 13394776, '2019-01-01', 93609657, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('PILARES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 1000205, '2019-01-01', 13394776, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('PODER CIUDADANO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 1000204, '2019-01-01', 1000201, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('PROACTIVA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('PROEM -Proyecto Emprender', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000204, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('PROGRESAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 14772995, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('PROTEGE TU CORAZON', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 14772995, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('PROYECTAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000207, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('PROYECTO DE LUZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 93609657, '2019-01-01', 1000207, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('Proyecto Empujar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 1000207, '2019-01-01', 1000204, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('PROYECTOS PADRES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 1000203, '2019-01-01', 1000204, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('RAMSEYER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 93609657, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('RECIDUCA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000204, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('RED  DE INNOVACION LOCAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000207, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('RED DE BANCO DE ALIMENTOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 13394776, '2019-01-01', 1000204, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('RED DE COMUNIDADES RURALES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 1000202, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('RESPONDE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 1000201, '2019-01-01', 93609657, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('RUBICOM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000201, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('RUGBY SIN FRONTERAS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 1000200, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('RUGBY SOLIDARIO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000201, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('RUTA 40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 93609657, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('SAGIJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('SAHDES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('SECHI/CIUDAD OCULTA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 13394776, '2019-01-01', 1000201, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('SECHI/LACARRA-CARRILLO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 13394776, '2019-01-01', 1000201, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('SEGUNDA OPORTUNIDAD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('SEMBRAR VALORES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 14772995, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('SES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 1000204, '2019-01-01', 1000201, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('SILOE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 1000205, '2019-01-01', 1000206, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('SOLIDAGRO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 13394776, '2019-01-01', 1000204, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('SONRISAS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 1000207, '2019-01-01', 1000206, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('STEPS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 93609657, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('SUMA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 1000204, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('SUMANDO ARG.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 14772995, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('SUR SOLIDARIO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 1000206, '2019-01-01', 1000205, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('SURCOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 1000202, '2019-01-01', 13394776, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('TECHO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 1000200, '2019-01-01', 93609657, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('TEMAS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 13394776, '2019-01-01', 1000206, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('TREN DEL ALMA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 13394776, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('Truchos 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Truchos 1', 1, '2000-01-01', 2, '2000-01-01', '2019-02-10 23:36:05');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('Truchos 2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Truchos 2', 1, '2000-01-01', 2, '2000-01-01', '2019-02-10 23:36:36');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('Truchos 20', 'Moreno', '3333', 'CABA', '1428', '', '', '', '', '', '', 'www.truchos.org.ar', 'Identificada', 'Pendiente', 'Son muy truchos', 1000202, '2019-02-12', 1000203, '2019-02-12', '2019-02-12 11:55:54');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('Truchos 21', 'Combet', '6077', 'Villa Ballester', '1653', 'Buenos AIres', '', '', '', '', '', 'www.tr30.org.ar', 'Identificada', 'Pendiente', 'Recontra truchex', 1, '2000-01-01', 2, '2000-01-01', '2019-02-13 14:14:54');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('Truchos 22', 'Moreno', '6077', 'Villa Ballester', '1428', 'Buenos AIres', 'N/D', '', '', '', '', '', 'Identificada', 'Pendiente', 'Son muy truchos', 1, '2000-01-01', 2, '2000-01-01', '2019-02-13 14:23:33');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('Truchos 23', 'Combet', '3333', 'Villa Ballester', '1428', 'Buenos AIres', 'N/D', '', '', '', '', 'www.truchos.org.ar', 'Identificada', 'N/D', 'Recontra truchex', 1, '2000-01-01', 2, '2000-01-01', '2019-02-13 14:24:45');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('Truchos 24', 'N/D', 'N/D', 'N/D', 'N/D', 'N/D', 'N/D', 'N/D', 'N/D', 'N/D', 'N/D', 'N/D', 'Identificada', 'N/D', 'No hay notas', 1, '2000-01-01', 2, '2000-01-01', '2019-02-13 14:32:38');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('Truchos 25', 'N/D', 'N/D', 'N/D', 'N/D', 'N/D', 'N/D', 'N/D', 'N/D', 'N/D', 'N/D', '', 'Identificada', 'Pendiente', 'No hay notas', 1, '2000-01-01', 2, '2000-01-01', '2019-02-13 14:34:03');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('Truchos 3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Truchos 3', 1, '2000-01-01', 2, '2000-01-01', '2019-02-10 23:38:37');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('Truchos 4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Truchos 4', 1, '2000-01-01', 2, '2000-01-01', '2019-02-10 23:43:10');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('TZEDAKA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 1000204, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('U.D.E.S.A.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000204, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('UASI-LA CAVA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 14772995, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('UNA MANO QUE AYUDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 1000205, '2019-01-01', 1000204, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('UNIENDO CAMINOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 13394776, '2019-01-01', 1000202, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('UNION GITANA UNIVERSAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000206, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('UNIVERSO AGORA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Supl', 93609657, '2019-01-01', 1000201, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('VALORES PARA CRECER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 93609657, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('VERGEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 14772995, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('VICAR.EPISC DE EDU DEL ARZ. DE BS.AS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Tit', 1000202, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('VIDA SILVESTRE ARGENTINA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 1000200, '2019-01-01', 1000206, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('VISITAS ANIMADAS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 93609657, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('VIVIENDA DIGNA (SAG FAMILIA)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 1000202, '2019-01-01', 1000207, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('VOCES VITALES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 1000204, '2019-01-01', 93609657, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('WENTEMIL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Pendiente', 'Asignacion DC Tit', 1000207, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:07');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('WINGU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'Firmado', 'Asignacion DC Supl', 1000200, '2019-01-01', 93609657, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('YONOFUI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Supl', 1000200, '2019-01-01', 1000200, '2019-01-01', '2019-02-04 17:21:09');
INSERT INTO `t_osc` (`osc_nombre`, `osc_calle_1`, `osc_num_1`, `osc_ciudad_1`, `osc_cp_1`, `osc_prov_1`, `osc_calle_2`, `osc_num_2`, `osc_ciudad_2`, `osc_cp_2`, `osc_prov_2`, `osc_pag_web`, `osc_estado`, `osc_acuerdo`, `osc_notas`, `osc_dc_tit`, `osc_f_titular`, `osc_dc_supl`, `osc_f_supl`, `last_update`) VALUES('ZAMBRANO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Identificada', 'N/D', 'Asignacion DC Tit', 1000204, '2019-01-01', 2, '2000-01-01', '2019-02-04 17:21:08');

--
-- Triggers `t_osc`
--
DELIMITER $$
CREATE TRIGGER `after_t_osc_insert` AFTER INSERT ON `t_osc` FOR EACH ROW BEGIN


		IF NEW.osc_dc_tit != '1' 
		THEN
			INSERT INTO t_osc_logs_dc 	(osc_nombre, dni, osc_rol_dc,osc_f_cambio,osc_comentarios_dc)
			VALUES 						(NEW.osc_nombre, NEW.osc_dc_tit, "Titular", NEW.osc_f_titular,"Se asigno DC TITULAR");
       END IF;

        IF NEW.osc_dc_supl != '2' 
        THEN
			INSERT INTO t_osc_logs_dc 	(osc_nombre, 	dni, 			osc_rol_dc,	osc_f_cambio,osc_comentarios_dc)
			VALUES (NEW.osc_nombre, NEW.osc_dc_supl, 'Suplente', NEW.osc_f_supl,"Se asigno DC SUPLENTE");
		END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_t_osc_update` AFTER UPDATE ON `t_osc` FOR EACH ROW BEGIN

	IF NEW.osc_dc_tit != OLD.osc_dc_tit
    THEN
        IF OLD.osc_dc_tit = '1'
        THEN
			INSERT INTO t_osc_logs_dc 	(osc_nombre, dni, osc_rol_dc,osc_f_cambio,osc_comentarios_dc)
			VALUES 						(OLD.osc_nombre, NEW.osc_dc_tit, "Titular", NEW.osc_f_titular,"Se asigno DC TITULAR");
        ELSE
			IF NEW.osc_dc_tit = 1
			THEN
				INSERT INTO t_osc_logs_dc 	(osc_nombre, dni, osc_rol_dc,osc_f_cambio,osc_comentarios_dc)
				VALUES 						(OLD.osc_nombre, NEW.osc_dc_tit, "No_Asignado", NEW.osc_f_titular,"Se desasigno DC TITULAR");
			ELSE
				INSERT INTO t_osc_logs_dc 	(osc_nombre, dni, osc_rol_dc,osc_f_cambio,osc_comentarios_dc)
				VALUES 						(OLD.osc_nombre, NEW.osc_dc_tit, "Titular", NEW.osc_f_titular,"Se cambio DC TITULAR");
			END IF;
		END IF;	
    END IF;    
   
    IF NEW.osc_dc_supl != OLD.osc_dc_supl
    THEN
       IF OLD.osc_dc_supl = '2'
       THEN   
			INSERT INTO `t_osc_logs_dc`	(`osc_nombre`,`dni`,`osc_rol_dc`,`osc_f_cambio`,osc_comentarios_dc)
			VALUES 	(OLD.osc_nombre, NEW.osc_dc_supl, "Suplente", NEW.osc_f_supl,"Se asigno DC SUPLENTE");
		ELSE
			IF NEW.osc_dc_supl = '2'
			THEN
				INSERT INTO `t_osc_logs_dc`	(`osc_nombre`,`dni`,`osc_rol_dc`,`osc_f_cambio`,osc_comentarios_dc)
				VALUES 	(OLD.osc_nombre, NEW.osc_dc_supl, "No_Asignado", NEW.osc_f_supl,"Se desasigno DC SUPLENTE");
			ELSE
				INSERT INTO `t_osc_logs_dc`	(`osc_nombre`,`dni`,`osc_rol_dc`,`osc_f_cambio`,osc_comentarios_dc)
				VALUES 	(OLD.osc_nombre, NEW.osc_dc_supl, "Suplente", NEW.osc_f_supl,"Se cambio DC SUPLENTE");
			END IF;
		END IF;
	END IF;			
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `t_osc_contactos`
--

CREATE TABLE `t_osc_contactos` (
  `osc_nombre` varchar(128) NOT NULL,
  `osc_contacto_apellido` varchar(45) NOT NULL,
  `osc_contacto_nombres` varchar(45) NOT NULL,
  `osc_contacto_cel` varchar(20) NOT NULL DEFAULT 'N/D',
  `osc_contacto_tel_fijo` varchar(20) NOT NULL DEFAULT 'N/D',
  `osc_contacto_email` varchar(50) NOT NULL DEFAULT 'N/D',
  `osc_contacto_posicion` varchar(64) NOT NULL DEFAULT 'N/D',
  `osc_contacto_horario` varchar(256) NOT NULL DEFAULT 'No hay detalle',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de los contactos correspondientes a una OSC';

-- --------------------------------------------------------

--
-- Table structure for table `t_osc_estados`
--

CREATE TABLE `t_osc_estados` (
  `osc_estado` varchar(16) NOT NULL DEFAULT 'Desconocido'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lista de los posibles estados de una OSC';

--
-- Dumping data for table `t_osc_estados`
--

INSERT INTO `t_osc_estados` (`osc_estado`) VALUES('Contactada');
INSERT INTO `t_osc_estados` (`osc_estado`) VALUES('Descartada');
INSERT INTO `t_osc_estados` (`osc_estado`) VALUES('Desconocido');
INSERT INTO `t_osc_estados` (`osc_estado`) VALUES('En_Actividad');
INSERT INTO `t_osc_estados` (`osc_estado`) VALUES('En_Conversacion');
INSERT INTO `t_osc_estados` (`osc_estado`) VALUES('Identificada');
INSERT INTO `t_osc_estados` (`osc_estado`) VALUES('Inactiva');

-- --------------------------------------------------------

--
-- Table structure for table `t_osc_lista_objetivos`
--

CREATE TABLE `t_osc_lista_objetivos` (
  `osc_objetivo` varchar(32) NOT NULL DEFAULT 'Desconocido'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lista de los posibles objetivos de una OSC';

--
-- Dumping data for table `t_osc_lista_objetivos`
--

INSERT INTO `t_osc_lista_objetivos` (`osc_objetivo`) VALUES('Adicciones');
INSERT INTO `t_osc_lista_objetivos` (`osc_objetivo`) VALUES('Alimentos');
INSERT INTO `t_osc_lista_objetivos` (`osc_objetivo`) VALUES('Beneficencia');
INSERT INTO `t_osc_lista_objetivos` (`osc_objetivo`) VALUES('Caridad');
INSERT INTO `t_osc_lista_objetivos` (`osc_objetivo`) VALUES('Comunicacion');
INSERT INTO `t_osc_lista_objetivos` (`osc_objetivo`) VALUES('Comunidad');
INSERT INTO `t_osc_lista_objetivos` (`osc_objetivo`) VALUES('Discapacidad');
INSERT INTO `t_osc_lista_objetivos` (`osc_objetivo`) VALUES('Educacion');
INSERT INTO `t_osc_lista_objetivos` (`osc_objetivo`) VALUES('Infancia');
INSERT INTO `t_osc_lista_objetivos` (`osc_objetivo`) VALUES('Informatica');
INSERT INTO `t_osc_lista_objetivos` (`osc_objetivo`) VALUES('Integracion');
INSERT INTO `t_osc_lista_objetivos` (`osc_objetivo`) VALUES('Medio Ambiente');
INSERT INTO `t_osc_lista_objetivos` (`osc_objetivo`) VALUES('Mejora de la Gestion');
INSERT INTO `t_osc_lista_objetivos` (`osc_objetivo`) VALUES('No Especificado');
INSERT INTO `t_osc_lista_objetivos` (`osc_objetivo`) VALUES('Otro');
INSERT INTO `t_osc_lista_objetivos` (`osc_objetivo`) VALUES('Salud');
INSERT INTO `t_osc_lista_objetivos` (`osc_objetivo`) VALUES('Tercera Edad');

-- --------------------------------------------------------

--
-- Table structure for table `t_osc_logs_dc`
--

CREATE TABLE `t_osc_logs_dc` (
  `dni` int(10) UNSIGNED NOT NULL COMMENT 'dni del DC en cuestion',
  `osc_nombre` varchar(128) NOT NULL,
  `osc_rol_dc` varchar(16) NOT NULL COMMENT 'Roles posibles en tabla aparte',
  `osc_f_cambio` date NOT NULL DEFAULT '2000-01-01',
  `osc_comentarios_dc` varchar(256) DEFAULT 'No Comments',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_truch` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de registro de asignacion/desasignacion de los DCs a una OSC';

--
-- Dumping data for table `t_osc_logs_dc`
--

INSERT INTO `t_osc_logs_dc` (`dni`, `osc_nombre`, `osc_rol_dc`, `osc_f_cambio`, `osc_comentarios_dc`, `last_update`, `id_truch`) VALUES(1000203, 'A.C.I.A.P.O.', 'Titular', '2019-02-04', 'No Comments', '2019-02-04 19:40:07', 1);
INSERT INTO `t_osc_logs_dc` (`dni`, `osc_nombre`, `osc_rol_dc`, `osc_f_cambio`, `osc_comentarios_dc`, `last_update`, `id_truch`) VALUES(1000202, 'A.C.I.A.P.O.', 'Suplente', '2019-02-04', 'No Comments', '2019-02-04 19:41:22', 2);
INSERT INTO `t_osc_logs_dc` (`dni`, `osc_nombre`, `osc_rol_dc`, `osc_f_cambio`, `osc_comentarios_dc`, `last_update`, `id_truch`) VALUES(1000200, 'AAAEPAD', 'Suplente', '2000-01-01', 'No Comments', '2019-02-04 19:43:20', 3);
INSERT INTO `t_osc_logs_dc` (`dni`, `osc_nombre`, `osc_rol_dc`, `osc_f_cambio`, `osc_comentarios_dc`, `last_update`, `id_truch`) VALUES(1000201, 'AAPPG', 'Suplente', '2019-02-04', 'Se cambio DC SUPLENTE', '2019-02-04 19:51:23', 4);
INSERT INTO `t_osc_logs_dc` (`dni`, `osc_nombre`, `osc_rol_dc`, `osc_f_cambio`, `osc_comentarios_dc`, `last_update`, `id_truch`) VALUES(1000201, 'AAA Los Falsos', 'Titular', '2019-02-04', 'Se asigno DC TITULAR', '2019-02-04 20:06:27', 5);
INSERT INTO `t_osc_logs_dc` (`dni`, `osc_nombre`, `osc_rol_dc`, `osc_f_cambio`, `osc_comentarios_dc`, `last_update`, `id_truch`) VALUES(1000203, 'AAA Los Falsos', 'Suplente', '2019-02-04', 'Se asigno DC SUPLENTE', '2019-02-04 20:08:02', 6);
INSERT INTO `t_osc_logs_dc` (`dni`, `osc_nombre`, `osc_rol_dc`, `osc_f_cambio`, `osc_comentarios_dc`, `last_update`, `id_truch`) VALUES(1000203, 'AAA Los Truchos ORG', 'Titular', '2019-02-04', 'Se asigno DC TITULAR', '2019-02-04 20:10:03', 7);
INSERT INTO `t_osc_logs_dc` (`dni`, `osc_nombre`, `osc_rol_dc`, `osc_f_cambio`, `osc_comentarios_dc`, `last_update`, `id_truch`) VALUES(2, 'AAA Los Falsos', 'Suplente', '2019-02-04', 'Se Cambio DC SUPLENTE', '2019-02-04 20:58:15', 8);
INSERT INTO `t_osc_logs_dc` (`dni`, `osc_nombre`, `osc_rol_dc`, `osc_f_cambio`, `osc_comentarios_dc`, `last_update`, `id_truch`) VALUES(1000204, 'AAA Los Truchos ORG', 'Suplente', '2019-02-04', 'Se asigno DC SUPLENTE', '2019-02-04 21:23:47', 9);
INSERT INTO `t_osc_logs_dc` (`dni`, `osc_nombre`, `osc_rol_dc`, `osc_f_cambio`, `osc_comentarios_dc`, `last_update`, `id_truch`) VALUES(2, 'AAA Los Truchos ORG', 'No_Asignado', '2019-02-04', 'Se desasigno DC SUPLENTE', '2019-02-04 21:30:41', 10);
INSERT INTO `t_osc_logs_dc` (`dni`, `osc_nombre`, `osc_rol_dc`, `osc_f_cambio`, `osc_comentarios_dc`, `last_update`, `id_truch`) VALUES(1000204, 'AAA Los Truchos ORG', 'Suplente', '2019-02-04', 'Se asigno DC SUPLENTE', '2019-02-04 21:29:14', 11);
INSERT INTO `t_osc_logs_dc` (`dni`, `osc_nombre`, `osc_rol_dc`, `osc_f_cambio`, `osc_comentarios_dc`, `last_update`, `id_truch`) VALUES(2, 'AAA Los Truchos ORG', 'No_Asignado', '2019-02-04', 'Se desasigno DC SUPLENTE', '2019-02-04 21:29:49', 12);
INSERT INTO `t_osc_logs_dc` (`dni`, `osc_nombre`, `osc_rol_dc`, `osc_f_cambio`, `osc_comentarios_dc`, `last_update`, `id_truch`) VALUES(1000200, 'Truchos 20', 'Titular', '2019-02-12', 'Se asigno DC TITULAR', '2019-02-12 11:52:10', 13);
INSERT INTO `t_osc_logs_dc` (`dni`, `osc_nombre`, `osc_rol_dc`, `osc_f_cambio`, `osc_comentarios_dc`, `last_update`, `id_truch`) VALUES(1000203, 'Truchos 20', 'Suplente', '2019-02-12', 'Se asigno DC SUPLENTE', '2019-02-12 11:54:23', 14);
INSERT INTO `t_osc_logs_dc` (`dni`, `osc_nombre`, `osc_rol_dc`, `osc_f_cambio`, `osc_comentarios_dc`, `last_update`, `id_truch`) VALUES(1000202, 'Truchos 20', 'Titular', '2019-02-12', 'Se cambio DC TITULAR', '2019-02-12 11:55:54', 15);

-- --------------------------------------------------------

--
-- Table structure for table `t_osc_logs_estado`
--

CREATE TABLE `t_osc_logs_estado` (
  `osc_nombre` varchar(128) NOT NULL,
  `osc_estado` varchar(16) NOT NULL DEFAULT 'Identificada',
  `dni` int(10) UNSIGNED NOT NULL COMMENT 'dni del autor del cambio de estado de la OSC',
  `osc_coment_estado` varchar(256) DEFAULT 'No Comments',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de registro de la evolucion de los estados de una OSC';

--
-- Dumping data for table `t_osc_logs_estado`
--

INSERT INTO `t_osc_logs_estado` (`osc_nombre`, `osc_estado`, `dni`, `osc_coment_estado`, `last_update`) VALUES('ADOBE', 'En_Conversacion', 1000200, 'No Comments', '2019-01-28 22:02:12');
INSERT INTO `t_osc_logs_estado` (`osc_nombre`, `osc_estado`, `dni`, `osc_coment_estado`, `last_update`) VALUES('ALDEAS INFANTILES', 'En_Conversacion', 1000200, 'No Comments', '2019-01-28 22:02:29');
INSERT INTO `t_osc_logs_estado` (`osc_nombre`, `osc_estado`, `dni`, `osc_coment_estado`, `last_update`) VALUES('ALPI', 'En_Actividad', 1000200, 'No Comments', '2019-01-28 22:03:52');
INSERT INTO `t_osc_logs_estado` (`osc_nombre`, `osc_estado`, `dni`, `osc_coment_estado`, `last_update`) VALUES('APA (Asoc.Psicoanalitica Argentina)', 'En_Actividad', 1000200, 'No Comments', '2019-01-28 22:04:31');

--
-- Triggers `t_osc_logs_estado`
--
DELIMITER $$
CREATE TRIGGER `after_t_osc_logs_estado_insert` AFTER INSERT ON `t_osc_logs_estado` FOR EACH ROW BEGIN
    UPDATE t_osc
    SET 
		osc_nombre= NEW.osc_nombre,
		osc_estado = NEW.osc_estado,
		last_update = NOW()
     WHERE osc_nombre=NEW.osc_nombre; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_t_osc_logs_estado_update` AFTER UPDATE ON `t_osc_logs_estado` FOR EACH ROW BEGIN
    UPDATE t_osc
    SET 
    osc_nombre= OLD.osc_nombre,
     osc_estado = NEW.osc_estado,
     last_update = NOW()
     WHERE OLD.osc_nombre=NEW.osc_nombre;  
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `t_osc_objetivos`
--

CREATE TABLE `t_osc_objetivos` (
  `osc_nombre` varchar(128) NOT NULL,
  `osc_objetivo` varchar(32) NOT NULL DEFAULT 'Desconocido',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_truch` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de los objetivos de una OSC';

--
-- Dumping data for table `t_osc_objetivos`
--

INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('COLEGIO DE ESCRIBANOS', 'Adicciones', '2019-02-04 17:21:05', 1);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CONVIVIR', 'Adicciones', '2019-02-04 17:21:05', 2);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CONVIVIR', 'Salud', '2019-02-04 17:21:05', 3);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('DEHUM', 'Adicciones', '2019-02-04 17:21:05', 4);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('EL ALMENDRO', 'Adicciones', '2019-02-04 17:21:05', 5);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('EL REPARO', 'Adicciones', '2019-02-04 17:21:05', 6);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('EMMANUEL', 'Adicciones', '2019-02-04 17:21:05', 7);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FONGA', 'Adicciones', '2019-02-04 17:21:05', 8);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('PAR', 'Adicciones', '2019-02-04 17:21:05', 9);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('RUBICOM', 'Adicciones', '2019-02-04 17:21:05', 10);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('SEGUNDA OPORTUNIDAD', 'Adicciones', '2019-02-04 17:21:05', 11);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CERO A LA DERECHA', 'Comunicacion', '2019-02-04 17:21:05', 12);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CERO A LA DERECHA', 'Integracion', '2019-02-04 17:21:05', 13);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('COMUNIA', 'Comunicacion', '2019-02-04 17:21:05', 14);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('LA FLECHA', 'Comunicacion', '2019-02-04 17:21:05', 15);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('LA NACION D1', 'Comunicacion', '2019-02-04 17:21:05', 16);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ABRIL SOLIDARIO', 'Comunidad', '2019-02-04 17:21:05', 17);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ACDE', 'Comunidad', '2019-02-04 17:21:05', 18);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ACIFAD', 'Comunidad', '2019-02-04 17:21:05', 19);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ADC', 'Comunidad', '2019-02-04 17:21:05', 20);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ADOPTARE', 'Comunidad', '2019-02-04 17:21:05', 21);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('AIDIS', 'Comunidad', '2019-02-04 17:21:05', 22);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('AIKEN', 'Comunidad', '2019-02-04 17:21:05', 23);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ALANON', 'Comunidad', '2019-02-04 17:21:05', 24);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ALANON', 'Adicciones', '2019-02-04 17:21:05', 25);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ALDEAS INFANTILES', 'Comunidad', '2019-02-04 17:21:05', 26);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ALDEAS INFANTILES', 'Educacion', '2019-02-04 17:21:05', 27);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ALDEAS INFANTILES', 'Medio Ambiente', '2019-02-04 17:21:05', 28);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ALIMENTARIS', 'Comunidad', '2019-02-04 17:21:05', 29);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('AMA', 'Comunidad', '2019-02-04 17:21:05', 30);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('AMA', 'Salud', '2019-02-04 17:21:05', 31);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('AMARTYA', 'Comunidad', '2019-02-04 17:21:05', 32);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('AMERICAN JOINT DISTRIBUTION COMMITTEE', 'Comunidad', '2019-02-04 17:21:05', 33);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('AMIA', 'Comunidad', '2019-02-04 17:21:05', 34);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('AMJA', 'Comunidad', '2019-02-04 17:21:05', 35);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ANIDAR', 'Comunidad', '2019-02-04 17:21:05', 36);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ANIDAR', 'Infancia', '2019-02-04 17:21:05', 37);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ANUAR', 'Comunidad', '2019-02-04 17:21:05', 38);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('Anybody Argentina', 'Comunidad', '2019-02-04 17:21:05', 39);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('APAER', 'Comunidad', '2019-02-04 17:21:05', 40);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('APAER', 'Educacion', '2019-02-04 17:21:05', 41);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ARTESANIAS ARGENTINAS', 'Comunidad', '2019-02-04 17:21:05', 42);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ASDRA', 'Comunidad', '2019-02-04 17:21:05', 43);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ASDRA', 'Discapacidad', '2019-02-04 17:21:05', 44);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ASOCIACION FILANTROPICA ISRAELITA', 'Comunidad', '2019-02-04 17:21:05', 45);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ASOCIACION MUTUAL SENDEROS (MTE)', 'Comunidad', '2019-02-04 17:21:05', 46);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ASOCIACION MUTUAL SENDEROS (MTE)', 'Integracion', '2019-02-04 17:21:05', 47);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('AVANZAR', 'Comunidad', '2019-02-04 17:21:05', 48);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('AVES ARGENTINAS', 'Comunidad', '2019-02-04 17:21:05', 49);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('BOCA SOCIAL', 'Comunidad', '2019-02-04 17:21:05', 50);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('BOCA SOCIAL', 'Infancia', '2019-02-04 17:21:05', 51);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CAII', 'Comunidad', '2019-02-04 17:21:05', 52);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CAMINANDO JUNTOS (UNITED WAY)', 'Comunidad', '2019-02-04 17:21:05', 53);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CARITAS NACIONAL', 'Comunidad', '2019-02-04 17:21:05', 54);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CASA DEL TEATRO', 'Comunidad', '2019-02-04 17:21:05', 55);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CAZADORES DE ARTE', 'Comunidad', '2019-02-04 17:21:05', 56);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CIUDADANOS DEL MUNDO', 'Comunidad', '2019-02-04 17:21:05', 57);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CLUB DEPORTIVO BONGIOVANNI', 'Comunidad', '2019-02-04 17:21:05', 58);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CONCIENCIA', 'Comunidad', '2019-02-04 17:21:05', 59);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('COOPERATIVA DECAPOLIS', 'Comunidad', '2019-02-04 17:21:05', 60);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CREANDO LAZOS', 'Comunidad', '2019-02-04 17:21:05', 61);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CREAR CAMINOS', 'Comunidad', '2019-02-04 17:21:05', 62);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CUENTA CONMIGO', 'Comunidad', '2019-02-04 17:21:05', 63);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CURAR', 'Comunidad', '2019-02-04 17:21:05', 64);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CURAR', 'Salud', '2019-02-04 17:21:05', 65);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('DAD', 'Comunidad', '2019-02-04 17:21:05', 66);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('DAR ES DAR', 'Comunidad', '2019-02-04 17:21:05', 67);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('DAR ES DAR', 'Infancia', '2019-02-04 17:21:05', 68);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('DE LA NADA', 'Comunidad', '2019-02-04 17:21:05', 69);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('DEFENSORES DEL CHACO', 'Comunidad', '2019-02-04 17:21:05', 70);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('DESAFIO E IGUALDAD', 'Comunidad', '2019-02-04 17:21:05', 71);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('DETODOSPARATODOS', 'Comunidad', '2019-02-04 17:21:05', 72);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('DIGNIDAD', 'Comunidad', '2019-02-04 17:21:05', 73);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('Don Orione', 'Comunidad', '2019-02-04 17:21:05', 74);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('EDUCACION PARA COMPARTIR', 'Comunidad', '2019-02-04 17:21:05', 75);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('EDUCACION PARA COMPARTIR', 'Educacion', '2019-02-04 17:21:05', 76);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('EJERCITO DE SALVACION', 'Comunidad', '2019-02-04 17:21:05', 77);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('EL ARRANQUE', 'Comunidad', '2019-02-04 17:21:05', 78);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('EMAUS', 'Comunidad', '2019-02-04 17:21:05', 79);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ENABLIS', 'Comunidad', '2019-02-04 17:21:05', 80);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('Espacio de Escucha', 'Comunidad', '2019-02-04 17:21:05', 81);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ESPERANZA VIVA', 'Comunidad', '2019-02-04 17:21:05', 82);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FE Y ALEGRIA', 'Comunidad', '2019-02-04 17:21:05', 83);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FLOR', 'Comunidad', '2019-02-04 17:21:05', 84);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FOC  (Fund.Org.Comunitaria)', 'Comunidad', '2019-02-04 17:21:05', 85);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FORO DEL SECTOR SOCIAL', 'Comunidad', '2019-02-04 17:21:05', 86);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FOVEFOMI', 'Comunidad', '2019-02-04 17:21:05', 87);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FRENTE JOVEN', 'Comunidad', '2019-02-04 17:21:05', 88);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('Fundación Lebensohn', 'Comunidad', '2019-02-04 17:21:05', 89);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FUNDACION SUMA', 'Comunidad', '2019-02-04 17:21:05', 90);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('GRAN CHACO', 'Comunidad', '2019-02-04 17:21:05', 91);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('GUIDO BUFFO', 'Comunidad', '2019-02-04 17:21:05', 92);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('HABITAT PARA LA HUMANIDAD ARGENTINA', 'Comunidad', '2019-02-04 17:21:05', 93);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('HACIENDO CAMINO', 'Comunidad', '2019-02-04 17:21:05', 94);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('HACIENDO LIO', 'Comunidad', '2019-02-04 17:21:05', 95);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('HAMPATU', 'Comunidad', '2019-02-04 17:21:05', 96);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('Hecho por Nosotros/Animana', 'Comunidad', '2019-02-04 17:21:05', 97);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('HOGAR DE SAN JOSE', 'Comunidad', '2019-02-04 17:21:05', 98);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('HOGAR DE SAN JOSE', 'Integracion', '2019-02-04 17:21:05', 99);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('HOGAR MA.DEL ROSARIO DE SAN NICOLAS', 'Comunidad', '2019-02-04 17:21:05', 100);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('HOGAR SAGRADA FAMILIA/PILAR', 'Comunidad', '2019-02-04 17:21:05', 101);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('HOGAR SANTA RAFAELA MARIA', 'Comunidad', '2019-02-04 17:21:05', 102);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('HORIZONTE DE MAXIMA', 'Comunidad', '2019-02-04 17:21:05', 103);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('HUERTA NIÑO', 'Comunidad', '2019-02-04 17:21:05', 104);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('IELADEINU  (Jabad Lubavitch)', 'Comunidad', '2019-02-04 17:21:05', 105);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('IEM. Un Nuevo Humanismo', 'Comunidad', '2019-02-04 17:21:05', 106);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('IMPULSAR', 'Comunidad', '2019-02-04 17:21:05', 107);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('IONKOS', 'Comunidad', '2019-02-04 17:21:05', 108);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('LA BASE', 'Comunidad', '2019-02-04 17:21:05', 109);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('LAS TUNAS ', 'Comunidad', '2019-02-04 17:21:05', 110);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('LOS HIJOS DEL CAMPO', 'Comunidad', '2019-02-04 17:21:05', 111);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('MADRE TIERRA', 'Comunidad', '2019-02-04 17:21:05', 112);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('MADRES DE SAN LORENZO', 'Comunidad', '2019-02-04 17:21:05', 113);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('MANOS ABIERTAS', 'Comunidad', '2019-02-04 17:21:05', 114);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('MANOS DE LA CAVA', 'Comunidad', '2019-02-04 17:21:05', 115);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('MANOS EN ACCION', 'Comunidad', '2019-02-04 17:21:05', 116);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('MARGARITA BARRIENTOS', 'Comunidad', '2019-02-04 17:21:05', 117);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('MARIA DE OS ANGELES', 'Comunidad', '2019-02-04 17:21:05', 118);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('MENSAJEROS DE LA PAZ', 'Comunidad', '2019-02-04 17:21:05', 119);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('MICROJUSTICIA', 'Comunidad', '2019-02-04 17:21:05', 120);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('MINKAI', 'Comunidad', '2019-02-04 17:21:05', 121);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('MUSEO DE ARTE MODERNO', 'Comunidad', '2019-02-04 17:21:05', 122);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('MUSEO DEL HOLOCAUSTO', 'Comunidad', '2019-02-04 17:21:05', 123);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('MUSEO MUJICA LAINEZ', 'Comunidad', '2019-02-04 17:21:05', 124);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('NUEVOS CAMINOS', 'Comunidad', '2019-02-04 17:21:05', 125);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('OAJNU (org.arg.jov.para nac unidas)', 'Comunidad', '2019-02-04 17:21:05', 126);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('OBRA DEL PADRE MARIO', 'Comunidad', '2019-02-04 17:21:05', 127);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('OBRA DEL PADRE MARIO', 'Educacion', '2019-02-04 17:21:05', 128);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('OBRA DEL PADRE MARIO', 'Salud', '2019-02-04 17:21:05', 129);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('PANZAS LLENAS', 'Comunidad', '2019-02-04 17:21:05', 130);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('PARROQUIA SANTA MARIA DEL CAMINO', 'Comunidad', '2019-02-04 17:21:05', 131);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('PASTORAL SOCIAL', 'Comunidad', '2019-02-04 17:21:05', 132);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('PATA PILA', 'Comunidad', '2019-02-04 17:21:05', 133);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('PEREZ BUGALLO', 'Comunidad', '2019-02-04 17:21:05', 134);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('PH 15', 'Comunidad', '2019-02-04 17:21:05', 135);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('PIES DESCALZOS', 'Comunidad', '2019-02-04 17:21:05', 136);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('PILARES', 'Comunidad', '2019-02-04 17:21:05', 137);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('PODER CIUDADANO', 'Comunidad', '2019-02-04 17:21:05', 138);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('PRO VIVIENDA SOCIAL', 'Comunidad', '2019-02-04 17:21:05', 139);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('PROGRESAR', 'Comunidad', '2019-02-04 17:21:05', 140);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('PROTEGE TU CORAZON', 'Comunidad', '2019-02-04 17:21:05', 141);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('PROTEGE TU CORAZON', 'Adicciones', '2019-02-04 17:21:05', 142);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('PROYECTO DE LUZ', 'Comunidad', '2019-02-04 17:21:05', 143);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('PROYECTOS PADRES', 'Comunidad', '2019-02-04 17:21:05', 144);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('RECIDUCA', 'Comunidad', '2019-02-04 17:21:05', 145);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('RED  DE INNOVACION LOCAL', 'Comunidad', '2019-02-04 17:21:05', 146);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('RED DE COMUNIDADES RURALES', 'Comunidad', '2019-02-04 17:21:05', 147);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('RESPONDE', 'Comunidad', '2019-02-04 17:21:05', 148);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('RUGBY SIN FRONTERAS', 'Comunidad', '2019-02-04 17:21:05', 149);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('RUTA 40', 'Comunidad', '2019-02-04 17:21:05', 150);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('RUTA 40', 'Educacion', '2019-02-04 17:21:05', 151);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('SECHI/CIUDAD OCULTA', 'Comunidad', '2019-02-04 17:21:05', 152);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('SECHI/LACARRA-CARRILLO', 'Comunidad', '2019-02-04 17:21:05', 153);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('SEMBRAR VALORES', 'Comunidad', '2019-02-04 17:21:05', 154);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('SILOE', 'Comunidad', '2019-02-04 17:21:05', 155);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('SILOE', 'Educacion', '2019-02-04 17:21:05', 156);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('SOLIDAGRO', 'Comunidad', '2019-02-04 17:21:05', 157);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('SONRISAS', 'Comunidad', '2019-02-04 17:21:05', 158);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('SONRISAS', 'Infancia', '2019-02-04 17:21:05', 159);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('SONRISAS', 'Educacion', '2019-02-04 17:21:05', 160);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('SUR SOLIDARIO', 'Comunidad', '2019-02-04 17:21:05', 161);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('SUR SOLIDARIO', 'Infancia', '2019-02-04 17:21:06', 162);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('TECHO', 'Comunidad', '2019-02-04 17:21:06', 163);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('TEMAS', 'Comunidad', '2019-02-04 17:21:06', 164);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('TREN DEL ALMA', 'Comunidad', '2019-02-04 17:21:06', 165);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('TZEDAKA', 'Comunidad', '2019-02-04 17:21:06', 166);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('UASI-LA CAVA', 'Comunidad', '2019-02-04 17:21:06', 167);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('UNA MANO QUE AYUDA', 'Comunidad', '2019-02-04 17:21:06', 168);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('UNA MANO QUE AYUDA', 'Infancia', '2019-02-04 17:21:06', 169);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('UNIENDO CAMINOS', 'Comunidad', '2019-02-04 17:21:06', 170);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('UNION GITANA UNIVERSAL', 'Comunidad', '2019-02-04 17:21:06', 171);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('UNIVERSO AGORA', 'Comunidad', '2019-02-04 17:21:06', 172);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('VIVIENDA DIGNA (SAG FAMILIA)', 'Comunidad', '2019-02-04 17:21:06', 173);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('VOCES VITALES', 'Comunidad', '2019-02-04 17:21:06', 174);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ACCERVIL', 'Discapacidad', '2019-02-04 17:21:06', 175);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('AL REPARO', 'Discapacidad', '2019-02-04 17:21:06', 176);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CARE', 'Discapacidad', '2019-02-04 17:21:06', 177);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CASCOS VERDES', 'Discapacidad', '2019-02-04 17:21:06', 178);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CENTRO THEVENET', 'Discapacidad', '2019-02-04 17:21:06', 179);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('Club de amigos mios', 'Discapacidad', '2019-02-04 17:21:06', 180);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('EMPRENDER', 'Discapacidad', '2019-02-04 17:21:06', 181);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FANDA', 'Discapacidad', '2019-02-04 17:21:06', 182);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FUNDACIÓN PARA EL BIENESTAR', 'Discapacidad', '2019-02-04 17:21:06', 183);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FUNDACIÓN PARA EL BIENESTAR', 'Comunidad', '2019-02-04 17:21:06', 184);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FUNDACIÓN PARA EL BIENESTAR', 'Tercera Edad', '2019-02-04 17:21:06', 185);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('GRANJA ANDAR', 'Discapacidad', '2019-02-04 17:21:06', 186);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('IDEL', 'Discapacidad', '2019-02-04 17:21:06', 187);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('IDEL', 'Integracion', '2019-02-04 17:21:06', 188);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('JUNTOS SIN DIFERENCIAS', 'Discapacidad', '2019-02-04 17:21:06', 189);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('LA USINA', 'Discapacidad', '2019-02-04 17:21:06', 190);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('NOSOTROS', 'Discapacidad', '2019-02-04 17:21:06', 191);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('OLIMPIADAS ESPECIALES', 'Discapacidad', '2019-02-04 17:21:06', 192);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('PROACTIVA', 'Discapacidad', '2019-02-04 17:21:06', 193);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('RAMSEYER', 'Discapacidad', '2019-02-04 17:21:06', 194);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('STEPS', 'Discapacidad', '2019-02-04 17:21:06', 195);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('STEPS', 'Integracion', '2019-02-04 17:21:06', 196);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('TRIADE', 'Discapacidad', '2019-02-04 17:21:06', 197);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('WENTEMIL', 'Discapacidad', '2019-02-04 17:21:06', 198);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ACER /Conin San Isidro', 'Educacion', '2019-02-04 17:21:06', 199);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('AEAPG ASOCIACION ESCUELA ARG DE PSICOTERAPIA GRADUADOS', 'Educacion', '2019-02-04 17:21:06', 200);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('AEAPG ASOCIACION ESCUELA ARG DE PSICOTERAPIA GRADUADOS', 'Salud', '2019-02-04 17:21:06', 201);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ARGENTINA NARRADA', 'Educacion', '2019-02-04 17:21:06', 202);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ASHOKA', 'Educacion', '2019-02-04 17:21:06', 203);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ASOCIACION ARGENTINA DE EDUCADORES SEXUALES', 'Educacion', '2019-02-04 17:21:06', 204);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CARLOS DIAZ VELEZ', 'Educacion', '2019-02-04 17:21:06', 205);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CASA DEL NIÑO NUEVA FAMILIA', 'Educacion', '2019-02-04 17:21:06', 206);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CASA RAFAEL', 'Educacion', '2019-02-04 17:21:06', 207);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CASA RAFAEL', 'Comunidad', '2019-02-04 17:21:06', 208);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CHICOS NATURALISTAS', 'Educacion', '2019-02-04 17:21:06', 209);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CIMIENTOS', 'Educacion', '2019-02-04 17:21:06', 210);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('COLEGIO MADRE TERESA', 'Educacion', '2019-02-04 17:21:06', 211);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('Comprometerse mas', 'Educacion', '2019-02-04 17:21:06', 212);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('Comprometerse mas', 'Adicciones', '2019-02-04 17:21:06', 213);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('DALE TU MANO', 'Educacion', '2019-02-04 17:21:06', 214);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('DALE TU MANO', 'Comunidad', '2019-02-04 17:21:06', 215);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('EDUCAR Y CRECER', 'Educacion', '2019-02-04 17:21:06', 216);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ENDEAVOR', 'Educacion', '2019-02-04 17:21:06', 217);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ENSEÑA POR ARG.', 'Educacion', '2019-02-04 17:21:06', 218);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ESCOLARES', 'Educacion', '2019-02-04 17:21:06', 219);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ESCUELAS DEL BICENTENARIO', 'Educacion', '2019-02-04 17:21:06', 220);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ETIS', 'Educacion', '2019-02-04 17:21:06', 221);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('EVE (Eduacación en Valores)', 'Educacion', '2019-02-04 17:21:06', 222);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FEPAIS', 'Educacion', '2019-02-04 17:21:06', 223);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FORGE', 'Educacion', '2019-02-04 17:21:06', 224);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FUNDACION MONTESSORI', 'Educacion', '2019-02-04 17:21:06', 225);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('GERMINARE', 'Educacion', '2019-02-04 17:21:06', 226);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('GRANO DE MOSTAZA', 'Educacion', '2019-02-04 17:21:06', 227);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('INTEGRAR', 'Educacion', '2019-02-04 17:21:06', 228);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('JOVENES EN ACCION', 'Educacion', '2019-02-04 17:21:06', 229);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('LEER', 'Educacion', '2019-02-04 17:21:06', 230);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('LEKOTEK', 'Educacion', '2019-02-04 17:21:06', 231);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('MEDIA  PILA', 'Educacion', '2019-02-04 17:21:06', 232);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('MEDIA  PILA', 'Integracion', '2019-02-04 17:21:06', 233);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('MISIONES RURALES ARGENTINAS', 'Educacion', '2019-02-04 17:21:06', 234);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('Orientacion a la Joven', 'Educacion', '2019-02-04 17:21:06', 235);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('PESCAR', 'Educacion', '2019-02-04 17:21:06', 236);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('PROYECTAR', 'Educacion', '2019-02-04 17:21:06', 237);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('PROYECTAR', 'Medio Ambiente', '2019-02-04 17:21:06', 238);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('Proyecto Empujar', 'Educacion', '2019-02-04 17:21:06', 239);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('PUENTES', 'Educacion', '2019-02-04 17:21:06', 240);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('RUGBY SOLIDARIO', 'Educacion', '2019-02-04 17:21:06', 241);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('SOCIEDAD DAMAS DE LA MISERICORDIA', 'Educacion', '2019-02-04 17:21:06', 242);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('VALORES PARA CRECER', 'Educacion', '2019-02-04 17:21:06', 243);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('VISITAS ANIMADAS', 'Educacion', '2019-02-04 17:21:06', 244);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('AEDROS', 'Fortalecimiento', '2019-02-04 17:21:06', 245);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('GDFE (Grupo de FUndaciones y Empresas)', 'Fortalecimiento', '2019-02-04 17:21:06', 246);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('IMPULSAR', 'Fortalecimiento', '2019-02-04 17:21:06', 247);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('SUMANDO ARG.', 'Fortalecimiento', '2019-02-04 17:21:06', 248);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('SUMANDO ARG.', 'Comunidad', '2019-02-04 17:21:06', 249);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ALEGRIA INTENSIVA', 'Infancia', '2019-02-04 17:21:06', 250);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('AMARANTA', 'Infancia', '2019-02-04 17:21:06', 251);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('AMARANTA', 'Educacion', '2019-02-04 17:21:06', 252);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('AMARANTA', 'Tercera Edad', '2019-02-04 17:21:06', 253);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CONIN LUJAN', 'Infancia', '2019-02-04 17:21:06', 254);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CONIN LUJAN', 'Salud', '2019-02-04 17:21:06', 255);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CULTIVARTE', 'Infancia', '2019-02-04 17:21:06', 256);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CULTIVARTE', 'Educacion', '2019-02-04 17:21:06', 257);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('DONCEL', 'Infancia', '2019-02-04 17:21:06', 258);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('DONCEL', 'Comunidad', '2019-02-04 17:21:06', 259);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('EMILIE JENECHERU', 'Infancia', '2019-02-04 17:21:06', 260);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FUND.TODAVIA ES TIEMPO - HOGAR EL ARCA DE NOE', 'Infancia', '2019-02-04 17:21:06', 261);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FUND.TODAVIA ES TIEMPO - HOGAR EL ARCA DE NOE', 'Integracion', '2019-02-04 17:21:06', 262);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FUND.TODAVIA ES TIEMPO - HOGAR EL ARCA DE NOE', 'Comunidad', '2019-02-04 17:21:06', 263);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FUNDACION DIGNAMENTE', 'Infancia', '2019-02-04 17:21:06', 264);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('Fundacion Ronald McDonald', 'Infancia', '2019-02-04 17:21:06', 265);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('Fundacion Ronald McDonald', 'Salud', '2019-02-04 17:21:06', 266);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FUNDACIÓN VIDA y ESPERANZA (FUNDAVE)', 'Infancia', '2019-02-04 17:21:06', 267);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('HOGAR MARIA LUISA', 'Infancia', '2019-02-04 17:21:06', 268);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('HOGAR NIÑO JESUS', 'Infancia', '2019-02-04 17:21:06', 269);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('LA NUBE', 'Infancia', '2019-02-04 17:21:06', 270);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('LA NUBE', 'Educacion', '2019-02-04 17:21:06', 271);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('LAS LOMAS ORAL', 'Infancia', '2019-02-04 17:21:06', 272);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('LAS LOMAS ORAL', 'Salud', '2019-02-04 17:21:06', 273);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('VERGEL', 'Infancia', '2019-02-04 17:21:06', 274);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('INCLUBYTE', 'Informatica', '2019-02-04 17:21:06', 275);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('INCLUBYTE', 'Integracion', '2019-02-04 17:21:06', 276);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('INCLUBYTE', 'Discapacidad', '2019-02-04 17:21:06', 277);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('WINGU', 'Informatica', '2019-02-04 17:21:06', 278);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ADOBE', 'Integracion', '2019-02-04 17:21:06', 279);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('AEDIN', 'Integracion', '2019-02-04 17:21:06', 280);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ARTE Y ESPERANZA', 'Integracion', '2019-02-04 17:21:06', 281);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ASAC Asoc.Ayuda al Ciego', 'Integracion', '2019-02-04 17:21:06', 282);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ASAC Asoc.Ayuda al Ciego', 'Salud', '2019-02-04 17:21:06', 283);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ASOCIACION ARGENTINA DE KARATE', 'Integracion', '2019-02-04 17:21:06', 284);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CANALES', 'Integracion', '2019-02-04 17:21:06', 285);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CASA DEL ENCUENTRO', 'Integracion', '2019-02-04 17:21:06', 286);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CASA NIÑO MARIA DE NAZARETH', 'Integracion', '2019-02-04 17:21:06', 287);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CILSA', 'Integracion', '2019-02-04 17:21:06', 288);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('DIAGONAL', 'Integracion', '2019-02-04 17:21:06', 289);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('DISCAR', 'Integracion', '2019-02-04 17:21:06', 290);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('EL PUENTE POSIBLE', 'Integracion', '2019-02-04 17:21:06', 291);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('EQUIDAD', 'Integracion', '2019-02-04 17:21:06', 292);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FUNDACION EVOLUCION', 'Integracion', '2019-02-04 17:21:06', 293);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FUNDACION EVOLUCION', 'Educacion', '2019-02-04 17:21:06', 294);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('GARRAHAN', 'Integracion', '2019-02-04 17:21:06', 295);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('HELP ARG.', 'Integracion', '2019-02-04 17:21:06', 296);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('LA COLIFATA', 'Integracion', '2019-02-04 17:21:06', 297);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('LA REVISTITA MULTICULTURAL', 'Integracion', '2019-02-04 17:21:06', 298);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('LOS NARANJOS', 'Integracion', '2019-02-04 17:21:06', 299);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('LOS NARANJOS', 'Comunidad', '2019-02-04 17:21:06', 300);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('MARIA DE LAS CARCELES', 'Integracion', '2019-02-04 17:21:06', 301);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('PELOTA DE TRAPO', 'Integracion', '2019-02-04 17:21:06', 302);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('PEREGRINA', 'Integracion', '2019-02-04 17:21:06', 303);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('PROEM -Proyecto Emprender', 'Integracion', '2019-02-04 17:21:06', 304);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('PROEM -Proyecto Emprender', 'Salud', '2019-02-04 17:21:06', 305);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('YONOFUI', 'Integracion', '2019-02-04 17:21:06', 306);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FARN -Ambiente y Recursos Naturales', 'Medio Ambiente', '2019-02-04 17:21:06', 307);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('GERMINAR', 'Medio Ambiente', '2019-02-04 17:21:06', 308);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('GERMINAR', 'Comunidad', '2019-02-04 17:21:06', 309);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('MANOS VERDES', 'Medio Ambiente', '2019-02-04 17:21:06', 310);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('VIDA SILVESTRE ARGENTINA', 'Medio Ambiente', '2019-02-04 17:21:06', 311);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('A.C.I.A.P.O.', 'Salud', '2019-02-04 17:21:06', 312);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('AAAEPAD', 'Salud', '2019-02-04 17:21:06', 313);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('AAPPG', 'Salud', '2019-02-04 17:21:06', 314);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ADESAR', 'Salud', '2019-02-04 17:21:06', 315);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ADESAR', 'Comunidad', '2019-02-04 17:21:06', 316);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('AEPSO', 'Salud', '2019-02-04 17:21:06', 317);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('AGAPAO', 'Salud', '2019-02-04 17:21:06', 318);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('AGAPAO', 'Comunidad', '2019-02-04 17:21:06', 319);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ALMA', 'Salud', '2019-02-04 17:21:06', 320);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ALPI', 'Salud', '2019-02-04 17:21:06', 321);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('APA (Asoc.Psicoanalitica Argentina)', 'Salud', '2019-02-04 17:21:06', 322);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ARPA', 'Salud', '2019-02-04 17:21:06', 323);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ARTICULAR', 'Salud', '2019-02-04 17:21:06', 324);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ASCINUEN', 'Salud', '2019-02-04 17:21:06', 325);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ASPERGER', 'Salud', '2019-02-04 17:21:06', 326);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ASPERGER', 'Discapacidad', '2019-02-04 17:21:06', 327);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('BASTONES VERDES', 'Salud', '2019-02-04 17:21:06', 328);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('BASTONES VERDES', 'Tercera Edad', '2019-02-04 17:21:06', 329);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('BRINCAR', 'Salud', '2019-02-04 17:21:06', 330);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CESUM', 'Salud', '2019-02-04 17:21:06', 331);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CHAP', 'Salud', '2019-02-04 17:21:06', 332);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CRUZ ROJA', 'Salud', '2019-02-04 17:21:06', 333);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('DAMAS ROSADAS', 'Salud', '2019-02-04 17:21:06', 334);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('DEBRA', 'Salud', '2019-02-04 17:21:06', 335);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('DONAR SANGRE', 'Salud', '2019-02-04 17:21:06', 336);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('DONDE QUIERO ESTAR', 'Salud', '2019-02-04 17:21:06', 337);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ESCLEROSIS MULTIPLE ARGENTINA', 'Salud', '2019-02-04 17:21:06', 338);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FADEPOF', 'Salud', '2019-02-04 17:21:06', 339);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FAGRAN ( Federación de Nutricionistas)', 'Salud', '2019-02-04 17:21:06', 340);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FIORIRE', 'Salud', '2019-02-04 17:21:06', 341);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FLEXER', 'Salud', '2019-02-04 17:21:06', 342);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FUNDACION DE TRANSPLANTE HEPATICO', 'Salud', '2019-02-04 17:21:06', 343);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('Fundacion Inter Americana del Corazón - Argentina', 'Salud', '2019-02-04 17:21:06', 344);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FUNDACION MARIA CECILIA', 'Salud', '2019-02-04 17:21:06', 345);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FUNDALC', 'Salud', '2019-02-04 17:21:06', 346);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FUPREMUS', 'Salud', '2019-02-04 17:21:06', 347);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('HERMANAS HOSPITALARIAS', 'Salud', '2019-02-04 17:21:06', 348);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('HUESPED', 'Salud', '2019-02-04 17:21:06', 349);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('INAC', 'Salud', '2019-02-04 17:21:06', 350);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('INFANT', 'Salud', '2019-02-04 17:21:06', 351);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('L.A.L.C.E.C.', 'Salud', '2019-02-04 17:21:06', 352);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('LAPDI', 'Salud', '2019-02-04 17:21:06', 353);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('LAS CARITAS DEL TUYU', 'Salud', '2019-02-04 17:21:06', 354);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('MATERNA', 'Salud', '2019-02-04 17:21:06', 355);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('MUNDO SANO', 'Salud', '2019-02-04 17:21:06', 356);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('NUTRIR LA VIDA', 'Salud', '2019-02-04 17:21:06', 357);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('PALLIUM LATINOAMERICA', 'Salud', '2019-02-04 17:21:06', 358);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('PIEL', 'Salud', '2019-02-04 17:21:06', 359);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('SAGIJ', 'Salud', '2019-02-04 17:21:06', 360);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('SAHDES', 'Salud', '2019-02-04 17:21:06', 361);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('SUMA', 'Salud', '2019-02-04 17:21:06', 362);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('SURCOS', 'Salud', '2019-02-04 17:21:06', 363);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ZAMBRANO', 'Salud', '2019-02-04 17:21:06', 364);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ABRIR LA PUERTA', 'No Especificado', '2019-02-04 17:21:06', 365);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ACEPAR', 'No Especificado', '2019-02-04 17:21:06', 366);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ALPAD', 'No Especificado', '2019-02-04 17:21:06', 367);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ALTERNATIVA 3', 'No Especificado', '2019-02-04 17:21:06', 368);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ANDARES', 'No Especificado', '2019-02-04 17:21:06', 369);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ASOCIACIÓN CIVIL ORY', 'No Especificado', '2019-02-04 17:21:06', 370);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('AVINA', 'No Especificado', '2019-02-04 17:21:06', 371);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('BANCO DE ALIMENTOS', 'Alimentos', '2019-02-04 17:21:06', 372);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CAMBIO DEMOCRATICO', 'No Especificado', '2019-02-04 17:21:06', 373);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CIENCIA PARA TODOS', 'No Especificado', '2019-02-04 17:21:06', 374);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CIRCO SOCIAL DEL SUR', 'No Especificado', '2019-02-04 17:21:06', 375);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('COMPROMISO', 'No Especificado', '2019-02-04 17:21:06', 376);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('COSIENDO REDES', 'No Especificado', '2019-02-04 17:21:06', 377);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('CREAR VALE LA PENA', 'No Especificado', '2019-02-04 17:21:06', 378);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ECOCLUBES', 'No Especificado', '2019-02-04 17:21:06', 379);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ESCUELA TALLER FATIMA', 'No Especificado', '2019-02-04 17:21:06', 380);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FAIAM', 'No Especificado', '2019-02-04 17:21:06', 381);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FERIADO AL PLANETA ', 'No Especificado', '2019-02-04 17:21:06', 382);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FORES', 'No Especificado', '2019-02-04 17:21:06', 383);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FUCA - Fundación para la Investigación y la Prevención del Cáncer', 'Salud', '2019-02-04 17:21:07', 384);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('FUNDACION SENDERO', 'No Especificado', '2019-02-04 17:21:07', 385);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('Fundacion Sistema B', 'No Especificado', '2019-02-04 17:21:07', 386);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('GREENPEACE', 'Medio Ambiente', '2019-02-04 17:21:07', 387);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('IDEALISTAS', 'No Especificado', '2019-02-04 17:21:07', 388);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('IPA', 'No Especificado', '2019-02-04 17:21:07', 389);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('LA LIGA DE LA LECHE', 'No Especificado', '2019-02-04 17:21:07', 390);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('LA SCALA DE SAN TELMO', 'No Especificado', '2019-02-04 17:21:07', 391);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('LUCERO DEL ALBA', 'No Especificado', '2019-02-04 17:21:07', 392);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('LUZ DE ESPERANZA ', 'No Especificado', '2019-02-04 17:21:07', 393);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('MATRIARCADO', 'No Especificado', '2019-02-04 17:21:07', 394);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('MI HUERTA', 'No Especificado', '2019-02-04 17:21:07', 395);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('MIRADAS DE AMOR', 'No Especificado', '2019-02-04 17:21:07', 396);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('MISSING CHILDREN', 'No Especificado', '2019-02-04 17:21:07', 397);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('MOVILIZARSE', 'No Especificado', '2019-02-04 17:21:07', 398);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('MUJERES 2000', 'No Especificado', '2019-02-04 17:21:07', 399);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('NORDELTA', 'No Especificado', '2019-02-04 17:21:07', 400);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('RED DE BANCO DE ALIMENTOS', 'Alimentos', '2019-02-04 17:21:07', 401);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('SES', 'No Especificado', '2019-02-04 17:21:07', 402);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('U.D.E.S.A.', 'No Especificado', '2019-02-04 17:21:07', 403);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('VICAR.EPISC DE EDU DEL ARZ. DE BS.AS', 'No Especificado', '2019-02-04 17:21:07', 404);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('Truchos 1', 'Alimentos', '2019-02-11 15:07:06', 409);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('Truchos 1', 'Informatica', '2019-02-11 15:07:30', 410);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('Truchos 1', 'Educacion', '2019-02-11 18:08:38', 413);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('Truchos 1', 'Tercera Edad', '2019-02-11 18:08:50', 414);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('Truchos 1', 'Caridad', '2019-02-11 23:26:55', 419);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('ALANON', 'Discapacidad', '2019-02-11 23:28:59', 420);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('Truchos 20', 'Beneficencia', '2019-02-13 14:44:22', 421);
INSERT INTO `t_osc_objetivos` (`osc_nombre`, `osc_objetivo`, `last_update`, `id_truch`) VALUES('Truchos 20', 'Discapacidad', '2019-02-13 14:44:25', 422);

-- --------------------------------------------------------

--
-- Table structure for table `t_osc_rol_dc`
--

CREATE TABLE `t_osc_rol_dc` (
  `osc_rol_dc` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lista de los posibles roles de un DC';

--
-- Dumping data for table `t_osc_rol_dc`
--

INSERT INTO `t_osc_rol_dc` (`osc_rol_dc`) VALUES('Des-Asignado');
INSERT INTO `t_osc_rol_dc` (`osc_rol_dc`) VALUES('No_Asignado');
INSERT INTO `t_osc_rol_dc` (`osc_rol_dc`) VALUES('Suplente');
INSERT INTO `t_osc_rol_dc` (`osc_rol_dc`) VALUES('Titular');

-- --------------------------------------------------------

--
-- Table structure for table `t_profesiones`
--

CREATE TABLE `t_profesiones` (
  `profesion` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de datos de las posibles profesiones de un voluntario';

--
-- Dumping data for table `t_profesiones`
--

INSERT INTO `t_profesiones` (`profesion`) VALUES('Abogada');
INSERT INTO `t_profesiones` (`profesion`) VALUES('Abogado');
INSERT INTO `t_profesiones` (`profesion`) VALUES('Antropologa');
INSERT INTO `t_profesiones` (`profesion`) VALUES('Antropologo');
INSERT INTO `t_profesiones` (`profesion`) VALUES('Arquitecta');
INSERT INTO `t_profesiones` (`profesion`) VALUES('Arquitecto');
INSERT INTO `t_profesiones` (`profesion`) VALUES('Chanta');
INSERT INTO `t_profesiones` (`profesion`) VALUES('Chantologa');
INSERT INTO `t_profesiones` (`profesion`) VALUES('Chantologo');
INSERT INTO `t_profesiones` (`profesion`) VALUES('Contador');
INSERT INTO `t_profesiones` (`profesion`) VALUES('Contadora');
INSERT INTO `t_profesiones` (`profesion`) VALUES('Ingeniera');
INSERT INTO `t_profesiones` (`profesion`) VALUES('Ingeniero');
INSERT INTO `t_profesiones` (`profesion`) VALUES('Lic RRHH');
INSERT INTO `t_profesiones` (`profesion`) VALUES('Lic RRPP');
INSERT INTO `t_profesiones` (`profesion`) VALUES('Medica');
INSERT INTO `t_profesiones` (`profesion`) VALUES('Medico');
INSERT INTO `t_profesiones` (`profesion`) VALUES('Mentirosa');
INSERT INTO `t_profesiones` (`profesion`) VALUES('Mentiroso');
INSERT INTO `t_profesiones` (`profesion`) VALUES('N/D');
INSERT INTO `t_profesiones` (`profesion`) VALUES('Otra');
INSERT INTO `t_profesiones` (`profesion`) VALUES('Sicologa');
INSERT INTO `t_profesiones` (`profesion`) VALUES('Sicologo');
INSERT INTO `t_profesiones` (`profesion`) VALUES('Sociologa');
INSERT INTO `t_profesiones` (`profesion`) VALUES('Sociologo');

-- --------------------------------------------------------

--
-- Table structure for table `t_proyectos`
--

CREATE TABLE `t_proyectos` (
  `p_num_corr_proy` int(10) UNSIGNED NOT NULL,
  `p_nombre_proy` varchar(128) NOT NULL,
  `osc_nombre` varchar(128) NOT NULL,
  `p_fecha_pre_proy` date NOT NULL DEFAULT '2004-01-01',
  `p_fecha_present_vol` date NOT NULL DEFAULT '2004-01-01',
  `p_fecha_dup` date NOT NULL DEFAULT '2004-01-01',
  `p_fecha_mitad_proy_estim` date NOT NULL DEFAULT '2004-01-01',
  `p_fecha_mitad_proy_real` date NOT NULL DEFAULT '2004-12-01',
  `p_fecha_cierre_proy_estim` date NOT NULL DEFAULT '2004-01-01',
  `p_fecha_cierre_proy_real` date NOT NULL DEFAULT '2004-12-01',
  `p_ultimo_estado` varchar(20) NOT NULL COMMENT 'Registra el ultimo estado en que esta el proyecto',
  `p_dup_si_no` enum('Si','No') DEFAULT 'No',
  `p_link_a_dup` varchar(256) NOT NULL DEFAULT 'N/D',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla base de registro de proyectos';

--
-- Dumping data for table `t_proyectos`
--

INSERT INTO `t_proyectos` (`p_num_corr_proy`, `p_nombre_proy`, `osc_nombre`, `p_fecha_pre_proy`, `p_fecha_present_vol`, `p_fecha_dup`, `p_fecha_mitad_proy_estim`, `p_fecha_mitad_proy_real`, `p_fecha_cierre_proy_estim`, `p_fecha_cierre_proy_real`, `p_ultimo_estado`, `p_dup_si_no`, `p_link_a_dup`, `last_update`) VALUES(998, 'ALPI ', 'ALPI', '2004-01-01', '2004-01-01', '2004-01-01', '2004-01-01', '2004-12-01', '2004-01-01', '2004-12-01', 'Cancelado', 'No', 'N/D', '2019-02-04 17:21:10');
INSERT INTO `t_proyectos` (`p_num_corr_proy`, `p_nombre_proy`, `osc_nombre`, `p_fecha_pre_proy`, `p_fecha_present_vol`, `p_fecha_dup`, `p_fecha_mitad_proy_estim`, `p_fecha_mitad_proy_real`, `p_fecha_cierre_proy_estim`, `p_fecha_cierre_proy_real`, `p_ultimo_estado`, `p_dup_si_no`, `p_link_a_dup`, `last_update`) VALUES(999, 'ALPI I', 'ALPI', '2004-01-01', '2004-01-01', '2004-01-01', '2004-01-01', '2004-12-01', '2004-01-01', '2004-12-01', 'Terminado', 'No', 'N/D', '2019-02-04 17:21:10');
INSERT INTO `t_proyectos` (`p_num_corr_proy`, `p_nombre_proy`, `osc_nombre`, `p_fecha_pre_proy`, `p_fecha_present_vol`, `p_fecha_dup`, `p_fecha_mitad_proy_estim`, `p_fecha_mitad_proy_real`, `p_fecha_cierre_proy_estim`, `p_fecha_cierre_proy_real`, `p_ultimo_estado`, `p_dup_si_no`, `p_link_a_dup`, `last_update`) VALUES(1001, 'APA I', 'APA (Asoc.Psicoanalitica Argentina)', '2019-01-01', '2004-01-01', '2004-01-01', '2004-01-01', '2004-12-01', '2004-01-01', '2004-12-01', 'En_Ejecucion', 'Si', 'N/D', '2019-02-04 17:21:10');
INSERT INTO `t_proyectos` (`p_num_corr_proy`, `p_nombre_proy`, `osc_nombre`, `p_fecha_pre_proy`, `p_fecha_present_vol`, `p_fecha_dup`, `p_fecha_mitad_proy_estim`, `p_fecha_mitad_proy_real`, `p_fecha_cierre_proy_estim`, `p_fecha_cierre_proy_real`, `p_ultimo_estado`, `p_dup_si_no`, `p_link_a_dup`, `last_update`) VALUES(1002, 'Adobe I', 'ADOBE', '2004-01-01', '2004-01-01', '2004-01-01', '2004-01-01', '2004-12-01', '2004-01-01', '2004-12-01', 'En_Ejecucion', 'No', 'N/D', '2019-02-04 17:21:10');
INSERT INTO `t_proyectos` (`p_num_corr_proy`, `p_nombre_proy`, `osc_nombre`, `p_fecha_pre_proy`, `p_fecha_present_vol`, `p_fecha_dup`, `p_fecha_mitad_proy_estim`, `p_fecha_mitad_proy_real`, `p_fecha_cierre_proy_estim`, `p_fecha_cierre_proy_real`, `p_ultimo_estado`, `p_dup_si_no`, `p_link_a_dup`, `last_update`) VALUES(1003, 'ALPI II', 'ALPI', '2004-01-01', '2004-01-01', '2004-01-01', '2004-01-01', '2004-12-01', '2004-01-01', '2004-12-01', 'En_Ejecucion', 'No', 'N/D', '2019-02-04 17:21:10');
INSERT INTO `t_proyectos` (`p_num_corr_proy`, `p_nombre_proy`, `osc_nombre`, `p_fecha_pre_proy`, `p_fecha_present_vol`, `p_fecha_dup`, `p_fecha_mitad_proy_estim`, `p_fecha_mitad_proy_real`, `p_fecha_cierre_proy_estim`, `p_fecha_cierre_proy_real`, `p_ultimo_estado`, `p_dup_si_no`, `p_link_a_dup`, `last_update`) VALUES(1004, 'ALDEAS I', 'ALDEAS INFANTILES', '2004-01-01', '2004-01-01', '2004-01-01', '2004-01-01', '2004-12-01', '2004-01-01', '2004-12-01', 'En_Ejecucion', 'No', 'N/D', '2019-02-04 17:21:10');
INSERT INTO `t_proyectos` (`p_num_corr_proy`, `p_nombre_proy`, `osc_nombre`, `p_fecha_pre_proy`, `p_fecha_present_vol`, `p_fecha_dup`, `p_fecha_mitad_proy_estim`, `p_fecha_mitad_proy_real`, `p_fecha_cierre_proy_estim`, `p_fecha_cierre_proy_real`, `p_ultimo_estado`, `p_dup_si_no`, `p_link_a_dup`, `last_update`) VALUES(1005, 'ALPI III', 'ALPI', '2004-01-01', '2004-01-01', '2004-01-01', '2004-01-01', '2004-12-01', '2004-01-01', '2004-12-01', 'Terminado', 'No', 'N/D', '2019-02-04 17:21:10');
INSERT INTO `t_proyectos` (`p_num_corr_proy`, `p_nombre_proy`, `osc_nombre`, `p_fecha_pre_proy`, `p_fecha_present_vol`, `p_fecha_dup`, `p_fecha_mitad_proy_estim`, `p_fecha_mitad_proy_real`, `p_fecha_cierre_proy_estim`, `p_fecha_cierre_proy_real`, `p_ultimo_estado`, `p_dup_si_no`, `p_link_a_dup`, `last_update`) VALUES(1006, 'ALPI IV', 'ALPI', '2004-01-01', '2004-01-01', '2004-01-01', '2004-01-01', '2004-12-01', '2004-01-01', '2004-12-01', 'Pre-Proyecto', 'No', 'N/D', '2019-02-04 17:21:10');

-- --------------------------------------------------------

--
-- Table structure for table `t_p_estado_proy`
--

CREATE TABLE `t_p_estado_proy` (
  `p_estado_proy` varchar(20) NOT NULL,
  `p_signif_fecha` varchar(32) NOT NULL,
  `p_color_estado` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lista de los posibles estados de los proyectos';

--
-- Dumping data for table `t_p_estado_proy`
--

INSERT INTO `t_p_estado_proy` (`p_estado_proy`, `p_signif_fecha`, `p_color_estado`) VALUES('Cancelado', 'Fecha cancelacion', 'Negro');
INSERT INTO `t_p_estado_proy` (`p_estado_proy`, `p_signif_fecha`, `p_color_estado`) VALUES('En_Ejecucion', 'Fecha prox reun', 'Verde');
INSERT INTO `t_p_estado_proy` (`p_estado_proy`, `p_signif_fecha`, `p_color_estado`) VALUES('En_Implementacion', 'Fecha estim fin implement', 'Verde');
INSERT INTO `t_p_estado_proy` (`p_estado_proy`, `p_signif_fecha`, `p_color_estado`) VALUES('Pre-Proyecto', 'Fecha sig reun', 'Verde');
INSERT INTO `t_p_estado_proy` (`p_estado_proy`, `p_signif_fecha`, `p_color_estado`) VALUES('Suspendido', 'Fecha estim reanudac', 'Rojo');
INSERT INTO `t_p_estado_proy` (`p_estado_proy`, `p_signif_fecha`, `p_color_estado`) VALUES('Terminado', 'Fecha terminac', 'Azul');

-- --------------------------------------------------------

--
-- Table structure for table `t_p_logs_estado_proy`
--

CREATE TABLE `t_p_logs_estado_proy` (
  `p_num_corr_proy` int(10) UNSIGNED NOT NULL,
  `p_estado_proy` varchar(20) NOT NULL,
  `p_fecha` date DEFAULT NULL,
  `p_signif_fecha` varchar(32) NOT NULL,
  `p_audio_cambio` varchar(256) NOT NULL DEFAULT 'N/D',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que registra los cambios de estado de un proyecto';

--
-- Dumping data for table `t_p_logs_estado_proy`
--

INSERT INTO `t_p_logs_estado_proy` (`p_num_corr_proy`, `p_estado_proy`, `p_fecha`, `p_signif_fecha`, `p_audio_cambio`, `last_update`) VALUES(1001, 'En_Ejecucion', '2019-01-24', 'Fecha prox reun', 'N/D', '2019-01-28 02:31:46');
INSERT INTO `t_p_logs_estado_proy` (`p_num_corr_proy`, `p_estado_proy`, `p_fecha`, `p_signif_fecha`, `p_audio_cambio`, `last_update`) VALUES(1002, 'En_Ejecucion', '2019-01-23', 'Fecha prox reun', 'N/D', '2019-01-28 02:32:28');
INSERT INTO `t_p_logs_estado_proy` (`p_num_corr_proy`, `p_estado_proy`, `p_fecha`, `p_signif_fecha`, `p_audio_cambio`, `last_update`) VALUES(1003, 'En_Ejecucion', '2019-01-23', 'Fecha prox reun', 'N/D', '2019-01-28 02:33:14');
INSERT INTO `t_p_logs_estado_proy` (`p_num_corr_proy`, `p_estado_proy`, `p_fecha`, `p_signif_fecha`, `p_audio_cambio`, `last_update`) VALUES(1004, 'En_Ejecucion', '2019-01-23', 'Fecha prox reun', 'N/D', '2019-01-28 02:33:47');
INSERT INTO `t_p_logs_estado_proy` (`p_num_corr_proy`, `p_estado_proy`, `p_fecha`, `p_signif_fecha`, `p_audio_cambio`, `last_update`) VALUES(999, 'Terminado', '2019-01-01', 'Fecha terminac', 'N/D', '2019-01-28 03:01:36');
INSERT INTO `t_p_logs_estado_proy` (`p_num_corr_proy`, `p_estado_proy`, `p_fecha`, `p_signif_fecha`, `p_audio_cambio`, `last_update`) VALUES(998, 'Cancelado', '2019-01-23', 'Fecha cancelacion', 'N/D', '2019-01-28 03:07:12');
INSERT INTO `t_p_logs_estado_proy` (`p_num_corr_proy`, `p_estado_proy`, `p_fecha`, `p_signif_fecha`, `p_audio_cambio`, `last_update`) VALUES(1005, 'En_Ejecucion', '2019-01-01', 'Fecha prox reun', 'N/D', '2019-01-28 03:09:35');
INSERT INTO `t_p_logs_estado_proy` (`p_num_corr_proy`, `p_estado_proy`, `p_fecha`, `p_signif_fecha`, `p_audio_cambio`, `last_update`) VALUES(1005, 'Terminado', '2019-01-15', 'Fecha terminac', 'N/D', '2019-01-28 06:09:35');
INSERT INTO `t_p_logs_estado_proy` (`p_num_corr_proy`, `p_estado_proy`, `p_fecha`, `p_signif_fecha`, `p_audio_cambio`, `last_update`) VALUES(1006, 'Pre-Proyecto', '2019-01-23', 'Fecha prox reun', 'N/D', '2019-01-28 16:12:46');

--
-- Triggers `t_p_logs_estado_proy`
--
DELIMITER $$
CREATE TRIGGER `after_t_p_logs_estado_proy_insert` AFTER INSERT ON `t_p_logs_estado_proy` FOR EACH ROW BEGIN
    UPDATE t_proyectos
    SET 
		p_num_corr_proy= NEW.p_num_corr_proy,
		p_ultimo_estado = NEW.p_estado_proy,
		last_update = NOW()
     WHERE p_num_corr_proy=NEW.p_num_corr_proy; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_t_p_logs_estado_proy_update` AFTER UPDATE ON `t_p_logs_estado_proy` FOR EACH ROW BEGIN
    UPDATE t_proyectos
    SET 
    p_num_corr_proy= OLD.p_num_corr_proy,
    p_ultimo_estado = NEW.p_estado_proy,
    last_update = NOW()
    WHERE OLD.p_num_corr_proy=NEW.p_num_corr_proy;  
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `t_p_logs_result_reun`
--

CREATE TABLE `t_p_logs_result_reun` (
  `p_num_corr_proy` int(10) UNSIGNED NOT NULL,
  `p_fecha_reun` date DEFAULT NULL,
  `p_tipo_reun` varchar(16) NOT NULL,
  `p_result_reun` varchar(16) NOT NULL,
  `p_fecha_prox_reun` date DEFAULT NULL,
  `p_audio_reun` varchar(256) NOT NULL DEFAULT 'N/D',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que registra los resultados de cada reunion relacionada con una OSC';

-- --------------------------------------------------------

--
-- Table structure for table `t_p_logs_tipo_proy`
--

CREATE TABLE `t_p_logs_tipo_proy` (
  `p_num_corr_proy` int(10) UNSIGNED NOT NULL,
  `p_tipo_proy` varchar(16) NOT NULL DEFAULT 'No Especificado',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que registra las tipificaciones que tiene un proyecto';

-- --------------------------------------------------------

--
-- Table structure for table `t_p_result_reun`
--

CREATE TABLE `t_p_result_reun` (
  `p_result_reun` varchar(16) NOT NULL,
  `p_color_reun` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lista de los posibles resultados de una reunion';

--
-- Dumping data for table `t_p_result_reun`
--

INSERT INTO `t_p_result_reun` (`p_result_reun`, `p_color_reun`) VALUES('Accion ASAP', 'Naranja');
INSERT INTO `t_p_result_reun` (`p_result_reun`, `p_color_reun`) VALUES('Normal', 'Verde');
INSERT INTO `t_p_result_reun` (`p_result_reun`, `p_color_reun`) VALUES('Postergada', 'Amarillo');

-- --------------------------------------------------------

--
-- Table structure for table `t_p_tipo_proy`
--

CREATE TABLE `t_p_tipo_proy` (
  `p_tipo_proy` varchar(16) NOT NULL DEFAULT 'No Especificado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lista de los posibles tipos de un proyecto';

--
-- Dumping data for table `t_p_tipo_proy`
--

INSERT INTO `t_p_tipo_proy` (`p_tipo_proy`) VALUES('Administracion');
INSERT INTO `t_p_tipo_proy` (`p_tipo_proy`) VALUES('Contable');
INSERT INTO `t_p_tipo_proy` (`p_tipo_proy`) VALUES('Estrategia');
INSERT INTO `t_p_tipo_proy` (`p_tipo_proy`) VALUES('Financiero');
INSERT INTO `t_p_tipo_proy` (`p_tipo_proy`) VALUES('Governance');
INSERT INTO `t_p_tipo_proy` (`p_tipo_proy`) VALUES('Interno');
INSERT INTO `t_p_tipo_proy` (`p_tipo_proy`) VALUES('Negocio Social');
INSERT INTO `t_p_tipo_proy` (`p_tipo_proy`) VALUES('No Especificado');
INSERT INTO `t_p_tipo_proy` (`p_tipo_proy`) VALUES('Procesos');
INSERT INTO `t_p_tipo_proy` (`p_tipo_proy`) VALUES('RRHH');
INSERT INTO `t_p_tipo_proy` (`p_tipo_proy`) VALUES('Sistemas');

-- --------------------------------------------------------

--
-- Table structure for table `t_p_tipo_reun`
--

CREATE TABLE `t_p_tipo_reun` (
  `p_tipo_reun` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lista de los posibles tipos de una reunion';

--
-- Dumping data for table `t_p_tipo_reun`
--

INSERT INTO `t_p_tipo_reun` (`p_tipo_reun`) VALUES('Con OSC');
INSERT INTO `t_p_tipo_reun` (`p_tipo_reun`) VALUES('Interna');

-- --------------------------------------------------------

--
-- Table structure for table `t_roles`
--

CREATE TABLE `t_roles` (
  `rol` varchar(6) NOT NULL DEFAULT 'Vol'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de datos para los posibles roles de un voluntario de Aportes';

--
-- Dumping data for table `t_roles`
--

INSERT INTO `t_roles` (`rol`) VALUES('Asist');
INSERT INTO `t_roles` (`rol`) VALUES('Col');
INSERT INTO `t_roles` (`rol`) VALUES('DC');
INSERT INTO `t_roles` (`rol`) VALUES('DP');
INSERT INTO `t_roles` (`rol`) VALUES('DPI');
INSERT INTO `t_roles` (`rol`) VALUES('PMO');
INSERT INTO `t_roles` (`rol`) VALUES('VC');
INSERT INTO `t_roles` (`rol`) VALUES('Vol');

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

INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(1, 'Titular', 'No_Asignada/o', 'N/D', 'N/D', 'N/D', '2019-02-13 17:23:22');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(2, 'Suplente', 'No_Asignada/o', 'N/D', 'N/D', 'N/D', '2019-02-13 17:22:50');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(999999, 'Croxatto', 'Horacio Luis', 'N/D', 'hcroxatto@yahoo.com', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(1000020, 'Quito', 'Esteban', 'Chantologo', 'tc@gmail.com', '', '2019-02-04 17:49:03');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(1000031, 'Lame', 'Elsa', 'Chantologa', 'es@gmail.com', '', '2019-02-04 20:52:59');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(1000033, 'Cachuchova', 'Julia', 'Chantologa', 'jc@gmail.com', '', '2019-02-07 13:35:13');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(1000200, 'Kurlat', 'Miguel Pedro', 'Ingeniero', 'miguel.kurlat@gmail.com', 'N/D', '2019-02-04 17:21:03');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(1000201, 'Elizalde', 'Federico', 'N/D', 'N/D', 'N/D', '2019-02-04 17:21:03');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(1000202, 'Cameo', 'Fredy', 'N/D', 'N/D', 'N/D', '2019-02-04 17:21:03');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(1000203, 'Iglesias', 'Jorge', 'N/D', 'N/D', 'N/D', '2019-02-04 17:21:03');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(1000204, 'Stilerman', 'David', 'N/D', 'N/D', 'N/D', '2019-02-04 17:21:03');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(1000205, 'Canabal', 'Patricia', 'N/D', 'pc_1083@yahoo.com.ar', 'N/D', '2019-02-04 17:21:03');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(1000206, 'Almiron', 'Daniel', 'N/D', 'daniel_almiron@yahoo.com.ar', 'N/D', '2019-02-04 17:21:03');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(1000207, 'Codara', 'Monica', 'N/D', 'monicacodara@gmail.com', 'mcodara@laestrellaretiro.com.ar', '2019-02-04 17:21:03');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(1000210, 'Casagrande', 'Jorge Gustavo', 'N/D', 'jorge.g.casagrande@gmail.com', 'N/D', '2019-02-04 17:21:03');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(1000211, 'Di Brico', 'Carlos Alberto', 'N/D', 'Carlos.dibrico@gmail.com', 'N/D', '2019-02-04 17:21:03');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(1000212, 'Garnelo', 'Leonardo', 'N/D', 'lgarnelo2001@yahoo.com.ar', 'N/D', '2019-02-04 17:21:03');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(1000213, 'Gutman', 'Sergio', 'N/D', 'sergio.gutman@gmail.com', 'N/D', '2019-02-04 17:21:03');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(1000214, 'Lanzillotta', 'Victor Eduardo', 'N/D', 've.lanzi@hotmail.com', 'N/D', '2019-02-04 17:21:03');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(1000215, 'Leonhardt', 'Ana', 'N/D', 'ana.leonhardt@gmail.com', 'N/D', '2019-02-04 17:21:03');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(1000216, 'Lopez', 'Gustavo', 'N/D', 'glopez1707@gmail.com', 'N/D', '2019-02-04 17:21:03');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(1000217, 'Meana', 'Maria Alicia', 'N/D', 'ali_meana@hotmail.com', 'N/D', '2019-02-04 17:21:03');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(1000218, 'Rivera', 'Luis Armando', 'N/D', 'luisarmandorivera@speedy.com.ar', 'N/D', '2019-02-04 17:21:03');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(1000219, 'Rodas', 'Jose Luis', 'N/D', 'jlrodas@gmail.com', 'N/D', '2019-02-04 17:21:03');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(1000220, 'Russo', 'Cecilia', 'N/D', 'ceciliarusso@ymail.com', 'N/D', '2019-02-04 17:21:03');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(1000221, 'Torresagasti', 'Maria Clara', 'N/D', 'ctorresagasti@yahoo.com.ar', ' clara.torresagasti@mdnicolas.com.ar', '2019-02-04 17:21:03');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(1000225, 'Truchinsky', 'Mario Jose', 'Chantologo', 'jt@gmail.com', 'N/D', '2019-02-13 20:32:48');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(4311689, 'Leschinsky', 'Lazaro', 'N/D', 'lazaro.leschinsky@gmail.com', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(4357215, 'Vilate', 'Roberto', 'N/D', 'rvilate@gmail.com', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(4368430, 'Fiocchi', 'Mario Alberto', 'N/D', 'mario.fiocchi@petrobras.com', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(4373628, 'D Alessio', 'Enrique', 'N/D', 'enrique.a.dalessio@gmail.com', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(4381690, 'Jalfen', 'Norberto Benjamin', 'N/D', 'jalfens@hotmail.com', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(4383620, 'Blumenthal', 'Roberto Jose', 'N/D', 'rblumenthal9@gmail.com', 'N/D', '2019-02-04 17:21:00');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(4403493, 'Falicoff', 'Eduardo', 'N/D', 'efalicoff@gmail.com', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(4412265, 'Pampillo', 'Raul Francisco Jose', 'N/D', 'pampillo@fibertel.com.ar', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(4437727, 'Castillo', 'Eduardo', 'N/D', 'eduardocastillo13@gmail.com', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(4444524, 'Romero', 'Norberto', 'N/D', 'n.romero@ar.inter.net', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(4514672, 'Cortes', 'Eduardo', 'N/D', 'ecortes229@hotmail.com', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(4520142, 'Vicente', 'Carlos Alberto', 'N/D', 'Cvicente45@outlook.com', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(4536924, 'Sorrosal', 'Gustavo', 'N/D', 'gustavo.sorrosal@fibertel.com.ar', ' gsorrosal@proveedores.siderca.com', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(4543686, 'Deleonardis', 'Godofredo', 'N/D', 'gdeleonardis@fibertel.com.ar', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(4548676, 'Sarno', 'Rodolfo', 'N/D', 'rodsrn@gmail.com', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(4553179, 'Quintana Aguilar', 'Jose Alberto', 'N/D', 'jquintana.ar@fibertel.com.ar', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(4556079, 'Philipps', 'Roberto', 'N/D', 'rphilipps@ternium.com', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(4747813, 'Liendo', 'Jose Maria', 'N/D', 'jose_liendo@yahoo.com.ar', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(4981277, 'Vogel', 'Guillermo Enrique', 'N/D', 'guillermo_vogel@hotmail.com', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(5315515, 'Cabo', 'Celia', 'N/D', 'celia.cabo@yahoo.com.ar', 'N/D', '2019-02-04 17:21:00');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(5931630, 'Gonzalez Rosas', 'Graciela Juana', 'N/D', 'gracielagrosas@gmail.com', 'N/D', '2019-02-04 17:21:03');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(6082141, 'Marcer', 'José Luis', 'N/D', 'jlmarcer@dow.com', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(6153590, 'D Avola', 'Marta Ines', 'N/D', 'marta@retisrrhh.com.ar', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(6714305, 'Pezzolla', 'Cecilia', 'N/D', 'cpezzolla@fibertel.com.ar', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(7375447, 'Lopez', 'Horacio', 'N/D', 'hlopez1@fibertel.com.ar', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(7604925, 'Zucchino', 'Cesar', 'N/D', 'cesar.zucchino@gmail.com', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(7621101, 'Fossati', 'Eduardo Jorge', 'N/D', 'eduardojfossati@gmail.com', 'N/D', '2019-02-04 17:21:03');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(7638418, 'Lopez Marti', 'Juan Carlos', 'N/D', 'jclmarti@itba.edu.ar', 'jclopezmarti@gmail.com', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(7660708, 'Bagg', 'Luis', 'N/D', 'eugenio.bagg@gmail.com', 'N/D', '2019-02-04 17:21:00');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(7685597, 'Pujals', 'Fernando', 'N/D', 'pujals9@gmail.com', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(7704808, 'Rabinovich', 'Delfin', 'N/D', 'delfin@fibertel.com.ar', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(7837645, 'Carchak Canes', 'Rafael Angel', 'N/D', 'rafael.carchak@energeia.com.ar', ' rcarchak@fibertel.com.ar', '2019-02-04 17:21:00');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(8261239, 'Hall', 'Peter', 'N/D', 'peter.hall.arg@gmail.com', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(8406769, 'Magnus', 'Tomás Rubén', 'N/D', 'elianeytommy@gmail.com', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(8591589, 'Conde', 'Roberto Pablo', 'N/D', 'rpconde@fibertel.com.ar', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(8627432, 'Vega', 'Ruben Oscar', 'N/D', 'rvega706@gmail.com', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(10110647, 'Prado', 'Pablo Raul', 'N/D', 'N/D', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(10123767, 'Larralde', 'Roberto', 'N/D', 'larralde@abe.org.ar', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(10125826, 'Di Nucci', 'Jorge Nicolas', 'N/D', 'jndinucci@gmail.com', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(10128986, 'Donzelli', 'Alejandro', 'N/D', 'adonzelli@fibertel.com.ar', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(10161593, 'Fidalgo', 'Ruben Omar', 'N/D', 'rufidalgo@gmail.com', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(10260310, 'Spielmann', 'Susana Ines', 'N/D', 'susyspielmann@gmail.com', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(10558702, 'Peña', 'Maria del Carmen', 'N/D', 'mcpena34@gmail.com', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(10661746, 'Indaco', 'Alfredo Antonio', 'N/D', 'alfredo.in@gmail.com', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(11023715, 'Arco', 'Alberto', 'N/D', 'arcoalberto@hotmail.com', 'N/D', '2019-02-04 17:21:00');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(11077171, 'Albisetti', 'Carlos Jose', 'N/D', 'calbisetti@gmail.com', 'N/D', '2019-02-04 17:21:00');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(11285447, 'Dubko', 'Basilio', 'N/D', 'basilio_dubko@yahoo.com', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(11362109, 'Sabban Cohen', 'Rafael', 'N/D', 'litorcs@gmail.com', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(11368729, 'Niemetz', 'Jorge Alberto', 'N/D', 'mailto:jniemetz@gmail.com', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(11467178, 'Kievsky', 'Ariel', 'N/D', 'ariel.kievsky@tec-consultores.com.ar', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(11478659, 'Villahoz', 'Carlos Alberto', 'N/D', 'carlos.villahoz@gmail.com', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(11524703, 'Oxoby', 'Marta Elena', 'N/D', 'moxoby@dianthus.com.ar  ', '   oxobymarthe03@gmail.com', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(11710217, 'Vasaro', 'Vilma', 'N/D', 'Vilmava09@yahoo.com.ar', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(11788722, 'Brandt', 'Roberto Daniel', 'N/D', 'robertodbrandt@googlemail.com', 'N/D', '2019-02-04 17:21:00');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(11802203, 'Pages', 'Jose', 'N/D', 'jose.pages@itau.com.ar', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(11815205, 'Iglesias', 'Alicia Josefina', 'N/D', 'aigle955@gmail.com', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(11997550, 'Pfister', 'Arnoldo', 'N/D', 'aopfister@hotmail.com', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(12001693, 'Valchi', 'Elvio', 'N/D', 'elvio.valchi@gmail.com', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(12062579, 'Fernandez', 'Carlos Ezequiel', 'N/D', 'N/D', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(12107641, 'Nuevo', 'Susana', 'N/D', 'snuevo@gmail.com', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(12332887, 'Scheuer', 'Ricardo', 'N/D', 'r.scheuer@evolution-tactic.com', 'r.scheuer@arnet.com.ar', '2019-02-04 17:21:03');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(12463662, 'Schargorodsky', 'Gregorio', 'N/D', 'gregorio.schargorodsky@ar.ey.com', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(12600203, 'Serebrennik', 'Diego', 'N/D', 'diegoserebre@gmail.com', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(12601664, 'San Gil', 'Ernesto', 'N/D', 'ernesto.san.gil@gmail.com', ' vivimbecerra@gmail.com', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(12861175, 'KEBLERIS', 'SILVIA MARCELA', 'N/D', 'smkebleris@gmail.com', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(12865409, 'Fuster', 'Patricia Maria', 'N/D', 'mpfuster@gmail.com', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(12865523, 'Sgro', 'Silvia', 'N/D', 'ssgro@redhat.com', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(13211906, 'Valotta', 'Carlos Augusto', 'N/D', 'carlosvalotta@hotmail.com', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(13237942, 'Soula', 'Gerardo Augusto', 'N/D', 'gerynet@icloud.com', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(13394776, 'Maletta', 'Mirta', 'N/D', 'mirtamaletta@arnet.com.ar', 'mirta.maletta@aportesdegestion.org.ar', '2019-02-04 17:21:03');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(13980034, 'Flores', 'Osvaldo Antonio', 'N/D', 'osvaldo.flores@ar.ey.com', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(14026826, 'CASTILLO', 'MARIA ESTELA', 'N/D', 'mariaestelacastillo@gmail.com', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(14772995, 'Tournier', 'Maria Jose', 'N/D', 'mariajtournier@hotmail.com', 'N/D', '2019-02-04 17:21:03');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(14809026, 'Marine', 'Jorge', 'N/D', 'jorge_marine@hotmail.com', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(14927381, 'Sanchez', 'Gustavo', 'N/D', 'mailto:gsanchez.ar@gmail.com', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(16412832, 'De Paul', 'Fabian', 'N/D', 'depaulfabian@gmail.com', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(17233641, 'Segura', 'Jorge Gustavo', 'N/D', 'segurajorgegustavo@gmail.com', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(17446349, 'Zamora', 'Diana', 'N/D', 'dianazamora@gmail.com', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(17481570, 'Moya', 'Claudia', 'N/D', 'moya_claudia@hotmail.com', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(17812861, 'Gaston', 'Laura', 'N/D', 'gastonlaura@hotmail.com', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(18475365, 'Lijtman', 'Daniel', 'N/D', 'daniel.lijtman@gmail.com', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(20665260, 'Imbrogno', 'Mariano', 'N/D', 'mariano.imbrogno@gmail.com', 'N/D', '2019-02-04 17:21:03');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(21764250, 'GARDELLA', 'Alejandro P.', 'N/D', 'Newtango1970@yahoo.com', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(22759102, 'Sarabia', 'Esteban', 'N/D', 'esteban@sarabia.com', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(24569384, 'Scquizzato', 'Natalia', 'N/D', 'natalia.scquizzato@ar.ey.com', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(26115457, 'Jejcic', 'Guillermo', 'N/D', 'guillermo.jejcic@itau.com.ar', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(29217019, 'Lopez Dagan', 'Maria Eugenia', 'N/D', 'N/D', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(92334192, 'LLano Leguizamon', 'Carmen Ines', 'N/D', 'carmen.llano@gmail.com', 'N/D', '2019-02-04 17:21:01');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(93345440, 'Bernardini', 'Maria Elizabeth', 'N/D', 'ebernardini@kenwin.net', 'N/D', '2019-02-04 17:21:00');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(93445268, 'Rosenfeld', 'Zoltan', 'N/D', 'zoltan.cyb@gmail.com', 'N/D', '2019-02-04 17:21:02');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(93609657, 'Testa', 'Jose', 'N/D', 'testa.jose@gmail.com', 'N/D', '2019-02-04 17:21:03');
INSERT INTO `t_users1` (`dni`, `apellido`, `nombres`, `profesion`, `email_1`, `email_2`, `last_update`) VALUES(94602041, 'Rovira Cubillo', 'Alejandro Enrique', 'N/D', 'alejandro.rovirac@gmail.com', 'N/D', '2019-02-04 17:21:02');

-- --------------------------------------------------------

--
-- Table structure for table `t_users2`
--

CREATE TABLE `t_users2` (
  `dni` int(10) UNSIGNED NOT NULL,
  `cuil` varchar(14) NOT NULL DEFAULT 'N/D',
  `rol` varchar(6) NOT NULL DEFAULT 'Vol',
  `estado` varchar(14) NOT NULL DEFAULT 'Desconoc',
  `comentarios` varchar(256) DEFAULT 'No Comments',
  `tel_1` varchar(20) DEFAULT 'N/D',
  `tel_2` varchar(20) DEFAULT 'N/D',
  `a_socio` year(4) NOT NULL DEFAULT '0000',
  `status_socio` enum('Si','No','Declino') DEFAULT 'No',
  `f_ingreso` date NOT NULL DEFAULT '2004-01-01',
  `acuerdo` enum('Si','No','N/D','N/A') DEFAULT 'N/A',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de datos RESTRINGIDOS de los voluntarios de Aportes';

--
-- Dumping data for table `t_users2`
--

INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(1, 'N/D', 'DC', 'Desconoc', 'No Comments', 'N/D', 'N/D', 2011, 'No', '2000-01-01', 'No', '2019-02-04 17:24:33');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(2, 'N/D', 'DC', 'Desconoc', 'No Comments', 'N/D', 'N/D', 2011, 'No', '2000-01-01', 'No', '2019-02-04 17:24:51');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(999999, 'N/D', 'Vol', 'ND_Temp', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(1000020, '11 1000020 3', 'Vol', 'Asignado', 'No sirve para nada', '4444 5555', '', 0000, 'No', '2018-01-01', 'N/A', '2019-02-04 17:52:25');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(1000031, '11 1000031 3', 'Vol', 'Asignado', 'No sirve ni regalada', '4444 6666', '', 0000, 'No', '2018-01-02', 'N/A', '2019-02-06 13:50:16');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(1000033, '11 1000030 33', 'Vol', 'Asignado', 'No sirve para nada', '4444 5555', '', 0000, 'No', '2018-01-03', 'N/A', '2019-02-08 11:47:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(1000200, 'N/D', 'DC', 'Disponible', 'No Comments', '+54-911-4479-8810', 'N/D', 2011, 'No', '2011-09-18', 'Si', '2019-02-04 17:21:03');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(1000201, 'N/D', 'DC', 'Disponible', 'No Comments', 'N/D', 'N/D', 2011, 'No', '2011-09-18', 'Si', '2019-02-04 17:21:03');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(1000202, 'N/D', 'DC', 'Disponible', 'No Comments', 'N/D', 'N/D', 2011, 'No', '2011-09-18', 'Si', '2019-02-04 17:21:03');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(1000203, 'N/D', 'DC', 'Disponible', 'No Comments', 'N/D', 'N/D', 2011, 'No', '2011-09-18', 'Si', '2019-02-04 17:21:03');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(1000204, 'N/D', 'DC', 'Disponible', 'No Comments', 'N/D', 'N/D', 2011, 'No', '2011-09-18', 'Si', '2019-02-04 17:21:03');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(1000205, 'N/D', 'DC', 'Disponible', 'No Comments', '+54-911-5327-6672', '+54-11-5787-1891', 2014, 'No', '2014-08-06', 'Si', '2019-02-04 17:21:03');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(1000206, 'N/D', 'DC', 'Disponible', 'No Comments', '+54-911-4565-3234', 'N/D', 2016, 'No', '2009-10-22', 'Si', '2019-02-04 17:21:03');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(1000207, 'N/D', 'DC', 'Disponible', 'No Comments', '+54-911-6554-6630', '+54-11-4785-2292', 2016, 'No', '2012-10-01', 'Si', '2019-02-04 17:21:03');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(1000210, 'N/D', 'Vol', 'ND_Temp', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:03');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(1000211, 'N/D', 'Vol', 'ND_Temp', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:03');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(1000212, 'N/D', 'Vol', 'ND_Temp', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:03');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(1000213, 'N/D', 'Vol', 'Puntual', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:03');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(1000214, 'N/D', 'Vol', 'Disponible', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:03');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(1000215, 'N/D', 'Vol', 'ND_Temp', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:03');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(1000216, 'N/D', 'Vol', 'ND_Temp', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:03');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(1000217, 'N/D', 'Vol', 'Disponible', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:03');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(1000218, 'N/D', 'Vol', 'ND_Temp', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:03');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(1000219, 'N/D', 'Vol', 'Disponible', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:03');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(1000220, 'N/D', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:03');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(1000221, 'N/D', 'Vol', 'ND_Temp', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:03');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(1000225, '11 1000225 3', 'VC', 'Disponible', 'No sirve para nada', '4444 5555', '', 2019, 'No', '2018-01-01', 'N/A', '2019-02-13 20:33:36');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(4311689, '20-04311689-5', 'Vol', 'Disponible', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(4357215, 'N/D', 'Vol', 'Disponible', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(4368430, 'N/D', 'Vol', 'Disponible', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(4373628, 'N/D', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(4381690, 'N/D', 'Vol', 'ND_Temp', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(4383620, '20-04383620-0', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:00');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(4403493, 'N/D', 'Vol', 'Disponible', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(4412265, 'N/D', 'Vol', 'Disponible', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(4437727, '20-04437727-7', 'Vol', 'ND_Temp', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(4444524, 'N/D', 'Vol', 'Disponible', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(4514672, 'N/D', 'Vol', 'Interno', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(4520142, '20-04520142-3', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(4536924, '20-04536924-3', 'Vol', 'Disponible', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(4543686, 'N/D', 'Vol', 'ND_Temp', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(4548676, 'N/D', 'Vol', 'Disponible', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(4553179, 'N/D', 'Vol', 'Disponible', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(4556079, '20-04556079-02', 'Vol', 'ND_Temp', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(4747813, 'N/D', 'Vol', 'ND_Temp', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(4981277, 'N/D', 'Vol', 'Disponible', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(5315515, 'N/D', 'Vol', 'Interno', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:00');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(5931630, 'N/D', 'Vol', 'Disponible', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:03');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(6082141, '20-06082141-1', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(6153590, '27-06153590-5', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(6714305, 'N/D', 'Vol', 'ND_Temp', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(7375447, 'N/D', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(7604925, '20-07604925-5', 'Vol', 'ND_Temp', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:03');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(7621101, 'N/D', 'Vol', 'Disponible', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:03');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(7638418, 'N/D', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(7660708, '20-07660708-8', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:00');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(7685597, 'N/D', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(7704808, 'N/D', 'Vol', 'Disponible', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(7837645, '20-07837645-8', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:00');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(8261239, 'N/D', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(8406769, 'N/D', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(8591589, 'N/D', 'Vol', 'ND_Temp', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(8627432, 'N/D', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(10110647, 'N/D', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(10123767, 'N/D', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(10125826, 'N/D', 'Vol', 'ND_Temp', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(10128986, '23-10128986-9', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(10161593, 'N/D', 'Vol', 'Disponible', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(10260310, '27-10260310-4', 'Vol', 'Interno', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(10558702, '27-10558702-9', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(10661746, 'N/D', 'Vol', 'Disponible', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(11023715, 'N/D', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:00');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(11077171, 'N/D', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:00');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(11285447, 'N/D', 'Vol', 'Asignado', 'No Comments', '+54 911 4044 3540', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-07 20:46:47');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(11362109, 'N/D', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(11368729, 'N/D', 'Vol', 'Con_Restricc', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(11467178, '23-11467178-9', 'Vol', 'Disponible', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(11478659, 'N/D', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(11524703, 'N/D', 'Vol', 'Disponible', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(11710217, 'N/D', 'Vol', 'Disponible', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(11788722, 'N/D', 'Vol', 'ND_Temp', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:00');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(11802203, 'N/D', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(11815205, 'N/D', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(11997550, 'N/D', 'Vol', 'Disponible', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(12001693, '20-12001693-9', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(12062579, '23-12062579-9', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(12107641, '27-12107641-7', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(12332887, 'N/D', 'DC', 'Disponible', 'No Comments', '+54-911-4449-4102', 'N/D', 2011, 'No', '2011-12-11', 'Si', '2019-02-04 17:21:03');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(12463662, 'N/D', 'Vol', 'ND_Temp', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(12600203, '20-12600203-4', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(12601664, '20-12601664-7', 'Vol', 'ND_Temp', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(12861175, 'N/D', 'Vol', 'Disponible', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(12865409, 'N/D', 'Vol', 'Disponible', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(12865523, 'N/D', 'Vol', 'ND_Temp', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(13211906, '20-13211906-7', 'Vol', 'ND_Temp', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(13237942, 'N/D', 'Vol', 'Disponible', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(13394776, 'N/D', 'DC', 'Disponible', 'No Comments', '+54-911-5378-1899', 'N/D', 2011, 'No', '2011-09-18', 'Si', '2019-02-04 17:21:03');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(13980034, 'N/D', 'Vol', 'ND_Temp', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(14026826, 'N/D', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(14772995, 'N/D', 'DC', 'Disponible', 'No Comments', '+54-911-4938-7133', '+54-11-4784-4978', 2013, 'No', '2013-06-27', 'Si', '2019-02-04 17:21:03');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(14809026, '20-14809026-3', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(14927381, 'N/D', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(16412832, 'N/D', 'Vol', 'ND_Temp', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(17233641, 'N/D', 'Vol', 'Disponible', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(17446349, 'N/D', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(17481570, 'N/D', 'Vol', 'ND_Temp', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(17812861, 'N/D', 'Vol', 'Interno', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(18475365, 'N/D', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(20665260, 'N/D', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:03');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(21764250, 'N/D', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(22759102, 'N/D', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(24569384, 'N/D', 'Vol', 'ND_Temp', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(26115457, 'N/D', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(29217019, '27-29217019-5', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(92334192, 'N/D', 'Vol', 'Disponible', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:01');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(93345440, 'N/D', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:00');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(93445268, '20-93445268-3', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(93609657, 'N/D', 'DC', 'Disponible', 'No Comments', '+54-911-5563-8100', 'N/D', 2011, 'No', '2011-09-18', 'Si', '2019-02-04 17:21:03');
INSERT INTO `t_users2` (`dni`, `cuil`, `rol`, `estado`, `comentarios`, `tel_1`, `tel_2`, `a_socio`, `status_socio`, `f_ingreso`, `acuerdo`, `last_update`) VALUES(94602041, 'N/D', 'Vol', 'Asignado', 'No Comments', 'N/D', 'N/D', 0000, 'No', '2004-01-01', 'N/A', '2019-02-04 17:21:02');

-- --------------------------------------------------------

--
-- Stand-in structure for view `us1_us2`
--
CREATE TABLE `us1_us2` (
`dni` int(10) unsigned
,`apellido` varchar(45)
,`nombres` varchar(45)
,`email_1` varchar(50)
,`rol` varchar(6)
,`estado` varchar(14)
,`tel_1` varchar(20)
,`tel_2` varchar(20)
);

-- --------------------------------------------------------

--
-- Structure for view `list_osc_dc_supl`
--
DROP TABLE IF EXISTS `list_osc_dc_supl`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `list_osc_dc_supl`  AS  select `t_osc`.`osc_nombre` AS `osc_nombre`,`t_osc`.`osc_f_supl` AS `osc_f_supl`,`t_users1`.`dni` AS `dni`,`t_users1`.`apellido` AS `apellido`,`t_users1`.`nombres` AS `nombres` from (`t_users1` join `t_osc` on((`t_users1`.`dni` = `t_osc`.`osc_dc_supl`))) ;

-- --------------------------------------------------------

--
-- Structure for view `list_osc_dc_tit`
--
DROP TABLE IF EXISTS `list_osc_dc_tit`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `list_osc_dc_tit`  AS  select `t_osc`.`osc_nombre` AS `osc_nombre`,`t_osc`.`osc_f_titular` AS `osc_f_titular`,`t_users1`.`dni` AS `dni`,`t_users1`.`apellido` AS `apellido`,`t_users1`.`nombres` AS `nombres` from (`t_users1` join `t_osc` on((`t_users1`.`dni` = `t_osc`.`osc_dc_tit`))) ;

-- --------------------------------------------------------

--
-- Structure for view `osc_proy`
--
DROP TABLE IF EXISTS `osc_proy`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `osc_proy`  AS  select distinct `t_hist_user_proy`.`dni` AS `dni`,`t_proyectos`.`p_num_corr_proy` AS `p_num_corr_proy`,`t_proyectos`.`osc_nombre` AS `osc_nombre`,`t_proyectos`.`p_nombre_proy` AS `p_nombre_proy`,`t_proyectos`.`p_ultimo_estado` AS `p_ultimo_estado` from (`t_proyectos` join `t_hist_user_proy` on((`t_proyectos`.`p_num_corr_proy` = `t_hist_user_proy`.`p_num_corr_proy`))) ;

-- --------------------------------------------------------

--
-- Structure for view `us1_us2`
--
DROP TABLE IF EXISTS `us1_us2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `us1_us2`  AS  select `t_users1`.`dni` AS `dni`,`t_users1`.`apellido` AS `apellido`,`t_users1`.`nombres` AS `nombres`,`t_users1`.`email_1` AS `email_1`,`t_users2`.`rol` AS `rol`,`t_users2`.`estado` AS `estado`,`t_users2`.`tel_1` AS `tel_1`,`t_users2`.`tel_2` AS `tel_2` from (`t_users1` join `t_users2` on((`t_users1`.`dni` = `t_users2`.`dni`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_cambios_estado`
--
ALTER TABLE `t_cambios_estado`
  ADD PRIMARY KEY (`id_truch`);

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
-- Indexes for table `t_hist_user_proy`
--
ALTER TABLE `t_hist_user_proy`
  ADD PRIMARY KEY (`id_truch`),
  ADD KEY `idx_fk_hist_dni` (`dni`),
  ADD KEY `idx_fk_hu_num_corr_proy` (`p_num_corr_proy`);

--
-- Indexes for table `t_logs_estado_user`
--
ALTER TABLE `t_logs_estado_user`
  ADD PRIMARY KEY (`id_truch`),
  ADD KEY `idx_fk_dni` (`dni`),
  ADD KEY `idx_fk_estado` (`estado`);

--
-- Indexes for table `t_osc`
--
ALTER TABLE `t_osc`
  ADD PRIMARY KEY (`osc_nombre`),
  ADD KEY `idx_fk_osc_tit` (`osc_dc_tit`),
  ADD KEY `idx_fk_osc_supl` (`osc_dc_supl`),
  ADD KEY `idx_fk_osc_estado` (`osc_estado`);

--
-- Indexes for table `t_osc_contactos`
--
ALTER TABLE `t_osc_contactos`
  ADD KEY `idx_fk_osc_nombre` (`osc_nombre`);

--
-- Indexes for table `t_osc_estados`
--
ALTER TABLE `t_osc_estados`
  ADD PRIMARY KEY (`osc_estado`);

--
-- Indexes for table `t_osc_lista_objetivos`
--
ALTER TABLE `t_osc_lista_objetivos`
  ADD PRIMARY KEY (`osc_objetivo`);

--
-- Indexes for table `t_osc_logs_dc`
--
ALTER TABLE `t_osc_logs_dc`
  ADD PRIMARY KEY (`id_truch`),
  ADD KEY `idx_fk_osc_logs_dc_dni` (`dni`),
  ADD KEY `idx_fk_logs_dc_osc_nombre` (`osc_nombre`),
  ADD KEY `idx_fk_osc_logs_rol` (`osc_rol_dc`);

--
-- Indexes for table `t_osc_logs_estado`
--
ALTER TABLE `t_osc_logs_estado`
  ADD KEY `idx_fk_logs_est_dni_autor` (`dni`),
  ADD KEY `idx_fk_logs_est_osc_nombre` (`osc_nombre`),
  ADD KEY `idx_fk_logs_est_osc_estado` (`osc_estado`);

--
-- Indexes for table `t_osc_objetivos`
--
ALTER TABLE `t_osc_objetivos`
  ADD PRIMARY KEY (`id_truch`),
  ADD KEY `idx_fk_osc_objet_nombre` (`osc_nombre`),
  ADD KEY `idx_fk_osc_objet_obj` (`osc_objetivo`);

--
-- Indexes for table `t_osc_rol_dc`
--
ALTER TABLE `t_osc_rol_dc`
  ADD PRIMARY KEY (`osc_rol_dc`);

--
-- Indexes for table `t_profesiones`
--
ALTER TABLE `t_profesiones`
  ADD PRIMARY KEY (`profesion`);

--
-- Indexes for table `t_proyectos`
--
ALTER TABLE `t_proyectos`
  ADD PRIMARY KEY (`p_num_corr_proy`),
  ADD UNIQUE KEY `p_num_corr_proy` (`p_num_corr_proy`),
  ADD KEY `idx_fk_p_osc_nombre` (`osc_nombre`);

--
-- Indexes for table `t_p_estado_proy`
--
ALTER TABLE `t_p_estado_proy`
  ADD PRIMARY KEY (`p_estado_proy`);

--
-- Indexes for table `t_p_logs_estado_proy`
--
ALTER TABLE `t_p_logs_estado_proy`
  ADD KEY `idx_fk_ple_num_corr_proy` (`p_num_corr_proy`),
  ADD KEY `idx_fk_estado_proy` (`p_estado_proy`);

--
-- Indexes for table `t_p_logs_result_reun`
--
ALTER TABLE `t_p_logs_result_reun`
  ADD KEY `idx_fk_r_num_corr_proy` (`p_num_corr_proy`),
  ADD KEY `idx_fk_p_tipo_reun` (`p_tipo_reun`),
  ADD KEY `idx_fk_p_result_reun` (`p_result_reun`);

--
-- Indexes for table `t_p_logs_tipo_proy`
--
ALTER TABLE `t_p_logs_tipo_proy`
  ADD KEY `idx_fk_plt_num_corr_proy` (`p_num_corr_proy`),
  ADD KEY `idx_fk_tipo_proy` (`p_tipo_proy`);

--
-- Indexes for table `t_p_result_reun`
--
ALTER TABLE `t_p_result_reun`
  ADD PRIMARY KEY (`p_result_reun`);

--
-- Indexes for table `t_p_tipo_proy`
--
ALTER TABLE `t_p_tipo_proy`
  ADD PRIMARY KEY (`p_tipo_proy`);

--
-- Indexes for table `t_p_tipo_reun`
--
ALTER TABLE `t_p_tipo_reun`
  ADD PRIMARY KEY (`p_tipo_reun`);

--
-- Indexes for table `t_roles`
--
ALTER TABLE `t_roles`
  ADD PRIMARY KEY (`rol`);

--
-- Indexes for table `t_users1`
--
ALTER TABLE `t_users1`
  ADD PRIMARY KEY (`dni`),
  ADD KEY `idx_fk_prof` (`profesion`);

--
-- Indexes for table `t_users2`
--
ALTER TABLE `t_users2`
  ADD UNIQUE KEY `dni` (`dni`),
  ADD KEY `idx_fk_dni` (`dni`),
  ADD KEY `idx_fk_rol` (`rol`),
  ADD KEY `idx_fk_estado` (`estado`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_cambios_estado`
--
ALTER TABLE `t_cambios_estado`
  MODIFY `id_truch` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `t_hist_user_proy`
--
ALTER TABLE `t_hist_user_proy`
  MODIFY `id_truch` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `t_logs_estado_user`
--
ALTER TABLE `t_logs_estado_user`
  MODIFY `id_truch` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;
--
-- AUTO_INCREMENT for table `t_osc_logs_dc`
--
ALTER TABLE `t_osc_logs_dc`
  MODIFY `id_truch` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `t_osc_objetivos`
--
ALTER TABLE `t_osc_objetivos`
  MODIFY `id_truch` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=423;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_especialidad_user`
--
ALTER TABLE `t_especialidad_user`
  ADD CONSTRAINT `fk_especialidad_dni` FOREIGN KEY (`dni`) REFERENCES `t_users1` (`dni`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_especialidades_especialidad` FOREIGN KEY (`especialidad`) REFERENCES `t_especialidades` (`especialidad`) ON UPDATE CASCADE;

--
-- Constraints for table `t_hist_user_proy`
--
ALTER TABLE `t_hist_user_proy`
  ADD CONSTRAINT `fk_hist_dni` FOREIGN KEY (`dni`) REFERENCES `t_users1` (`dni`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_hu_num_corr_proy` FOREIGN KEY (`p_num_corr_proy`) REFERENCES `t_proyectos` (`p_num_corr_proy`) ON UPDATE CASCADE;

--
-- Constraints for table `t_logs_estado_user`
--
ALTER TABLE `t_logs_estado_user`
  ADD CONSTRAINT `fk_estado_dni` FOREIGN KEY (`dni`) REFERENCES `t_users1` (`dni`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estados_estado` FOREIGN KEY (`estado`) REFERENCES `t_estados` (`estado`) ON UPDATE CASCADE;

--
-- Constraints for table `t_osc`
--
ALTER TABLE `t_osc`
  ADD CONSTRAINT `fk_osc_estado` FOREIGN KEY (`osc_estado`) REFERENCES `t_osc_estados` (`osc_estado`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_osc_supl` FOREIGN KEY (`osc_dc_supl`) REFERENCES `t_users1` (`dni`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_osc_tit` FOREIGN KEY (`osc_dc_tit`) REFERENCES `t_users1` (`dni`) ON UPDATE CASCADE;

--
-- Constraints for table `t_osc_contactos`
--
ALTER TABLE `t_osc_contactos`
  ADD CONSTRAINT `fk_osc_nombre` FOREIGN KEY (`osc_nombre`) REFERENCES `t_osc` (`osc_nombre`) ON UPDATE CASCADE;

--
-- Constraints for table `t_osc_logs_dc`
--
ALTER TABLE `t_osc_logs_dc`
  ADD CONSTRAINT `fk_logs_dc_osc_nombre` FOREIGN KEY (`osc_nombre`) REFERENCES `t_osc` (`osc_nombre`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_osc_logs_dc_dni` FOREIGN KEY (`dni`) REFERENCES `t_users1` (`dni`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_osc_logs_rol_dc` FOREIGN KEY (`osc_rol_dc`) REFERENCES `t_osc_rol_dc` (`osc_rol_dc`) ON UPDATE CASCADE;

--
-- Constraints for table `t_osc_logs_estado`
--
ALTER TABLE `t_osc_logs_estado`
  ADD CONSTRAINT `fk_logs_est_dni_autor` FOREIGN KEY (`dni`) REFERENCES `t_users1` (`dni`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_logs_est_osc_estado` FOREIGN KEY (`osc_estado`) REFERENCES `t_osc_estados` (`osc_estado`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_logs_est_osc_nombre` FOREIGN KEY (`osc_nombre`) REFERENCES `t_osc` (`osc_nombre`) ON UPDATE CASCADE;

--
-- Constraints for table `t_osc_objetivos`
--
ALTER TABLE `t_osc_objetivos`
  ADD CONSTRAINT `fk_osc_objet_nombre` FOREIGN KEY (`osc_nombre`) REFERENCES `t_osc` (`osc_nombre`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_osc_objet_obj` FOREIGN KEY (`osc_objetivo`) REFERENCES `t_osc_lista_objetivos` (`osc_objetivo`) ON UPDATE CASCADE;

--
-- Constraints for table `t_proyectos`
--
ALTER TABLE `t_proyectos`
  ADD CONSTRAINT `fk_p_osc_nombre` FOREIGN KEY (`osc_nombre`) REFERENCES `t_osc` (`osc_nombre`) ON UPDATE CASCADE;

--
-- Constraints for table `t_p_logs_estado_proy`
--
ALTER TABLE `t_p_logs_estado_proy`
  ADD CONSTRAINT `fk_ple_num_corr_proy` FOREIGN KEY (`p_num_corr_proy`) REFERENCES `t_proyectos` (`p_num_corr_proy`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_proy_estado_proy` FOREIGN KEY (`p_estado_proy`) REFERENCES `t_p_estado_proy` (`p_estado_proy`) ON UPDATE CASCADE;

--
-- Constraints for table `t_p_logs_result_reun`
--
ALTER TABLE `t_p_logs_result_reun`
  ADD CONSTRAINT `fk_p_result_reun` FOREIGN KEY (`p_result_reun`) REFERENCES `t_p_result_reun` (`p_result_reun`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_p_tipo_reun` FOREIGN KEY (`p_tipo_reun`) REFERENCES `t_p_tipo_reun` (`p_tipo_reun`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_r_num_corr_proy` FOREIGN KEY (`p_num_corr_proy`) REFERENCES `t_proyectos` (`p_num_corr_proy`) ON UPDATE CASCADE;

--
-- Constraints for table `t_p_logs_tipo_proy`
--
ALTER TABLE `t_p_logs_tipo_proy`
  ADD CONSTRAINT `fk_plt_num_corr_proy` FOREIGN KEY (`p_num_corr_proy`) REFERENCES `t_proyectos` (`p_num_corr_proy`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tipo_proy` FOREIGN KEY (`p_tipo_proy`) REFERENCES `t_p_tipo_proy` (`p_tipo_proy`) ON UPDATE CASCADE;

--
-- Constraints for table `t_users1`
--
ALTER TABLE `t_users1`
  ADD CONSTRAINT `fk_profesiones_profesion` FOREIGN KEY (`profesion`) REFERENCES `t_profesiones` (`profesion`) ON UPDATE CASCADE;

--
-- Constraints for table `t_users2`
--
ALTER TABLE `t_users2`
  ADD CONSTRAINT `fk_users2_dni` FOREIGN KEY (`dni`) REFERENCES `t_users1` (`dni`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_users2_estado` FOREIGN KEY (`estado`) REFERENCES `t_estados` (`estado`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_users2_rol` FOREIGN KEY (`rol`) REFERENCES `t_roles` (`rol`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
