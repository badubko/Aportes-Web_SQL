<!doctype html>

<?php 
include "../templates/header_osc.php"; 
require "../config_ap_V1.4.php";
require "../common_ap_V1.4.php";
?>


	<ul>
		<li><a href="201_alta_osc_<?php echo escape($vers);?>.php"><strong>Alta OSC</strong></a> - Alta OSC</li>
		<li><a href="202_buscar_osc_<?php echo escape($vers);?>.php"><strong>Buscar OSC p/Actualizar</strong></a> - Buscar OSC p/ Agregar o Actualizar datos</li><br>
		<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home<class=button /a>
<!--
		<h3>---------------------------------------------------------------------------------------------</h3>
		<li><a href="buscar_vol_x_apell_ap_<?php echo escape($vers);?>.php"><strong>Asignar VOL x Apellido</strong></a> - Buscar VOL x Apellido p/ asignar a proyecto</li>
		<li><a href="buscar_vol_x_espec_ap_<?php echo escape($vers);?>.php"><strong>Asignar VOL x Especialidad</strong></a> - Buscar VOL x Especialidad p/ asignar a proyecto<br><br></li>
		

		<li><a href="buscar_proy_x_apell_ap_V1.4.php"><strong>Desasignar VOL</strong></a> - Buscar un VOL para desasignar</li>
-->

	</ul>

<?php include "../templates/footer_osc.php"; ?>