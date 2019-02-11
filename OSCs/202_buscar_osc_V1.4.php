<?php

/**
 * 
 * Buscar OSC por Nombre aproximado
 * Con estado = CUALQUIERA (?)
 * Se seleccionara OSC para agregar otros datos
 * o para actualizarlos
 * 
 */

if (isset($_POST['submit'])) {
	try {	
		require "../config_ap_V1.4.php";
		require "../common_ap_V1.4.php";

		$connection = new PDO($dsn, $username, $password, $options);

		$sql = "SELECT
						t_osc.osc_nombre, t_osc.osc_estado
				FROM    t_osc
				WHERE 	osc_nombre LIKE :osc  ;" ;
						
		$osc = $_POST['osc'];				

		$statement = $connection->prepare($sql);
		$statement->bindParam(':osc', $osc, PDO::PARAM_STR);
		$statement->execute();

		$result = $statement->fetchAll();
	} catch(PDOException $error) {
		echo $sql . "<br>" . $error->getMessage();
													}
}
?>
<?php require "../templates/header_osc.php"; ?>
		
<?php  
if (isset($_POST['submit'])) {
	if ($result && $statement->rowCount() > 0) { ?>

		<h3>Buscar OSC por nombre aproximado</h3>

		<a href="index_ap_<?php echo escape($vers);?>.php">Back to home</a>
		<table>
			<thead>
				<tr>
					<th>OSC</th>
					<th>Estado</th>
					<th>Elegir OSC</th>
				</tr>
			</thead>
			<tbody>
	<?php foreach ($result as $row) { ?>
			<tr>
				<td><?php echo escape($row["osc_nombre"]); ?></td>
				<td><?php echo escape($row["osc_estado"]); ?></td>		
				<td><a href="202_1_admin_osc_<?php echo escape($vers);?>.php
				?osc=<?php echo escape($row["osc_nombre"]); ?>
				">Administrar datos OSC</a></td>
			</tr>
		<?php } ?> 
			</tbody>
	</table>
	<?php } else { ?>
<!--
		<blockquote>No se encontro ninguna OSC: <?php echo escape($_POST['osc']); ?>  con proyectos para asignar Vol.</blockquote>
-->
		<blockquote><?php echo "No se encontro ninguna OSC: " , escape($_POST['osc']) ;?></blockquote>
	<?php } ?>

<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>
<?php
require "../templates/footer_osc.php"; 
exit;	
} ?> 

<!--
    Aca comenzamos...
-->
<?php  	require "../config_ap_V1.4.php";
		require "../common_ap_V1.4.php";?>
		

<h3>Buscar OSC por nombre aproximado</h3>
<h3>para para agregar o actualizar datos</h3>

<form method="post">
	<label for="osc">OSC (A%  %A%  %)</label>
	<input type="text" id="osc" name="osc">
	<input type="submit" name="submit" value="Buscar">
</form>



<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>

<?php require "../templates/footer_osc.php"; ?>
