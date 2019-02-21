<?php

/**
 * 
 * Buscar DC por apellido aproximado
 * En esta version, no incluimos la cant de OSCs que tiene
 * Presenta lista de DCs que permite seleccionar a uno
 * para listar sus OSCs 
 */

if (isset($_POST['submit'])) {
	try {	
		require "../config_ap_V1.4.php";
		require "../common_ap_V1.4.php";

		$connection = new PDO($dsn, $username, $password, $options);

		$sql = "SELECT
						dni, apellido, nombres, rol, tel_1, email_1,estado
				FROM    us1_us2
				WHERE
				apellido LIKE :apellido AND (estado !='Be_baja' AND estado != 'ND_Temp' ) AND (rol='VC' OR rol='DC')
				AND ( dni != :dni_tit_fict ) AND (dni != :dni_supl_fict )
				ORDER BY rol , apellido;" ;
        
		$apellido = $_POST['apellido'];
		
		$statement = $connection->prepare($sql);
		
		$statement->bindParam(':apellido', $apellido, PDO::PARAM_STR);
		$statement->bindParam(':dni_tit_fict', $dni_tit_fict, PDO::PARAM_STR);
		$statement->bindParam(':dni_supl_fict', $dni_supl_fict, PDO::PARAM_STR);
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
		<h3>Buscar DC por apellido para Listar sus OSCs</h3>
		
		<h4>Resultados para rol = DC o VC y estado != De_Baja y != ND_Temp </h4>
		<h4>(Excluye a los DCs/VCs "Ficticios")</h4>

<style>
table, th, td {
  border: 1px solid black;
}
</style>

		<table>
			<thead>
				<tr>
					<th>DNI</th>
					<th>Apellido</th>
					<th>Nombres</th>
					<th>Rol</th>
					<th>Telefono 1</th>
					<th>email 1</th>
					<th>Seleccionar</th>
				</tr>
			</thead>
			<tbody>
	<?php foreach ($result as $row): { ?>
			<tr>
				<td><?php echo escape($row["dni"]); ?></td>
				<td><?php echo escape($row["apellido"]); ?></td>
				<td><?php echo escape($row["nombres"]); ?></td>
				<td><?php echo escape($row["rol"]); ?></td>
				<td><?php echo escape($row["tel_1"]); ?></td>
				<td><?php echo escape($row["email_1"]); ?></td>

				<td><a href="203_1_lista_osc_x_dc_<?php echo escape($vers);?>.php
				?dni_dc=<?php echo escape($row["dni"]); ?>

				">p/Ver OSCs</a></td>
	
			</tr>
		<?php } 
		endforeach;?> 
			</tbody>
	</table><br><br>
	
	
	<?php } else { ?>
		<blockquote>No se encontro ningun DC con:  <?php echo escape($_POST['apellido']); ?>.</blockquote>
		<a href="<?php $_PHP_SELF ?>">Volver a Buscar</a><br><br>
	<?php } ?>
<br>
<a href="<?php $_PHP_SELF ?>">Buscar otro DC</a>
<br>
<a href="202_buscar_osc_<?php echo escape($vers);?>.php">Buscar otra OSC p/ Agregar o Actualizar datos</a>
<br>
<br>
<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>
<?php
require "../templates/footer_osc.php"; 
exit;	
} ?> 

<?php  	require "../config_ap_V1.4.php";
		require "../common_ap_V1.4.php";?>
		
<h3>Buscar DC por apellido</h3>
<h3>para Listar sus OSCs </h3>


<form method="post">

	<label for="apellido">Apellido (A%  %A%  %)</label>
	<input type="text" id="apellido" name="apellido">
	<input type="submit" name="submit" value="Buscar">
</form>


<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>

<?php require "../templates/footer_osc.php"; ?>

