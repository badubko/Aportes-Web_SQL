SELECT
	t_users1.dni, t_users1.apellido, t_users1.nombres
FROM
	t_users1
WHERE
	dni IN 	(SELECT  dni FROM    t_osc_logs_dc WHERE   osc_nombre LIKE "APA%" AND (osc_rol_dc = "Titular" OR  osc_rol_dc = "Suplente" ) 
				) ORDER by apellido;
	
