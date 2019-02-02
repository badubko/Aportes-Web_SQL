SELECT
	dni, apellido, nombres
FROM
	t_users1
-- WHERE
	-- dni IN (SELECT dni
			-- FROM  t_users2
			-- WHERE (estado = 'Disponible' OR estado = 'Asignado') AND  (rol = 'Vol') AND dni IN 
				-- (SELECT dni
					-- FROM
						-- t_especialidad_user
					-- WHERE especialidad = "Sistemas"  ) 
				 
            -- ) ORDER by apellido;
	
WHERE
	dni IN (SELECT dni
			FROM  t_users2
			WHERE (estado = 'Disponible' OR estado = 'Asignado') AND  (rol = 'Vol') ORDER BY estado 

				 
            ) ;
            
            				-- (SELECT dni
					-- FROM
						-- t_especialidad_user
					-- WHERE especialidad = "Sistemas"  ) 
