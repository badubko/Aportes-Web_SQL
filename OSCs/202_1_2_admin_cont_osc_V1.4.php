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
<?php require "../templates/header_osc.php"; ?>
        
<h3>Administrar contactos de la OSC:</h3>
<h3> <?php echo escape($osc_nombre) ; ?></h3>

<?php if ( $count != 0 ) { ?>
	
<style>
table, th, td {
  border: 1px solid black;
}
</style>


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

        <td><a href="202_1_2_2_1_modif_cont_osc_<?php echo escape($vers);?>.php?osc_nombre=<?php echo escape($row["osc_nombre"]); ?>
		&id_truch=<?php echo escape($row["id_truch"]); ?>
		">Modif Contacto</a></td>
        
       <td><a href="202_1_2_2_2_elim_cont_osc_<?php echo escape($vers);?>.php?osc_nombre=<?php echo escape($row["osc_nombre"]); ?>
		&id_truch=<?php echo escape($row["id_truch"]); ?>
		">Eliminar Contacto</a></td>
      </tr>
    <?php endforeach; ?>
    </tbody>
</table>

<?php }
else {
	 echo "OSC: " , $osc_nombre ,  " --> No tiene contactos listados" , "<br>" ;
	} ?>
        <br>
        <a href="202_1_2_1_agreg_cont_osc_<?php echo escape($vers);?>.php?osc_nombre=<?php echo escape($osc_nombre); ?>
         ">Agregar Nuevo Contacto</a>
        <br>
        
<a href="<?php $_PHP_SELF ?>">Listar Contactos</a><br><br>
<a href="202_1_admin_osc_<?php echo escape($vers);?>.php?osc_nombre=<?php echo escape($osc_nombre); ?>
        ">Menu Administrar OSC</a><br> 
<a href="../index_ap_V1.4.php">Back to home</a>

<?php require "../templates/footer_osc.php"; ?>
