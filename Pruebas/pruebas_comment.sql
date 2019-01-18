use test;

CREATE TABLE t_osc_estados_2 (
	osc_estado 				VARCHAR (16) NOT NULL DEFAULT "Desconocido" COMMENT 'Es el estado',
	PRIMARY KEY (osc_estado)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Registra las posibles estados de una OSC';
