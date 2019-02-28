<!doctype html>

<?php 
require "./templates/header.php"; 
require "./config_ap_V1.4.php";
require "./common_ap_V1.4.php";
?>
<title>Aportes: Administracion de Voluntarios, OSCs y Proyectos </title>

	<ul>
		<li><a href="./VOLs/100_VOLs_<?php echo escape($vers);?>.php"><strong>VOLs</strong></a> - Administracion de VOLuntarios</li>
		
<!--
		<li><a href="create_ap_<?php echo escape($vers);?>.php"><strong>Crear VOL</strong></a> - Agregar Voluntario</li>
		<li><a href="read_ap_<?php echo escape($vers);?>.php"><strong>Actualizar un VOL</strong></a> - Buscar y modif Voluntario</li>
		<li><a href="cambiar_est_vol_ap_<?php echo escape($vers);?>.php"><strong>Cambiar Estado VOL</strong></a> - Buscar y cambiar Estado de Voluntario</li>
-->
		<h3>---------------------------------------------------------------------------------------------</h3>
		<li><a href="./OSCs/200_OSCs_<?php echo escape($vers);?>.php"><strong>OSCs</strong></a> - Administracion de OSCs</li>
		<h3>---------------------------------------------------------------------------------------------</h3>
		
		<h3>---------------------------------------------------------------------------------------------</h3>
		<li><a href="./PROY/300_Proy_<?php echo escape($vers);?>.php"><strong>Proy</strong></a> - Administracion de Proyectos</li>
		<h3>---------------------------------------------------------------------------------------------</h3>
		
		<li><a href="buscar_vol_x_apell_ap_<?php echo escape($vers);?>.php"><strong>Asignar VOL x Apellido</strong></a> - Buscar VOL x Apellido p/ asignar a proyecto</li>
		<li><a href="buscar_vol_x_espec_ap_<?php echo escape($vers);?>.php"><strong>Asignar VOL x Especialidad</strong></a> - Buscar VOL x Especialidad p/ asignar a proyecto<br><br></li>
		

		<li><a href="buscar_proy_x_apell_ap_V1.4.php"><strong>Desasignar VOL</strong></a> - Buscar un VOL para desasignar</li>

	</ul>

<?php include "templates/footer.php"; ?>
