<?php

/**
 * Listar contactos de una OSC para: 
 * 
 * Agregar un nuevo contacto
 * Modificar los datos del contacto
 * Eliminar contacto
 */

try {
  require "../config_ap_V1.4.php";
  require "../common_ap_V1.4.php";

  $connection = new PDO($dsn, $username, $password, $options);
  $osc_nombre = $_GET['osc_nombre'];

  $sql = "SELECT * FROM t_osc_contactos WHERE osc_nombre = :osc_nombre ORDER BY osc_contacto_apellido";

  $statement = $connection->prepare($sql);
  $statement->bindParam(':osc_nombre', $osc_nombre, PDO::PARAM_STR);
  $statement->execute();

  $result = $statement->fetchAll();
  $count = $statement->rowCount();
} catch(PDOException $error) {
  echo $sql . "<br>" . $error->getMessage();
}
?>
<?php require "../templates/header.php"; ?>
        
<h2>Administrar contactos de la OSC:</h2>
<h3><?php echo escape($osc_nombre) ; ?></h3>

<?php if ( $count != 0 ) { ?>

<table>

  <thead>
    <tr>
      
      <th>Apellido</th>
      <th>Nombres</th>
       <th>Celular</th>
       <th>Posicion</th>
       <th>Mas detalles</th>
    </tr>
  </thead>
    <tbody>
    <?php foreach ($result as $row) : ?>
      <tr>
        <td><?php echo escape($row["osc_contacto_apellido"]); ?></td>
        <td><?php echo escape($row["osc_contacto_nombres"]); ?></td>
        <td><?php echo escape($row["osc_contacto_cel"]); ?></td>
        <td><?php echo escape($row["osc_contacto_posicion"]); ?></td>
        
        <td><a href="202_1_3_2_1_elim_obj_osc_<?php echo escape($vers);?>.php?osc_nombre=<?php echo escape($row["osc_nombre"]); ?>
        &osc_objetivo=<?php echo escape($row["osc_objetivo"]); ?>
    
        ">Eliminar Objetivo</a></td>
      </tr>
    <?php endforeach; ?>
    </tbody>
</table>

<?php }
else {
	 echo "OSC: " , $osc_nombre ,  " --> No tiene objetivos listados" , "<br>" ;
	} ?>
        <br>
        <a href="202_1_3_1_1_agreg_obj_osc_<?php echo escape($vers);?>.php?osc_nombre=<?php echo escape($osc_nombre); ?>
         ">Agregar Nuevo Objetivo</a>
        <br>
        
<a href="<?php $_PHP_SELF ?>">Listar Objetivos</a><br><br>
<a href="202_1_admin_osc_<?php echo escape($vers);?>.php?osc_nombre=<?php echo escape($osc_nombre); ?>
        ">Menu Administrar OSC</a><br> 
<a href="../index_ap_V1.4.php">Back to home</a>

<?php require "../templates/footer_osc.php"; ?>
