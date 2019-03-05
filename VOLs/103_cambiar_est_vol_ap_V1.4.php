
<head>
<link rel="stylesheet" reference="text/css" href="../css/style.css" >
</head>



<?php

/**
 * Cambiar el estado de un voluntario
 * 
 *
 */

if (isset($_POST['submit'])) {
	try {	
		require "../config_ap_V1.4.php";
		require "../common_ap_V1.4.php";

		$connection = new PDO($dsn, $username, $password, $options);


			
			$sql = "SELECT dni, apellido, nombres, rol, estado FROM us1_us2 WHERE 
					  (apellido LIKE :apellido) AND
					 ((estado != 'De_Baja') AND (estado != 'Asignado' )) AND 
					 ((rol = 'Vol' ) OR (rol = 'VC') OR (rol = 'DC')) 
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
<?php require "../templates/header_vol.php"; ?>
		
<?php  
if (isset($_POST['submit'])) {
	if ($result && $statement->rowCount() > 0) { ?>
		<h3>Resultados para (estado != Asignado y estado != De_Baja)</h3>
		<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>
		<table>
			<thead>
				<tr>
					<th>DNI</th>
					<th>Apellido</th>
					<th>Nombres</th>
					<th>ROL</th>
					<th>Estado Act</th>
					<th>Cambiar</th>
<!--					
					<th>Editar</th>
-->
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

				<td><a href="103_1_modif_est_vol_ap_<?php echo escape($vers);?>.php?dni=<?php echo escape($row["dni"]); ?>
				&apellido=<?php echo escape($row["apellido"]); ?>
				&nombres=<?php echo escape($row["nombres"]); ?>
				&est_act=<?php echo escape($row["estado"]); ?>
				">Estado VOL</a></td>
		
			</tr>
		<?php } ?> 
			</tbody>
	</table>
	<?php } else { ?>
		<blockquote>No se encontro ningun Vol con (estado != Asignado y estado != De_Baja) y Apellido:  <?php echo escape($_POST['apellido']); ?>.</blockquote>
	<?php } 
} ?> 

<h3>Buscar Voluntario por apellido</h3>
<h3>Con (estado != Asignado y estado != De_Baja)</h3>
<h3>Cambiar estado del Voluntario</h3>

<form method="post">
	<label for="apellido">Apellido (A%  %A%  %)</label>
	<input type="text" id="apellido" name="apellido">
	<input type="submit" name="submit" value="Buscar">
</form>

<a href="../index_ap_V1.4.php">Back to home</a>

<?php require "../templates/footer_vol.php"; ?>
