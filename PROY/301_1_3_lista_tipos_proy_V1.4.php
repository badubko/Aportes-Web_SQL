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
 * List los tipos de un proyecto con links para:
 *  agregar nuevo tipo de proy o eliminar tipo
 */

try {
  require "../config_ap_V1.4.php";
  require "../common_ap_V1.4.php";

  $connection = new PDO($dsn, $username, $password, $options);
  $osc_nombre = $_GET['osc_nombre'];
  $p_num_corr_proy = $_GET['p_num_corr_proy'];
  $p_nombre_proy = $_GET['p_nombre_proy'];
  $sql = "SELECT p_num_corr_proy, p_tipo_proy , last_update, id_truch FROM t_p_logs_tipo_proy WHERE p_num_corr_proy = :p_num_corr_proy ORDER BY last_update";

  $statement = $connection->prepare($sql);
  $statement->bindParam(':p_num_corr_proy', $p_num_corr_proy, PDO::PARAM_STR);
  $statement->execute();

  $result = $statement->fetchAll();
} catch(PDOException $error) {
  echo $sql . "<br>" . $error->getMessage();
}
?>
<?php require "../templates/header_vol.php"; ?>
        
<h2>Actualizar los tipos del Proyecto</h2>
<h3><?php echo escape($osc_nombre) , ", " , escape($p_num_corr_proy), ", " , escape($p_nombre_proy); ?></h3>

<table>

  <thead>
    <tr>
     
      <th>Num Corr<br>Proy</th>
      <th>Tipo Proy</th>
      <th>Actualizado el</th>
      <th>Accion</th>
    </tr>
  </thead>
    <tbody>
    <?php foreach ($result as $row) : ?>
      <tr>
        <td><?php echo escape($row["p_num_corr_proy"]); ?></td>
        <td><?php echo escape($row["p_tipo_proy"]); ?></td>
        <td><?php echo escape($row["last_update"]); ?></td>
        <td><a href="301_1_3_2_elim_tipo_proy_<?php echo escape($vers);?>.php?osc_nombre=<?php echo escape($osc_nombre); ?>
        &p_num_corr_proy=<?php echo escape($row["p_num_corr_proy"]); ?>
        &p_nombre_proy=<?php echo escape($p_nombre_proy); ?>
        &p_tipo_proy=<?php echo escape($row["p_tipo_proy"]); ?>
        &id_truch=<?php echo escape($row["id_truch"]); ?>
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
        <br>
        <a href="301_1_3_1_agregar_tipo_proy<?php echo escape($vers);?>.php?osc_nombre=<?php echo escape($osc_nombre); ?>
        &p_num_corr_proy=<?php echo escape($p_num_corr_proy); ?>
        &p_nombre_proy=<?php echo escape($p_nombre_proy); ?>
        ">Agregar Nvo Tipo Proy</a>
<br>        
<a href="<?php $_PHP_SELF ?>">Listar tipos del PROY</a>

<br><br>
<?php require "../templates/footer_proy.php"; ?>
