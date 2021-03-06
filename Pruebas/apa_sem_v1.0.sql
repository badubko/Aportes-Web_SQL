
DROP SCHEMA IF EXISTS apa_sem_v1_0;
CREATE SCHEMA apa_sem_v1_0;
USE apa_sem_v1_0;

CREATE TABLE t_seminarios(
  id_sem 			MEDIUMINT UNSIGNED NOT NULL,
  descr_sem 		VARCHAR(1024) NOT NULL,
  last_update 		TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY  (id_sem)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
CREATE TABLE t_prog_sem(
  id_sem 			MEDIUMINT UNSIGNED NOT NULL,
  fecha_sem			DATE NOT NULL,
  last_update 		TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY  (id_sem, fecha_sem),
  KEY idx_fk_id_sem (id_sem),
  CONSTRAINT fk_id_sem FOREIGN KEY (id_sem) REFERENCES t_seminarios (id_sem) ON DELETE RESTRICT ON UPDATE CASCADE
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
  
 
CREATE TABLE t_alumnos(
  dni				INT UNSIGNED NOT NULL,
  apellidos 		VARCHAR(64) NOT NULL,
  nombres 			VARCHAR(64) NOT NULL,
  email				VARCHAR (64) DEFAULT 'N/D',
  cel				VARCHAR (32) DEFAULT 'ND',
  last_update 		TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY  (dni)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
   
CREATE TABLE t_inscrip(
  dni				INT UNSIGNED NOT NULL,
  id_sem 			MEDIUMINT UNSIGNED NOT NULL,
  fecha_sem			DATE NOT NULL,
  opcion 			ENUM ('1','2','3'),
  last_update 		TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  
   KEY idx_fk_dni(dni),
   CONSTRAINT fk_dni FOREIGN KEY (dni) REFERENCES t_alumnos (dni) ON DELETE RESTRICT ON UPDATE CASCADE,
  
   KEY idx_id_sem_f_sem (id_sem,fecha_sem),
   CONSTRAINT fk_id_sem FOREIGN KEY (id_sem) REFERENCES t_seminarios (id_sem) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_fecha_sem FOREIGN KEY (fecha_sem) REFERENCES t_prog_sem (fecha_sem) ON DELETE RESTRICT ON UPDATE CASCADE
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
