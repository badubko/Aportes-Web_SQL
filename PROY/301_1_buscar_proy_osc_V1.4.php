
<head>
<link rel="stylesheet" reference="text/css" href="../css/style.css" >
</head>


<?php

/**
 * 
 * Buscar los proyectos de una OSC 
 * para ver detalles de un proyecto en particular
 * o crear un nuevo proyecto
 */

	try {	
		require "../config_ap_V1.4.php";
		require "../common_ap_V1.4.php";

		$connection = new PDO($dsn, $username, $password, $options);


		//$sql = "SELECT p_num_corr_proy, osc_nombre, p_nombre_proy , p_ultimo_estado FROM t_proyectos 
				//where osc_nombre LIKE :osc_nombre AND 
				//((p_ultimo_estado = 'Pre-Proyecto' ) OR (p_ultimo_estado = 'En_Ejecucion') )";
// Elegimos todos los proyectos para poder asignar correctamente el nombre 

		$sql = "SELECT p_num_corr_proy, osc_nombre, p_nombre_proy , p_ultimo_estado FROM t_proyectos 
				where osc_nombre LIKE :osc_nombre ORDER BY p_num_corr_proy";
				
		

						
		$osc_nombre = $_GET['osc_nombre'];				


		$statement = $connection->prepare($sql);
		$statement->bindParam(':osc_nombre', $osc_nombre, PDO::PARAM_STR);
		$statement->execute();

		$result = $statement->fetchAll();
	} catch(PDOException $error) {
		echo $sql . "<br>" . $error->getMessage();
													}

 require "../templates/header_proy.php"; 
 require "../verificar_asign_V1.4.php";		

	if ($result && $statement->rowCount() > 0) { ?>

		
		<h3><?php echo "Proyectos de OSC: " , escape($_GET['osc_nombre']) ; ?></h3>

<!--
		<a href="index_ap_<?php echo escape($vers);?>.php">Back to home</a>
-->
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
	<?php foreach ($result as $row) { ?>
			<tr>
				<td><?php echo escape($row["osc_nombre"]); ?></td>
				<td><?php echo escape($row["p_num_corr_proy"]); ?></td>
				<td><?php echo escape($row["p_nombre_proy"]); ?></td>
				<td><?php echo escape($row["p_ultimo_estado"]); ?></td>

			</tr>
		<?php } ?> 
			</tbody>
	</table>
	<?php } else { ?>
		<blockquote>No se encontraron proyectos para la OSC:  <?php echo escape($_GET["osc_nombre"]); ?>.</blockquote>
	<?php } ?>

<?php 
try {
$sql_np="SELECT p_num_corr_proy  FROM t_proyectos 
				WHERE p_num_corr_proy > 0  ORDER BY p_num_corr_proy DESC LIMIT 1";

		$stat_np = $connection->prepare($sql_np);
		
		$stat_np->execute();

		$res_np = $stat_np->fetchAll();

}catch(PDOException $error) {
		echo $sql_np . "<br>" . $error->getMessage();
		exit;
												}
												
foreach ($res_np as $row_np) { ?>
<br>
<form action="./301_1_1_alta_proy_<?php echo escape($vers);?>.php" method="post">
<table>
	<thead>
				<tr>
					<th>OSC</th>
					<th>Nuevo Numero Proy</th>
					<th>Nuevo Nombre Proy</th>
				</tr>
	</thead>
	
	<tbody>
<!--
		<td><?php echo escape($row["osc_nombre"]); ?></td>
-->
		<td> <input type="text" id="osc_nombre" name="osc_nombre" value="<?php echo escape($_GET["osc_nombre"]); ?>" <?php echo ( 'readonly' ); ?> ></td>
		<td> <input type="text" id="p_num_corr_proy" name="p_num_corr_proy" value=<?php echo  escape ($row_np["p_num_corr_proy"] + 1 ) ; ?>  > </td>
		<td> <input type="text" id="p_nombre_proy" name="p_nombre_proy"> </td>
	</tbody>
</table>
<input type="submit" name="submit" value="Crear">
</form>



<?php
}	
?>


<?php
require "../templates/footer_proy.php"; 
exit;	
?> 

<!--
    Aca comenzamos...
-->
<?php  	require "../config_ap_V1.4.php";
		require "../common_ap_V1.4.php";?>
		


<?php require "../templates/footer_proy.php"; ?>
