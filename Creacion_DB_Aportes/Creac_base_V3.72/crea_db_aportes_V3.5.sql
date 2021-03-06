SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS aportes_V3_5;
CREATE SCHEMA aportes_V3_5;
USE aportes_V3_5;

--
-- Table structure for table `users1`
--

CREATE TABLE t_users1 (
  dni INT UNSIGNED NOT NULL,
  apellido VARCHAR(45) NOT NULL,
  nombres VARCHAR(45) NOT NULL,
  profesion VARCHAR(25)  NOT NULL DEFAULT "N/D",
  email_1 VARCHAR(50) NOT NULL DEFAULT "N/D",
  email_2 VARCHAR(50) NOT NULL DEFAULT "N/D",
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY  (dni),
  KEY idx_fk_prof (profesion),
  CONSTRAINT fk_profesiones_profesion FOREIGN KEY (profesion) REFERENCES t_profesiones (profesion) ON DELETE RESTRICT ON UPDATE CASCADE  
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `users2`
-- Agregados telefonos y modificado orden
--

CREATE TABLE t_users2 (
  dni INT UNSIGNED NOT NULL UNIQUE,
  cuil VARCHAR(14) NOT NULL DEFAULT "N/D",
  rol VARCHAR (6) NOT NULL DEFAULT "Vol",
  estado VARCHAR (14) NOT NULL DEFAULT 'Desconoc',
  comentarios varchar(256) NULL DEFAULT 'No Comments',
  tel_1 VARCHAR (20) NULL DEFAULT "N/D",
  tel_2 VARCHAR (20) NULL DEFAULT "N/D",
  a_socio YEAR NOT NULL DEFAULT "0000",
  f_ingreso DATE NOT NULL DEFAULT "2004-01-01",
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY idx_fk_dni (dni),
  CONSTRAINT fk_users2_dni FOREIGN KEY (dni) REFERENCES t_users1 (dni) ON DELETE RESTRICT ON UPDATE CASCADE,
  KEY idx_fk_estado (estado),
  CONSTRAINT fk_users2_estado FOREIGN KEY (estado) REFERENCES t_estados (estado) ON DELETE RESTRICT ON UPDATE CASCADE
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
  CONSTRAINT fk_especialidades_especialidad FOREIGN KEY (especialidad) REFERENCES t_especialidades (especialidad) ON DELETE RESTRICT ON UPDATE CASCADE
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
CREATE TABLE t_logs_estado_user (
  dni INT UNSIGNED NOT NULL,
  estado VARCHAR (14) NOT NULL DEFAULT 'Disponible',
  consideraciones VARCHAR (256) DEFAULT "No Comments", 
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  
  KEY idx_fk_dni (dni),
  CONSTRAINT fk_estado_dni FOREIGN KEY (dni) REFERENCES t_users1 (dni) ON DELETE RESTRICT ON UPDATE CASCADE,
  KEY idx_fk_estado (estado),
  CONSTRAINT fk_estados_estado FOREIGN KEY (estado) REFERENCES t_estados (estado) ON DELETE RESTRICT ON UPDATE CASCADE  
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
DELIMITER $$
CREATE TRIGGER after_t_logs_estado_user_update 
    AFTER UPDATE ON t_logs_estado_user
FOR EACH ROW
BEGIN
    UPDATE t_users2
    SET 
    dni = OLD.dni,
     estado = NEW.estado,
     last_update = NOW()
     WHERE OLD.dni=NEW.dni ;  
END$$

CREATE TRIGGER after_t_logs_estado_user_insert 
    AFTER INSERT ON t_logs_estado_user
FOR EACH ROW
BEGIN
    UPDATE  t_users2
    SET 
     dni = NEW.dni,
     estado = NEW.estado,
     last_update = NOW()
     WHERE dni=NEW.dni ; 
END$$

DELIMITER ;  

CREATE TABLE t_hist_user_proy (
  dni INT UNSIGNED NOT NULL,
  num_corr_proy INT UNSIGNED,
  f_asignac DATE NOT NULL DEFAULT "2004-01-01",
  f_desasign DATE NOT NULL DEFAULT "2100-01-01",
  coment_desemp VARCHAR (256) DEFAULT "No Comments", 
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  
  KEY idx_fk_dni (dni),
  CONSTRAINT fk_hist_dni FOREIGN KEY (dni) REFERENCES t_users1 (dni) ON DELETE RESTRICT ON UPDATE CASCADE
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
  

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- Valores de las tablas "Fijas"

INSERT INTO `t_profesiones` (`profesion`) VALUES
('Abogada'),
('Abogado'),
('Antropologa'),
('Antropologo'),
('Arquitecta'),
('Arquitecto'),
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
('Sociologo'),
('Otra'),
('Chanta'),
('Chantologa'),
('Chantologo'),
('Mentirosa'),
('Mentiroso');



INSERT INTO `t_especialidades` (`especialidad`) VALUES
('Administracion'),
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
('Pura Paja');

INSERT INTO `t_roles` (`rol`) VALUES
('DP'),
('DC'),
('PMO'),
('DPI'),
('Asist'),
('Vol'),
('VC'),
('Col');

INSERT INTO `t_estados` (`estado`) VALUES
('Asignado'),
('Disponible'),
('ND_Temp'),
('De_Baja'),
('Con_Restricc'),
('Interno'),
('Puntual'),
('A_Confirmar'),
('Desconoc');



-- \. SQL_Ins_T_fijas/2018-10-31_0018_ESPEC.sql
-- estado ENUM ('Asignado','Disponible','ND_Temp','De_Baja','Con_Restricc','Interno','Puntual','Desconoc')
-- No hace falta insertar esto para esta version de la BD
-- Ya que esta en t_estado_user
-- \. SQL_Ins_T_fijas/2018-10-31_1029_ESTADO.sql

