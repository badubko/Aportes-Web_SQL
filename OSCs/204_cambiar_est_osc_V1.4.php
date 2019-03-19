
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

		<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a><br><br>
		
		<style>
		table, th, td {
		border: 1px solid black; }
		</style>
		
		<table>
			<thead>
				<tr>
					<th>OSC</th>
					<th>Estado Actual</th>
					<th>Nuevo Estado</th>
				</tr>
			</thead>
			
			<tbody>
			  <tr>
				<td><?php echo escape($_GET['osc_nombre']); ?></td>
				<td><?php echo escape($_GET['osc_estado']); ?></td>	
				<td>
				<p>
					<label for="estado">Nuevo Estado</label> 
					<select name="estado">
					<option value="">Seleccione...</option>
					<?php foreach ($result as $est_pos) { ?>
						<option value="<?php echo $est_pos["osc_estado_proximo"]; ?>"><?php echo $est_pos["osc_estado_proximo"]; ?></option>
					<?php } ?>
					</select>
				</p>
				</td>
 		
			</tr>
			</tbody>
		</table>
		
<?php exit; ?>		
