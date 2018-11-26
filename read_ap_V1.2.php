<?php

/**
 * Function to query information based on 
 * a parameter: in this case, location.
 *
 */

if (isset($_POST['submit'])) {
	try {	
		require "./config_ap_V1.0.php";
		require "./common.php";

		$connection = new PDO($dsn, $username, $password, $options);

		$sql = "SELECT dni , apellido  , nombres , profesion , email_1
						FROM t_users1
						WHERE apellido = :apellido";

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
		<h2>Results</h2>

		<table>
			<thead>
				<tr>
					<th>dni</th>
					<th>apellido</th>
					<th>nombre</th>
					<th>profesion</th>
					<th>email_1</th>
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
			</tr>
		<?php } ?> 
			</tbody>
	</table>
	<?php } else { ?>
		<blockquote>No results found for <?php echo escape($_POST['apellido']); ?>.</blockquote>
	<?php } 
} ?> 

<h2>Find user based on apellido</h2>

<form method="post">
	<label for="apellido">Apellido</label>
	<input type="text" id="apellido" name="apellido">
	<input type="submit" name="submit" value="View Results">
</form>

<a href="index_ap_V1.2.php">Back to home</a>

<?php require "templates/footer.php"; ?>
