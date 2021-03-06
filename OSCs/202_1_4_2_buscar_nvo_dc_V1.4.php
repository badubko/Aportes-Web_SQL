<?php

/**
 * 
 * Buscar DC por apellido aproximado
 * En esta version, no incluimos la cant de OSCs que tiene
 * 
 */

if (isset($_POST['submit'])) {
	try {	
		require "../config_ap_V1.4.php";
		require "../common_ap_V1.4.php";

		$connection = new PDO($dsn, $username, $password, $options);

		$sql = "SELECT
						dni, apellido, nombres, rol, tel_1, email_1,estado
				FROM    us1_us2
				WHERE
				apellido LIKE :apellido AND (estado !='De_Baja' AND estado != 'ND_Temp' ) AND (rol='VC' OR rol='DC')
				AND ( dni != :dni_tit_ant) AND ( dni != :dni_supl_ant) AND ( dni != :dni_tit_fict ) AND (dni != :dni_supl_fict )
				ORDER BY rol , apellido, nombres;" ;
        

        
		$apellido = $_POST['apellido'];
		$dni_tit_ant=$_GET['dni_tit_ant'];
		$dni_supl_ant=$_GET['dni_supl_ant'];

 //       echo $apellido,", ",$dni_tit_ant,", ",$dni_supl_ant,", ",$dni_tit_fict,", ",$dni_supl_fict,"<br>";
		
		$statement = $connection->prepare($sql);
		
		$statement->bindParam(':apellido', $apellido, PDO::PARAM_STR);
		$statement->bindParam(':dni_tit_ant', $dni_tit_ant, PDO::PARAM_STR);
		$statement->bindParam(':dni_supl_ant', $dni_supl_ant, PDO::PARAM_STR);
		$statement->bindParam(':dni_tit_fict', $dni_tit_fict, PDO::PARAM_STR);
		$statement->bindParam(':dni_supl_fict', $dni_supl_fict, PDO::PARAM_STR);
		$statement->execute();
        
        
		$result = $statement->fetchAll();
	} catch(PDOException $error) {
		echo $sql . "<br>" . $error->getMessage();
													}
}
?>
<?php require "../templates/header_osc.php"; ?>
		
<?php  
if (isset($_POST['submit'])) {
	if ($result && $statement->rowCount() > 0) { ?>
		<h3>Buscar DC por apellido</h3>
		<h3>para ASIGNAR a OSC: <?php echo escape($_GET['osc_nombre']); ?> como NUEVO: DC <?php echo escape($_GET['rol_dc']); ?> </h3>
		<h3>Resultados para rol = DC o VC y estado != De_Baja y != ND_Temp </h3>
		<h3>(Excluye a los DCs/VCs asignados a esa OSC)</h3>
<!--
		<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>
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
					<th>Apellido</th>
					<th>Nombres</th>
					<th>Rol</th>
					<th>Telefono 1</th>
					<th>email 1</th>
					<th>Seleccionar</th>
				</tr>
			</thead>
			<tbody>
	<?php foreach ($result as $row): { ?>
			<tr>
				<td><?php echo escape($row["dni"]); ?></td>
				<td><?php echo escape($row["apellido"]); ?></td>
				<td><?php echo escape($row["nombres"]); ?></td>
				<td><?php echo escape($row["rol"]); ?></td>
				<td><?php echo escape($row["tel_1"]); ?></td>
				<td><?php echo escape($row["email_1"]); ?></td>

				<td><a href="202_1_4_2_1_asigna_dc_<?php echo escape($vers);?>.php
				?osc_nombre=<?php echo escape($_GET['osc_nombre']); ?>
				
				<?php switch ($_GET['rol_dc']) {
				case 'Titular':?>
							
					&dni_ant=<?php echo escape($_GET['dni_tit_ant']); ?>
					&ap_ant=<?php echo escape($_GET['ap_tit_ant']); ?>
					&nom_ant=<?php echo escape($_GET['nom_tit_ant']); ?>
					
				
				<?php
				 break;
				 case 'Suplente':?>
					&dni_ant=<?php echo escape($_GET['dni_supl_ant']); ?>
					&ap_ant=<?php echo escape($_GET['ap_supl_ant']); ?>
					&nom_ant=<?php echo escape($_GET['nom_supl_ant']); ?>
				
				<?php
				  break;
				   }	
				 ?> 
				
				&dni_nvo=<?php echo escape($row["dni"]); ?>
				&ap_nvo=<?php echo escape($row["apellido"]); ?>
				&nom_nvo=<?php echo escape($row["nombres"]); ?>
				
				
				&rol_dc=<?php echo escape($_GET['rol_dc']); ?>
				">P/Asignar</a></td>
	
			</tr>
		<?php } 
		endforeach;?> 
			</tbody>
	</table><br><br>
	
	
	<?php } else { ?>
		<blockquote>No se encontro ningun DC con:  <?php echo escape($_POST['apellido']); ?>.</blockquote>
<!--
		<a href="<?php $_PHP_SELF ?>
		?osc_nombre=<?php echo escape($_GET['osc_nombre']); ?>
		&dni_ant=<?php echo escape($_GET['dni']); ?>
		&apellido_ant=<?php echo escape($_GET['apellido']); ?>
		&nombres_ant=<?php echo escape($_GET['nombres']); ?>
		&rol_dc=<?php echo escape($_GET['rol_dc']); ?> 
		">Volver a Buscar</a><br><br>
-->
				<a href="202_1_4_asign_desasign_dcs_<?php echo escape($vers);?>.php
				?osc_nombre=<?php echo escape($_GET["osc_nombre"]); ?>
				"><strong>Ver o Asignar/Desasignar DCs</strong></a> -Volver a  Asignar o Desasignar DCs para OSC<br><br>
	<?php } ?>

<br>
<a href="202_buscar_osc_<?php echo escape($vers);?>.php">Buscar otra OSC p/ Agregar o Actualizar datos</a>
<br>
<br>
<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>
<?php
require "../templates/footer_osc.php"; 
exit;	
} ?> 

<?php  	require "../config_ap_V1.4.php";
		require "../common_ap_V1.4.php";?>
		
<h3>Buscar DC por apellido</h3>
<h3>para ASIGNAR a OSC: <?php echo escape($_GET['osc_nombre']); ?> como: DC <?php echo escape($_GET['rol_dc']); ?> </h3>
<?php
        //$dni_tit_ant=$_GET['dni_tit_ant'];
        //$dni_supl_ant=$_GET['dni_supl_ant'];
        //echo $dni_tit_ant,", ",$dni_supl_ant,"<br>";
        
?>



<form method="post">

	<label for="apellido">Apellido (A%  %A%  %)</label>
	<input type="text" id="apellido" name="apellido">
	<input type="submit" name="submit" value="Buscar">
</form>


<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>

<?php require "../templates/footer_osc.php"; ?>

