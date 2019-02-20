<?php 


		require "../config_ap_V1.4.php";
		require "../common_ap_V1.4.php";

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
// Si no es desasignacion

if ( $dni_nvo != 1 AND $dni_nvo !=2 ) { ?>
	
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


	<?php 	switch ($_GET['rol_dc']) {
			case 'Titular':?>
				<label for="osc_f_titular">Fecha Cambio Tit</label>
				<input type="text" name="osc_f_titular" id="osc_f_titular" value= "<?php echo escape(date("Y-m-d")); ?>">	<br>
	<?php
				break;
			case 'Suplente':
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

<?php
exit;
?>

