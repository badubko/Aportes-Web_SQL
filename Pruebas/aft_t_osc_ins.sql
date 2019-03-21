DELIMITER $$
DROP TRIGGER IF EXISTS `after_t_osc_insert`;

CREATE TRIGGER after_t_osc_insert 
    AFTER INSERT ON t_osc
FOR EACH ROW
BEGIN
-- Solo si se asigno un DC titular verdadero, o sea, !=1. Esto se selecciona por programa
-- Esto significa que se creo OSC pero no se asigno DC Titular y/o Suplente (quedan como 1 y 2)
-- Esto no ocurre, ya que por programa al crear nueva OSC no se agregan los DCs
-- ya que los DCs se agregan en un paso separado.
		IF NEW.osc_dc_tit != '1' 
		THEN
			INSERT INTO t_osc_logs_dc 	(osc_nombre, osc_estado, dni, osc_rol_dc,osc_f_cambio,osc_comentarios_dc)
			VALUES 						(NEW.osc_nombre, NEW.osc_dc_tit, "Titular", NEW.osc_f_titular,"Se asigno DC TITULAR");
       END IF;
-- Solo si se asigno un DC suplente verdadero, o sea, !=2   Esto se selecciona por programa      
        IF NEW.osc_dc_supl != '2' 
        THEN
			INSERT INTO t_osc_logs_dc 	(osc_nombre, 	dni, 			osc_rol_dc,	osc_f_cambio,osc_comentarios_dc)
			VALUES (NEW.osc_nombre, NEW.osc_dc_supl, 'Suplente', NEW.osc_f_supl,"Se asigno DC SUPLENTE");
		END IF;
		
-- En el futuro el dni del autor del cambio deberia seleccionarse previamente...
-- DECLARE DNI_DP INT;
--	SELECT dni INTO DNI_DP FROM t_users2 WHERE rol = 'DP' LIMIT 1;
		    
		INSERT INTO `t_osc_logs_estado`	(`osc_nombre`,`osc_estado`,`dni`,`osc_coment_estado`)
				VALUES 	(NEW.osc_nombre, 'Identificada', '1000999','Estado inicial al crearse esta OSC');
		
END;$$
DELIMITER ;  
