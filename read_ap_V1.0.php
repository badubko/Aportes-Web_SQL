<?php

/**
 * Function to query information based on 
 * a parameter: in this case, location.
 *
 */

if (isset($_POST['submit'])) {
	try {	
		require "../config.php";
		require "../common.php";

		$connection = new PDO($dsn, $username, $password, $options);

		$sql = "SELECT dni , apellido  
						FROM t_users1
						WHERE dni = :dni";

		$dni = $_POST['dni'];

		$statement = $connection->prepare($sql);
		$statement->bindParam(':dni', $dni, PDO::PARAM_STR);
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
					<th>#</th>
					<th>dni</th>
					<th>apellido</th>
				</tr>
			</thead>
			<tbody>
	<?php foreach ($result as $row) { ?>
			<tr>
				<td><?php echo escape($row["dni"]); ?></td>
				<td><?php echo escape($row["apellido"]); ?></td>
			</tr>
		<?php } ?> 
			</tbody>
	</table>
	<?php } else { ?>
		<blockquote>No results found for <?php echo escape($_POST['dni']); ?>.</blockquote>
	<?php } 
} ?> 

<h2>Find user based on location</h2>

<form method="post">
	<label for="dni">DNI</label>
	<input type="text" id="dni" name="dni">
	<input type="submit" name="submit" value="View Results">
</form>

<a href="index_ap_V1.0.php">Back to home</a>

<?php require "templates/footer.php"; ?>
