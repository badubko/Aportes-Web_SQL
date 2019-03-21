-- Este script cambia la fecha de default en la tabla t_proyectos
-- sin tener que regenerar la tabla o la base
-- El valor de la fecha deberia coincidir con la f_max en config


USE aportes_V3_74;
SET @FE = '2100-01-01';
SELECT @FE;

-- Tablas a alterar
-- p_fecha_pre_proy
-- p_fecha_present_vol
-- p_fecha_dup
-- p_fecha_mitad_proy_estim
-- p_fecha_mitad_proy_real
-- p_fecha_cierre_proy_estim
-- p_fecha_cierre_proy_real

SET @S = CONCAT("ALTER TABLE `t_proyectos` CHANGE `p_fecha_pre_proy` `p_fecha_pre_proy` DATE NOT NULL DEFAULT '", @FE,"'");
-- SELECT @S;
PREPARE stmt FROM @S;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @S = CONCAT("ALTER TABLE `t_proyectos` CHANGE `p_fecha_present_vol` `p_fecha_present_vol` DATE NOT NULL DEFAULT '", @FE,"'");
-- SELECT @S;
PREPARE stmt FROM @S;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @S = CONCAT("ALTER TABLE `t_proyectos` CHANGE `p_fecha_dup` `p_fecha_dup` DATE NOT NULL DEFAULT '", @FE,"'");
-- SELECT @S;
PREPARE stmt FROM @S;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @S = CONCAT("ALTER TABLE `t_proyectos` CHANGE `p_fecha_mitad_proy_estim` `p_fecha_mitad_proy_estim` DATE NOT NULL DEFAULT '", @FE,"'");
-- SELECT @S;
PREPARE stmt FROM @S;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @S = CONCAT("ALTER TABLE `t_proyectos` CHANGE `p_fecha_mitad_proy_real` `p_fecha_mitad_proy_real` DATE NOT NULL DEFAULT '", @FE,"'");
-- SELECT @S;
PREPARE stmt FROM @S;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @S = CONCAT("ALTER TABLE `t_proyectos` CHANGE `p_fecha_cierre_proy_estim` `p_fecha_cierre_proy_estim` DATE NOT NULL DEFAULT '", @FE,"'");
-- SELECT @S;
PREPARE stmt FROM @S;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


SET @S = CONCAT("ALTER TABLE `t_proyectos` CHANGE `p_fecha_cierre_proy_real` `p_fecha_cierre_proy_real` DATE NOT NULL DEFAULT '", @FE,"'");
-- SELECT @S;
PREPARE stmt FROM @S;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

