SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS aportes_V3_2;
CREATE SCHEMA aportes_V3_2;
USE aportes_V3_2;


--
-- Table structure for table `users1`
--

CREATE TABLE t_users1 (
  dni INT UNSIGNED NOT NULL,
  apellido VARCHAR(45) NOT NULL,
  nombres VARCHAR(45) NOT NULL,
  profesion VARCHAR(25)  NOT NULL DEFAULT "N/D",
  email_1 VARCHAR(50) DEFAULT "N/D",
  email_2 VARCHAR(50) DEFAULT "N/D",
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY  (dni)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `users2`
--

CREATE TABLE t_users2 (
  dni INT UNSIGNED NOT NULL UNIQUE,
  rol VARCHAR (6) DEFAULT "Vol",
  cuil VARCHAR(14) DEFAULT "N/D",
  a_socio YEAR DEFAULT "0000",
  f_ingreso DATE DEFAULT "2004-01-01"
  comentarios VARCHAR (256) DEFAULT "N/C",
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY idx_fk_dni (dni),
  CONSTRAINT fk_users2_dni FOREIGN KEY (dni) REFERENCES t_users1 (dni) ON DELETE RESTRICT ON UPDATE CASCADE
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Tablas de valores "Fijos"

CREATE TABLE t_profesiones (
  profesion VARCHAR(25) NOT NULL,
  PRIMARY KEY  (profesion)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE t_especialidades (
  especialidad VARCHAR(20) NOT NULL,
  PRIMARY KEY  (especialidad)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
CREATE TABLE t_roles (
  rol VARCHAR(6) NOT NULL DEFAULT "Vol",
  PRIMARY KEY  (rol)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
CREATE TABLE t_estados (
  estado VARCHAR(14) NOT NULL,
  PRIMARY KEY (estado)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Tablas complementarias de los usuarios

CREATE TABLE t_especialidad_user (
  dni INT UNSIGNED NOT NULL,
  especialidad VARCHAR(20) DEFAULT "Desconocida",
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY idx_fk_dni (dni),
  CONSTRAINT fk_especialidad_dni FOREIGN KEY (dni) REFERENCES t_users1 (dni) ON DELETE RESTRICT ON UPDATE CASCADE,
  KEY idx_fk_especialidad (especialidad),
  CONSTRAINT fk_especialidades_especialidad FOREIGN KEY (especialidad) REFERENCES t_especialidades (especialidad) ON DELETE RESTRICT ON UPDATE RESTRICT
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
CREATE TABLE t_logs_estado_user (
  dni INT UNSIGNED NOT NULL,
  estado VARCHAR (14) DEFAULT 'Desconoc',
  consideraciones VARCHAR (256) DEFAULT "No Comments", 
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  
  KEY idx_fk_dni (dni),
  CONSTRAINT fk_estado_dni FOREIGN KEY (dni) REFERENCES t_users1 (dni) ON DELETE RESTRICT ON UPDATE CASCADE
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
  

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- Valores de las tablas "Fijas"

INSERT INTO `t_profesiones` (`profesion`) VALUES
('Ingeniera'),
('Ingeniero'),
('Abogada'),
('Abogado'),
('Medica'),
('Medico'),
('Contadora'),
('Contador'),
('Arquitecta'),
('Arquitecto'),
('Sicologa'),
('Sicologo'),
('Sociologa'),
('Sociologo'),
('Lic RRHH'),
('Lic RRPP'),
('N/D'),
('Chanta'),
('Chantologa'),
('Chantologo'),
;


INSERT INTO `t_especialidades` (`especialidad`) VALUES
('Administración'),
('Coaching'),
('Comercial'),
('Comunicacion'),
('Contable'),
('Diagnostico'),
('Estrategia'),
('Indicadores'),
('Logistica'),
('Negocios'),
('Procesos'),
('RRHH'),
('Sistemas'),
('Chantologia'),
('Pajas Mentales'),
('Pura Paja'),
;

INSERT INTO `t_roles` (`rol`) VALUES
('DP'),
('DC'),
('PMO'),
('DPI'),
('Asist'),
('Vol'),
('VC'),
('Col'),
;

INSERT INTO `t_estados` (`estado`) VALUES
('Asignado'),
('Disponible'),
('ND_Temp'),
('De_Baja'),
('Con_Restricc'),
('Interno'),
('Puntual'),
('Desconoc'),
;



-- \. SQL_Ins_T_fijas/2018-10-31_0018_ESPEC.sql
-- estado ENUM ('Asignado','Disponible','ND_Temp','De_Baja','Con_Restricc','Interno','Puntual','Desconoc')
-- No hace falta insertar esto para esta version de la BD
-- Ya que esta en t_estado_user
-- \. SQL_Ins_T_fijas/2018-10-31_1029_ESTADO.sql

