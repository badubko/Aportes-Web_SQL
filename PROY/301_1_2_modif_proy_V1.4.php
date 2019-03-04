<?php
/**
 * Update de datos de un Proyecto
 * 
 *
 */
require "../config_ap_V1.4.php";
require "../common_ap_V1.4.php";


if (isset($_GET['p_num_corr_proy'])) {
  try {

    $connection = new PDO($dsn, $username, $password, $options);
    $osc_nombre = 		$_GET['osc_nombre'];
    $p_num_corr_proy = 	$_GET['p_num_corr_proy'];
    $p_nombre_proy = 	$_GET['p_nombre_proy'];
    
    
    $sql1 = "SELECT * FROM t_proyectos WHERE p_num_corr_proy = :p_num_corr_proy";
    
    
    $statement = $connection->prepare($sql1);
    $statement->bindValue(':p_num_corr_proy', $p_num_corr_proy);
    $statement->execute();
    
    $proy = $statement->fetch(PDO::FETCH_ASSOC);
    $count = $statement->rowCount();
     
  } catch(PDOException $error) {
      echo $sql1 . "<br>" . $error->getMessage();
  }
} else {
    echo "Algo salio mal AQUI! No se encontro el proyecto" ;
    exit;
}
?>


<?php
// Aca se actualizan los datos...

if (isset($_POST['submit'])) {
  try {

    $upd_proy =[
		
            "p_num_corr_proy"			=> $_POST['p_num_corr_proy'],
    

            "p_fecha_pre_proy"			=> $_POST['p_fecha_pre_proy'],
            "p_fecha_present_vol"		=> $_POST['p_fecha_present_vol'],
            
            "p_fecha_mitad_proy_estim"	=> $_POST['p_fecha_mitad_proy_estim'],
            "p_fecha_mitad_proy_real"	=> $_POST['p_fecha_mitad_proy_real'],

            "p_fecha_cierre_proy_estim" => $_POST['p_fecha_cierre_proy_estim'],
            "p_fecha_cierre_proy_real"	=> $_POST['p_fecha_cierre_proy_real'],
            
            

            "p_dup_si_no"				=> $_POST['p_dup_si_no'],
            "p_fecha_dup" 				=> $_POST['p_fecha_dup'],
            "p_link_a_dup"				=> $_POST['p_link_a_dup'],
			
			];

    

    $sql2 = "UPDATE t_proyectos
            SET  
					p_num_corr_proy = :p_num_corr_proy,
					p_fecha_pre_proy = :p_fecha_pre_proy,
					p_fecha_present_vol = :p_fecha_present_vol,
					
					p_fecha_mitad_proy_estim = :p_fecha_mitad_proy_estim,
					p_fecha_mitad_proy_real = :p_fecha_mitad_proy_real,
					
					p_fecha_cierre_proy_estim = :p_fecha_cierre_proy_estim,
					p_fecha_cierre_proy_real = :p_fecha_cierre_proy_real,
					
					p_dup_si_no = :p_dup_si_no,
					p_fecha_dup = :p_fecha_dup,
					p_link_a_dup = :p_link_a_dup,
    				
             WHERE p_num_corr_proy = :p_num_corr_proy";
             
  $error="";
  $statement = $connection->prepare($sql2);
  $statement->execute($upd_proy);
  
  
  } catch(PDOException $error) {
      echo $sql2 . "<br>" . $error->getMessage();
      exit;
  }
  
if ( $statement && !$error) : ?>
	<blockquote>
	Proyecto: <?php echo escape($_GET['p_num_corr_proy'])  ?> Fue actualizado OK. <br>
	</blockquote>
	<a href="202_buscar_osc_<?php echo escape($vers);?>.php">Buscar otra OSC p/Actualizar</a> - Buscar otra OSC p/ Agregar o Actualizar datos	
	<br><a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>
<?php endif;
exit; 
}

?>

<h3>Modificar datos de un Proyecto de <?php echo escape($_GET['p_num_corr_proy'])?> </h3>

<?php if ( $count != 0 ) { ?>
<form method="post">
<table>
    <?php foreach ($proy as $key => $value) : ?>
    <?php switch ($key) {
			case 'p_num_corr_proy':
			case 'osc_nombre': 
			case 'p_nombre_proy':  
			case 'p_ultimo_estado': 
			case 'last_update':  
	?>	
			<tr>
<!--
				 <td><strong><?php echo escape (ucfirst(str_replace("p_","",$key))); ?></strong></td>
				 <td><?php echo escape($value); ?></td> 
-->
				<label for="<?php echo $key; ?>"><?php echo (ucfirst(str_replace("p_","",$key))); ?><br></label>    
				<input type="text" name="<?php echo $key; ?>" iden="<?php echo $key; ?>" value="<?php echo escape($value); ?>" <?php echo ( 'readonly' ); ?>><br>
			</tr>	
		   
	<?php 	break;
	
			default: 
	?>
			<tr>
			<label for="<?php echo $key; ?>"><?php echo (ucfirst(str_replace("p_","",$key))); ?><br></label>    
			<input type="text" name="<?php echo $key; ?>" iden="<?php echo $key; ?>" value="<?php echo escape($value); ?>" ><br>
			</tr>
	<?php	break;
					}	?>
    <?php endforeach; ?> 
    <input type="submit" name="submit" value="Guardar">
</table>
</form>
	
	<li><a href="202_1_4_asign_desasign_dcs_<?php echo escape($vers);?>.php
				?osc_nombre=<?php echo escape($_GET["osc_nombre"]); ?>
				">Ver o Asignar/Desasignar DCs</a> - Asignar o Desasignar DCs para OSC</li>
	<li><a href="202_buscar_osc_<?php echo escape($vers);?>.php">Buscar otra OSC p/Actualizar</a> - Buscar otra OSC p/ Agregar o Actualizar datos</li>		
	<br><a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>

<?php }  ?>	



