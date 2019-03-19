
CREATE TABLE t_osc_cambios_estado (
  osc_estado_actual 	VARCHAR(16) NOT NULL,
  osc_estado_proximo 	VARCHAR(16) NOT NULL,
  id_truch				INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY  (id_truch)
  -- Por ahora dejamos afuera estos indices para poder incluir el estado "Imposible"
  -- KEY idx_fk_est_act (estado_actual),
  -- CONSTRAINT fk_est_act FOREIGN KEY (estado_actual) REFERENCES t_estados (estado) ON DELETE RESTRICT ON UPDATE CASCADE,
  -- KEY idx_fk_est_prox (estado_proximo),
  -- CONSTRAINT fk_est_prox FOREIGN KEY (estado_proximo) REFERENCES t_estados (estado) ON DELETE RESTRICT ON UPDATE CASCADE  
  )ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de relacion de los estados actual y proximo posible de una osc';

INSERT INTO `t_osc_cambios_estado` (`osc_estado_actual`, `osc_estado_proximo`) VALUES
('Identificada','Contactada'),
('Identificada','Descartada'),
('Contactada','Descartada'),
('Contactada','En_Conversacion'),

('En_Conversacion','Descartada'),

--  Automatico cuando se crea un proyecto
-- ('En_Conversacion','En_Actividad'),

--  Primero deberia pasar a Inactiva cuando se termina o cancelan los
--  proyectos
-- ('En_Actividad','Descartada'),

-- Automatico cuando se terminan todos los proyectos
-- ('En_Actividad','Inactiva'),


-- ('Inactiva','En_Actividad'),
('Inactiva','Descartada');
