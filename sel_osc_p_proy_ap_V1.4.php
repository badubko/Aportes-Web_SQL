<?php

/**
 * 
 * Buscar OSC por Nombre aproximado
 * Con estado = En_Actividad o = En_Conversacion (?)
 * Se seleccionara OSC y se pasara a buscar los proyectos
 * de esa OSC
 * 
 */

if (isset($_POST['submit'])) {
	try {	
		require "./config_ap_V1.4.php";
		require "./common_ap_V1.4.php";

		$connection = new PDO($dsn, $username, $password, $options);

		$sql = "SELECT
						t_osc.osc_nombre, t_osc.osc_estado
				FROM    t_osc
				WHERE ((osc_nombre LIKE :osc)  AND 
						( (osc_estado = 'En_Actividad') OR  (osc_estado = 'En_Conversacion'))
						) ORDER BY osc_nombre;" ;
						
		$osc = $_POST['osc'];				
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
}
?>
<?php require "templates/header.php"; ?>
		
<?php  
if (isset($_POST['submit'])) {
	if ($result && $statement->rowCount() > 0) { ?>
		<h3><?php echo "Asignacion de Vol: " , escape($apellido) , ", " , escape($nombres); ?></h3>
		<h3>Buscar OSC por nombre aproximado</h3>
		<h3>para buscar sus Proyectos</h3>
		<h3>Resultados para osc_estado (= En_Actividad o = En_Conversacion)</h3>
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
				<td><a href="busc_proy_osc_ap_<?php echo escape($vers);?>.php
				?dni=<?php echo escape($dni); ?>
				&apellido=<?php echo escape ($apellido); ?>
				&nombres=<?php echo escape($nombres); ?>
				&osc=<?php echo escape($row["osc_nombre"]); ?>
				">P/Asignar Vol</a></td>
		
			</tr>
		<?php } ?> 
			</tbody>
	</table>
	<?php } else { ?>
<!--
		<blockquote>No se encontro ninguna OSC: <?php echo escape($_POST['osc']); ?>  con proyectos para asignar Vol.</blockquote>
-->
		<blockquote><?php echo "No se encontro ninguna OSC: " , escape($_POST['osc']) , " , con proyectos para asignar Vol." ; ?></blockquote>
	<?php } ?>

<a href="index_ap_<?php echo escape($vers);?>.php">Back to home</a>
<?php
require "templates/footer.php"; 
exit;	
} ?> 

<!--
    Aca comenzamos...
-->
<?php  	require "./config_ap_V1.4.php";
		require "./common_ap_V1.4.php";?>
		
<h3><?php echo "Asignacion de Vol: " , escape($_GET['apellido']) , ", " , escape($_GET['nombres']); ?></h3>
<h3>Buscar OSC por nombre aproximado</h3>
<h3>para buscar sus proyectos</h3>

<form method="post">
	<label for="osc">OSC (A%  %A%  %)</label>
	<input type="text" id="osc" name="osc">
	<input type="submit" name="submit" value="Buscar">
</form>



<a href="index_ap_<?php echo escape($vers);?>.php">Back to home</a>

<?php require "templates/footer.php"; ?>
