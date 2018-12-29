SELECT `t_especialidad_user`.`dni`, `t_especialidad_user`.`especialidad` 
FROM `t_especialidad_user` 
WHERE (`t_especialidad_user`.`especialidad` ="Procesos") OR (`t_especialidad_user`.`especialidad` ="Sistemas")


SELECT dni FROM `t_especialidad_user` WHERE especialidad in ( "Sistemas", "Procesos");



SELECT dni FROM
t_especialidad_user



WHERE dni IN (SELECT 
dni 
FROM `t_especialidad_user` WHERE especialidad =  "Sistemas")  ;

SELECT dni FROM `t_especialidad_user` WHERE especialidad = "Sistemas" 
UNION 
SELECT dni FROM `t_especialidad_user` WHERE especialidad = "Procesos" ORDER BY `dni` ASC;
