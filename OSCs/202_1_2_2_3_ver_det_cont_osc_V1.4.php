<?php
/**
 * Listar datos detallados de un Contacto de una OSC
 *
 */
require "../config_ap_V1.4.php";
require "../common_ap_V1.4.php";


if (isset($_GET['id_truch'])) {
  try {

    $connection = new PDO($dsn, $username, $password, $options);
    $id_truch = $_GET['id_truch'];
    
    $sql1 = "SELECT osc_nombre,
    				osc_contacto_apellido,
    				osc_contacto_nombres,
    				osc_contacto_cel,
    				osc_contacto_tel_fijo,
    				osc_contacto_email,
    				osc_contacto_posicion,
    				osc_contacto_comentarios,
    				osc_contacto_horario,
    				last_update
    				
    FROM t_osc_contactos WHERE id_truch = :id_truch";
    
    $error=0;
    $statement = $connection->prepare($sql1);
    $statement->bindValue(':id_truch', $id_truch);
    $statement->execute();
    
    $osc_cont = $statement->fetch(PDO::FETCH_ASSOC);
    $count = $statement->rowCount();
     
  } catch(PDOException $error) {
      echo $sql1 . "<br>" . $error->getMessage();
								}
} else {
    echo "Algo salio mal AQUI!" ;
    exit;
		}
?>


<?php


if (isset($_POST['submit'])) {

  
if ( $statement && !$error) : ?>

	<a href="202_1_2_admin_cont_osc_<?php echo escape($vers);?>.php
				?osc_nombre=<?php echo escape($_GET["osc_nombre"]); ?>
				"><strong>Administrar Contactos</strong></a> - Administar los contactos de la OSC<br>
	<a href="202_buscar_osc_<?php echo escape($vers);?>.php"><strong>Buscar otra OSC p/Actualizar</strong></a> - Buscar otra OSC p/ Agregar o Actualizar datos	
	<br><a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>
<?php endif;
exit; 
}

?>
<?php require "../templates/header_osc.php"; ?>


<h3>Datos detallados de un contacto de la OSC: <?php echo escape($_GET['osc_nombre'])?> </h3>

<?php if ( $count != 0 ) { ?>
	
<style>
table, th, td {
  border: 1px solid black;
}
</style>

<table>
	 <tbody>
		 <?php foreach ($osc_cont as $key => $value) : ?>
		 <tr>
			
				 <td><strong><?php echo escape (ucfirst(str_replace("osc_contacto_","",$key))); ?></strong></td>
				 <td><?php echo escape($value); ?></td> 
			
		</tr>
		<?php endforeach; ?> 
     </tbody>
</table>	    
<br><br>    

<?php 
} 
else { 
?>
	<a> No se encontraron datos del contacto ...<?php echo escape($_GET['id_truch'])?>  </a> <br><br>

<?php 	
}
 ?>

	<li><a href="202_1_2_admin_cont_osc_<?php echo escape($vers);?>.php
				?osc_nombre=<?php echo escape($_GET["osc_nombre"]); ?>
				"><strong>Administrar Contactos</strong></a> - Administar los contactos de la OSC</li>
	<li><a href="202_buscar_osc_<?php echo escape($vers);?>.php"><strong>Buscar otra OSC p/Actualizar</strong></a> - Buscar otra OSC p/ Agregar o Actualizar datos</li>		
	<br><a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>

<?php 
exit;
?>	
