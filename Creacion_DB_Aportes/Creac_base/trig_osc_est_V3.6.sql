USE aportes_V3_6;

DELIMITER $$
-- El estado de la osc se cambia en t_osc_logs_estado
-- El trigger se encarga de modificarlo en la t_osc, poniendo el ultimo estado
-- del Vol

-- 

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
