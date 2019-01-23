SELECT
	t_users1.dni, t_users1.apellido, t_users1.nombres
FROM
	t_users1
WHERE
	dni IN (
			
			SELECT dni 
						  FROM t_users2 
						     WHERE ( ((estado != "De_Baja") AND (estado != "Asignado" )) AND ((rol = "Vol" ) OR (rol = 'VC') ) 
						     AND dni IN
						      (SELECT dni
						       FROM t_users1 
						       WHERE apellido LIKE "%ca%"
						       )						     
									)		
				 
            ) ORDER by apellido;
	
-- SELECT 	t_users1.dni, t_users1.apellido, t_users1.nombres
				-- FROM
					-- t_users1
				-- WHERE
						-- dni IN ( 
								-- SELECT dni
								-- FROM    t_users2
								-- WHERE   ( (rol = 'Vol' ) OR (rol = 'VC') ) AND dni IN
									-- ( SELECT dni 
										-- FROM t_users2 
										-- WHERE ( (estado != 'De_Baja') AND (estado != 'Asignado' ) ) AND dni IN
										-- (SELECT dni
										-- FROM t_users1 
										-- WHERE apellido LIKE :apellido  ) 		     
						-- )
				 
                -- ) ORDER by apellido
