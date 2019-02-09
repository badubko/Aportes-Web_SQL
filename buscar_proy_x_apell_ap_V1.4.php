<?php

/**
 * 
 * Buscar proyectos de un Vol por apellido aproximado
 * 
 * Se elije Vol (o VC) por apellido aproximado. 
 * Se selecciona Vol
 * Se listan los proyectos a los que esta asignado 
 * Deberia validar que el que desasigna es el DP
 * Se da la opcion de desasignar al VOL de cada proyecto
 * Al desasignar, si no tiene mas proyectos VOL pasa a estar Disponible
 * 
 * SELECT dni,apellido, estado FROM us1_us2 WHERE apellido LIKE "CA%" and estado != "ND_Temp"
 * 
 */

if (isset($_POST['submit'])) {
	try {	
		require "./config_ap_V1.4.php";
		require "./common_ap_V1.4.php";

		$connection = new PDO($dsn, $username, $password, $options);

		$sql = "SELECT
						dni, apellido, nombres, rol, estado
				FROM    us1_us2
				WHERE apellido LIKE :apellido 	AND (estado = 'Asignado') 
												AND ((rol = 'Vol' ) OR (rol = 'VC') ) 
                ORDER BY apellido;" ;

		$apellido = $_POST['apellido'];

		$statement = $connection->prepare($sql);
		$statement->bindParam(':apellido', $apellido, PDO::PARAM_STR);
		$statement->execute();

		$result = $statement->fetchAll();
	} catch(PDOException $error) {
		echo $sql . "<br>" . $error->getMessage();
													}
}
?>
<?php require "templates/header.php"; ?>
		
<?php  
if (isset($_POST['submit'])) {
	if ($result && $statement->rowCount() > 0) { ?>
		<h3>Buscar Voluntario por apellido</h3>
		<h3>para DESASIGNAR de un Proyecto</h3>
		<h3>Resultados para (estado = "Asignado" y (rol = "VOL" OR rol = "VC") )</h3>
		<a href="index_ap_<?php echo escape($vers);?>.php">Back to home</a>
		<table>
			<thead>
				<tr>
					<th>dni</th>
					<th>apellido</th>
					<th>nombre</th>
					<th>rol</th>
					<th>Estado Act</th>
					<th>Seleccionar</th>

				</tr>
			</thead>
			<tbody>
	<?php foreach ($result as $row) { ?>
			<tr>
				<td><?php echo escape($row["dni"]); ?></td>
				<td><?php echo escape($row["apellido"]); ?></td>
				<td><?php echo escape($row["nombres"]); ?></td>
				<td><?php echo escape($row["rol"]); ?></td>
				<td><?php echo escape($row["estado"]); ?></td>

				<td><a href="buscar_proy_de_vol_ap_<?php echo escape($vers);?>.php?dni=<?php echo escape($row["dni"]); ?>
				&apellido=<?php echo escape($row["apellido"]); ?>
				&nombres=<?php echo escape($row["nombres"]); ?>
				&est_act=<?php echo escape($row["estado"]); ?>
				">p/DesAsignar</a></td>

			</tr>
		<?php } ?> 
			</tbody>
	</table>
	<?php } else { ?>
		<blockquote>No se encontro ningun Vol con:  <?php echo escape($_POST['apellido']); ?>.</blockquote>
	<?php } ?>

<a href="index_ap_<?php echo escape($vers);?>.php">Back to home</a>
<?php
require "templates/footer.php"; 
exit;	
} ?> 

<h3>Buscar Voluntario por apellido</h3>
<h3>para DesAsignar a un Proyecto</h3>

<form method="post">
	<label for="apellido">Apellido (A%  %A%  %)</label>
	<input type="text" id="apellido" name="apellido">
	<input type="submit" name="submit" value="Buscar">
</form>

<?php  	require "./config_ap_V1.4.php";
		require "./common_ap_V1.4.php";?>

<a href="index_ap_<?php echo escape($vers);?>.php">Back to home</a>

<?php require "templates/footer.php"; ?>
