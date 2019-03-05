-- \. ./Scr_Ins_V3.74/que_base_V1.4.sql

-- USE aportes_V3_74;

-- ---------------------------------------------------------------------  

-- ---------------------------------------------------------------------  
DELIMITER $$
-- El estado del usuario se cambia en t_logs_estado_user
-- El trigger se encarga de modificarlo en la t_user2, poniendo el ultimo estado
-- del Vol

-- Hay que escribir un trigger para el caso de que el VOL pase a estar 
-- ND_Temp o De_Baja el DC1 o DC2 de la OSC pase a ser Lalo o sea el DP
-- Por ahora dni= 000 010

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
			osc_f_titular = CURRDATE(),
			last_update = NOW()
		WHERE osc_dc_tit = NEW.dni;
	 
		UPDATE t_osc 
		SET 
			osc_dc_supl = '2',
			osc_f_supl = CURRDATE(),
			last_update = NOW()
		WHERE osc_dc_supl = NEW.dni;	
	 END IF;	
     
END$$

DELIMITER ;  
-- ---------------------------------------------------------------------
