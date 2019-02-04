

%s/\(.*\);\(.*\)/UPDATE t_osc SET `osc_dc_tit`= '\2',`osc_f_titular` = '2019-01-01',`osc_notas`='Asignacion DC Tit' WHERE osc_nombre = '\1';/
