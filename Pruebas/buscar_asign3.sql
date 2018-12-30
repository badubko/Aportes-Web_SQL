SELECT
	Apellido, Nombres
FROM
	t_users1
WHERE
	dni IN (SELECT
	    dni
	 FROM
	    t_users2
	 WHERE
	    estado = "Disponible" AND  dni IN (SELECT
	    dni
	    FROM
	      t_especialidad_user
	    WHERE
	       especialidad = "Sistemas" )  );
	
