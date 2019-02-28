<!doctype html>

<?php 
include "../templates/header_proy.php"; 
require "../config_ap_V1.4.php";
require "../common_ap_V1.4.php";
?>


	<ul>
		<li><a href="301_buscar_osc_p_proy_<?php echo escape($vers);?>.php"><strong>Buscar OSC para crear proy</strong></a> - Buscar OSC para crear un nuevo proyecto</li><br>
		<li><a href="302_buscar_proy_inic_<?php echo escape($vers);?>.php"><strong>Buscar Proy Iniciados</strong></a>       - Buscar Proyectos iniciados en un periodo</li><br>
		<li><a href="303_buscar_proy_term_<?php echo escape($vers);?>.php"><strong>Buscar Proy Terminados</strong></a>      - Buscar Proyectos terminados en un periodo </li><br>
		<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>
		


	</ul>

<?php include "../templates/footer_proy.php"; ?>
