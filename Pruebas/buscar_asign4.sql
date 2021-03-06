SELECT
	dni, apellido, nombres
FROM
	t_users1
WHERE
	dni IN (SELECT dni
			FROM  t_users2
			WHERE estado = "Disponible" AND  dni IN 
				(SELECT dni
					FROM
						t_especialidad_user
					WHERE especialidad = "Comercial"  AND dni IN 
						(SELECT  dni
						FROM    t_especialidad_user
						WHERE   especialidad = "Negocios"  ) 
				) 
            ) ORDER by apellido;
	
