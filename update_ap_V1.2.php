<?php

/**
 * List all users with a link to edit
 */

try {
  require "./config_ap_V1.0.php";
  require "./common.php";

  $connection = new PDO($dsn, $username, $password, $options);

  $sql = "SELECT * FROM t_users1";

  $statement = $connection->prepare($sql);
  $statement->execute();

  $result = $statement->fetchAll();
} catch(PDOException $error) {
  echo $sql . "<br>" . $error->getMessage();
}
?>
<?php require "templates/header.php"; ?>
        
<h2>Actualizar Voluntarios</h2>

<table>
  <thead>
    <tr>
      <th>DNI</th>
      <th>Apellido</th>
      <th>Nombres</th>
      <th>Profesion</th>
      <th>email_1</th>
      <th>email_2</th>
      <th>Ultima Act</th>
    </tr>
  </thead>
    <tbody>
    <?php foreach ($result as $row) : ?>
      <tr>
        <td><?php echo escape($row["dni"]); ?></td>
        <td><?php echo escape($row["apellido"]); ?></td>
        <td><?php echo escape($row["nombres"]); ?></td>
        <td><?php echo escape($row["profesion"]); ?></td>
        <td><?php echo escape($row["email_1"]); ?></td>
        <td><?php echo escape($row["email_2"]); ?></td>
        <td><?php echo escape($row["last_update"]); ?> </td>
        <td><a href="update-single.php?id=<?php echo escape($row["dni"]); ?>">Edit</a></td>
      </tr>
    <?php endforeach; ?>
    </tbody>
</table>

<a href="index_ap_V1.2.php">Back to home</a>

<?php require "templates/footer.php"; ?>
