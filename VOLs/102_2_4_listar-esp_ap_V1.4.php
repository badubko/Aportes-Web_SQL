<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

<!--
	<title>Aportes: VOLs </title>
-->

	<link rel="stylesheet" href="../css/style.css">
</head>

<?php

/**
 * List all users with a link to edit
 */

try {
  require "../config_ap_V1.4.php";
  require "../common_ap_V1.4.php";

  $connection = new PDO($dsn, $username, $password, $options);
  $dni = $_GET['dni'];
  $apellido = $_GET['apellido'];
  $nombres = $_GET['nombres'];
  $sql = "SELECT dni, especialidad , last_update FROM t_especialidad_user WHERE dni = :dni ORDER BY last_update";

  $statement = $connection->prepare($sql);
  $statement->bindParam(':dni', $dni, PDO::PARAM_STR);
  $statement->execute();

  $result = $statement->fetchAll();
} catch(PDOException $error) {
  echo $sql . "<br>" . $error->getMessage();
}
?>
<?php require "../templates/header_vol.php"; ?>
        
<h2>Actualizar Especialidad de un Vol</h2>
<h3><?php echo escape($apellido) , ", " , escape($nombres); ?></h3>

<table>

  <thead>
    <tr>
      <th>DNI</th>
      <th>Especialidad</th>
      <th>Ultima Act</th>
      <th>Accion</th>
    </tr>
  </thead>
    <tbody>
    <?php foreach ($result as $row) : ?>
      <tr>
        <td><?php echo escape($row["dni"]); ?></td>
        <td><?php echo escape($row["especialidad"]); ?></td>
        <td><?php echo escape($row["last_update"]); ?></td>
        <td><a href="102_2_4_2_delete-espec_ap_<?php echo escape($vers);?>.php?dni=<?php echo escape($row["dni"]); ?>
        &especialidad=<?php echo escape($row["especialidad"]); ?>
        &apellido=<?php echo escape($apellido); ?>
        &nombres=<?php echo escape($nombres); ?>
        ">Eliminar</a></td>
      </tr>
    <?php endforeach; ?>
    </tbody>
</table>

<!--
<p>
    <label for="espec">Nueva Especialidad</label>
    <input id="espec" type="text">
</p>
-->
        <a href="102_2_4_1_agreg_nva_esp_ap_<?php echo escape($vers);?>.php?dni=<?php echo escape($dni); ?>
        &apellido=<?php echo escape($apellido); ?>
        &nombres=<?php echo escape($nombres); ?>
        ">Agregar Nva Esp</a>
        
<a href="<?php $_PHP_SELF ?>">Listar Espec</a>
<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>

<?php require "../templates/footer_vol.php"; ?>
