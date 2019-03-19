
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
		require "../common_ap_V1.4.php";

		$connection = new PDO($dsn, $username, $password, $options);
   
        $osc_nombre = $_GET['osc_nombre'];
		$osc_estado = $_POST['estado_nuevo'];
		$osc_coment_estado = $_POST['osc_coment_estado'];
		// dni del DP viene del config por ahora hardcoded.
		$dni = $dni_dp;
		
		 $sql_est="INSERT INTO t_osc_logs_estado
		 (osc_nombre, osc_estado, dni, osc_coment_estado) VALUES (:osc_nombre, :osc_estado, :dni, :osc_coment_estado);";

		
		$connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

		// prepare sql and bind parameters
		
		$stmt = $connection->prepare($sql_est);
		$stmt->bindParam(':osc_nombre', $osc_nombre, PDO::PARAM_STR);
		$stmt->bindParam(':osc_estado', $osc_estado, PDO::PARAM_STR);
		$stmt->bindParam(':dni', $dni, PDO::PARAM_STR);
		$stmt->bindParam(':osc_coment_estado', $osc_coment_estado, PDO::PARAM_STR);
		// insertar nuevo estado

		$stmt->execute();
 
		$error = "";

	} catch(PDOException $error) {
		echo $sql_est . "<br>" . $error->getMessage();
													}
}

if (isset($_POST['submit_est']) && $stmt && !$error){ ?>
    <blockquote><?php echo $_GET['osc_nombre'] ?> Actualizada.</blockquote><br>
    <td><a href="200_OSCs_<?php echo escape($vers);?>.php">Menu Principal OSC</a></td><br>
    <td><a href="202_1_admin_osc_<?php echo escape($vers);?>.php?osc_nombre=<?php echo $_GET['osc_nombre']; ?>
				">Administrar OSC</a></td><br><br>
    <a href="../index_ap_V1.4.php">Back to home</a>
    
<?php 
require "../templates/footer_osc.php"; 
exit;
} ?>

<?php
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
					<select name="estado_nuevo">
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
