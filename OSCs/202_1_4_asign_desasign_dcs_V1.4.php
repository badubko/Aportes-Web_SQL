<?php

/**
 * Listar los DCs de una OSC para 
 * Desasignarlos o Cambiarlos
 * 
 */
  require "../config_ap_V1.4.php";
  require "../common_ap_V1.4.php";
  $connection = new PDO($dsn, $username, $password, $options);
  $osc_nombre = $_GET['osc_nombre'];

try {

   
  // Seleccionamos los datos del titular con un view

  $sql_tit = "SELECT osc_nombre, osc_f_titular , dni, apellido, nombres FROM list_osc_dc_tit WHERE osc_nombre = :osc_nombre ";

  $statement = $connection->prepare($sql_tit);
  $statement->bindParam(':osc_nombre', $osc_nombre, PDO::PARAM_STR);
  $statement->execute();

  $result_tit = $statement->fetchAll();
  $count_tit  = $statement->rowCount();
} catch(PDOException $error) {
  echo $sql_tit . "<br>" . $error->getMessage();
}
try {

   
  // Seleccionamos los datos del suplente  con un view

  $sql_supl = "SELECT osc_nombre, osc_f_supl , dni, apellido, nombres FROM list_osc_dc_supl WHERE osc_nombre = :osc_nombre ";

  $statement = $connection->prepare($sql_supl);
  $statement->bindParam(':osc_nombre', $osc_nombre, PDO::PARAM_STR);
  $statement->execute();

  $result_supl = $statement->fetchAll();
  $count_supl  = $statement->rowCount();
} catch(PDOException $error) {
  echo $sql_supl . "<br>" . $error->getMessage();
}
?>
<?php require "../templates/header.php"; ?>
        
<h2>Actualizar los DCs de la OSC:</h2>
<h3><?php echo escape($osc_nombre) ; ?></h3>

<!--
		Practicas de programacion LAMENTABLES !
		Un foreach para 1 sola fila 
		y no user foreach anidados... 
		Como extraño otros lenguajes...
-->
<table>

  <thead>
    <tr>
      <th>OSC</th>
      <th>Rol</th>
      <th>Apellido</th>
      <th>Nombres</th>
      <th>F Asign</th>
    </tr>
  </thead> 
    <tbody>

    <?php foreach ($result_tit as $row) : ?>
      <tr>
        <td><?php echo escape($row["osc_nombre"]); ?></td>
        <td>Tit</td>
        <td><?php echo escape($row["apellido"]); ?></td>
        <td><?php echo escape($row["nombres"]); ?></td>
        <td><?php echo escape($row["osc_f_titular"]); ?></td>
        <td><a href="202_1_4_2_1_asign_dc_<?php echo escape($vers);?>.php?osc_nombre=<?php echo escape($row["osc_nombre"]); ?>
        &dni=1
        &rol_dc=Titular
        &osc_f_titular=<?php echo escape($row["osc_f_titular"]); ?>
        ">Desasignar Titular</a></td>
        <td><a href="202_1_4_2_buscar_nvo_dc_<?php echo escape($vers);?>.php?osc_nombre=<?php echo escape($row["osc_nombre"]); ?>
        &rol_dc=Titular
        ">Nuevo DC Titular</a></td>
      </tr>
    <?php endforeach; ?>
    
     <?php foreach ($result_supl as $row) : ?>
      <tr>
        <td><?php echo escape($row["osc_nombre"]); ?></td>
        <td>Supl</td>
        <td><?php echo escape($row["apellido"]); ?></td>
        <td><?php echo escape($row["nombres"]); ?></td>
        <td><?php echo escape($row["osc_f_supl"]); ?></td>
        <td><a href="202_1_4_2_1_asign_dc_<?php echo escape($vers);?>.php?osc_nombre=<?php echo escape($row["osc_nombre"]); ?>
        &dni=2
        &rol_dc=Suplente
        &osc_f_titular=<?php echo escape($row["osc_f_supl"]); ?>
        ">Desasignar Titular</a></td>
        <td><a href="202_1_4_2_buscar_nvo_dc_<?php echo escape($vers);?>.php?osc_nombre=<?php echo escape($row["osc_nombre"]); ?>
        &rol_dc=Suplente
        ">Nuevo DC Suplente</a></td>
      </tr>
    <?php endforeach; ?>
    
    
    </tbody>
</table>




