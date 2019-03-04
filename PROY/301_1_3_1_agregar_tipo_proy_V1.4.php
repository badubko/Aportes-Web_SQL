<?php

// Agregar especificacion de tipos a un proyecto

 require "../config_ap_V1.4.php";
 require "../common_ap_V1.4.php";

if (isset($_POST['submit'])) {
   

try {
	
	$connection = new PDO($dsn, $username, $password, $options);
	$osc_nombre = $_GET['osc_nombre'];
	$p_num_corr_proy = $_GET['p_num_corr_proy'];
	$p_nombre_proy = $_GET['p_nombre_proy'];
    $p_tipo_proy = $_POST['p_tipo_proy'];
    
    if ($p_tipo_proy == "") {
		echo "Seleccione especificacion de tipo". "<br>" ; ?>
		<a href="202_1_3_1_1_agreg_obj_osc_V1.4.php?dni=<?php echo escape($osc_nombre); ?>
        &osc_nombre=<?php echo escape($osc_nombre); ?>
        ">Agregar Nueva Objetivo</a>
	<?php	exit; }
    
    // set the PDO error mode to exception
    $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // prepare sql and bind parameters
    $stmt = $connection->prepare(" INSERT INTO t_p_logs_tipo_proy (p_num_corr_proy, p_tipo_proy) VALUES (:p_num_corr_proy, :p_tipo_proy)");
    $stmt->bindParam(':p_num_corr_proy', $p_num_corr_proy);
    $stmt->bindParam(':p_tipo_proy', $p_tipo_proy);
   
    // insertar nueva especificacion de tipo de proyecto

    $stmt->execute();
    // $result = $stmt->fetchAll();
    $e = "";
    
    } catch(PDOException $e)
		{  echo "Error: " . "<br>" . $e->getMessage() . "<br>" . "No se pudo agregar tipo de proyecto: $p_tipo_proy" ;    }

}
?>

<?php if (isset($_POST['submit']) && $stmt && !$e ) { ?>
    <blockquote>Agregado tipo de proyecto: <?php echo $_POST['p_tipo_proy']; ?> </blockquote>
<?php } ?>

<h2>Agregar especificacion de tipo de proyecto </h2>
<h3>Al proyecto: <?php echo escape($_GET["p_num_corr_proy"]); ?></h3>

<?php

try {
	
	// Obtener la lista de las posibles especificaciones de tipo de proyecto
  require "../config_ap_V1.4.php";
  

  $conn_tipo = new PDO($dsn, $username, $password, $options);
  
  $sql_tipo = "SELECT p_tipo_proy  FROM t_p_tipo_proy ORDER BY p_tipo_proy";

  $stat_tipo = $conn_tipo->prepare($sql_tipo);
  
  $stat_tipo->execute();

  $a_tipo = $stat_tipo->fetchAll();
} catch(PDOException $error) {
  echo $sql_tipo . "<br>" . $error->getMessage();
}         


?>

<form method="post" action="">
<p>
	<label for="p_tipo_proy">Tipo PROY</label> 
	<select name="p_tipo_proy">
	<option value=""selected hidden>Seleccione...</option>
	<?php foreach ($a_tipo as $tipo) { ?>
		<option value="<?php echo $tipo["p_tipo_proy"]; ?>"><?php echo $tipo["p_tipo_proy"]; ?></option>
	<?php } ?>
	</select>
	<input type="submit" name="submit" value="Guardar">
</p>
</form>

<?php
	$p_num_corr_proy = $_GET['p_num_corr_proy'];
?>


<a href="./301_1_3_lista_tipos_proy_<?php echo escape($vers);?>.php?osc_nombre=<?php echo escape($_GET['osc_nombre']); ?>
				&p_num_corr_proy=<?php echo escape($_GET['p_num_corr_proy']); ?>
				&p_nombre_proy=<?php echo escape($_GET['p_nombre_proy']); ?>">Listar especific de tipo para este PROY</a>

<br><br>   
     


<?php require "../templates/footer_proy.php"; ?>


