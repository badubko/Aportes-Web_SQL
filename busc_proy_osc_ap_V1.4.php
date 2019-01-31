<?php

/**
 * 
 * Buscar los proyectos de una OSC 
 * Con estado = En_Ejecucion o = Pre-Proyecto(?) (Que otros estados???)
 * Se seleccionara el proyecto al que se asignara al Voluntario
 * en el proximo paso.
 * Si Vil YA esta asignado a un proyecto, informa
 * Si Vol NO esta asignado a un proyecto, permite asignarlo
 * 
 */

	try {	
		require "./config_ap_V1.4.php";
		require "./common_ap_V1.4.php";

		$connection = new PDO($dsn, $username, $password, $options);

// select p_num_corr_proy, osc_nombre, p_nombre_proy from t_proyectos 
// where osc_nombre = "ALPI" and 
// ( p_num_corr_proy in (SELECT p_num_corr_proy FROM t_p_logs_estado_proy 
//  WHERE (p_estado_proy = 'En_Ejecucion' ) OR (p_estado_proy = 'Pre-Proyecto')  ));


		$sql = "SELECT p_num_corr_proy, osc_nombre, p_nombre_proy , p_ultimo_estado FROM t_proyectos 
				where osc_nombre LIKE :osc AND 
				((p_ultimo_estado = 'Pre-Proyecto' ) OR (p_ultimo_estado = 'En_Ejecucion') )";

						
		$osc = $_GET['osc'];				
		$dni = $_GET['dni'];
		$apellido = $_GET['apellido'];
		$nombres = $_GET['nombres'];

		$statement = $connection->prepare($sql);
		$statement->bindParam(':osc', $osc, PDO::PARAM_STR);
		$statement->execute();

		$result = $statement->fetchAll();
	} catch(PDOException $error) {
		echo $sql . "<br>" . $error->getMessage();
													}

 require "templates/header.php"; 
 require "verificar_asign_V1.4.php";		

	if ($result && $statement->rowCount() > 0) { ?>
		<h3><?php echo "Asignacion de Vol: " , escape($apellido) , ", " , escape($nombres); ?></h3>
		
		<h3><?php echo "a un Proyecto de OSC: " , escape($_GET['osc']) , ", en Estado = (Pre-Proyecto o En_Ejecucion)"; ?></h3>

<!--
		<a href="index_ap_<?php echo escape($vers);?>.php">Back to home</a>
-->
		<table>
			<thead>
				<tr>
					<th>OSC</th>
					<th>Num Corr Proy</th>
					<th>Nombre Proy</th>
					<th>Estado Proy</th>			
					<th>Elegir Proyecto</th>
				</tr>
			</thead>
			<tbody>
	<?php foreach ($result as $row) { ?>
			<tr>
				<td><?php echo escape($row["osc_nombre"]); ?></td>
				<td><?php echo escape($row["p_num_corr_proy"]); ?></td>
				<td><?php echo escape($row["p_nombre_proy"]); ?></td>
				<td><?php echo escape($row["p_ultimo_estado"]); ?></td>
	
	<?php       if ( verificar_asign( $dni , $row["p_num_corr_proy"]) == 'No_Asignado' 	) { 	?>			
					
					<td><a href="asign_a_proy_ap_<?php echo escape($vers);?>.php
					?dni=<?php echo escape($dni); ?>
					&apellido=<?php echo escape ($apellido); ?>
					&nombres=<?php echo escape($nombres); ?>
					&osc=<?php echo escape($row["osc_nombre"]); ?>
					&num_proy=<?php echo escape($row["p_num_corr_proy"]); ?>
					&p_nombre_proy=<?php echo escape($row["p_nombre_proy"]); ?>
					">Asignar VOL</a></td>
	<?php  																	} 
				else 	{  ?>
					<td>Ya esta ASIGNADA/O a este Proyecto</td>
	<?php 				} ?>	
					
			</tr>
		<?php } ?> 
			</tbody>
	</table>
	<?php } else { ?>
		<blockquote>No se encontro ninguna OSC con:  <?php echo escape($_POST['osc']); ?>.</blockquote>
	<?php } ?>

<a href="index_ap_<?php echo escape($vers);?>.php">Back to home</a>
<?php
require "templates/footer.php"; 
exit;	
?> 

<!--
    Aca comenzamos...
-->
<?php  	require "./config_ap_V1.4.php";
		require "./common_ap_V1.4.php";?>
		

<!--
<h3><?php echo "Seleccionar Proy de OSC: " , escape($_GET['osc']); ?></h3>

<h3><?php echo "Para asignar VOL: " , escape($_GET['apellido']) , ", " , escape($_GET['nombres']); ?></h3>

<a href="index_ap_<?php echo escape($vers);?>.php">Back to home</a>

-->
<?php require "templates/footer.php"; ?>
