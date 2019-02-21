<?php
/**
 * Update de datos de una OSC
 * Version con drop-down de ROL 
 *
 */
require "../config_ap_V1.4.php";
require "../common_ap_V1.4.php";


if (isset($_GET['osc_nombre'])) {
  try {

    $connection = new PDO($dsn, $username, $password, $options);
    $osc_nombre = $_GET['osc_nombre'];
    
    $sql1 = "SELECT osc_nombre,
    				osc_calle_1,
    				osc_num_1,
    				osc_ciudad_1,
    				osc_cp_1,
    				osc_prov_1,
    				osc_calle_2,
    				osc_num_2,
    				osc_ciudad_2,
    				osc_cp_2,
    				osc_prov_2,
    				osc_pag_web,
    				osc_estado,
    				osc_acuerdo,
    				osc_notas,
    				osc_dc_tit,
    				osc_f_titular,
    				osc_dc_supl,
    				osc_f_supl,
    				last_update
    FROM t_osc WHERE osc_nombre = :osc_nombre";
    
    $statement = $connection->prepare($sql1);
    $statement->bindValue(':osc_nombre', $osc_nombre);
    $statement->execute();
    
    $osc = $statement->fetch(PDO::FETCH_ASSOC);
    $count = $statement->rowCount();
     
  } catch(PDOException $error) {
      echo $sql1 . "<br>" . $error->getMessage();
  }
} else {
    echo "Algo salio mal AQUI!" ;
    exit;
}
?>

<h3>Modificar datos de OSC <?php echo escape($_GET['osc_nombre'])?> </h3>

<?php if ( $count != 0 ) { ?>
<form method="post">
	
    <?php foreach ($osc as $key => $value) : ?>
    <?php switch ($key) {
			case 'osc_acuerdo': 
	?>	
			<label for="osc_acuerdo">Acuerdo  </label> 
			<select name="osc_acuerdo">
			<option value="<?php echo escape($value); ?>"><?php echo escape($value); ?></option>
				<option value="Firmado">Firmado</option>			
				<option value="Pendiente">Pendiente</option>
				<option value="N/D">N/D</option>
			</select>	
		    <br>
	<?php	break;
			case 'osc_estado': 
	?>
		<label for="<?php echo $key; ?>"><?php echo ucfirst($key); ?><br></label>    
	    <input type="text" name="<?php echo $key; ?>" iden="<?php echo $key; ?>" value="<?php echo escape($value); ?>" <?php echo ( 'readonly' ); ?>><br>
	<?php	break;
	 	    // Los DCs se administran en otro menu...
	 	    // La opcion de hacerlo se presenta mas abajo.
			case 'osc_dc_tit':
			case 'osc_f_titular': 
			case 'osc_dc_supl': 
			case 'osc_f_supl': 
			break;
		default:		
	?>
		<label for="<?php echo $key; ?>"><?php echo ucfirst($key); ?><br></label>    
	    <input type="text" name="<?php echo $key; ?>" iden="<?php echo $key; ?>" value="<?php echo escape($value); ?>" ><br>
	<?php	break;
						}	?>
    <?php endforeach; ?> 
    <input type="submit" name="submit" value="Guardar">

</form>

	<li><a href="202_1_4_asign_desasign_dcs_<?php echo escape($vers);?>.php
				?osc_nombre=<?php echo escape($_GET["osc_nombre"]); ?>
				">Ver o Asignar/Desasignar DCs</a> - Asignar o Desasignar DCs para OSC</li>
	<li><a href="202_buscar_osc_<?php echo escape($vers);?>.php">Buscar otra OSC p/Actualizar</a> - Buscar otra OSC p/ Agregar o Actualizar datos</li>		
	<br><a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>

<?php }  ?>	



