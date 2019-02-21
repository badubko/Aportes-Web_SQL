<?php

/**
 * 
 * Buscar las OSC que tiene asignado un DC
 * o para actualizarlos
 * 
 */

if (isset($_GET['dni_dc'])) {
	try {	
		require "../config_ap_V1.4.php";
		require "../common_ap_V1.4.php";
		
        
		$connection = new PDO($dsn, $username, $password, $options);

		$sql_tit = "SELECT osc_nombre, apellido, nombres
				FROM    list_osc_dc_tit
				WHERE 	dni =  :dni_dc  ;" ;
		

								
		$dni_dc = $_GET['dni_dc'];		

		$statement_tit = $connection->prepare($sql_tit);
		$statement_tit->bindParam(':dni_dc', $dni_dc, PDO::PARAM_STR);
		$statement_tit->execute();

		$result_tit = $statement_tit->fetchAll();
		$count_tit = $statement_tit->rowCount();
	} catch(PDOException $error_tit) {
		echo $sql_tit . "<br>" . $error_tit->getMessage();
									 }
	try {	
		
		$sql_supl = "SELECT osc_nombre, apellido, nombres
				FROM    list_osc_dc_supl
				WHERE 	dni =  :dni_dc  ;" ;
								
		$dni_dc = $_GET['dni_dc'];		

		$statement_supl = $connection->prepare($sql_supl);
		$statement_supl->bindParam(':dni_dc', $dni_dc, PDO::PARAM_STR);
		$statement_supl->execute();

		$result_supl = $statement_supl->fetchAll();
		$count_supl = $statement_supl->rowCount();
		
	} catch(PDOException $error_supl) {
		echo $sql_supl . "<br>" . $error_supl->getMessage();
								  }

}
?>
<?php require "../templates/header_osc.php"; ?>
		
<?php  

	if ($result_tit && $count_tit> 0) { ?>

		<h3>Listar OSCs de: <?php echo escape($_GET['apellido']); ?>, <?php echo escape($_GET['nombres']); ?> </h3>
        <h4>Total OSCs como Titular : <?php echo escape($count_tit); ?><br></4>
		<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a><br><br>
		
		<style>
		table, th, td {
		border: 1px solid black; }
		</style>
		
		<table>
			<thead>
				<tr>
					<th>OSC</th>
					<th>Rol</th>
					<th>Elegir OSC</th>
				</tr>
			</thead>
			<tbody>
	<?php foreach ($result_tit as $row) { ?>
			<tr>
				<td><?php echo escape($row["osc_nombre"]); ?></td>
				<td>Titular</td>		
				<td><a href="202_1_admin_osc_<?php echo escape($vers);?>.php
				?osc_nombre=<?php echo escape($row["osc_nombre"]); ?>
				">Administrar datos OSC</a></td>
			</tr>
		<?php } ?> 
			</tbody>
	</table>
	<?php } else { ?>

		<blockquote>No se encontro ninguna OSC para DC como Titular: <?php echo escape($_GET['apellido']); ?>, <?php echo escape($_GET['nombres']); ?></blockquote>
	<?php } ?>
<br>
<br>
<a href="203_buscar_dcs_<?php echo escape($vers);?>.php">Buscar otro DC</a>
<br>
<a href="202_buscar_osc_<?php echo escape($vers);?>.php">Buscar otra OSC p/ Agregar o Actualizar datos</a>
<br>
<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>
<?php
require "../templates/footer_osc.php"; 
exit;	
 ?> 

