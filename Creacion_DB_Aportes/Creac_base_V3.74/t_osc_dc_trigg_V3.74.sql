-- \. ./Scr_Ins_V3.74/que_base_V1.4.sql

-- USE aportes_V3_74;

-- Trigger que inserta los logs de los cambios de DC Titular o Suplente de OSC

DELIMITER $$


CREATE TRIGGER after_t_osc_dc_update 
    AFTER UPDATE ON t_osc
FOR EACH ROW
BEGIN
-- Faltaria excluir que el nuevo sea "2" Pero eso deberia ser por programa...
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
END;$$

CREATE TRIGGER after_t_osc_dc_insert 
    AFTER INSERT ON t_osc
FOR EACH ROW
BEGIN
-- Solo si se asigno un DC titular verdadero, o sea, !=1. Esto se selecciona por programa
-- Esto significa que se creo OSC pero no se asigno DC Titular y/o Suplente (quedan como 1 y 2)
		IF NEW.osc_dc_tit != '1' 
		THEN
			INSERT INTO t_osc_logs_dc 	(osc_nombre, dni, osc_rol_dc,osc_f_cambio,osc_comentarios_dc)
			VALUES 						(NEW.osc_nombre, NEW.osc_dc_tit, "Titular", NEW.osc_f_titular,"Se asigno DC TITULAR");
       END IF;
-- Solo si se asigno un DC suplente verdadero, o sea, !=2   Esto se selecciona por programa      
        IF NEW.osc_dc_supl != '2' 
        THEN
			INSERT INTO t_osc_logs_dc 	(osc_nombre, 	dni, 			osc_rol_dc,	osc_f_cambio,osc_comentarios_dc)
			VALUES (NEW.osc_nombre, NEW.osc_dc_supl, 'Suplente', NEW.osc_f_supl,"Se asigno DC SUPLENTE");
		END IF;
END;$$
DELIMITER ;  
