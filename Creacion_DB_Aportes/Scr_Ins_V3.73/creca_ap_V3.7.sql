-- Script que crea y carga la base de aportes

\! sync
\! sync
\! ls


-- \. crea_db_aportes_V3.7.sql
--
USE aportes_V3_7;
\. 2018-11-01_1154_users_reales.sql
\. 20181227-2010_t_users1_truch.sql
-- Agrega datos de DCs Crea OSCs y Asigna DCs
\. 2019-01-10_Datos_DC_V1.0.sql
-- Agrega datos detallados de OSCs y Asigna a DC
\. 20190114_t_osc.sql
