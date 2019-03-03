<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

<!--
	<title>Aportes: VOLs </title>
-->

	<link rel="stylesheet" href="../css/style.css">
</head>


<?php

/**
 * Function to query information based on 
 * a parameter: in this case, apellido.
 *
 */

if (isset($_POST['submit'])) {
	try {	
		require "../config_ap_V1.4.php";
		require "../common_ap_V1.4.php";

		$connection = new PDO($dsn, $username, $password, $options);

		$sql = "SELECT dni , apellido  , nombres , profesion , email_1 , email_2 , last_update
						FROM t_users1
						WHERE apellido LIKE :apellido ORDER BY apellido" ;

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
		<h2>Results</h2>
		<a href="../index_ap_V1.4.php">Back to home</a>
		<table>
			<thead>
				<tr>
					<th>dni</th>
					<th>apellido</th>
					<th>nombre</th>
					<th>profesion</th>
					<th>email_1</th>
					<th>email_2</th>
					<th>last_update</th>
					<th>Modif Datos</th>
					<th>Agreg Datos</th>
					<th>Modif Datos</th>
					<th>Editar</th>
				</tr>
			</thead>
			<tbody>
	<?php foreach ($result as $row) { ?>
			<tr>
				<td><?php echo escape($row["dni"]); ?></td>
				<td><?php echo escape($row["apellido"]); ?></td>
				<td><?php echo escape($row["nombres"]); ?></td>
				<td><?php echo escape($row["profesion"]); ?></td>
				<td><?php echo escape($row["email_1"]); ?></td>
				<td><?php echo escape($row["email_2"]); ?></td>
				<td><?php echo escape($row["last_update"]); ?></td>
				<td><a href="./102_2_1_update-single_ap_<?php echo escape($vers);?>.php?dni=<?php echo escape($row["dni"]); ?>">PUB VOL</a></td>
				<td><a href="./102_2_2_create_restr_ap_<?php echo escape($vers);?>.php?dni=<?php echo escape($row["dni"]); ?>
				&apellido=<?php echo escape($row["apellido"]); ?>
				&nombres=<?php echo escape($row["nombres"]); ?>
				">RESTR VOL</a></td>
				<td><a href="./102_2_3_update-single_restr_ap_<?php echo escape($vers);?>.php?dni=<?php echo escape($row["dni"]); ?>
				&apellido=<?php echo escape($row["apellido"]); ?>
				&nombres=<?php echo escape($row["nombres"]); ?>
				">RESTR VOL</a></td>
				<td><a href="./102_2_4_listar-esp_ap_<?php echo escape($vers);?>.php?dni=<?php echo escape($row["dni"]); ?>
				&apellido=<?php echo escape($row["apellido"]); ?>
				&nombres=<?php echo escape($row["nombres"]); ?>
				">Espec</a></td>
			</tr>
		<?php } ?> 
			</tbody>
	</table>
	<?php } else { ?>
		<blockquote>No results found for <?php echo escape($_POST['apellido']); ?>.</blockquote>
	<?php } 
} ?> 


		
<h2>Buscar Voluntario por apellido</h2>

<form method="post">
	<label for="apellido">Apellido (A%  %A%  %)</label>
	<input type="text" id="apellido" name="apellido">
	<input type="submit" name="submit" value="Buscar">
</form>

<a href="../index_ap_V1.4.php">Back to home</a>

<?php require "../templates/footer_vol.php"; ?>
