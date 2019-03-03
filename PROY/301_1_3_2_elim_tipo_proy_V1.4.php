<?php

/**
 * Eliminar una especificacion de tipo de un proyecto
 */


  require "../config_ap_V1.4.php";
  require "../common_ap_V1.4.php";

if (isset($_POST['submit'])) {
  try {
    $connection = new PDO($dsn, $username, $password, $options);
  
    $id_truch= $_GET["id_truch"];
   

    $sql = "DELETE FROM t_p_logs_tipo_proy WHERE id_truch = :id_truch ";

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

	<h3>Tipificacion: <?php echo escape($_GET['p_tipo_proy']); ?> </h3>
	<h3>Fue eliminada del proy: <?php echo escape($_GET['p_nombre_proy']); ?>< </h3>
	<h3>OSC: <?php echo escape($_GET['osc_nombre']); ?> , <?php echo escape($_GET['p_num_corr_proy']); ?></h3>
	    <br>
	    
	<a href="./301_1_3_lista_tipos_proy_<?php echo escape($vers);?>.php?osc_nombre=<?php echo escape($_GET['osc_nombre']); ?>
				&p_num_corr_proy=<?php echo escape($_GET["p_num_corr_proy"]); ?>
				&p_nombre_proy=<?php echo escape($_GET["p_nombre_proy"]); ?>">Listar tipos</a>
		
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
        
<h3>Eliminar una especificacion de tipo del proyecto: </h3>
<h3>Nombre Proyecto: <?php echo escape($_GET['p_nombre_proy']); ?></h3>
<h3>De la OSC: <?php echo escape($_GET['osc_nombre']); ?></h3>
<h3>Num corr Proy:<?php echo escape($_GET['p_num_corr_proy']); ?> , <?php echo escape($_GET['osc_nombre']); ?></h3>
<h3>Tipo de Proyecto: <?php echo escape($_GET['p_tipo_proy']); ?> </h3>

<form method="post">
	<input type="submit" name="submit" value="Confirmar">
</form>

<a href="./301_1_3_lista_tipos_proy_<?php echo escape($vers);?>.php?osc_nombre=<?php echo escape($_GET['osc_nombre']); ?>
				&p_num_corr_proy=<?php echo escape($_GET["p_num_corr_proy"]); ?>
				&p_nombre_proy=<?php echo escape($_GET["p_nombre_proy"]); ?>">Listar tipos</a>
				
<a href="202_1_admin_osc_<?php echo escape($vers);?>.php?osc_nombre=<?php echo escape($_GET['osc_nombre']); ?>
        ">Menu Administrar OSC</a><br> 	
        			
<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>


<?php require "../templates/footer_proy.php"; ?>
