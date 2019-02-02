create view r_e as
select t_users1.dni, t_users1.apellido, t_users1.nombres, t_users2.rol, t_users2.estado from
t_users1 INNER JOIN t_users2 ON t_users1.dni=t_users2.dni

-- select * from r_e where rol= 'DC' ORDER By apellido;

-- select * from r_e where rol= 'Vol'  ORDER By estado, apellido;

-- select * from r_e where rol= 'Vol' AND dni IN (SELECT dni from t_especialidad_user WHERE especialidad = 'Indicadores') ORDER By estado, apellido;
