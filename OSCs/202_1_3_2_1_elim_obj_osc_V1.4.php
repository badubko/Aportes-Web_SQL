<?php

/**
 * Eliminar un objetivo de una OSC
 */

  require "../config_ap_V1.4.php";
  require "../common_ap_V1.4.php";

if (isset($_GET["osc_nombre"])) {
  try {
    $connection = new PDO($dsn, $username, $password, $options);
  
    $osc_nombre = $_GET["osc_nombre"];
    $osc_objetivo = $_GET["osc_objetivo"];
// Limitamos a un solo objetivo para el caso de que haya duplicados.  
    $sql = "DELETE FROM t_osc_objetivos WHERE osc_nombre = :osc_nombre AND osc_objetivo = :osc_objetivo LIMIT 1";

    $statement = $connection->prepare($sql);
    $statement->bindValue(':osc_nombre', $osc_nombre);
    $statement->bindValue(':osc_objetivo', $osc_objetivo);
    $statement->execute();

    $success = "OSC $osc_nombre : Se elimino el objetivo $osc_objetivo";
    		
  } catch(PDOException $error) {
    echo $sql . "<br>" . $error->getMessage();
  }
}
?>

<?php require "../templates/header_osc.php"; ?>
        
<h2>Eliminar Objetivo OSC</h2>

<?php if ($success) echo $success ; ?><br><br>
<a href="202_1_3_admin_obj_osc_<?php echo escape($vers);?>.php
				?osc_nombre=<?php echo escape($osc_nombre); ?>
				&osc_objetivo=<?php echo escape($osc_objetivo); ?>
				">Volver a listar Objetivos</a><br><br>
<a href="202_1_admin_osc_<?php echo escape($vers);?>.php?osc_nombre=<?php echo escape($osc_nombre); ?>
        ">Menu Administrar OSC</a><br> 				
<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>


<?php require "../templates/footer_osc.php"; ?>
