SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS aportes_V3_6;
CREATE SCHEMA aportes_V3_6;
USE aportes_V3_6;

-- ---------------------------------------------------------------------
-- Table structure for table `users1`
--
-- ---------------------------------------------------------------------
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

-- ---------------------------------------------------------------------
-- Table structure for table `users2`
-- Agregados telefonos y modificado orden
--
-- ---------------------------------------------------------------------
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
-- ---------------------------------------------------------------------
-- Tablas de valores "Fijos"
-- ---------------------------------------------------------------------
CREATE TABLE t_profesiones (
  profesion VARCHAR(25) NOT NULL,
  PRIMARY KEY  (profesion)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ---------------------------------------------------------------------
-- ---------------------------------------------------------------------
CREATE TABLE t_especialidades (
  especialidad VARCHAR(20) NOT NULL,
  PRIMARY KEY  (especialidad)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ---------------------------------------------------------------------
-- ---------------------------------------------------------------------  
CREATE TABLE t_roles (
  rol VARCHAR(6) NOT NULL DEFAULT "Vol",
  PRIMARY KEY  (rol)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ---------------------------------------------------------------------
-- ---------------------------------------------------------------------  
CREATE TABLE t_estados (
  estado VARCHAR(14) NOT NULL,
  PRIMARY KEY (estado)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Tablas complementarias de los usuarios
-- ---------------------------------------------------------------------
-- ---------------------------------------------------------------------
CREATE TABLE t_especialidad_user (
  dni INT UNSIGNED NOT NULL,
  especialidad VARCHAR(20) DEFAULT "Desconocida",
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY idx_fk_dni (dni),
  CONSTRAINT fk_especialidad_dni FOREIGN KEY (dni) REFERENCES t_users1 (dni) ON DELETE RESTRICT ON UPDATE CASCADE,
  KEY idx_fk_especialidad (especialidad),
  CONSTRAINT fk_especialidades_especialidad FOREIGN KEY (especialidad) REFERENCES t_especialidades (especialidad) ON DELETE RESTRICT ON UPDATE CASCADE
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ---------------------------------------------------------------------
-- ---------------------------------------------------------------------  
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
-- ---------------------------------------------------------------------
-- ---------------------------------------------------------------------  
DELIMITER $$
-- El estado del usuario se cambia en t_logs_estado_user
-- El trigger se encarga de modificarlo en la t_user2, poniendo el ultimo estado
-- del Vol

-- Hay que escribir un trigger para el caso de que el VOL pase a estar 
-- ND_Temp o De_Baja el DC1 o DC2 de la OSC pase a ser Lalo o sea el DP
-- Por ahora dni= 000 010

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
-- ---------------------------------------------------------------------
-- ---------------------------------------------------------------------
-- AL ser esta tabla un log, se agregan filas a medida que suceden eventos
-- de asignacion o des-asignacion. 
-- 
CREATE TABLE t_hist_user_proy (
  dni INT UNSIGNED NOT NULL,
  p_num_corr_proy INT UNSIGNED,
-- f_asignac DATE NOT NULL DEFAULT "2004-01-01",
-- f_desasign DATE NOT NULL DEFAULT "2100-01-01",
-- coment_desemp VARCHAR (256) DEFAULT "No Comments", 
-- fecha_evento DATE NOT NULL,
-- Evaluar luego si hay que separa en 2 fechas: fecha_evento y last_update.
--
  tipo_evento ENUM ('Asignacion','Des-Asignacion'),
  fecha_evento TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--
  KEY idx_fk_dni (dni),
  CONSTRAINT fk_hist_dni FOREIGN KEY (dni) REFERENCES t_users1 (dni) ON DELETE RESTRICT ON UPDATE CASCADE,
--  
  KEY idx_fk_num_corr_proy (p_num_corr_proy),
  CONSTRAINT fk_num_corr_proy FOREIGN KEY (p_num_corr_proy) REFERENCES t_proyectos(p_num_corr_proy) ON DELETE RESTRICT ON UPDATE CASCADE
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ---------------------------------------------------------------------
-- Tablas de las OSCs
--
-- ---------------------------------------------------------------------


CREATE TABLE t_osc (
--  osc_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  osc_nombre 	VARCHAR (128) NOT NULL,
-- Direccion 1
  osc_calle_1 	VARCHAR (64),
  osc_num_1 	VARCHAR (6),
  osc_ciudad_1 	VARCHAR (32),
  osc_cp_1		VARCHAR (8),
  osc_prov_1 	VARCHAR (12),
-- Direccion 2
  osc_calle_2 	VARCHAR (64),
  osc_num_2 	VARCHAR (6),
  osc_ciudad_2 	VARCHAR (32),
  osc_cp_2		VARCHAR (8),
  osc_prov_2 	VARCHAR (12),
--
  osc_pag_web 	VARCHAR (128),
--
  osc_estado 	VARCHAR (16) NOT NULL DEFAULT "Identificada",
--
  osc_obj_1 	VARCHAR (32) NOT NULL DEFAULT "No Especificado",
  osc_obj_2 	VARCHAR (32) NOT NULL DEFAULT "No Especificado",
  osc_obj_3 	VARCHAR (32) NOT NULL DEFAULT "No Especificado",
--
--  osc_dni_dc1 	INT UNSIGNED NOT NULL,
--  osc_dni_dc2 	INT UNSIGNED NOT NULL,
--
  osc_notas 	VARCHAR (256) DEFAULT "No hay notas",
--
  last_update 	TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--
  PRIMARY KEY  (osc_nombre),
--
  KEY idx_fk_osc_estado (osc_estado),
  CONSTRAINT fk_osc_osc_estado FOREIGN KEY (osc_estado) REFERENCES t_osc_estados (osc_estado) ON DELETE RESTRICT ON UPDATE CASCADE
--
-- KEY idx_fk_osc_dni_dc1 (osc_dni_dc1),
-- CONSTRAINT fk_osc_dni_dc1 FOREIGN KEY (osc_dni_dc1) REFERENCES t_users1 (dni) ON DELETE RESTRICT ON UPDATE CASCADE,
--
-- KEY idx_fk_osc_dni_dc2 (osc_dni_dc2),
-- CONSTRAINT fk_osc_dni_dc2 FOREIGN KEY (osc_dni_dc2) REFERENCES t_users1 (dni) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;  
-- ---------------------------------------------------------------------  
-- ---------------------------------------------------------------------
CREATE TABLE t_osc_contactos (
	osc_nombre 				VARCHAR (128) NOT NULL,
	osc_contacto_apellido 	VARCHAR(45) NOT NULL,
	osc_contacto_nombres 	VARCHAR(45) NOT NULL,
	osc_contacto_cel  		VARCHAR (20) NOT NULL DEFAULT "N/D",
	osc_contacto_tel_fijo  	VARCHAR (20) NOT NULL DEFAULT "N/D",
	osc_contacto_email 		VARCHAR(50) NOT NULL DEFAULT "N/D",
	osc_contacto_posicion 	VARCHAR(64) NOT NULL DEFAULT "N/D",
	osc_contacto_horario 	VARCHAR (256) NOT NULL DEFAULT "No hay detalle",
	last_update 			TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	KEY idx_fk_osc_nombre (osc_nombre),
	CONSTRAINT fk_osc_osc_nombre FOREIGN KEY (osc_nombre) REFERENCES t_osc(osc_nombre) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ---------------------------------------------------------------------
-- ---------------------------------------------------------------------
CREATE TABLE t_osc_logs_dc (
    dni 					INT UNSIGNED NOT NULL,
    osc_nombre 				VARCHAR (128) NOT NULL, 
	osc_rol_dc				VARCHAR (16) NOT NULL ,
	osc_comentarios_dc 		VARCHAR (256) DEFAULT "No Comments",
	last_update 			TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--
	KEY idx_fk_osc_logs_dni (dni),
    CONSTRAINT fk_logs_dc_dni FOREIGN KEY (dni) REFERENCES t_users1 (dni) ON DELETE RESTRICT ON UPDATE CASCADE,
--
	KEY idx_fk_logs_dc_osc_nombre (osc_nombre),
	CONSTRAINT fk_logs_dc_osc_nombre FOREIGN KEY (osc_nombre) REFERENCES t_osc(osc_nombre) ON DELETE RESTRICT ON UPDATE CASCADE,
--
    KEY idx_fk_osc_logs_rol (osc_rol_dc),
    CONSTRAINT fk_logs_rol_dc FOREIGN KEY (osc_rol_dc) REFERENCES t_osc_rol_dc (osc_rol_dc) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ---------------------------------------------------------------------
-- ---------------------------------------------------------------------
CREATE TABLE t_osc_logs_estado (
    
    osc_nombre 				VARCHAR (128) NOT NULL, 
    osc_estado 				VARCHAR (16) NOT NULL DEFAULT "Identificada",
--	dni del autor del cambio de estado de la OSC
	dni						INT UNSIGNED NOT NULL,
	osc_coment_estado		VARCHAR (256) DEFAULT "No Comments",
	last_update 			TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--
	KEY 	idx_fk_logs_est_dni_autor (dni),
    CONSTRAINT 	fk_logs_est_dni_autor FOREIGN KEY (dni) REFERENCES t_users1 (dni) ON DELETE RESTRICT ON UPDATE CASCADE,
--
	KEY 	idx_fk_logs_est_osc_nombre (osc_nombre),
	CONSTRAINT 	fk_logs_est_osc_nombre FOREIGN KEY (osc_nombre) REFERENCES t_osc(osc_nombre) ON DELETE RESTRICT ON UPDATE CASCADE,
--
	KEY 	idx_fk_logs_est_osc_estado (osc_estado),
	CONSTRAINT 	fk_logs_est_osc_estado FOREIGN KEY (osc_estado) REFERENCES t_osc_estados (osc_estado) ON DELETE RESTRICT ON UPDATE CASCADE

)ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ---------------------------------------------------------------------
-- ---------------------------------------------------------------------  
DELIMITER $$
-- El estado de la osc se cambia en t_osc_logs_estado
-- El trigger se encarga de modificarlo en la t_osc, poniendo el ultimo estado
-- del Vol

-- Nunca habra update sobre esta tabla.... Es un log asi que cada cambio es un insert
-- ya que es precisamente el objetivo.

CREATE TRIGGER after_t_osc_logs_estado_update 
    AFTER UPDATE ON t_osc_logs_estado
FOR EACH ROW
BEGIN
    UPDATE t_osc
    SET 
    osc_nombre= OLD.osc_nombre,
     osc_estado = NEW.osc_estado,
     last_update = NOW()
     WHERE OLD.osc_nombre=NEW.osc_nombre;  
END$$

CREATE TRIGGER after_t_osc_logs_estado_insert 
    AFTER INSERT ON t_osc_logs_estado
FOR EACH ROW
BEGIN
    UPDATE t_osc
    SET 
		osc_nombre= NEW.osc_nombre,
		osc_estado = NEW.osc_estado,
		last_update = NOW()
     WHERE osc_nombre=NEW.osc_nombre; 
END$$

DELIMITER ;  
-- ---------------------------------------------------------------------
-- ---------------------------------------------------------------------
-- ---------------------------------------------------------------------
-- ---------------------------------------------------------------------
CREATE TABLE t_osc_rol_dc (
	osc_rol_dc				VARCHAR (16) NOT NULL ,
	PRIMARY KEY (osc_rol_dc)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ---------------------------------------------------------------------
-- ---------------------------------------------------------------------
CREATE TABLE t_osc_estados (
	osc_estado 				VARCHAR (16) NOT NULL DEFAULT "Desconocido",
	PRIMARY KEY (osc_estado)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ---------------------------------------------------------------------
-- ---------------------------------------------------------------------
CREATE TABLE t_osc_objetivos (
	osc_objetivo 			VARCHAR (16) NOT NULL DEFAULT "Desconocido",
	PRIMARY KEY (osc_objetivo)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ---------------------------------------------------------------------
-- --------------------------------------------------------------------
-- Tablas de los proyectos
--
--  -------------------------------------------------------------------
-- ---------------------------------------------------------------------
CREATE TABLE t_proyectos (
	p_num_corr_proy    		INT UNSIGNED NOT NULL UNIQUE,
	p_nombre_proy			VARCHAR (128) NOT NULL,
	osc_nombre 				VARCHAR (128) NOT NULL, 
	p_tipo_proy		 		VARCHAR(16) NOT NULL DEFAULT "No Especificado",
	p_fecha_pre_proy 		DATE NOT NULL DEFAULT "2004-01-01",
	p_fecha_present_vol		DATE NOT NULL DEFAULT "2004-01-01",
	p_fecha_dup				DATE NOT NULL DEFAULT "2004-01-01",
	p_fecha_mitad_proy 		DATE NOT NULL DEFAULT "2004-01-01",
	p_fecha_cierre_proy 	DATE NOT NULL DEFAULT "2004-01-01",
	p_link_a_dup			VARCHAR (256) NOT NULL DEFAULT "N/D",
	p_dup_si_no				VARCHAR(2) NOT NULL DEFAULT "No",
	last_update 			TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--
	PRIMARY KEY  (p_num_corr_proy),
--
	KEY idx_fk_p_osc_nombre (osc_nombre),
	CONSTRAINT fk_p_osc_nombre FOREIGN KEY (osc_nombre) REFERENCES t_osc(osc_nombre) ON DELETE RESTRICT ON UPDATE CASCADE,
--
	KEY idx_fk_p_tipo_proy (p_tipo_proy),
	CONSTRAINT fk_p_tipo_proy FOREIGN KEY (p_tipo_proy) REFERENCES t_p_tipo_proy (p_tipo_proy) ON DELETE RESTRICT ON UPDATE CASCADE  
--
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
--  -------------------------------------------------------------------
-- ---------------------------------------------------------------------
CREATE TABLE t_p_logs_estado_proy (
	p_num_corr_proy    		INT UNSIGNED NOT NULL,
	p_fecha_cambio 			DATE ,
	p_estado_proy			VARCHAR(20) NOT NULL,
	p_audio_cambio			VARCHAR (256) NOT NULL DEFAULT "N/D",
--
	KEY idx_fk_ple_num_corr_proy (p_num_corr_proy),
	CONSTRAINT fk_ple_num_corr_proy FOREIGN KEY (p_num_corr_proy) REFERENCES t_proyectos(p_num_corr_proy) ON DELETE RESTRICT ON UPDATE CASCADE,
--
	KEY idx_fk_estado_proy (p_estado_proy),
	CONSTRAINT fk_proy_estado_proy FOREIGN KEY (p_estado_proy) REFERENCES t_p_estado_proy(p_estado_proy) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
--  -------------------------------------------------------------------
-- ---------------------------------------------------------------------
CREATE TABLE t_p_logs_result_reun (
	p_num_corr_proy    		INT UNSIGNED NOT NULL,
	p_fecha_reun 			DATE,
	p_tipo_reun				VARCHAR(16) NOT NULL ,
	p_result_reun			VARCHAR(16) NOT NULL ,
	p_fecha_prox_reun 		DATE,
	p_audio_reun			VARCHAR (256) NOT NULL DEFAULT "N/D",
	last_update 			TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--
	KEY idx_fk_r_num_corr_proy (p_num_corr_proy),
	CONSTRAINT fk_r_num_corr_proy FOREIGN KEY (p_num_corr_proy) REFERENCES t_proyectos(p_num_corr_proy) ON DELETE RESTRICT ON UPDATE CASCADE,
--	
	KEY idx_fk_p_tipo_reun (p_tipo_reun),
	CONSTRAINT fk_p_tipo_reun FOREIGN KEY (p_tipo_reun) REFERENCES t_p_tipo_reun(p_tipo_reun) ON DELETE RESTRICT ON UPDATE CASCADE,
--
	KEY idx_fk_p_result_reun (p_result_reun),
	CONSTRAINT fk_p_result_reun FOREIGN KEY (p_result_reun) REFERENCES t_p_result_reun(p_result_reun) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
--  -------------------------------------------------------------------
-- ---------------------------------------------------------------------
CREATE TABLE t_p_estado_proy (
    p_estado_proy		VARCHAR(20) NOT NULL,
    p_color_estado		VARCHAR(8) NOT NULL,
    PRIMARY KEY (p_estado_proy)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
--  -------------------------------------------------------------------
-- ---------------------------------------------------------------------
CREATE TABLE t_p_result_reun (
    p_result_reun		VARCHAR(16) NOT NULL,
    p_color_reun		VARCHAR(8) NOT NULL,
    PRIMARY KEY (p_result_reun)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
--  -------------------------------------------------------------------
-- ---------------------------------------------------------------------
CREATE TABLE t_p_tipo_reun (
    p_tipo_reun		 	VARCHAR(16) NOT NULL,
    PRIMARY KEY (p_tipo_reun)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
--  -------------------------------------------------------------------
-- ---------------------------------------------------------------------
CREATE TABLE t_p_tipo_proy (
    p_tipo_proy		 	VARCHAR(16) NOT NULL DEFAULT "No Especificado",
    PRIMARY KEY (p_tipo_proy)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
--  -------------------------------------------------------------------
-- ---------------------------------------------------------------------
--
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


--  -------------------------------------------------------------------
-- Valores de las tablas "Fijas"
--  -------------------------------------------------------------------
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
--
('Chanta'),
('Chantologa'),
('Chantologo'),
('Mentirosa'),
('Mentiroso');
--
--
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
--
('Chantologia'),
('Procastinacion'),
('Enroscar la vibora'),
('Versotica'),
('Pura Fantasia');
--
INSERT INTO `t_roles` (`rol`) VALUES
('DP'),
('DC'),
('PMO'),
('DPI'),
('Asist'),
('Vol'),
('VC'),
('Col');
--
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
--
INSERT INTO `t_osc_rol_dc` (`osc_rol_dc`) VALUES
('Primario'),
('Suplente'),
('Desasignado');
--
INSERT INTO `t_osc_estados` (`osc_estado`) VALUES
('Identificada'),
('Contactada'),
('En_Actividad'),
('Inactiva'),
('Descartada'),
('En_Conversacion'),
('Desconocido');
--
INSERT INTO `t_osc_objetivos` (`osc_objetivo`) VALUES 
("Educacion"),
("Alimentos"),
("Caridad"),
("Otro"),
('Beneficencia'),
('No Especificado'),
("Salud");
-- ---------------------------------------------------------
-- Proyectos
-- ---------------------------------------------------------
INSERT INTO `t_p_estado_proy` (`p_estado_proy`,`p_color_estado`) VALUES
("En_Ejecucion","Verde"),
("Suspendido","Rojo"),
("Cancelado","Negro"),
("Terminado","Azul"),
("En_Implementacion","Verde"),
("Pre-Proyecto","Verde");
--
INSERT INTO `t_p_result_reun` (`p_result_reun`,`p_color_reun`) VALUES 
("Normal","Verde"),
("Postergada","Amarillo"),
("Accion ASAP","Naranja");
--
INSERT INTO `t_p_tipo_reun` (`p_tipo_reun`) VALUES 
("Interna"),
("Con OSC");
--
INSERT INTO `t_p_tipo_proy` (`p_tipo_proy`) VALUES 
("Estrategia"),
("Governance"),
("Procesos"),
("RRHH"),
("Sistemas"),
("Administracion"),
("Negocio Social"),
("Financiero"),
("Contable"),
("No Especificado");

