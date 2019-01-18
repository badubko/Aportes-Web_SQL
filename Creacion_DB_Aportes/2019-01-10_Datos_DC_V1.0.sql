-- Crea DCs

Insert into t_users1 
(`dni`,`apellido`,`nombres`,`profesion`,`email_1`,`email_2`)
Values
('1000200','Kurlat','Miguel Pedro','Ingeniero','miguel.kurlat@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`,`rol`)
Values
('1000200','N/D','DC')
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
(`dni`,`estado`)
Values
('1000200','Disponible')
;
--
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`profesion`,`email_1`,`email_2`)
Values
('1000201','Sabelotodo','Pedrito','Ingeniero','pslt@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`,`rol`)
Values
('1000201','N/D','DC')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000201','Chantologia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000201','Versotica')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000201','Diagnostico')
;
Insert into t_logs_estado_user 
(`dni`,`estado`)
Values
('1000201','Disponible')
;
--
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`profesion`,`email_1`,`email_2`)
Values
('1000202','Truchan','Juan Carlos','Chantologo','pslt@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`,`rol`)
Values
('1000202','N/D','DC')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000202','Chantologia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000202','Versotica')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000202','Procastinacion')
;
Insert into t_logs_estado_user 
(`dni`,`estado`)
Values
('1000202','Disponible')
;
-- ------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`profesion`,`email_1`,`email_2`)
Values
('1000203','Orihuela','Reina Katherine','Chantologa','rko@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`,`rol`)
Values
('1000203','N/D','DC')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000203','Chantologia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000203','Versotica')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000203','Pura Fantasia')
;
Insert into t_logs_estado_user 
(`dni`,`estado`)
Values
('1000203','Disponible')
;
-- ------------------------------------------------
Insert into t_users1 
(`dni`,`apellido`,`nombres`,`profesion`,`email_1`,`email_2`)
Values
('1000204','Noches','Angela','Mentirosa','an@gmail.com','N/D')
;
Insert into t_users2 
(`dni`,`cuil`,`rol`)
Values
('1000204','N/D','DC')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000204','Chantologia')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000204','Versotica')
;
Insert into t_especialidad_user 
(`dni`,`especialidad`)
Values
('1000204','Pura Fantasia')
;
Insert into t_logs_estado_user 
(`dni`,`estado`)
Values
('1000204','Disponible')
;
--
-- Agregar OSC
--
Insert into t_osc
(`osc_nombre`)
Values
('Cruz Roja')
;
Insert into t_osc
(`osc_nombre`)
Values
('Casa Rafael')
;
Insert into t_osc
(`osc_nombre`)
Values
('Wingu')
;
Insert into t_osc
(`osc_nombre`)
Values
('Haciendo Camino')
;
Insert into t_osc
(`osc_nombre`)
Values
('IDEL')
;
Insert into t_osc
(`osc_nombre`)
Values
('Casa FOA')
;
--
--
-- Cambiar estado OSC a Identificada

Insert into t_osc_logs_estado
(`osc_nombre`,`osc_estado`,`dni`)
Values
('Cruz Roja','Identificada',"11285447")
;
Insert into t_osc_logs_estado
(`osc_nombre`,`osc_estado`,`dni`)
Values
('Casa Rafael','Identificada',"11285447")
;
Insert into t_osc_logs_estado
(`osc_nombre`,`osc_estado`,`dni`)
Values
('Wingu','Identificada',"11285447")
;
Insert into t_osc_logs_estado
(`osc_nombre`,`osc_estado`,`dni`)
Values
('Haciendo Camino','Identificada',"11285447")
;
Insert into t_osc_logs_estado
(`osc_nombre`,`osc_estado`,`dni`)
Values
('IDEL','Identificada',"11285447")
;
Insert into t_osc_logs_estado
(`osc_nombre`,`osc_estado`,`dni`)
Values
('Casa FOA','Identificada',"11285447")
;


-- Asignar DC
--
--
-- 
Insert into t_osc_logs_dc
(`dni`,`osc_nombre`,`osc_rol_dc`)
Values
('1000200','Casa FOA','Primario')
;
Insert into t_osc_logs_dc
(`dni`,`osc_nombre`,`osc_rol_dc`)
Values
('1000201','Casa FOA','Suplente')
;
--
--
Insert into t_osc_logs_dc
(`dni`,`osc_nombre`,`osc_rol_dc`)
Values
('1000202','Casa Rafael','Primario')
;
Insert into t_osc_logs_dc
(`dni`,`osc_nombre`,`osc_rol_dc`)
Values
('1000203','Casa Rafael','Suplente')
;
--
--
Insert into t_osc_logs_dc
(`dni`,`osc_nombre`,`osc_rol_dc`)
Values
('1000200','Wingu','Primario')
;
Insert into t_osc_logs_dc
(`dni`,`osc_nombre`,`osc_rol_dc`)
Values
('1000203','Wingu','Suplente')
;
--
--
Insert into t_osc_logs_dc
(`dni`,`osc_nombre`,`osc_rol_dc`)
Values
('1000204','IDEL','Primario')
;
Insert into t_osc_logs_dc
(`dni`,`osc_nombre`,`osc_rol_dc`)
Values
('1000203','IDEL','Suplente')
;
