-- \. ./Scr_Ins_V3.74/que_base_V1.4.sql

-- USE aportes_V3_74;

-- ---------------------------------------------------------------------  
-- TRIGGERS de Voluntarios o (users...)
-- ---------------------------------------------------------------------  
DELIMITER $$
-- El estado del usuario se cambia en t_logs_estado_user
-- El trigger se encarga de modificarlo en la t_user2, poniendo el ultimo estado
-- del Vol
-- Cuando el  DC o VC pasa a estar De_Baja, se acualiza en la t_osc
-- asignando a los ficticios dni= 1 o dni = 2 (o sea NO_Asignado)
-- como DC titular y o suplente.


DROP TRIGGER IF EXISTS `after_t_logs_estado_user_update`;

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

DROP TRIGGER IF EXISTS `after_t_logs_estado_user_insert`;

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
     
      
     IF NEW.estado = 'De_Baja'
     THEN
		UPDATE t_osc 
		SET 
			osc_dc_tit = '1',
			osc_f_titular = CURDATE(),
			last_update = NOW()
		WHERE osc_dc_tit = NEW.dni;
	 
		UPDATE t_osc 
		SET 
			osc_dc_supl = '2',
			osc_f_supl = CURDATE(),
			last_update = NOW()
		WHERE osc_dc_supl = NEW.dni;	
	 END IF;	
     
END$$

DELIMITER ;  

-- ---------------------------------------------------------------------
-- Trigger que actualiza el estado a 'Disponible'
-- en t_logs_estado_user
-- 
-- Cuando un Voluntario se desasigna del ultimo proyecto 
-- (y no tiene mas proyectos asignados)
-- en t_hist_user_proy
-- 
-- El estado se refleja tambien por otro trigger a t_users2
--
-- No me quedo claro porque AND NEW.f_desasign = '2100-01-01' pero
-- asi funciona...
-- ----------------------------------------------------------------------
DELIMITER $$
DROP TRIGGER IF EXISTS `after_t_hist_user_proy_update`;

CREATE TRIGGER after_t_hist_user_proy_update 
    AFTER UPDATE ON t_hist_user_proy

FOR EACH ROW
BEGIN
DECLARE TPROY INT;

       SELECT COUNT(*) INTO TPROY FROM t_hist_user_proy 
			WHERE dni = OLD.dni AND ( OLD.f_asignac > '2000-01-01' AND NEW.f_desasign = '2100-01-01' ) ;  

     IF TPROY = 0
     THEN
		INSERT INTO t_logs_estado_user	(dni, estado,consideraciones)
			VALUES 						(OLD.dni, 'Disponible', 'Quedo Disponible: Se desasigno de todos los proy');
	 END IF;	
     
END$$

DELIMITER ;  

-- ---------------------------------------------------------------------
-- TRIGGERS de OSCs
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
-- TRIGGERS de Proyectos
-- ---------------------------------------------------------------------
-- El estado del proyecto se cambia en t_p_logs_estado_proy
-- El trigger se encarga de modificarlo en la t_proyectos, poniendo el ultimo estado
-- del proyecto. 
-- Esto se hace para posibilitar la busqueda sencilla de los proy
-- que solo estan En_Conversacion o En_Ejecucion... 
-- (Los buenos en sql lo harian mejor...)

-- Nunca habra update sobre esta tabla.... Es un log asi que cada cambio es un insert
-- ya que es precisamente el objetivo. Igual por las dudas lo dejamos...

DELIMITER $$
CREATE TRIGGER after_t_p_logs_estado_proy_update 
    AFTER UPDATE ON t_p_logs_estado_proy
FOR EACH ROW
BEGIN
    UPDATE t_proyectos
    SET 
    p_num_corr_proy= OLD.p_num_corr_proy,
    p_ultimo_estado = NEW.p_estado_proy,
    last_update = NOW()
    WHERE OLD.p_num_corr_proy=NEW.p_num_corr_proy;  
END$$

CREATE TRIGGER after_t_p_logs_estado_proy_insert 
    AFTER INSERT ON t_p_logs_estado_proy
FOR EACH ROW
BEGIN
    UPDATE t_proyectos
    SET 
		p_num_corr_proy= NEW.p_num_corr_proy,
		p_ultimo_estado = NEW.p_estado_proy,
		last_update = NOW()
     WHERE p_num_corr_proy=NEW.p_num_corr_proy; 
END$$

DELIMITER ;  
