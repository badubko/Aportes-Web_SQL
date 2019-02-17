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
      <th>DNI</th>
      <th>Rol</th>
      <th>Apellido</th>
      <th>Nombres</th>
      <th>F Asign</th>
    </tr>
  </thead> 
    <tbody>
    
    <?php 
    // Hay una sola fila para titular y suplente...
    // Hacemos esto de antemano para luego tener todos los valores
    // para cada fila en la tabla
        
    foreach ($result_tit as $row_tit) : 
	$dni_tit_ant=$row_tit["dni"];
	$ap_tit_ant=$row_tit["apellido"];
	$nom_tit_ant=$row_tit["nombres"];
	$f_tit_ant=$row_tit["osc_f_titular"];
	endforeach;
	
    foreach ($result_supl as $row_supl) : 
	$dni_supl_ant=$row_supl["dni"];
	$ap_supl_ant=$row_supl["apellido"];
	$nom_supl_ant=$row_supl["nombres"];
	$f_supl_ant=$row_supl["osc_f_supl"];
	
	endforeach;	
    
    ?>
    
<!--
Esto es HORRIBLEEEE... pero.... "funciona"
-->
    

      <tr>
        <td><?php echo escape($dni_tit_ant); ?></td>
        <td>Tit</td>
        <td><?php echo escape($ap_tit_ant); ?></td>
        <td><?php echo escape($nom_tit_ant); ?></td>
        <td><?php echo escape($f_tit_ant); ?></td>
        
        
		<?php if(  ($row_tit["dni"] != 1 ) AND  ($row_tit["dni"] != 2)) { ?>	
				<td><a href="202_1_4_2_1_asigna_dc_<?php echo escape($vers);?>.php?osc_nombre=<?php echo escape($row_tit["osc_nombre"]); ?>
				&dni_ant=<?php echo escape($dni_tit_ant); ?>
				&ap_ant=<?php echo escape($ap_tit_ant); ?>
				&nom_ant=<?php echo escape($nom_tit_ant); ?>

				&dni_nvo=<?php echo escape($dni_tit_fict); ?>
				&ap_nvo=<?php echo escape($ap_tit_fict); ?>
				&nom_nvo=<?php echo escape($nom_supl_fict); ?>

				&rol_dc=Titular
				">Desasignar Titular</a></td>
															<?php } 
			else{  ?>
				<td> <a>--N/A--</a></td>
		<?php } ?>
  
<!--
        Pasamos todos estos datos para:
        En buscar: poder filtrar al DC titular y suplente de la busqueda
				   Eso es: no se puede asignar al mismo DC como tit o supl de si mismo.
		En asignar: Para poder pasarle estos valores
		Los valores de dni apellido y nombres de los DCs ficticios vienen 
		definidos en el config_ap_VX.X.php
-->
  
        <td><a href="202_1_4_2_buscar_nvo_dc_<?php echo escape($vers);?>.php?osc_nombre=<?php echo escape($row_tit["osc_nombre"]); ?>

		&dni_tit_ant=<?php echo escape($dni_tit_ant); ?>
		&ap_tit_ant=<?php echo escape($ap_tit_ant); ?>
		&nom_tit_ant=<?php echo escape($nom_tit_ant); ?>

		&dni_supl_ant=<?php echo escape($dni_supl_ant); ?>
		&ap_supl_ant=<?php echo escape($ap_supl_ant); ?>
		&nom_supl_ant=<?php echo escape($nom_supl_ant); ?>
		&rol_dc=Titular
        ">Nuevo DC Titular</a></td>
        
       </tr>
   
    

      <tr>
		<td><?php echo escape($dni_supl_ant); ?></td>
        <td>Supl</td>
        <td><?php echo escape($ap_supl_ant); ?></td>
        <td><?php echo escape($nom_supl_ant); ?></td>
        <td><?php echo escape($f_supl_ant); ?></td>
        
        <?php if(  ($row_supl["dni"] != 1 ) AND  ($row_supl["dni"] != 2)) { ?>	
				<td><a href="202_1_4_2_1_asigna_dc_<?php echo escape($vers);?>.php
				?osc_nombre=<?php echo escape($row_supl["osc_nombre"]); ?>
				&dni_ant=<?php echo escape($dni_supl_ant); ?>
				&ap_ant=<?php echo escape($ap_supl_ant); ?>
				&nom_ant=<?php echo escape($nom_supl_ant); ?>
				
				&dni_nvo=<?php echo escape($dni_supl_fict); ?>
				&ap_nvo=<?php echo escape($ap_supl_fict); ?>
				&nom_nvo=<?php echo escape($nom_supl_fict); ?>
				
				&rol_dc=Suplente
				">Desasignar Suplente</a></td>
														<?php } 
			else{  ?>
				<td> <a>--N/A--</a></td>
			<?php } ?>
        
        <td><a href="202_1_4_2_buscar_nvo_dc_<?php echo escape($vers);?>.php?osc_nombre=<?php echo escape($row_supl["osc_nombre"]); ?>
		&dni_tit_ant=<?php echo escape($dni_tit_ant); ?>
		&ap_tit_ant=<?php echo escape($ap_tit_ant); ?>
		&nom_tit_ant=<?php echo escape($nom_tit_ant); ?>

		&dni_supl_ant=<?php echo escape($dni_supl_ant); ?>
		&ap_supl_ant=<?php echo escape($ap_supl_ant); ?>
		&nom_supl_ant=<?php echo escape($nom_supl_ant); ?>
		
		&rol_dc=Suplente
		">Nuevo DC Suplente</a></td>
      </tr>

    
    
    </tbody>
</table>
        <br>
		<a href="202_buscar_osc_<?php echo escape($vers);?>.php">Buscar otra OSC p/ Agregar o Actualizar datos</a>
		<br>
		<br>
		<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>
		<?php require "../templates/footer_osc.php"; ?>



