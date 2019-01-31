-- --------------------------------------------------------------
-- Nombre    :  ../Scr_Ins_datos/2019-01-25_2014_USERS.sql
-- Creado por: ./transformer_t_users1_V2.9.sh     Run_date  : # 2019/01/25 20:14
--
-- Directorio Origen:  /media/CGate/badubko/Back_F/BAS/DOCS/Aportes/Aportes-Web_SQL/Creacion_DB_Aportes/Scripts_transf
-- CSV_IN_FILE :				../Planillas_Orig/Libro2-no_dni.csv
-- --------------------------------------------------------------
. ./Scr_Ins_datos/que_base_V1.4.sql

-- --------------------------------------------------------------
-- Esta en la lista de los DCs
-- Insert into t_users1 
-- (`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
-- Values
-- ('1000205','Canabal','Patricia','pC_1083@yahoo.com.ar','N/D')
-- ;
-- Insert into t_users2 
-- (`dni`,`cuil`)
-- Values
-- ('1000205','N/D')
-- ;
-- Insert into t_especialidad_user 
-- (`dni`,`especialidad`)
-- Values
-- ('1000205','RRHH')
-- ;
-- Insert into t_logs_estado_user 
-- (`dni`,`estado`)
-- Values
-- ('1000205','Asignado')
-- ;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('1000210','Casagrande','Jorge Gustavo','jorge.g.casagrande@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('1000210','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000210','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000210','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000210','Diagnostico')
;
Insert into t_logs_estado_user 
(`dni`,`estado`)
Values
('1000210','ND_Temp')
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('1000211','Di Brico','Carlos Alberto','Carlos.dibrico@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('1000211','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000211','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000211','Negocios')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000211','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000211','Coaching')
;
Insert into t_logs_estado_user 
(`dni`,`estado`)
Values
('1000211','ND_Temp')
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('7621101','Fossati','Eduardo Jorge','eduardojfossati@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('7621101','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('7621101','Administración')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('7621101','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('7621101','Contable')
;
Insert into t_logs_estado_user 
(`dni`,`estado`)
Values
('7621101','Disponible')
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('1000212','Garnelo','Leonardo','lgarnelo2001@yahoo.com.ar','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('1000212','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000212','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000212','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`)
Values
('1000212','ND_Temp')
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('5931630','Gonzalez Rosas','Graciela Juana','gracielagrosas@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('5931630','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('5931630','Estrategia')
;
Insert into t_logs_estado_user 
(`dni`,`estado`)
Values
('5931630','Disponible')
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('1000213','Gutman','Sergio','sergio.gutman@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('1000213','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000213','RRHH')
;
Insert into t_logs_estado_user 
(`dni`,`estado`)
Values
('1000213','Puntual')
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('20665260','Imbrogno','Mariano','mariano.imbrogno@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('20665260','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('20665260','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('20665260','Administración')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('20665260','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`)
Values
('20665260','Asignado')
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('1000214','Lanzillotta','Victor Eduardo','ve.lanzi@hotmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('1000214','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000214','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000214','Indicadores')
;
Insert into t_logs_estado_user 
(`dni`,`estado`)
Values
('1000214','Disponible')
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('1000215','Leonhardt','Ana','ana.leonhardt@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('1000215','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000215','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000215','Sistemas')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000215','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`)
Values
('1000215','ND_Temp')
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('1000216','Lopez','Gustavo','glopez1707@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('1000216','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000216','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000216','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`)
Values
('1000216','ND_Temp')
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('1000217','Meana','Maria Alicia','ali_meana@hotmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('1000217','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000217','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000217','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`)
Values
('1000217','Disponible')
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('1000218','Rivera','Luis Armando','luisarmandorivera@speedy.com.ar','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('1000218','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000218','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`)
Values
('1000218','ND_Temp')
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('1000219','Rodas','Jose Luis','jlrodas@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('1000219','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000219','Negocios')
;
Insert into t_logs_estado_user 
(`dni`,`estado`)
Values
('1000219','Disponible')
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('1000220','Russo','Cecilia','ceciliarusso@ymail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('1000220','N/D')
;
Insert into t_logs_estado_user 
(`dni`,`estado`)
Values
('1000220','Asignado')
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('1000221','Torresagasti','Maria Clara','ctorresagasti@yahoo.com.ar',' clara.torresagasti@mdnicolas.com.ar')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('1000221','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000221','Comunicacion')
;
Insert into t_logs_estado_user 
(`dni`,`estado`)
Values
('1000221','ND_Temp')
;
-- --------------------------------------------------------------
