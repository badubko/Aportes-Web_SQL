SELECT
	dni, apellido, nombres
FROM
	t_users1
WHERE
	dni IN 	(SELECT  dni
						FROM    t_osc_logs_dc
						WHERE   osc_nombre LIKE "CR%" AND (osc_rol_dc = "Primario" OR  osc_rol_dc = "Suplente" ) 
				) ORDER by apellido;
	
