<?php
/**
 * Modificar datos de un Contacto de una OSC
 *
 */
require "../config_ap_V1.4.php";
require "../common_ap_V1.4.php";


if (isset($_GET['osc_nombre'])) {
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
    				osc_contacto_horario,
    				last_update
    				
    FROM t_osc_contactos WHERE id_truch = :id_truch";
    
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
// Aca se actualizan los datos...

if (isset($_POST['submit'])) {
  try {
//    $connection = new PDO($dsn, $username, $password, $options);
    $upd_cont =[
				"osc_contacto_apellido" 		=> $_POST['osc_contacto_apellido'],
				"osc_contacto_nombres" 			=> $_POST['osc_contacto_nombres'],
				"osc_contacto_cel" 				=> $_POST['osc_contacto_cel'],
				"osc_contacto_tel_fijo" 		=> $_POST['osc_contacto_tel_fijo'],
				"osc_contacto_email" 			=> $_POST['osc_contacto_email'],
				"osc_contacto_posicion" 		=> $_POST['osc_contacto_posicion'],
				"osc_contacto_horario" 			=> $_POST['osc_contacto_horario'],
				"id_truch" 						=> $_GET['id_truch']
			];

    
    $sql2 = "UPDATE t_osc_contactos
				SET  			
				osc_contacto_apellido 		= :osc_contacto_apellido,
				osc_contacto_nombres 		= :osc_contacto_nombres,
				osc_contacto_cel 			= :osc_contacto_cel,
				osc_contacto_tel_fijo 		= :osc_contacto_tel_fijo,
				osc_contacto_email 			= :osc_contacto_email,
				osc_contacto_posicion 		= :osc_contacto_posicion,
				osc_contacto_horario 		= :osc_contacto_horario
             WHERE id_truch = :id_truch";
             
  $error="";
  $statement = $connection->prepare($sql2);
  $statement->execute($upd_cont);
  
  
  } catch(PDOException $error) {
      echo $sql2 . "<br>" . $error->getMessage();
  }
  
if ( $statement && !$error) : ?>
	<blockquote>
	OSC: <?php echo escape($_GET['osc_nombre']), ", " , escape($_POST['osc_contacto_apellido']), 
	", " , escape($_POST['osc_contacto_nombres']) ; ?> Fue actualizada/o OK. <br>
	</blockquote>
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


<h3>Modificar datos de un contacto de la OSC: <?php echo escape($_GET['osc_nombre'])?> </h3>

<?php if ( $count != 0 ) { ?>
<form method="post">
	
    <?php foreach ($osc_cont as $key => $value) : ?>
		<label for="<?php echo $key; ?>"><?php echo ucfirst($key); ?><br></label>    
	    <input type="text" name="<?php echo $key; ?>" iden="<?php echo $key; ?>" value="<?php echo escape($value); ?>" ><br>
	<?php			
     endforeach; ?> 
    
    
    <input type="submit" name="submit" value="Guardar">

</form>

	<li><a href="202_1_2_admin_cont_osc_<?php echo escape($vers);?>.php
				?osc_nombre=<?php echo escape($_GET["osc_nombre"]); ?>
				"><strong>Administrar Contactos</strong></a> - Administar los contactos de la OSC</li>
	<li><a href="202_buscar_osc_<?php echo escape($vers);?>.php">Buscar otra OSC p/Actualizar</a> - Buscar otra OSC p/ Agregar o Actualizar datos</li>		
	<br><a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>

<?php }  ?>	
