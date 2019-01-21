<?php
 require "./config_ap_V1.4.php";
 require "./common_ap_V1.4.php";

if (isset($_POST['submit'])) {
   

try {
	
	$connection = new PDO($dsn, $username, $password, $options);
	$dni = $_GET['dni'];
	$apellido = $_GET['apellido'];
	$nombres = $_GET['nombres'];
    $estado = $_POST['estado'];
    $consideraciones = $_POST['consideraciones'];
    
    // set the PDO error mode to exception
    $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // prepare sql and bind parameters
    $stmt = $connection->prepare(" INSERT INTO t_logs_estado_user (dni, estado, consideraciones) VALUES (:dni, :estado, :consideraciones)");
    $stmt->bindParam(':dni', $dni);
    $stmt->bindParam(':estado', $estado);
    $stmt->bindParam(':consideraciones', $consideraciones);
    // insertar nueva especialidad

    $stmt->execute();
    // $result = $stmt->fetchAll();
    $e = "";
    
    } catch(PDOException $e)
		{  echo "Error: " . "<br>" . $e->getMessage() . "<br>" . "No se pudo modificar estado a: $estado" ;    }

}
?>

<?php if (isset($_POST['submit']) && $stmt && !$e ) { ?>
    <blockquote>Agregado nuevo estado: <?php echo $_POST['estado']; ?> </blockquote>
<?php } ?>

<h2>Modicar estado de VOL V1.4</h2>
<!--
<form method="post" action="">
	<select name=especialidad[] multiple>
        <option value="Sistemas"> Sistemas </option>
        <option value="Comercial">  Comercial </option>
    </select>
	<label for="especialdad">Especialdad</label> 
	<input type="text" name="especialidad" id="especialidad"> 
	<input type="submit" name="submit" value="Submit">
</form>
-->

<?php
// Listado de estados posibles a los que se puede pasar desde 
// estado != Asignado o estado != De_Baja


//try {
  //require "./config_ap_V1.4.php";
  

  //$conn_esp = new PDO($dsn, $username, $password, $options);
  
  //$sql_esp = "SELECT especialidad  FROM t_especialidades ORDER BY especialidad";

  //$stat_esp = $conn_esp->prepare($sql_esp);
  
  //$stat_esp->execute();

  //$a_espec = $stat_esp->fetchAll();
//} catch(PDOException $error) {
  //echo $sql_esp . "<br>" . $error->getMessage();
//}         

// 
//$esp1 = "Contable";
//$esp2 = "Diagnostico";
//$esp3 = "Procesos";
//$esp4 = "Sistemas";
//
?>

<?php
 $a_estados_pos = array( "Disponible" , "Con Restricc" , 
					"Puntual" , "ND_Temp" , "De_Baja");
?>

<form method="post" action="">
<p>
	<label for="estado">Nvo Estado</label> 
	<select name="estado">
	<option value="">Seleccione...</option>
	<?php foreach ($a_estados_pos as $est_pos) { ?>
		<option value="<?php echo $est_pos; ?>"><?php echo $est_pos; ?></option>
	<?php } ?>
	<label for="consideraciones">Consideraciones</label>
	<input type="text" name="consideraciones" id="consideraciones">
<!--
    
	<option value="<?php echo escape($esp1); ?>"><?php echo escape($esp1); ?></option>
	<option value="<?php echo escape($esp2); ?>"><?php echo escape($esp2); ?></option>
	<option value="<?php echo escape($esp3); ?>"><?php echo escape($esp3); ?></option>
	<option value="<?php echo escape($esp4); ?>"><?php echo escape($esp4); ?></option>
-->
	
	</select>
		<input type="submit" name="submit" value="Guardar">
</p>
</form>

<?php
	$dni = $_GET['dni'];
	$apellido = $_GET['apellido'];
	$nombres = $_GET['nombres'];
?>

<a href="listar-esp_ap_<?php echo escape($vers);?>.php?dni=<?php echo escape($dni); ?>
        &apellido=<?php echo escape($apellido); ?>
        &nombres=<?php echo escape($nombres); ?>
        ">Listar Esp VOL</a>
<a href="index_ap_<?php echo escape($vers);?>.php">Back to home</a>

<?php require "templates/footer.php"; ?>


