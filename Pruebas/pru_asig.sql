SELECT f_asignac , last_update FROM  t_hist_user_proy WHERE 
							(dni = 5931630 AND 	p_num_corr_proy = 1002 )
							AND (f_asignac > '2000-01-01' AND f_desasign < '2100-01-01' )
						     ORDER BY f_asignac  DESC LIMIT 1;
						     
--					     						     ORDER BY f_asignac DESC ;
