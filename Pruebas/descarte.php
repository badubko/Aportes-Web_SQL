<!--
				<td><?php echo escape($row["p_nombre_proy"]); ?></td>
				<td><?php echo escape($row["p_ultimo_estado"]); ?></td>
-->
	
	<?php       if ( verificar_asign( $dni , $row["p_num_corr_proy"]) == 'No_Asignado' 	) { 	?>			
					
					<td><a href="asign_a_proy_ap_<?php echo escape($vers);?>.php
					?dni=<?php echo escape($dni); ?>
					&apellido=<?php echo escape ($apellido); ?>
					&nombres=<?php echo escape($nombres); ?>
					&osc=<?php echo escape($row["osc_nombre"]); ?>
					&num_proy=<?php echo escape($row["p_num_corr_proy"]); ?>
					&p_nombre_proy=<?php echo escape($row["p_nombre_proy"]); ?>
					">Asignar VOL</a></td>
	<?php  																	} 
				else 	{  ?>
					<td>Ya esta ASIGNADA/O a este Proyecto</td>
	<?php 				} ?>	
	
	
	
	
	
	if ($result && $statement->rowCount() > 0) { ?>
		<h3><?php echo "DesAsignacion de Vol: " , escape($apellido) , ", " , escape($nombres); ?></h3>
<!--		
		<h3><?php echo "a un Proyecto de OSC: " , escape($_GET['osc']) , ", en Estado = (Pre-Proyecto o En_Ejecucion)"; ?></h3>


		<a href="index_ap_<?php echo escape($vers);?>.php">Back to home</a>
-->
		<table>
			<thead>
				<tr>
					<th>OSC</th>
					<th>Num Corr Proy</th>
					<th>Nombre Proy</th>
					<th>Estado Proy</th>			
					<th>Elegir Proyecto</th>
				</tr>
			</thead>
			<tbody>
	<?php foreach ($result as $row) { ?>
			<tr>
				<td><?php echo escape($row["dni"]); ?></td>
				<td><?php echo escape($row["p_num_corr_proy"]); ?></td>
			</tr>
		<?php } ?> 
			</tbody>
	</table>
	<?php } else { ?>
		<blockquote>No se encontro ningun proy para:  <?php echo escape($_POST['dni']); ?>.</blockquote>
	<?php } ?>
