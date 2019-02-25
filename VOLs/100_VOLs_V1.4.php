<!doctype html>

<?php 
include "../templates/header_vol.php"; 
require "../config_ap_V1.4.php";
require "../common_ap_V1.4.php";
?>


	<ul>
		<li><a href="101_create_ap_<?php echo escape($vers);?>.php"><strong>Crear VOL</strong></a> - Alta Voluntario</li>
		
		<li><a href="102_read_ap_<?php echo escape($vers);?>.php"><strong>Actualizar un VOL</strong></a> - Buscar y modif Voluntario</li>
		<li><a href="103_cambiar_est_vol_ap_<?php echo escape($vers);?>.php"><strong>Cambiar Estado VOL</strong></a> - Buscar y cambiar Estado de Voluntario</li>
		
		
		<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>

	</ul>

<?php include "../templates/footer_vol.php"; ?>
