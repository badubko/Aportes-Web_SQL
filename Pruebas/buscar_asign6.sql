SELECT
	t_users1.dni, t_users1.apellido, t_users1.nombres
FROM
	t_users1
WHERE
	dni IN (SELECT dni
			FROM  t_users2
			WHERE estado = "Interno" AND  dni IN 
				(SELECT dni
					FROM
						t_especialidad_user
					WHERE especialidad = "Sistemas"  AND dni IN 
						(SELECT  dni
						FROM    t_especialidad_user
						WHERE   especialidad = "Versotica"  ) 
				) 
            ) ORDER by apellido;
	
