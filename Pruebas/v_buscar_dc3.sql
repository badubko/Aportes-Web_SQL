CREATE VIEW dc3
AS
SELECT
	t_users1.dni as dni, t_users1.apellido AS apellido , t_users1.nombres AS nombres
FROM
	t_users1
WHERE
	dni IN 	(SELECT  dni
						FROM    t_osc_logs_dc
						WHERE   (osc_rol_dc = "Primario" OR  osc_rol_dc = "Suplente" ) 
				) ORDER by apellido;
	
