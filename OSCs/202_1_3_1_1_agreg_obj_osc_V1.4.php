<?php

// Agregar Objetivos de OSC

 require "../config_ap_V1.4.php";
 require "../common_ap_V1.4.php";

if (isset($_POST['submit'])) {
   

try {
	
	$connection = new PDO($dsn, $username, $password, $options);
	$osc_nombre = $_GET['osc_nombre'];
	$osc_objetivo = $_POST['osc_objetivo'];
    
    if ($osc_objetivo == "") {
		echo "Seleccione un objetivo". "<br>" ; ?>
		<a href="202_1_3_1_1_agreg_obj_osc_V1.4.php?dni=<?php echo escape($osc_nombre); ?>
        &osc_nombre=<?php echo escape($osc_nombre); ?>
        ">Agregar Nuevo Objetivo</a>
	<?php	exit; }
    
    // set the PDO error mode to exception
    $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // prepare sql and bind parameters
    $stmt = $connection->prepare(" INSERT INTO t_osc_objetivos (osc_nombre, osc_objetivo) VALUES (:osc_nombre, :osc_objetivo)");
    $stmt->bindParam(':osc_nombre', $osc_nombre);
    $stmt->bindParam(':osc_objetivo', $osc_objetivo);
   
    // insertar nuevo objetivo

    $stmt->execute();
    // $result = $stmt->fetchAll();
    $e = "";
    
    } catch(PDOException $e)
		{  echo "Error: " . "<br>" . $e->getMessage() . "<br>" . "No se pudo agregar Objetivo: $osc_objetivo" ;    }

}
?>

<?php if (isset($_POST['submit']) && $stmt && !$e ) { ?>
    <blockquote>Agregado Objetivo: <?php echo $_POST['osc_objetivo']; ?> </blockquote>
<?php } ?>

<h2>Agregar Objetivo de OSC: </h2>
<h3><?php echo escape($_GET["osc_nombre"]); ?></h3>

<?php

try {
	
	// Obtener la lista de los posibles objetivos de un OSC
  require "../config_ap_V1.4.php";
  

  $conn_obj = new PDO($dsn, $username, $password, $options);
  
  $sql_obj = "SELECT osc_objetivo  FROM t_osc_lista_objetivos ORDER BY osc_objetivo";

  $stat_obj = $conn_obj->prepare($sql_obj);
  
  $stat_obj->execute();

  $a_obj = $stat_obj->fetchAll();
} catch(PDOException $error) {
  echo $sql_obj . "<br>" . $error->getMessage();
}         


?>

<form method="post" action="">
<p>
	<label for="osc_objetivo">Objetivo OSC</label> 
	<select name="osc_objetivo">
	<option value=""selected hidden>Seleccione...</option>
	<?php foreach ($a_obj as $obj) { ?>
		<option value="<?php echo $obj["osc_objetivo"]; ?>"><?php echo $obj["osc_objetivo"]; ?></option>
	<?php } ?>
	</select>
	<input type="submit" name="submit" value="Guardar">
</p>
</form>

<?php
	$osc_nombre = $_GET['osc_nombre'];
?>

<a href="202_1_3_admin_obj_osc_<?php echo escape($vers);?>.php?osc_nombre=<?php echo escape($osc_nombre); ?>
        ">Listar Objetivos de OSC</a><br><br>
        
<a href="202_1_admin_osc_<?php echo escape($vers);?>.php?osc_nombre=<?php echo escape($osc_nombre); ?>
        ">Menu Administrar OSC</a><br>       
<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>

<?php require "../templates/footer_osc.php"; ?>


