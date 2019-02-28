<?php

/**
 * 
 * Buscar Vol por apellido aproximado
 * En esta version, no incluimos el tema de las especialidades...
 * 
 */

if (isset($_POST['submit'])) {
	try {	
		require "./config_ap_V1.4.php";
		require "./common_ap_V1.4.php";

		$connection = new PDO($dsn, $username, $password, $options);

		// Se elimino "AND 	(estado != 'ND_Temp' )"
		// el estado= 'Interno' no existira mas en el futuro

		$sql = "SELECT
						dni, apellido, nombres, rol, estado, tel_1, email_1
				FROM    us1_us2
				WHERE 	( (		(estado != 'De_Baja') AND 	(estado != 'Interno' ) ) 
								
						AND ( 		rol = 'Vol'  
								OR  rol = 'VC' 
								OR	rol = 'DC'	)
								 
							AND apellido LIKE :apellido
														     
									
				 
							) ORDER BY rol DESC, estado, apellido;" ;

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
		<h3>para ASIGNAR a un Proyecto</h3>
		<h3>Resultados para (estado != De_Baja)</h3>
		<a href="index_ap_<?php echo escape($vers);?>.php">Back to home</a>
		<table>
			<thead>
				<tr>
					<th>DNI</th>
					<th>Apellido</th>
					<th>Nombres</th>
					<th>Rol</th>
					<th>Estado Act</th>
					<th>Tel_1</th>
					<th>email_1</th>
					<th>Seleccionar</th>
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
				<td><?php echo escape($row["tel_1"]); ?></td>
				<td><?php echo escape($row["email_1"]); ?></td>

				<td><a href="sel_osc_p_proy_ap_<?php echo escape($vers);?>.php?dni=<?php echo escape($row["dni"]); ?>
				&apellido=<?php echo escape($row["apellido"]); ?>
				&nombres=<?php echo escape($row["nombres"]); ?>
				&est_act=<?php echo escape($row["estado"]); ?>
				">P/Asignar</a></td>

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
<h3>para ASIGNAR a un Proyecto</h3>

<form method="post">
	<label for="apellido">Apellido (A%  %A%  %)</label>
	<input type="text" id="apellido" name="apellido">
	<input type="submit" name="submit" value="Buscar">
</form>

<?php  	require "./config_ap_V1.4.php";
		require "./common_ap_V1.4.php";?>

<a href="index_ap_<?php echo escape($vers);?>.php">Back to home</a>

<?php require "templates/footer.php"; ?>
