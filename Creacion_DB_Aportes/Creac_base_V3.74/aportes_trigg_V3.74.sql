-- \. ./Scr_Ins_V3.74/que_base_V1.4.sql

-- USE aportes_V3_74;

-- ---------------------------------------------------------------------  

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
