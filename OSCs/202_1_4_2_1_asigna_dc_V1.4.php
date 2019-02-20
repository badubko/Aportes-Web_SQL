<?php 

require "../config_ap_V1.4.php";
require "../common_ap_V1.4.php";

if (isset($_POST['submit'])) {
  try {
    $connection = new PDO($dsn, $username, $password, $options);
//        echo $_GET['rol_dc'] , "<br> " ;
		if ( $_GET['rol_dc'] == 'Titular') {
			$osc =[
			  "osc_nombre"      		=> $_GET['osc_nombre'],   
			  "osc_dc_tit"  			=> $_GET['dni_nvo'],
			  "osc_f_titular" 				=> $_POST['osc_f_titular']
					];
			$sql = "UPDATE t_osc
					SET osc_nombre = :osc_nombre,
						osc_dc_tit = :osc_dc_tit,
						osc_f_titular = :osc_f_titular 
					 WHERE osc_nombre = :osc_nombre";
		} else {
			  $osc =[
			  "osc_nombre"      		=> $_GET['osc_nombre'],   
			  "osc_dc_supl"  			=> $_GET['dni_nvo'],
			  "osc_f_supl" 				=> $_POST['osc_f_supl']
					];
			$sql = "UPDATE t_osc
					SET osc_nombre = :osc_nombre,
						osc_dc_supl = :osc_dc_supl,
						osc_f_supl = :osc_f_supl 
					 WHERE osc_nombre = :osc_nombre";        
		}    

   //$apellido = $_POST['apellido'];
   //$nombres = $_POST['nombres'];
    

  $error="";
  $statement = $connection->prepare($sql);
  $statement->execute($osc);
  
  } catch(PDOException $error) {
      echo $sql . "<br>" . $error->getMessage();
  }
}
?>

<?php if (isset($_POST['submit']) && $statement && !$error ) : ?>
	<blockquote>
	<?php echo escape($_GET['rol_dc']) , ", para " , escape($_GET['osc_nombre']); ?> Fue actualizada/o OK. 
	</blockquote>
	    <br>
		<a href="202_buscar_osc_<?php echo escape($vers);?>.php">Buscar otra OSC p/ Agregar o Actualizar datos</a>
		<br>
		<br>
		<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>
		<?php require "../templates/footer_osc.php"; ?>
<?php 
exit;
endif; ?>

<?php
$osc_nombre = $_GET['osc_nombre'];

$dni_ant=$_GET['dni_ant'];
$ap_ant=$_GET['ap_ant']; 
$nom_ant=$_GET['nom_ant']; 

$dni_nvo=$_GET['dni_nvo'];
$ap_nvo=$_GET['ap_nvo']; 
$nom_nvo=$_GET['nom_nvo']; 

$rol_dc=$_GET['rol_dc']; 

?>

<?php require "../templates/header_osc.php";?> 


       


<style>
table, th, td {
  border: 1px solid black;
}
</style>

<?php
// Si es asignacion

if ( $dni_nvo != 1 AND $dni_nvo !=2 ) { 
//	echo $dni_nvo , " rol ", $rol_dc , "<br>"
	?>
	
<h3>Asignar nueva/o DC <?php echo escape($rol_dc) ; ?> a la OSC: <?php echo escape($osc_nombre) ; ?></h3>
<?php } 
else 
      {?>
<h3>Desasignar DCs <?php echo escape($rol_dc) ; ?> de la OSC: <?php echo escape($osc_nombre) ; ?></h3>

<?php } ?>

<table>
  <thead>
    <tr>
	<th>Status</th>	
    <th>DNI</th>
     
      <th>Apellido</th>
      <th>Nombres</th>
     
    </tr>
  </thead> 
    <tbody>
		
      <tr>
		<td>DC Anterior</td>  
        <td><?php echo escape($dni_ant); ?></td>
        <td><?php echo escape($ap_ant); ?></td>
        <td><?php echo escape($nom_ant); ?></td>

      </tr>
      <tr>
		<td>DC Nueva/o</td>    
        <td><?php echo escape($dni_nvo); ?></td>
        <td><?php echo escape($ap_nvo); ?></td>
        <td><?php echo escape($nom_nvo); ?></td>
 
      </tr>
	</tbody>
</table><br><br>

<form method="post">
	<?php 	switch ($_GET['rol_dc']) {
			case 'Titular':?>
				<label for="osc_f_titular">Fecha Cambio Tit</label>
				<input type="text" name="osc_f_titular" id="osc_f_titular" value= "<?php echo escape(date("Y-m-d")); ?>">	<br>
	<?php
				break;
			case 'Suplente':
//	        echo "Es Suplente <br>"
	?>
				<label for="osc_f_supl">Fecha Cambio Supl</label>
				<input type="text" name="osc_f_supl" id="osc_f_supl" value= "<?php echo escape(date("Y-m-d")); ?>">	<br>
	
	<?php
				break;
				   }	
	?> 			 
				 		
	<label for="osc_comentarios_dc">Comentario sobre este cambio<br></label>
	<input type="text" name="osc_comentarios_dc" id="osc_comentarios_dc">
	<input type="submit" name="submit" value="Confirmar">
</form>
        <br>
		<a href="202_buscar_osc_<?php echo escape($vers);?>.php">Buscar otra OSC p/ Agregar o Actualizar datos</a>
		<br>
		<br>
		<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>
		<?php require "../templates/footer_osc.php"; ?>

<?php
exit;
?>

