-- Incluida en crea_db_aportes_V3.74.sql

CREATE VIEW osc_proy AS
SELECT DISTINCT	t_hist_user_proy.dni, t_proyectos.p_num_corr_proy , t_proyectos.osc_nombre, 
t_proyectos.p_nombre_proy , t_proyectos.p_ultimo_estado

FROM
t_proyectos INNER JOIN t_hist_user_proy ON t_proyectos.p_num_corr_proy=t_hist_user_proy.p_num_corr_proy ;
