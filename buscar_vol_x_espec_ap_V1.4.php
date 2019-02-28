<?php

/**
 * Function to query information based on 
 * a parameter: in this case, apellido.
 *
 */

if (isset($_POST['submit'])) {
	try {	
		require "./config_ap_V1.4.php";
		require "./common_ap_V1.4.php";

		$connection = new PDO($dsn, $username, $password, $options);

		$sql = "SELECT dni , apellido  , nombres , rol, estado , email_1 , tel_1	FROM us1_us2
						WHERE (		   rol = 'Vol'  
									OR rol = 'VC' 
									OR rol = 'DC')
						and (		estado= 'Disponible' 
								OR 	estado= 'Asignado' 
								OR 	estado= 'Con_Restricc' 
								OR estado=  'ND_Temp' 
								OR estado=  'Puntual'  )
						and dni 
						IN (SELECT dni from t_especialidad_user 
						WHERE especialidad = :especialidad ) ORDER By estado, apellido; " ;

		$especialidad = $_POST['especialidad'];

		$statement = $connection->prepare($sql);
		$statement->bindParam(':especialidad', $especialidad, PDO::PARAM_STR);
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
		<h3>Voluntarias/os con especialidad: <?php echo escape($especialidad); ?></h3>
		<h3>para ASIGNAR a un Proyecto</h3>

		<a href="index_ap_V1.4.php">Back to home</a>
		<table>
			<thead>
				<tr>
					<th>DNI</th>
					<th>Apellido</th>
					<th>Nombres</th>
					<th>Rol</th>
					<th>Estado</th>
					<th>email_1</th>
					<th>Tel 1</th>
					<th>Seleccionar</th>
					
					<th>Espec.</th>
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
				<td><?php echo escape($row["email_1"]); ?></td>
				<td><?php echo escape($row["tel_1"]); ?></td>
				
<!--
				<td><a href="update-single_ap_<?php echo escape($vers);?>.php?dni=<?php echo escape($row["dni"]); ?>">PUB VOL</a></td>
				
				<td><a href="create_restr_ap_<?php echo escape($vers);?>.php?dni=<?php echo escape($row["dni"]); ?>
				&apellido=<?php echo escape($row["apellido"]); ?>
				&nombres=<?php echo escape($row["nombres"]); ?>
				">RESTR VOL</a></td>
				
				<td><a href="update-single_restr_ap_<?php echo escape($vers);?>.php?dni=<?php echo escape($row["dni"]); ?>
				&apellido=<?php echo escape($row["apellido"]); ?>
				&nombres=<?php echo escape($row["nombres"]); ?>
				">RESTR VOL</a></td>
-->
				<td><a href="sel_osc_p_proy_ap_<?php echo escape($vers);?>.php
				?dni=<?php echo escape($row["dni"]); ?>
				&apellido=<?php echo escape($row["apellido"]); ?>
				&nombres=<?php echo escape($row["nombres"]); ?>
				&est_act=<?php echo escape($row["estado"]); ?>
				">P/Asignar</a></td>
				<td><a href="listar-esp_ap_<?php echo escape($vers);?>.php?dni=<?php echo escape($row["dni"]); ?>
				&apellido=<?php echo escape($row["apellido"]); ?>
				&nombres=<?php echo escape($row["nombres"]); ?>
				">Ver Todas</a></td>
			</tr>
		<?php } ?> 
			</tbody>
	</table>
	<a href="index_ap_<?php echo escape($vers);?>.php">Back to home</a>
	<?php require "templates/footer.php"; ?>
	<?php } else { ?>
		<blockquote>No se encontraron resultados. Ingrese una especialidad </blockquote>
		<a href="index_ap_<?php echo escape($vers);?>.php">Back to home</a>
	<?php } 
exit;	
} ?> 





<h3>Buscar Voluntario por especialidad</h3>
<h3>con estados: Disponible | Asignado | Con_Restricc | Puntual </h3>
<h3>para ASIGNAR a un Proyecto</h3>

<form method="post" action="">
<?php	
// Buscar las especialidades posibles
try {
  require "./config_ap_V1.4.php";
  $conn_esp = new PDO($dsn, $username, $password, $options);
  $sql_esp = "SELECT especialidad  FROM t_especialidades ORDER BY especialidad";
  $stat_esp = $conn_esp->prepare($sql_esp);
  $stat_esp->execute();
  $a_espec = $stat_esp->fetchAll();
} catch(PDOException $error) {
  echo $sql_esp . "<br>" . $error->getMessage();
  exit;
}      
?>

<p>
	<label for="especialdad">Especialdad</label> 
	<select name="especialidad">
<!--
	<option value="">Seleccione...</option>
-->
	<option value="" selected hidden>Seleccione...</option>
	<?php foreach ($a_espec as $espe) { ?>
		<option value="<?php echo $espe["especialidad"]; ?>"><?php echo $espe["especialidad"]; ?></option>
	<?php } ?>
	</select>
	<input type="submit" name="submit" value="Buscar">
</p>
</form>

<?php  	require "./config_ap_V1.4.php";
		require "./common_ap_V1.4.php";
		
		
		
?>

<a href="index_ap_<?php echo escape($vers);?>.php">Back to home</a>

<?php require "templates/footer.php"; ?>
