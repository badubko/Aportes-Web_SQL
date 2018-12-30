USE aportes_V3_5;

SELECT
   t_users1.apellido,
   t_users1.nombre
FROM
   t_users1
LEFT JOIN
    ON t_users1.dni = t_users2.dni 
WHERE
     t_users2.estado = "Asignado" ;
