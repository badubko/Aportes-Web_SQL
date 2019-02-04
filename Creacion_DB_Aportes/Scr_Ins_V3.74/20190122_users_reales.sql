-- --------------------------------------------------------------
-- Nombre    :  ../SQL_Ins_Datos/2018-11-01_1154_USERS.sql
-- Creado por: ./transformer_t_users1_V2.9.sh     Run_date  : # 2018/11/01 11:54
--
-- Directorio Origen:  /media/CGate/badubko/Back_F/BAS/DOCS/Aportes/Desa
-- CSV_IN_FILE :				../Datos/Libro2_V1.4.csv
-- --------------------------------------------------------------
-- :1,$s/\(estado\`\)/\1,\`consideraciones\`/
-- :g/dni`,`esta/+2,$s/\')/\',\"Carga inicial\"\)/


\. ./Scr_Ins_V3.74/que_base_V1.4.sql


Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('11077171','Albisetti','Carlos Jose','calbisetti@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('11077171','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11077171','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11077171','Comercial')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11077171','Negocios')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11077171','Diagnostico')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('11077171','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('11023715','Arco','Alberto','arcoalberto@hotmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('11023715','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11023715','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11023715','Comercial')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11023715','Negocios')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11023715','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('11023715','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('07660708','Bagg','Luis','eugenio.bagg@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('07660708','20-07660708-8')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('07660708','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('07660708','Diagnostico')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('07660708','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('93345440','Bernardini','Maria Elizabeth','ebernardini@kenwin.net','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('93345440','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('93345440','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('93345440','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('93345440','Diagnostico')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('93345440','Indicadores')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('93345440','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('04383620','Blumenthal','Roberto Jose','rblumenthal9@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('04383620','20-04383620-0')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('04383620','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('04383620','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('04383620','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('11788722','Brandt','Roberto Daniel','robertodbrandt@googlemail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('11788722','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11788722','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11788722','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11788722','Diagnostico')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11788722','Indicadores')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('11788722','ND_Temp',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('5315515','Cabo','Celia','celia.cabo@yahoo.com.ar','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('5315515','N/D')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('5315515','Interno',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('07837645','Carchak Canes','Rafael Angel','rafael.carchak@energeia.com.ar',' rcarchak@fibertel.com.ar')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('07837645','20-07837645-8')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('07837645','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('07837645','Negocios')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('07837645','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('07837645','Coaching')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('07837645','Diagnostico')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('07837645','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('04437727','Castillo','Eduardo','eduardocastillo13@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('04437727','20-04437727-7')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('04437727','Administracion')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('04437727','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('04437727','Contable')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('04437727','ND_Temp',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('14026826','CASTILLO','MARIA ESTELA','mariaestelacastillo@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('14026826','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('14026826','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('14026826','Sistemas')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('14026826','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('14026826','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('8591589','Conde','Roberto Pablo','rpconde@fibertel.com.ar','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('8591589','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('8591589','Comercial')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('8591589','Negocios')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('8591589','Comunicacion')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('8591589','ND_Temp',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('4514672','Cortes','Eduardo','ecortes229@hotmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('4514672','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4514672','RRHH')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('4514672','Interno',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('999999','Croxatto','Horacio Luis','hcroxatto@yahoo.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('999999','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('999999','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('999999','Comercial')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('999999','Negocios')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('999999','Sistemas')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('999999','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('999999','ND_Temp',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('4373628','D Alessio','Enrique','enrique.a.dalessio@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('4373628','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4373628','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4373628','Indicadores')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('4373628','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('06153590','D Avola','Marta Ines','marta@retisrrhh.com.ar','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('06153590','27-06153590-5')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('06153590','RRHH')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('06153590','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('06153590','Coaching')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('06153590','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('16412832','De Paul','Fabian','depaulfabian@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('16412832','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('16412832','Negocios')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('16412832','ND_Temp',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('4543686','Deleonardis','Godofredo','gdeleonardis@fibertel.com.ar','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('4543686','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4543686','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4543686','RRHH')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('4543686','ND_Temp',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('10125826','Di Nucci','Jorge Nicolas','jndinucci@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('10125826','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('10125826','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('10125826','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('10125826','Comunicacion')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('10125826','ND_Temp',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('10128986','Donzelli','Alejandro','adonzelli@fibertel.com.ar','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('10128986','23-10128986-9')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('10128986','Logistica')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('10128986','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('10128986','Indicadores')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('10128986','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('11285447','Dubko','Basilio','basilio_dubko@yahoo.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('11285447','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11285447','Sistemas')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11285447','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11285447','Versotica')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('11285447','Interno',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('4403493','Falicoff','Eduardo','efalicoff@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('4403493','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4403493','Sistemas')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4403493','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('4403493','Disponible',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('12062579','Fernandez','Carlos Ezequiel','N/D','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('12062579','23-12062579-9')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('12062579','Comercial')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('12062579','Logistica')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('12062579','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('12062579','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('10161593','Fidalgo','Ruben Omar','rufidalgo@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('10161593','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('10161593','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('10161593','Comercial')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('10161593','Negocios')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('10161593','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('10161593','Disponible',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('4368430','Fiocchi','Mario Alberto','mario.fiocchi@petrobras.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('4368430','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4368430','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4368430','RRHH')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('4368430','Disponible',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('13980034','Flores','Osvaldo Antonio','osvaldo.flores@ar.ey.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('13980034','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('13980034','Negocios')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('13980034','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('13980034','Contable')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('13980034','ND_Temp',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('12865409','Fuster','Patricia Maria','mpfuster@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('12865409','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('12865409','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('12865409','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('12865409','Diagnostico')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('12865409','Disponible',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('21764250','GARDELLA','Alejandro P.','Newtango1970@yahoo.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('21764250','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('21764250','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('21764250','Comercial')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('21764250','Negocios')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('21764250','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('21764250','Diagnostico')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('21764250','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('17812861','Gaston','Laura','gastonlaura@hotmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('17812861','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('17812861','Administracion')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('17812861','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('17812861','Contable')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('17812861','Interno',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('8261239','Hall','Peter','peter.hall.arg@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('8261239','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('8261239','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('8261239','RRHH')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('8261239','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('8261239','Coaching')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('8261239','Diagnostico')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('8261239','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('11815205','Iglesias','Alicia Josefina','aigle955@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('11815205','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11815205','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11815205','RRHH')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11815205','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11815205','Coaching')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('11815205','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('10661746','Indaco','Alfredo Antonio','alfredo.in@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('10661746','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('10661746','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('10661746','Comercial')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('10661746','Negocios')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('10661746','Disponible',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('4381690','Jalfen','Norberto Benjamin','jalfens@hotmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('4381690','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4381690','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4381690','Administracion')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4381690','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4381690','Diagnostico')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4381690','Contable')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('4381690','ND_Temp',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('26115457','Jejcic','Guillermo','guillermo.jejcic@itau.com.ar','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('26115457','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('26115457','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('26115457','Comercial')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('26115457','Negocios')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('26115457','Sistemas')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('26115457','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('26115457','Diagnostico')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('26115457','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('12861175','KEBLERIS','SILVIA MARCELA','smkebleris@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('12861175','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('12861175','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('12861175','Diagnostico')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('12861175','Indicadores')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('12861175','Disponible',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('11467178','Kievsky','Ariel','ariel.kievsky@tec-consultores.com.ar','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('11467178','23-11467178-9')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11467178','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11467178','RRHH')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('11467178','Disponible',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('10123767','Larralde','Roberto','larralde@abe.org.ar','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('10123767','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('10123767','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('10123767','Administracion')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('10123767','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('10123767','Contable')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('10123767','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('04311689','Leschinsky','Lazaro','lazaro.leschinsky@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('04311689','20-04311689-5')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('04311689','Disponible',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('4747813','Liendo','Jose Maria','jose_liendo@yahoo.com.ar','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('4747813','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4747813','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4747813','RRHH')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4747813','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('4747813','ND_Temp',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('18475365','Lijtman','Daniel','daniel.lijtman@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('18475365','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('18475365','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('18475365','RRHH')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('18475365','Administracion')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('18475365','Sistemas')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('18475365','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('18475365','Coaching')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('18475365','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('92334192','LLano Leguizamon','Carmen Ines','carmen.llano@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('92334192','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('92334192','Sistemas')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('92334192','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('92334192','Disponible',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('7375447','Lopez','Horacio','hlopez1@fibertel.com.ar','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('7375447','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('7375447','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('7375447','Administracion')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('7375447','Negocios')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('7375447','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('7375447','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('29217019','Lopez Dagan','Maria Eugenia','N/D','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('29217019','27-29217019-5')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('29217019','RRHH')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('29217019','Comunicacion')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('29217019','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('7638418','Lopez Marti','Juan Carlos','jclmarti@itba.edu.ar','jclopezmarti@gmail.com')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('7638418','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('7638418','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('7638418','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('7638418','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('8406769','Magnus','Tomás Rubén','elianeytommy@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('8406769','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('8406769','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('8406769','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('8406769','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('06082141','Marcer','José Luis','jlmarcer@dow.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('06082141','20-06082141-1')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('06082141','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('06082141','Administracion')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('06082141','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('06082141','Contable')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('06082141','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('14809026','Marine','Jorge','jorge_marine@hotmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('14809026','20-14809026-3')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('14809026','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('17481570','Moya','Claudia','moya_claudia@hotmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('17481570','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('17481570','Administracion')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('17481570','ND_Temp',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('11368729','Niemetz','Jorge Alberto','mailto:jniemetz@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('11368729','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11368729','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11368729','Comercial')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11368729','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('11368729','Con_Restricc',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('12107641','Nuevo','Susana','snuevo@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('12107641','27-12107641-7')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('12107641','RRHH')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('12107641','Coaching')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('12107641','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('11524703','Oxoby','Marta Elena','moxoby@dianthus.com.ar  ','   oxobymarthe03@gmail.com')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('11524703','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11524703','Estrategia')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('11524703','Disponible',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('11802203','Pages','Jose','jose.pages@itau.com.ar','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('11802203','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11802203','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11802203','Comercial')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11802203','Negocios')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11802203','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('11802203','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('4412265','Pampillo','Raul Francisco Jose','pampillo@fibertel.com.ar','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('4412265','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4412265','Negocios')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4412265','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('4412265','Disponible',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('10558702','Peña','Maria del Carmen','mcpena34@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('10558702','27-10558702-9')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('10558702','Administracion')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('10558702','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('10558702','Diagnostico')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('10558702','Contable')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('10558702','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('6714305','Pezzolla','Cecilia','cpezzolla@fibertel.com.ar','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('6714305','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('6714305','Negocios')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('6714305','Logistica')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('6714305','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('6714305','ND_Temp',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('11997550','Pfister','Arnoldo','aopfister@hotmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('11997550','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11997550','Negocios')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11997550','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('11997550','Disponible',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('04556079','Philipps','Roberto','rphilipps@ternium.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('04556079','20-04556079-02')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('04556079','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('04556079','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('04556079','ND_Temp',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('10110647','Prado','Pablo Raul','N/D','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('10110647','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('10110647','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('10110647','Comercial')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('10110647','Negocios')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('10110647','Logistica')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('10110647','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('7685597','Pujals','Fernando','pujals9@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('7685597','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('7685597','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('7685597','Administracion')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('7685597','Negocios')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('7685597','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('7685597','Diagnostico')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('7685597','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('4553179','Quintana Aguilar','Jose Alberto','jquintana.ar@fibertel.com.ar','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('4553179','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4553179','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4553179','Administracion')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4553179','Comercial')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4553179','Negocios')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('4553179','Disponible',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('7704808','Rabinovich','Delfin','delfin@fibertel.com.ar','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('7704808','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('7704808','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('7704808','Negocios')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('7704808','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('7704808','Diagnostico')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('7704808','Disponible',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('4444524','Romero','Norberto','n.romero@ar.inter.net','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('4444524','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4444524','Negocios')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4444524','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('4444524','Disponible',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('93445268','Rosenfeld','Zoltan','zoltan.cyb@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('93445268','20-93445268-3')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('93445268','RRHH')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('93445268','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('94602041','Rovira Cubillo','Alejandro Enrique','alejandro.rovirac@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('94602041','N/D')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('94602041','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('11362109','Sabban Cohen','Rafael','litorcs@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('11362109','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11362109','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11362109','Negocios')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11362109','Logistica')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11362109','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('11362109','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('12601664','San Gil','Ernesto','ernesto.san.gil@gmail.com',' vivimbecerra@gmail.com')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('12601664','20-12601664-7')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('12601664','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('12601664','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('12601664','ND_Temp',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('14927381','Sanchez','Gustavo','mailto:gsanchez.ar@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('14927381','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('14927381','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('14927381','Negocios')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('14927381','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('14927381','Coaching')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('14927381','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('22759102','Sarabia','Esteban','esteban@sarabia.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('22759102','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('22759102','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('22759102','Sistemas')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('22759102','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('22759102','Diagnostico')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('22759102','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('4548676','Sarno','Rodolfo','rodsrn@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('4548676','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4548676','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4548676','Negocios')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4548676','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('4548676','Disponible',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('12463662','Schargorodsky','Gregorio','gregorio.schargorodsky@ar.ey.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('12463662','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('12463662','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('12463662','Administracion')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('12463662','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('12463662','Contable')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('12463662','ND_Temp',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('24569384','Scquizzato','Natalia','natalia.scquizzato@ar.ey.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('24569384','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('24569384','RRHH')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('24569384','ND_Temp',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('17233641','Segura','Jorge Gustavo','segurajorgegustavo@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('17233641','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('17233641','Administracion')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('17233641','Comercial')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('17233641','Logistica')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('17233641','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('17233641','Disponible',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('12600203','Serebrennik','Diego','diegoserebre@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('12600203','20-12600203-4')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('12600203','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('12865523','Sgro','Silvia','ssgro@redhat.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('12865523','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('12865523','Sistemas')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('12865523','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('12865523','ND_Temp',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('04536924','Sorrosal','Gustavo','gustavo.sorrosal@fibertel.com.ar',' gsorrosal@proveedores.siderca.com')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('04536924','20-04536924-3')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('04536924','Sistemas')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('04536924','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('04536924','Disponible',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('13237942','Soula','Gerardo Augusto','gerynet@icloud.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('13237942','N/D')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('13237942','Disponible',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('10260310','Spielmann','Susana Ines','susyspielmann@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('10260310','27-10260310-4')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('10260310','Interno',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('12001693','Valchi','Elvio','elvio.valchi@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('12001693','20-12001693-9')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('12001693','Negocios')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('12001693','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('13211906','Valotta','Carlos Augusto','carlosvalotta@hotmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('13211906','20-13211906-7')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('13211906','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('13211906','Negocios')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('13211906','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('13211906','ND_Temp',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('11710217','Vasaro','Vilma','Vilmava09@yahoo.com.ar','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('11710217','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11710217','Comercial')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11710217','Negocios')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('11710217','Disponible',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('8627432','Vega','Ruben Oscar','rvega706@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('8627432','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('8627432','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('8627432','Administracion')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('8627432','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('8627432','Coaching')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('8627432','Contable')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('8627432','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('04520142','Vicente','Carlos Alberto','Cvicente45@outlook.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('04520142','20-04520142-3')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('04520142','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('04520142','Negocios')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('04520142','Logistica')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('04520142','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('04520142','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('4357215','Vilate','Roberto','rvilate@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('4357215','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4357215','Negocios')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4357215','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('4357215','Disponible',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('11478659','Villahoz','Carlos Alberto','carlos.villahoz@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('11478659','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11478659','Administracion')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11478659','Negocios')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('11478659','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('11478659','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('4981277','Vogel','Guillermo Enrique','guillermo_vogel@hotmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('4981277','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4981277','Administracion')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('4981277','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('4981277','Disponible',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('17446349','Zamora','Diana','dianazamora@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('17446349','N/D')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('17446349','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('17446349','RRHH')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('17446349','Sistemas')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('17446349','Procesos')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('17446349','Asignado',"Carga inicial")
;
-- --------------------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`email_1`,`email_2`)
Values
('07604925','Zucchino','Cesar','cesar.zucchino@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`)
Values
('07604925','20-07604925-5')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('07604925','Estrategia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('07604925','Administracion')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('07604925','Procesos')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('07604925','Diagnostico')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('07604925','Contable')
;
Insert into t_logs_estado_user 
(`dni`,`estado`,`consideraciones`)
Values
('07604925','ND_Temp',"Carga inicial")
;
-- --------------------------------------------------------------
