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
					p_fecha_pre_proy = :p_fecha_pre_proy,
					p_fecha_present_vol = :p_fecha_present_vol,
					
					p_fecha_mitad_proy_estim = :p_fecha_mitad_proy_estim,
					p_fecha_mitad_proy_real = :p_fecha_mitad_proy_real,
					
					p_fecha_cierre_proy_estim = :p_fecha_cierre_proy_estim,
					p_fecha_cierre_proy_real = :p_fecha_cierre_proy_real,
					
					p_dup_si_no = :p_dup_si_no,
					p_fecha_dup = :p_fecha_dup,
					p_link_a_dup = :p_link_a_dup
    				
             WHERE p_num_corr_proy = :p_num_corr_proy";
             
  $error="";
  $statement = $connection->prepare($sql2);
  $statement->execute($upd_proy);
  
  
  } catch(PDOException $error) {
      echo $sql2 . "<br>" . $error->getMessage();
      exit;
  }
  
if ( $statement && !$error) : ?>
    <br>
	<blockquote>
	Proyecto: <strong><?php echo escape($_GET['p_num_corr_proy']) ?></strong>  Nombre: <strong><?php echo escape($_GET['p_nombre_proy']) ?> </strong>  <br>
	
	de la OSC: <strong><?php echo escape($_GET['osc_nombre'])  ?> </strong>Fue actualizado OK. <br>
	
	</blockquote>
	
<?php 
		require "../templates/footer_proy.php"; 
	endif;
exit; 
}
?>

<h3>Modificar datos de un Proyecto: </h3>
<blockquote>
Proyecto: <strong><?php echo escape($_GET['p_num_corr_proy']) ?></strong>  Nombre: <strong><?php echo escape($_GET['p_nombre_proy']) ?> </strong>  <br>

de la OSC: <strong><?php echo escape($_GET['osc_nombre'])  ?> </strong><br>

</blockquote>


<?php if ( $count != 0 ) {
	 $limit=1; ?>
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

				<label for="<?php echo $key; ?>"><?php echo (ucfirst(preg_replace('/p_/','',$key,$limit))); ?><br></label>    
				<input type="text" name="<?php echo $key; ?>" iden="<?php echo $key; ?>" value="<?php echo escape($value); ?>" <?php echo ( 'readonly' ); ?>><br>
			</tr>	
		   
	<?php 	break;
			case 'p_dup_si_no': 
			// Use esta construccion para hacer el Select de opciones pero tambien porque
			// no descubri el funcionamiento de preg_replace... parece distinto de lo que conozco...
			// no da para perder mas tiempo 
	?>		

			    <br>
			    <label for="p_dup_si_no">Se hizo el DUP?</label><br>
				<select name="p_dup_si_no">
<!--
				<option value=""selected hidden>Seleccione...</option>

				<option value="<?php echo escape($value); ?>"selected></option>
-->
				<option value="<?php echo escape($value); ?>"><?php echo escape($value); ?></option>
						<option value="Si">SI</option>
						<option value="No">NO</option>
				</select><br>
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
	


<?php } 
 require "../templates/footer_proy.php"; 
?> 



