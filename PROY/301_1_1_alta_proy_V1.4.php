

<?php
require "../config_ap_V1.4.php";
require "../common_ap_V1.4.php";

$f_default='2014-01-01'; 
$estado_inic='Pre-Proyecto';

?>

<?php
if (isset($_POST['nuevo_proy'])) {
   

    try  {
        $connection = new PDO($dsn, $username, $password, $options);
        
        $new_proy = array(
            "osc_nombre" 				=> $_POST['osc_nombre'],
            "p_num_corr_proy"			=> $_POST['p_num_corr_proy'],
            "p_nombre_proy" 			=> $_POST['p_nombre_proy'],

            "p_fecha_pre_proy"			=> $_POST['p_fecha_pre_proy'],
            "p_fecha_present_vol"		=> $_POST['p_fecha_present_vol'],
            
            "p_fecha_mitad_proy_estim"	=> $_POST['p_fecha_mitad_proy_estim'],
            "p_fecha_mitad_proy_real"	=> $_POST['p_fecha_mitad_proy_real'],

            "p_fecha_cierre_proy_estim" => $_POST['p_fecha_cierre_proy_estim'],
            "p_fecha_cierre_proy_real"	=> $_POST['p_fecha_cierre_proy_real'],
            
            "p_ultimo_estado"			=> $_POST['p_ultimo_estado'],

            "p_dup_si_no"				=> $_POST['p_dup_si_no'],
            "p_fecha_dup" 				=> $_POST['p_fecha_dup'],
            "p_link_a_dup"				=> $_POST['p_link_a_dup'],

						);
 
        $sql_new_proy = sprintf(
						"INSERT INTO %s (%s) values (%s)",
						"t_proyectos",
						implode(", ", array_keys($new_proy)),
						":" . implode(", :", array_keys($new_proy))
								);
        $error = "";
        $statement = $connection->prepare($sql_new_proy);
        $statement->execute($new_proy);
        
    } catch(PDOException $error) {
       // echo $sql . "<br>" . $error->getMessage();
        echo "Hubo un error en el insert de: " , $_POST['osc_nombre'] . "<br>" . $error->getMessage();
    }
}
?>

<!--
Una vez que el proyecto se dio de alta en t_proyectos
Se escribe en el log el estado inicial del proyecto para mantener la consistencia
en p_logs_estado_proy
EL trigger after_t_p_logs_estado_proy_insert  replicara el estado en 
t_proyectos, aunque ya al haber creado el proyecto se haya registrado al proy
como "Pre-Proyecto" y se fija la fecha de la prox reunion en hoy + 14 dias? 
HARDCODED !!!! yackkkkk !!!

-->


<?php if (isset($_POST['nuevo_proy']) && $statement && !$error){ ?>
   OSC 	 : <?php echo $_POST['osc_nombre'] ?><br>
   Numero Proy: <?php echo $_POST['p_num_corr_proy'] ?><br>
   Nombre Proy: <?php echo $_POST['p_nombre_proy'] ?> <br>
   Registrado en la base de Aportes.<br><br>

<?php  
    $date=date_create(date("Y-m-d"));
	date_add($date,date_interval_create_from_date_string("14 days"));
	$fecha_prox_reun=date_format($date,"Y-m-d"); 
    
    try {
    $new_log = array(
            "p_num_corr_proy" 			=> $_POST['p_num_corr_proy'],
            "p_estado_proy"				=> $_POST['p_ultimo_estado'],
			"p_fecha" 					=> $fecha_prox_reun,
			"p_signif_fecha"			=> 'Fecha prox reun',
					);
	$sql_new_log = sprintf(
						"INSERT INTO %s (%s) values (%s)",
						"t_p_logs_estado_proy",
						implode(", ", array_keys($new_log)),
						":" . implode(", :", array_keys($new_log))
								);
        $error_p_log = "";
        $statement = $connection->prepare($sql_new_log);
        $statement->execute($new_log);		
		} catch(PDOException $error_p_log) {
       // echo $sql . "<br>" . $error->getMessage();
        echo "Hubo un error en el insert de log: " , $_POST['osc_nombre'] . "<br>" . $error_p_log->getMessage();
    }




require "../templates/footer_proy.php"; 
exit;
} ?>


<h2>Crear Nuevo proyecto</h2>

<form method="post">
	
	<label for="osc_nombre">OSC</label><br>
	<input type="text" name="osc_nombre" id="osc_nombre" value="<?php echo escape ($_POST["osc_nombre"]); ?>"<?php echo ( 'readonly' ); ?>><br><br>
	
	<label for="p_num_corr_proy">Numero Correlativo Proyecto</label><br>
	<input type="text" name="p_num_corr_proy" id="p_num_corr_proy" value="<?php echo escape ($_POST["p_num_corr_proy"]); ?>"<?php echo ( 'readonly' ); ?>><br><br>
	
	<label for="p_nombre_proy">Nombre Proyecto</label><br>
		<input type="text" name="p_nombre_proy" id="p_nombre_proy" value="<?php echo escape($_POST["p_nombre_proy"]); ?>"><br><br>
	
	<label for="p_fecha_pre_proy">Fecha Pre-proyecto</label><br>
		<input type="text" name="p_fecha_pre_proy" id="p_fecha_pre_proy" value="<?php echo escape($f_default); ?>"><br><br>		
		
	<label for="p_fecha_present_vol">Fecha Present VOLs</label><br>
		<input type="text" name="p_fecha_present_vol" id="p_fecha_present_vol" value="<?php echo escape($f_default); ?>"><br><br>		
	
	<label for="p_fecha_mitad_proy_estim">Fecha ESTIMADA mitad proyecto</label><br>
		<input type="text" name="p_fecha_mitad_proy_estim" id="p_fecha_mitad_proy_estim" value="<?php echo escape($f_default); ?>"><br><br>

	<label for="p_fecha_mitad_proy_real">Fecha REAL mitad proyecto</label><br>
		<input type="text" name="p_fecha_mitad_proy_real" id="p_fecha_mitad_proy_real" value="<?php echo escape($f_default); ?>"><br><br>	

	<label for="p_fecha_cierre_proy_estim">Fecha ESTIMADA cierre proyecto</label><br>
		<input type="text" name="p_fecha_cierre_proy_estim" id="p_fecha_cierre_proy_estim" value="<?php echo escape($f_default); ?>"><br><br>	

	<label for="p_fecha_cierre_proy_real">Fecha REAL cierre proyecto</label><br>
		<input type="text" name="p_fecha_cierre_proy_real" id="p_fecha_cierre_proy_real" value="<?php echo escape($f_default); ?>"><br><br>	

	<label for="p_ultimo_estado">Estado Inicial Proy</label><br>
	<input type="text" name="p_ultimo_estado" id="p_ultimo_estado" value="<?php echo escape ($estado_inic); ?>"<?php echo ( 'readonly' ); ?>><br><br>



    <label for="p_dup_si_no">Se hizo el DUP?</label><br>
	<select name="p_dup_si_no">
	<option value=""selected hidden>Seleccione...</option>
	
		<option value="Si">SI</option>
		<option value="No">NO</option>
	</select><br><br>
	
	<label for="p_fecha_dup">Fecha DUP</label><br>
	<input type="text" name="p_fecha_dup" id="p_fecha_dup" value="<?php echo escape($f_default); ?>"><br><br>					
	
	<label for="p_link_a_dup">Link al DUP</label><br>
	<input type="text" name="p_link_a_dup" id="p_link_a_dup" value="N/D"><br><br><br>	

	<input type="submit" name="nuevo_proy" value="Crear Proyecto">
</form>




<?php require "../templates/footer_proy.php"; ?>
