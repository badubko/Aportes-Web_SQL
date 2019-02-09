<?php

/**
 * 
 * Buscar los proyectos de un Vol para desasignarlo
 * Con estado = En_Ejecucion o = Pre-Proyecto(?) (Que otros estados???)
 * Se seleccionara el proyecto al que se desasignara el Voluntario
 * en el proximo paso.
 * Referencia:
 * 
 * 	CREATE VIEW osc_proy AS
 * 	SELECT DISTINCT	t_hist_user_proy.dni, t_proyectos.p_num_corr_proy , t_proyectos.osc_nombre, 
 * 	t_proyectos.p_nombre_proy  ,  t_proyectos.p_ultimo_estado
 * 	FROM
 * 	t_proyectos INNER JOIN t_hist_user_proy ON t_proyectos.p_num_corr_proy=t_hist_user_proy.p_num_corr_proy ;
 */

	try {	
		require "./config_ap_V1.4.php";
		require "./common_ap_V1.4.php";

		$connection = new PDO($dsn, $username, $password, $options);

		$sql = "SELECT osc_nombre, p_num_corr_proy, p_nombre_proy, p_ultimo_estado  FROM osc_proy 
		WHERE dni = :dni 	ORDER BY osc_nombre";				
						
		$dni = $_GET['dni'];

		$statement = $connection->prepare($sql);
		$statement->bindParam(':dni', $dni, PDO::PARAM_STR);
		$statement->execute();

		$result = $statement->fetchAll();
	} catch(PDOException $error) {
		echo $sql . "<br>" . $error->getMessage();
													}

 require "templates/header.php"; 
 require "verificar_asign_V1.4.php";?>
 
<h3>Buscar Proy del VOL</h3>

<h3><?php echo "Para desasignar VOL: " , escape($_GET['dni']) , ", " ,escape($_GET['apellido']) , ", " , escape($_GET['nombres']); ?></h3>

<a href="index_ap_<?php echo escape($vers);?>.php">Back to home</a>


<?php require "templates/footer.php"; 

		

	if ($result && $statement->rowCount() > 0) { 
		// Contar el total de proyectos validos
		// para luego saber cuando se desasigna del ultimo
		// Este valor se pasa al siguiente paso en cada renglon.
		//
		$tot_proy=0; 
		foreach ($result as $row) { 
			if ( verificar_asign( $dni , $row["p_num_corr_proy"]) == 'Asignado' 	) { 
			$tot_proy++ ; }
									}?>

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
	<?php foreach ($result as $row) { 
			if ( verificar_asign( $dni , $row["p_num_corr_proy"]) == 'Asignado' 	) { ?>
			<tr>
				<td><?php echo escape($row["osc_nombre"]); ?></td>
				<td><?php echo escape($row["p_num_corr_proy"]); ?></td>
				<td><?php echo escape($row["p_nombre_proy"]); ?></td>
				<td><?php echo escape($row["p_ultimo_estado"]); ?></td>
				<td><a href="desasign_de_proy_ap_<?php echo escape($vers);?>.php?dni=<?php echo escape($dni); ?>
				&apellido=<?php echo escape($_GET["apellido"]); ?>
				&nombres=<?php echo escape($_GET["nombres"]); ?>
				&osc_nombre=<?php echo escape($row["osc_nombre"]); ?>
				&p_nombre_proy=<?php echo escape($row["p_nombre_proy"]); ?>
				&p_ultimo_estado=<?php echo escape($row["p_ultimo_estado"]); ?>
				&p_num_corr_proy=<?php echo escape($row["p_num_corr_proy"]); ?>
				&tot_proy=<?php echo escape($tot_proy); ?>
				">p/DesAsignar de este</a></td>
			</tr>
		<?php 																			}
									} ?> 
			</tbody>
	</table>
	<?php } else { ?>
		<blockquote>No se encontro ningun proy para VOL:  <?php echo escape($_GET['dni']); ?>.</blockquote>
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
		


<h3>Buscar Proy del VOL</h3>

<h3><?php echo "Para desasignar VOL: " , escape($_GET['dni']) , ", " ,escape($_GET['apellido']) , ", " , escape($_GET['nombres']); ?></h3>

<a href="index_ap_<?php echo escape($vers);?>.php">Back to home</a>


<?php require "templates/footer.php"; 
exit; ?>
