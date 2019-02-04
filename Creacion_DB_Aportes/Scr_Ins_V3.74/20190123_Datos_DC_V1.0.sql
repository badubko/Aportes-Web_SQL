-- Crea DCs
\. ./Scr_Ins_V3.74/que_base_V1.4.sql
--
-- Este es el DC titular ficticio cuando no hay asignado ninguno
-- Dado que la columna dni es NOT NULL
--
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`profesion`,`email_1`,`email_2`)
Values
('1','No_Asignado','Titular No_Asignada/o','N/D','N/D','N/D')
;
Insert into t_users2 
(`dni`,`cuil`,`rol`,`tel_1`,`tel_2`,`a_socio`,`f_ingreso`,`acuerdo`)
Values
('1','N/D','DC','N/D','N/D','2011','2000-01-01','No')
;
Insert into t_logs_estado_user 
(`dni`,`consideraciones`)
Values
('1','Carga Inicial DC Titular ficticio')
;
--
-- Este es el DC suplente ficticio cuando no hay asignado ninguno
-- Dado que la columna dni es NOT NULL
--
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`profesion`,`email_1`,`email_2`)
Values
('2','No_Asignada','Suplente No_Asignada/o','N/D','N/D','N/D')
;
Insert into t_users2 
(`dni`,`cuil`,`rol`,`tel_1`,`tel_2`,`a_socio`,`f_ingreso`,`acuerdo`)
Values
('2','N/D','DC','N/D','N/D','2011','2000-01-01','No')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('2','Carga Inicial DC Suplente ficticio')
;
-- -----------------------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`profesion`,`email_1`,`email_2`)
Values
('1000200','Kurlat','Miguel Pedro','Ingeniero','miguel.kurlat@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`,`rol`,`tel_1`,`tel_2`,`a_socio`,`f_ingreso`,`acuerdo`)
Values
('1000200','N/D','DC','+54-911-4479-8810','N/D','2011','2011-09-18','Si')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000200','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000200','Sistemas')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000200','Diagnostico')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('1000200','Disponible','Carga Inicial DC')
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`profesion`,`email_1`,`email_2`)
Values
('13394776','Maletta','Mirta','N/D','mirtamaletta@arnet.com.ar','mirta.maletta@aportesdegestion.org.ar')

;
Insert into t_users2 
(`dni`,`cuil`,`rol`,`tel_1`,`tel_2`,`a_socio`,`f_ingreso`,`acuerdo`)
Values
('13394776','N/D','DC','+54-911-5378-1899','N/D','2011','2011-09-18','Si')
;

Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('13394776','Disponible','Carga Inicial DC')
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`profesion`,`email_1`,`email_2`)
Values
('93609657','Testa','Jose','N/D','testa.jose@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`,`rol`,`tel_1`,`tel_2`,`a_socio`,`f_ingreso`,`acuerdo`)
Values
('93609657','N/D','DC','+54-911-5563-8100','N/D','2011','2011-09-18','Si')
;

Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('93609657','Disponible','Carga Inicial DC')
;
-- ------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`profesion`,`email_1`,`email_2`)
Values
('12332887','Scheuer','Ricardo','N/D','r.scheuer@evolution-tactic.com','r.scheuer@arnet.com.ar')
;
Insert into t_users2 
(`dni`,`cuil`,`rol`,`tel_1`,`tel_2`,`a_socio`,`f_ingreso`,`acuerdo`)
Values
('12332887','N/D','DC','+54-911-4449-4102','N/D','2011','2011-12-11','Si')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('12332887','Disponible','Carga Inicial DC')
;
-- ------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`profesion`,`email_1`,`email_2`)
Values
('14772995','Tournier','Maria Jose','N/D','mariajtournier@hotmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`,`rol`,`tel_1`,`tel_2`,`a_socio`,`f_ingreso`,`acuerdo`)
Values
('14772995','N/D','DC','+54-911-4938-7133','+54-11-4784-4978','2013','2013-06-27','Si')
;
Insert into t_logs_estado_user (`dni`,`estado`,`consideraciones`)
Values
('14772995','Disponible','Carga Inicial DC')
;
-- ------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`profesion`,`email_1`,`email_2`)
Values
('1000201','Elizalde','Federico','N/D','N/D','N/D')
;
Insert into t_users2 
(`dni`,`cuil`,`rol`,`tel_1`,`tel_2`,`a_socio`,`f_ingreso`,`acuerdo`)
Values
('1000201','N/D','DC','N/D','N/D','2011','2011-09-18','Si')
;
Insert into t_logs_estado_user (`dni`,`estado`,`consideraciones`)
Values
('1000201','Disponible','Carga Inicial DC')
;
-- ------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`profesion`,`email_1`,`email_2`)
Values
('1000202','Cameo','Fredy','N/D','N/D','N/D')
;
Insert into t_users2 
(`dni`,`cuil`,`rol`,`tel_1`,`tel_2`,`a_socio`,`f_ingreso`,`acuerdo`)
Values
('1000202','N/D','DC','N/D','N/D','2011','2011-09-18','Si')
;
Insert into t_logs_estado_user (`dni`,`estado`,`consideraciones`)
Values
('1000202','Disponible','Carga Inicial DC')
;
-- ------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`profesion`,`email_1`,`email_2`)
Values
('1000203','Iglesias','Jorge','N/D','N/D','N/D')
;
Insert into t_users2 
(`dni`,`cuil`,`rol`,`tel_1`,`tel_2`,`a_socio`,`f_ingreso`,`acuerdo`)
Values
('1000203','N/D','DC','N/D','N/D','2011','2011-09-18','Si')
;
Insert into t_logs_estado_user (`dni`,`estado`,`consideraciones`)
Values
('1000203','Disponible','Carga Inicial DC')
;
-- ------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`profesion`,`email_1`,`email_2`)
Values
('1000204','Stilerman','David','N/D','N/D','N/D')
;
Insert into t_users2 
(`dni`,`cuil`,`rol`,`tel_1`,`tel_2`,`a_socio`,`f_ingreso`,`acuerdo`)
Values
('1000204','N/D','DC','N/D','N/D','2011','2011-09-18','Si')
;
Insert into t_logs_estado_user (`dni`,`estado`,`consideraciones`)
Values
('1000204','Disponible','Carga Inicial DC')
;
-- ------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`profesion`,`email_1`,`email_2`)
Values
('1000205','Canabal','Patricia','N/D','pc_1083@yahoo.com.ar','N/D')
;
Insert into t_users2 
(`dni`,`cuil`,`rol`,`tel_1`,`tel_2`,`a_socio`,`f_ingreso`,`acuerdo`)
Values
('1000205','N/D','DC','+54-911-5327-6672','+54-11-5787-1891','2014','2014-08-06','Si')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000205','RRHH')
;
Insert into t_logs_estado_user (`dni`,`estado`,`consideraciones`)
Values
('1000205','Disponible','Carga Inicial DC')
;
-- ------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`profesion`,`email_1`,`email_2`)
Values
('1000206','Almiron','Daniel','N/D','daniel_almiron@yahoo.com.ar','N/D')
;
Insert into t_users2 
(`dni`,`cuil`,`rol`,`tel_1`,`tel_2`,`a_socio`,`f_ingreso`,`acuerdo`)
Values
('1000206','N/D','DC','+54-911-4565-3234','N/D','2016','2009-10-22','Si')
;
Insert into t_logs_estado_user (`dni`,`estado`,`consideraciones`)
Values
('1000206','Disponible','Carga Inicial DC')
;
-- ------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`profesion`,`email_1`,`email_2`)
Values
('1000207','Codara','Monica','N/D','monicacodara@gmail.com','mcodara@laestrellaretiro.com.ar')
;
Insert into t_users2 
(`dni`,`cuil`,`rol`,`tel_1`,`tel_2`,`a_socio`,`f_ingreso`,`acuerdo`)
Values
('1000207','N/D','DC','+54-911-6554-6630','+54-11-4785-2292','2016','2012-10-01','Si')
;
Insert into t_logs_estado_user (`dni`,`estado`,`consideraciones`)
Values
('1000207','Disponible','Carga Inicial DC')
;
