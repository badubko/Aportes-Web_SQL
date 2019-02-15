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
<?php require "../templates/header_osc.php"; ?>
        
<h3>Actualizar los DCs de la OSC: <?php echo escape($osc_nombre) ; ?></h3>


<!--
		Practicas de programacion LAMENTABLES !
		Un foreach para 1 sola fila 
		y no usar foreach anidados... 
		Como extraño otros lenguajes...
-->
<style>
table, th, td {
  border: 1px solid black;
}
</style>
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
    
    <?php foreach ($result_supl as $row) : 
	$dc_supl_ant=$row["dni"];
	endforeach;	
    
    ?>
    
<!--
Esto es HORRIBLEEEE... pero.... "funciona"
-->
    
    <?php foreach ($result_tit as $row) : 
    $dc_tit_ant=$row["dni"];?>
      <tr>
        <td><?php echo escape($row["osc_nombre"]); ?></td>
        <td>Tit</td>
        <td><?php echo escape($row["apellido"]); ?></td>
        <td><?php echo escape($row["nombres"]); ?></td>
        <td><?php echo escape($row["osc_f_titular"]); ?></td>
        
        
		<?php if(  ($row["dni"] != 1 ) AND  ($row["dni"] != 2)) { ?>	
				<td><a href="202_1_4_2_1_asigna_dc_<?php echo escape($vers);?>.php?osc_nombre=<?php echo escape($row["osc_nombre"]); ?>
				&dni=1
				&rol_dc=Titular
				&osc_f_titular=<?php echo escape($row["osc_f_titular"]); ?>
				">Desasignar Titular</a></td>
															<?php } 
			else{  ?>
				<td> <a>--N/A--</a></td>
		<?php } ?>

        <td><a href="202_1_4_2_buscar_nvo_dc_<?php echo escape($vers);?>.php?osc_nombre=<?php echo escape($row["osc_nombre"]); ?>
        &rol_dc=Titular
        &dc_tit_ant=<?php echo escape($row["dni"]); ?>
        &dc_supl_ant=<?php echo escape($dc_supl_ant); ?>
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
        
        <?php if(  ($row["dni"] != 1 ) AND  ($row["dni"] != 2)) { ?>	
				<td><a href="202_1_4_2_1_asigna_dc_<?php echo escape($vers);?>.php
				?osc_nombre=<?php echo escape($row["osc_nombre"]); ?>
				&dni=2
				&rol_dc=Suplente
				&osc_f_titular=<?php echo escape($row["osc_f_supl"]); ?>
				">Desasignar Suplente</a></td>
														<?php } 
			else{  ?>
				<td> <a>--N/A--</a></td>
			<?php } ?>
        
        <td><a href="202_1_4_2_buscar_nvo_dc_<?php echo escape($vers);?>.php?osc_nombre=<?php echo escape($row["osc_nombre"]); ?>
        &rol_dc=Suplente
        &dc_tit_ant=<?php echo escape($dc_tit_ant); ?>
        &dc_supl_ant=<?php echo escape($row["dni"]); ?>
        ">Nuevo DC Suplente</a></td>
      </tr>
    <?php endforeach; ?>
    
    
    </tbody>
</table>
        <br>
		<a href="202_buscar_osc_<?php echo escape($vers);?>.php">Buscar otra OSC p/ Agregar o Actualizar datos</a>
		<br>
		<br>
		<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>
		<?php require "../templates/footer_osc.php"; ?>



