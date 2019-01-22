SELECT
	t_users1.dni, t_users1.apellido, t_users1.nombres
FROM
	t_users1
WHERE
	dni IN (
			
			SELECT dni 
						  FROM t_users2 
						     WHERE ( ((estado != "De_Baja") AND (estado != "Asignado" )) AND ((rol = "Vol" ) OR (rol = 'VC') ) AND dni IN
						      (SELECT dni
						       FROM t_users1 
						       WHERE apellido LIKE "%ac%"
						       )
						     
						     
						)
				
				 
            ) ORDER by apellido;
	
