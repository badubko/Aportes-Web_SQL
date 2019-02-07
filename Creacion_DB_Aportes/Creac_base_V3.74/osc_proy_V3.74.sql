CREATE VIEW osc_proy AS
SELECT 	t_hist_user_proy.dni, t_proyectos.p_num_corr_proy , t_proyectos.osc_nombre, t_proyectos.p_nombre_proy 

FROM
t_proyectos INNER JOIN t_hist_user_proy ON t_proyectos.p_num_corr_proy=t_hist_user_proy.p_num_corr_proy ;
