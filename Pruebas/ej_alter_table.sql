ALTER TABLE `t_hist_user_proy` ADD COLUMN `coment_desasign` VARCHAR (256) DEFAULT "No Comments"  AFTER  coment_asignac;

alter table t_osc_contactos add  `id_truch` INT UNSIGNED NOT NULL AUTO_INCREMENT AFTER last_update , ADD PRIMARY KEY (`id_truch`);
