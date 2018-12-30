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
	    estado = "Interno" );
	
