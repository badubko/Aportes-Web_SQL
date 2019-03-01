<?php

/**
 * Delete a user
 */

  require "../config_ap_V1.4.php";
  require "../common_ap_V1.4.php";

if (isset($_GET["dni"])) {
  try {
    $connection = new PDO($dsn, $username, $password, $options);
  
    $dni = $_GET["dni"];
    $especialidad = $_GET["especialidad"];
  $apellido = $_GET["apellido"];
  $nombres = $_GET["nombres"];
    $sql = "DELETE FROM t_especialidad_user WHERE dni = :dni AND especialidad = :especialidad LIMIT 1";

    $statement = $connection->prepare($sql);
    $statement->bindValue(':dni', $dni);
    $statement->bindValue(':especialidad', $especialidad);
    $statement->execute();

    $success = "Especialidad: $especialidad  Eliminada <br><br>";
    		
  } catch(PDOException $error) {
    echo $sql . "<br>" . $error->getMessage();
  }
}
?>

<?php require "../templates/header_vol.php"; ?>
        
<h2>Delete especialidad</h2>

<?php if ($success) echo $success , "\n"; ?>
<a href="102_2_4_listar-esp_ap_<?php echo escape($vers);?>.php?dni=<?php echo escape($dni); ?>
				&apellido=<?php echo escape($apellido); ?>
				&nombres=<?php echo escape($nombres); ?>
				">Listar Esp VOL</a>
<a href="102_read_ap_<?php echo escape($vers);?>.php">Back to Act Vol</a>

<?php require "../templates/footer_vol.php"; ?>
