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

try {
  $connection = new PDO($dsn, $username, $password, $options);

  $sql = "SELECT dni , especialidad FROM t_especialidad_user";

  $statement = $connection->prepare($sql);
  $statement->execute();

  $result = $statement->fetchAll();
} catch(PDOException $error) {
  echo $sql . "<br>" . $error->getMessage();
}
?>
<?php require "templates/header.php"; ?>
        
<h2>Delete especialidad</h2>

<?php if ($success) echo $success; ?>

<table>
  <thead>
    <tr>
      <th>#</th>
      <th>DNI</th>
      <th>Especialidad</th>
      <th>Delete</th>
    </tr>
  </thead>
  <tbody>
  <?php foreach ($result as $row) : ?>
    <tr>
      <td><?php echo escape($row["dni"]); ?></td>
      <td><?php echo escape($row["especialidad"]); ?></td>
      <td><a href="delete-espec_ap_V1.2.php?id=<?php echo escape($row["id"]); ?>">Delete</a></td>
    </tr>
  <?php endforeach; ?>
  </tbody>
</table>

<a href="read_ap_V1.2.php">Back to Act Vol</a>

<?php require "templates/footer.php"; ?>
