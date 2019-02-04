

%s/\(.*\);\(.*\)/UPDATE t_osc SET `osc_dc_supl`= '\2',`osc_f_supl` = '2019-01-01',`osc_notas`='Asignacion DC Supl' WHERE osc_nombre = '\1';/
