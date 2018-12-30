select dni , MAX(last_update)  from t_logs_estado_user group by dni having dni >1;

select * from t_logs_estado_user where last_update = (select MAX(last_update) from t_logs_estado_user);
