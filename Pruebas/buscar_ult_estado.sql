select dni, estado  from t_logs_estado_user WHERE dni IN 
   (select dni ,  MAX(last_update)  from t_logs_estado_user group by dni having dni >1
);
