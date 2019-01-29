-- Script que carga la base de aportes.

\! sync
\! sync
\! ls



-- EN este script esta la version de la base a usar
\. ./Scr_Ins_datos/que_base_V1.4.sql

-- Usuarios reales
-- \. ./Creacion_DB_Aportes/Scr_Ins_datos/20190122_users_reales.sql
\. ./Scr_Ins_datos/20190122_users_reales.sql

-- Usuarios ficticios
-- \. ./Creacion_DB_Aportes/Scr_Ins_datos/20181227-2010_t_users1_truch.sql

-- Agrega datos de DCs 
-- --> Atencion: no todos tienen el verdadero numero de DNI
-- \. ./Creacion_DB_Aportes/Scr_Ins_datos/20190123_Datos_DC_V1.0.sql
\. ./Scr_Ins_datos/20190123_Datos_DC_V1.0.sql
--

-- Agrega datos  de las OSCs. No hay datos detallados de c/OSC
-- \. ./Creacion_DB_Aportes/Scr_Ins_datos/20190123_t_osc_base_V1.1.sql
\. ./Scr_Ins_datos/20190123_t_osc_base_V1.1.sql

-- Agrega los objetivos de las OSCs
-- \. ./Creacion_DB_Aportes/Scr_Ins_datos/20190123_osc_obj_V1.2.sql
\. ./Scr_Ins_datos/20190123_osc_obj_V1.2.sql

-- Asocia DCs Titulares con OSCs
-- \. ./Creacion_DB_Aportes/Scr_Ins_datos/20190123_dc_tit_base_V1.0.sql
\. ./Scr_Ins_datos/20190123_dc_tit_base_V1.0.sql

-- Asocia DCs Suplentes con OSCs
-- \. ./Creacion_DB_Aportes/Scr_Ins_datos/20190123_dc_supl_base_V1.0.sql
\. ./Scr_Ins_datos/20190123_dc_supl_base_V1.0.sql

-- Conjunto minimo de proyectos de prueba
\. ./Scr_Ins_datos/20190128_t_proyectos.sql

-- Conjunto minimo de estado de proyectos

\. ./Scr_Ins_datos/20190128_t_p_logs_estado_proy.sql
