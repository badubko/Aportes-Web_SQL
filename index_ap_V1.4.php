<!doctype html>

<?php 
include "templates/header.php"; 
require "./config_ap_V1.4.php";
require "./common_ap_V1.4.php";
?>


	<ul>
		<li><a href="create_ap_<?php echo escape($vers);?>.php"><strong>Crear VOL</strong></a> - Agregar Voluntario</li>
		<li><a href="read_ap_<?php echo escape($vers);?>.php"><strong>Actualizar un VOL</strong></a> - Buscar y modif Voluntario</li>
		<li><a href="cambiar_est_vol_ap_<?php echo escape($vers);?>.php"><strong>Cambiar Estado VOL</strong></a> - Buscar y cambiar Estado de Voluntario</li>
		
		<h3>---------------------------------------------------------------------------------------------</h3>
		<li><a href="buscar_vol_x_apell_ap_<?php echo escape($vers);?>.php"><strong>Asignar VOL x Apellido</strong></a> - Buscar VOL x Apellido p/ asignar a proyecto</li>
		
<!--
		<li><a href="update_ap_V1.4.php"><strong>Actualizar todos los VOL</strong></a> - Mostrar y Modif todos</li>
-->
	</ul>

<?php include "templates/footer.php"; ?>
