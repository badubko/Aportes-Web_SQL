-- Script que crea y carga la base de aportes

\! sync
\! sync
\! ls


-- \. crea_db_aportes_V3.7.sql
--
USE aportes_V3_7;
-- Usuarios reales
\. 20190122_users_reales.sql

-- Usuarios ficticios
\. 20181227-2010_t_users1_truch.sql

-- Agrega datos de DCs 
-- --> Aencion: no todos tienen el verdadero numero de DNI
\. 20190123_Datos_DC_V1.0.sql
--

-- Agrega datos  de las OSCs. No hay datos detallados de c/OSC
\. 20190123_t_osc_base_V1.1.sql

-- Agrega los objetivos de las OSCs
\. 20190123_osc_obj_V1.2.sql

-- Asocia DCs Titulares con OSCs
\. 20190123_dc_tit_base_V1.0.sql

-- Asocia DCs Suplentes con OSCs
