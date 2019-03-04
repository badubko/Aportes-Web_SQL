<!doctype html>

<?php 
include "../templates/header_proy.php"; 
require "../config_ap_V1.4.php";
require "../common_ap_V1.4.php";
?>
<?php
//echo escape(date("Y-m-d")) , "<br>";

//$date=date_create(date("Y-m-d"));
//date_add($date,date_interval_create_from_date_string("33 days"));
//$new_date=date_format($date,"Y-m-d");
//echo $new_date;
 ?>

	<ul>
		<li><a href="301_buscar_osc_p_proy_<?php echo escape($vers);?>.php"><strong>Buscar OSC para administrar proy</strong></a> - Buscar OSC para crear o modificar proyectos</li><br>
		<li><a href="302_buscar_proy_inic_<?php echo escape($vers);?>.php"><strong>Buscar Proy Iniciados</strong></a>       - Buscar Proyectos iniciados en un periodo</li><br>
		<li><a href="303_buscar_proy_term_<?php echo escape($vers);?>.php"><strong>Buscar Proy Terminados</strong></a>      - Buscar Proyectos terminados en un periodo </li><br>
	</ul>

<?php include "../templates/footer_proy.php"; ?>
