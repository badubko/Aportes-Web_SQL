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

		$sql = "SELECT 	t_users1.dni, t_users1.apellido, t_users1.nombres
				FROM
					t_users1
				WHERE
						dni IN ( 
								SELECT dni
								FROM    t_users2
								WHERE   ( (rol = 'Vol' ) OR (rol = 'VC') ) AND dni IN
									( SELECT dni 
										FROM t_users2 
										WHERE ( (estado != 'De_Baja') AND (estado != 'Asignado' ) ) AND dni IN
										(SELECT dni
										FROM t_users1 
										WHERE apellido LIKE :apellido  ) 		     
						)
				 
                ) ORDER by apellido" ;

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
		<h3>Resultados para (estado != Asignado y estado != De_Baja)</h3>
		<a href="index_ap_V1.4.php">Back to home</a>
		<table>
			<thead>
				<tr>
					<th>dni</th>
					<th>apellido</th>
					<th>nombre</th>

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
				
				<?php
					try {	
						require "./config_ap_V1.4.php";
						$dni_estado = $row["dni"] ;
						$connection = new PDO($dsn, $username, $password, $options);
						$sql_estado = "SELECT 	estado FROM t_users2 WHERE dni = :dni_estado" ;
						$stat_estado = $connection->prepare($sql_estado);
						$stat_estado->bindParam(':dni_estado', $dni_estado, PDO::PARAM_STR);
						$stat_estado->execute();
						$result_estado = $stat_estado->fetchAll();
						} catch(PDOException $err_estado) {
						// echo $sql_estado . "<br>" . $err_estado->getMessage();
				?>
						<td>No Disponible</td>
						
														<?php	}
				?>
				<td><?php echo escape($result_estado); ?></td>
<!--				
				<td><?php echo escape($row["profesion"]); ?></td>
				<td><?php echo escape($row["email_1"]); ?></td>
				<td><?php echo escape($row["email_2"]); ?></td>
				<td><?php echo escape($row["last_update"]); ?></td>
				<td><a href="modif_est_vol_ap_<?php echo escape($vers);?>.php?dni=<?php echo escape($row["dni"]); ?>">Estado Vol</a></td>
-->
				<td><a href="modif_est_vol_ap_<?php echo escape($vers);?>.php?dni=<?php echo escape($row["dni"]); ?>
				&apellido=<?php echo escape($row["apellido"]); ?>
				&nombres=<?php echo escape($row["nombres"]); ?>
				">Estado VOL</a></td>
<!--				
				<td><a href="update-single_restr_ap_<?php echo escape($vers);?>.php?dni=<?php echo escape($row["dni"]); ?>
				&apellido=<?php echo escape($row["apellido"]); ?>
				&nombres=<?php echo escape($row["nombres"]); ?>
				">RESTR VOL</a></td>
				<td><a href="listar-esp_ap_<?php echo escape($vers);?>.php?dni=<?php echo escape($row["dni"]); ?>
				&apellido=<?php echo escape($row["apellido"]); ?>
				&nombres=<?php echo escape($row["nombres"]); ?>
				">Espec</a></td>
-->				
			</tr>
		<?php } ?> 
			</tbody>
	</table>
	<?php } else { ?>
		<blockquote>No se encontro ningun Vol con:  <?php echo escape($_POST['apellido']); ?>.</blockquote>
	<?php } 
} ?> 

<h3>Buscar Voluntario por apellido</h3>
<h3>Cambiar estado del Voluntario</h3>

<form method="post">
	<label for="apellido">Apellido (A%  %A%  %)</label>
	<input type="text" id="apellido" name="apellido">
	<input type="submit" name="submit" value="Buscar">
</form>

<a href="index_ap_V1.4.php">Back to home</a>

<?php require "templates/footer.php"; ?>
