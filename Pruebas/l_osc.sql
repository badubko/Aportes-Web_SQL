

select `aportes_V3_74`.`t_osc`.`osc_nombre` AS `osc_nombre`,`aportes_V3_74`.`t_users1`.`dni` AS `dni`,
`aportes_V3_74`.`t_users1`.`apellido` AS `apellido`,`aportes_V3_74`.`t_users1`.`nombres` AS `nombres`
 from (`aportes_V3_74`.`t_users1` 
 join `aportes_V3_74`.`t_osc` on((`aportes_V3_74`.`t_users1`.`dni` = `aportes_V3_74`.`t_osc`.`osc_dc_tit`)))
