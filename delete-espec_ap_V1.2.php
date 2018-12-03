<?php

/**
 * Delete a user
 */

  require "./config_ap_V1.2.php";
  require "./common_ap_V1.2.php";

if (isset($_GET["dni"])) {
  try {
    $connection = new PDO($dsn, $username, $password, $options);
  
    $dni = $_GET["dni"];
    $especialidad = $_GET["especialidad"];

    $sql = "DELETE FROM t_especialidad_user WHERE dni = :dni AND especialidad = :especialidad ";

    $statement = $connection->prepare($sql);
    $statement->bindValue(':dni', $dni);
    $statement->bindValue(':especialidad', $especialidad);
    $statement->execute();

    $success = "Especialidad successfully deleted";
  } catch(PDOException $error) {
    echo $sql . "<br>" . $error->getMessage();
  }
}
?>

<?php require "templates/header.php"; ?>
        
<h2>Delete especialidad</h2>

<?php if ($success) echo $success , "\n"; ?>

<a href="read_ap_V1.2.php">Back to Act Vol</a>

<?php require "templates/footer.php"; ?>
