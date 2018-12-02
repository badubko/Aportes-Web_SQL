<?php

/**
 * List all users with a link to edit
 */

try {
  require "./config_ap_V1.2.php";
  require "./common_ap_V1.2.php";

  $connection = new PDO($dsn, $username, $password, $options);
  $dni = $_GET['dni'];
  $apellido = $_GET['apellido'];
  $nombres = $_GET['nombres'];
  $sql = "SELECT dni, especialidad , last_update FROM t_especialidad_user WHERE dni = :dni" ;

  $statement = $connection->prepare($sql);
  $statement->bindParam(':dni', $dni, PDO::PARAM_STR);
  $statement->execute();

  $result = $statement->fetchAll();
} catch(PDOException $error) {
  echo $sql . "<br>" . $error->getMessage();
}
?>
<?php require "templates/header.php"; ?>
        
<h2>Actualizar Especialidad de un Vol</h2>
<h3><?php echo escape($apellido) , "  " , escape($nombres); ?></h3>

<table>

  <thead>
    <tr>
      <th>DNI</th>
      <th>Especialidad</th>
      <th>Ultima Act</th>
    </tr>
  </thead>
    <tbody>
    <?php foreach ($result as $row) : ?>
      <tr>
        <td><?php echo escape($row["dni"]); ?></td>
        <td><?php echo escape($row["especialidad"]); ?></td>
        <td><?php echo escape($row["last_update"]); ?></td>
        <td><a href="update-espec_ap_V1.2.php?dni=<?php echo escape($row["dni"]); ?>">Delete</a></td>
      </tr>
    <?php endforeach; ?>
    </tbody>
</table>

<a href="index_ap_V1.2.php">Back to home</a>

<?php require "templates/footer.php"; ?>
