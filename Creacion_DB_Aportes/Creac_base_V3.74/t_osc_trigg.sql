-- \. ./Scr_Ins_V3.74/que_base_V1.4.sql

USE aportes_V3_74;

DELIMITER $$
-- El estado del usuario se cambia en t_logs_estado_user
-- El trigger se encarga de modificarlo en la t_user2, poniendo el ultimo estado
-- del Vol

-- Hay que escribir un trigger para el caso de que el VOL pase a estar 
-- ND_Temp o De_Baja el DC1 o DC2 de la OSC pase a ser Lalo o sea el DP
-- Por ahora dni= 000 010

-- CREATE TRIGGER after_t_osc_update 
    -- AFTER UPDATE ON t_osc
-- FOR EACH ROW
-- BEGIN
	-- IF NEW.osc_dc_tit != OLD.osc_dc_tit
    -- THEN
		-- INSERT INTO t_osc_logs_dc 	(osc_nombre, dni, osc_rol_dc,osc_f_cambio)
        -- VALUES 						(OLD.osc_nombre, NEW.osc_dc_tit, "Titular", NEW.osc_f_titular);
    -- END IF;    
   
    -- IF NEW.osc_dc_supl != OLD.osc_dc_supl
		-- INSERT INTO `t_osc_logs_dc`	(`osc_nombre`,`dni`,`osc_rol_dc`,`osc_f_cambio`)
		-- VALUES 	(OLD.osc_nombre, NEW.osc_dc_supl, "Suplente", NEW.osc_f_supl);
	-- END IF;			
-- END;$$

CREATE TRIGGER after_t_osc_insert 
    AFTER INSERT ON t_osc
FOR EACH ROW
BEGIN
-- Solo si se asigno un DC titular verdadero, o sea, !=1. Esto se selecciona por programa
		-- IF NEW.osc_dc_tit != '1' 
		-- THEN
			-- INSERT INTO t_osc_logs_dc 	(osc_nombre, dni, osc_rol_dc,osc_f_cambio)
			-- VALUES 						(NEW.osc_nombre, NEW.osc_dc_tit, "Titular", NEW.osc_f_titular);
--        END IF;
-- Solo si se asigno un DC suplente verdadero, o sea, !=2   Esto se selecciona por programa      
        IF NEW.osc_dc_supl != "2" 
		INSERT INTO t_osc_logs_dc 	(osc_nombre, 	dni, 			osc_rol_dc,	osc_f_cambio)
		VALUES (NEW.osc_nombre, NEW.osc_dc_supl, "Suplente", NEW.osc_f_supl);
		END IF;
END;$$
DELIMITER ;  
