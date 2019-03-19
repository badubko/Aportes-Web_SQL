
<head>
<link rel="stylesheet" reference="text/css" href="../css/style.css" >
</head>



<?php

/**
 * Cambiar el estado de una OSC
 * Se ṕueden elegir solo los estados permitidos
 * Tal como se define en la tabla 
 * t_osc_cambios_estado
 *
 */

if (isset($_POST['submit_est'])) {
	try {	
		require "../config_ap_V1.4.php";
		

		$connection = new PDO($dsn, $username, $password, $options);
   
        $osc_nombre = $_GET['osc_nombre'];
		$osc_estado = $_GET['osc_estado'];
		$osc_coment_estado = $_POST['osc_coment_estado'];
		// dni del DP viene del config por ahora hardcoded.
		$dni = $dni_dp;
		
		$connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

		// prepare sql and bind parameters
		$stmt = $connection->prepare(" INSERT INTO t_logs_estado_user (dni, estado, consideraciones) VALUES (:dni, :estado, :consideraciones)");
    $stmt->bindParam(':dni', $dni);
    $stmt->bindParam(':estado', $estado);
    $stmt->bindParam(':consideraciones', $consideraciones);
    
    // insertar nuevo estado

    $stmt->execute();
    // $result = $stmt->fetchAll();
    $e = "";

			
			$sql = "SELECT dni, apellido, nombres, rol, estado FROM us1_us2 WHERE 
					  (apellido LIKE :apellido) AND
					 ((estado != 'De_Baja') AND (estado != 'Asignado' )) AND 
					 ((rol = 'Vol' ) OR (rol = 'VC') OR (rol = 'DC')) 
						ORDER BY apellido, nombres;" ;				
							
							
		$apellido = $_POST['apellido'];

		$statement = $connection->prepare($sql);
		$statement->bindParam(':apellido', $apellido, PDO::PARAM_STR);
		$statement->execute();

		$result = $statement->fetchAll();
	} catch(PDOException $error) {
		echo $sql . "<br>" . $error->getMessage();
													}
}


// Buscamos los estados posibles a partir del estado actual
try {	
		require "../config_ap_V1.4.php";
		require "../common_ap_V1.4.php";
         
         
        $osc_estado = $_GET['osc_estado']; 
        $osc_nombre = $_GET['osc_nombre'];	
        
		$connection = new PDO($dsn, $username, $password, $options);

		$sql = "SELECT
						osc_estado_proximo
				FROM    t_osc_cambios_estado
				WHERE 	osc_estado_actual = :osc_estado  ;" ;
						
	
		$statement = $connection->prepare($sql);
		$statement->bindParam(':osc_estado', $osc_estado, PDO::PARAM_STR);
		$statement->execute();

		$result = $statement->fetchAll();
	} catch(PDOException $error) {
		echo $sql . "<br>" . $error->getMessage() ."<br>" . "Error imposible" ."<br>"  ;
													}

?>

<h3>Elegir un Nuevo estado para la OSC</h3>
<h4>(Algunos estados son automaticos y no se pueden cambiar aqui)</h4>


		
		
		<style>
		table, th, td {
		border: 1px solid black; }
		</style>
		
<form method="post">		
		<table>
			<thead>
				<tr>
					<th>OSC</th>
					<th>Estado Actual</th>
					<th>Nuevo Estado</th>
					<th>Comentario sobre cambio de estado</th>
					<th>Acción</th>
				</tr>
			</thead>
			
			<tbody>
			  <tr>
				<td><?php echo escape($_GET['osc_nombre']); ?></td>
				<td><?php echo escape($_GET['osc_estado']); ?></td>	
				<td>
				<p>
<!--
					<label for="estado">Nuevo Estado</label> 
-->
					<select name="estado">
					<option value="">Seleccione...</option>
					<?php foreach ($result as $est_pos) { ?>
						<option value="<?php echo $est_pos["osc_estado_proximo"]; ?>"><?php echo $est_pos["osc_estado_proximo"]; ?></option>
					<?php } ?>
					</select>
				</p>
				</td>
<!--
				<label for="consideraciones">Consideraciones</label>
-->
				<td><input type="text" name="osc_coment_estado" id="osc_coment_estado"></td>
				<td><input type="submit" name="submit_est" value="Guardar"></td>
			</tr>
			</tbody>
		</table>
		
</form>		
<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a><br><br>		
<?php exit; ?>		
