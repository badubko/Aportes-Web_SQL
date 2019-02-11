<!doctype html>

<?php 

// Menu de administacion de datos de una OSC

include "../templates/header_osc.php"; 
require "../config_ap_V1.4.php";
require "../common_ap_V1.4.php";
?>

<h3><?php echo "Administar datos de OSC: " , escape($_GET['osc_nombre']);  ?></h3>
	<ul>
		
		<li><a href="202_1_1_modif_datos_osc_<?php echo escape($vers);?>.php
				?osc_nombre=<?php echo escape($_GET['osc_nombre']); ?>
				"><strong>Modificar OSC</strong></a> - Modificar los datos de la OSC</li>	
		
		<li><a href="202_1_2_admin_cont_osc_<?php echo escape($vers);?>.php
				?osc_nombre=<?php echo escape($_GET["osc_nombre"]); ?>
				"><strong>Administrar Contactos</strong></a> - Administar los contactos de la OSC</li>
				
		<li><a href="202_1_3_admin_obj_osc_<?php echo escape($vers);?>.php
				?osc_nombre=<?php echo escape($_GET["osc_nombre"]); ?>
				"><strong>Administrar Objetivos</strong></a> - Administar los objetivos de la OSC</li>		
				
				
		<br><a href="../index_ap_<?php echo escape($vers);?>.php">Back to home<class=button /a>
<!--
		<h3>---------------------------------------------------------------------------------------------</h3>
		<li><a href="buscar_vol_x_apell_ap_<?php echo escape($vers);?>.php"><strong>Asignar VOL x Apellido</strong></a> - Buscar VOL x Apellido p/ asignar a proyecto</li>
		<li><a href="buscar_vol_x_espec_ap_<?php echo escape($vers);?>.php"><strong>Asignar VOL x Especialidad</strong></a> - Buscar VOL x Especialidad p/ asignar a proyecto<br><br></li>
		

		<li><a href="buscar_proy_x_apell_ap_V1.4.php"><strong>Desasignar VOL</strong></a> - Buscar un VOL para desasignar</li>
-->

	</ul>

<?php include "../templates/footer_osc.php"; ?>
