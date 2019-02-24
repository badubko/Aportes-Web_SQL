<?php

/**
 * Eliminar un contacto de una OSC
 */

  require "../config_ap_V1.4.php";
  require "../common_ap_V1.4.php";

if (isset($_POST['submit'])) {
  try {
    $connection = new PDO($dsn, $username, $password, $options);
  
    $id_truch= $_GET["id_truch"];
   

    $sql = "DELETE FROM t_osc_contactos WHERE id_truch = :id_truch ";

    $statement = $connection->prepare($sql);
    $statement->bindValue(':id_truch', $id_truch);
    
    $error="";
    $statement->execute();

     		
  } catch(PDOException $error) {
    echo $sql . "<br>" . $error->getMessage();
  }
}
?>

<?php if (isset($_POST['submit']) && $statement && !$error ) : ?>

	<h3><?php echo escape($_GET['osc_contacto_apellido']); ?> , <?php echo escape($_GET['osc_contacto_nombres']); ?></h3>
	<h3>Fue eliminado como contacto de la OSC: <?php echo escape($_GET['osc_nombre']); ?>< </h3>
	    <br>
		<a href="202_1_2_admin_cont_osc_<?php echo escape($vers);?>.php
				?osc_nombre=<?php echo escape($_GET['osc_nombre']); ?>
				">Volver a listar contactos</a><br><br>
		<a href="202_1_admin_osc_<?php echo escape($vers);?>.php?osc_nombre=<?php echo escape($_GET['osc_nombre']); ?>
        ">Menu Administrar OSC</a><br> 				
		<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>
		<br>
		<br>
		
		<?php require "../templates/footer_osc.php"; ?>
<?php 
exit;
endif; ?>




<?php require "../templates/header_osc.php"; ?>
        
<h3>Eliminar un contacto de la OSC: <?php echo escape($_GET['osc_nombre']); ?></h3>
<h3><?php echo escape($_GET['osc_contacto_apellido']); ?> , <?php echo escape($_GET['osc_contacto_nombres']); ?></h3>


<form method="post">
	<input type="submit" name="submit" value="Confirmar">
</form>

<a href="202_1_2_admin_cont_osc_<?php echo escape($vers);?>.php
				?osc_nombre=<?php echo escape($_GET['osc_nombre']); ?>
				">Volver a listar contactos</a><br><br>
<a href="202_1_admin_osc_<?php echo escape($vers);?>.php?osc_nombre=<?php echo escape($_GET['osc_nombre']); ?>
        ">Menu Administrar OSC</a><br> 				
<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>


<?php require "../templates/footer_osc.php"; ?>
