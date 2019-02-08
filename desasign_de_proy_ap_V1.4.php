
<?php
/**
 *
 * asignar un usuario a un proyecto
 * 
 *
 */
require "./config_ap_V1.4.php";
// require "./common_ap_V1.4.php";


if (isset($_POST['submit'])) {
    // Aca insertamos la asignacion del Vol al proyecto
    // agregando una fila a t_hist_user_proy
    try  {

		
        $connection = new PDO($dsn, $username, $password, $options);
        
        $new_asign = array(

					"dni"     				=> $_GET['dni'],
					"p_num_corr_proy"       => $_GET['num_proy'],
							//"fecha_evento"			=> date("Y-m-d"),
					"f_asignac"				=> $_POST['f_asignac'],
							//"tipo_evento"  			=> 'Asignacion',
					"coment_desemp"  		=> $_POST['coment_desemp']
						);
        $sql = sprintf(
                "INSERT INTO %s (%s) values (%s)",
                "t_hist_user_proy",
                implode(", ", array_keys($new_asign)),
                ":" . implode(", :", array_keys($new_asign))
        );
        $error = "";
        $statement = $connection->prepare($sql);
        $statement->execute($new_asign);
        
    } catch(PDOException $error) {
       // echo $sql . "<br>" . $error->getMessage();
        echo "Hubo un error en el insert de: " , $_GET['apellido'] . "<br>" . $error->getMessage();
        exit;
    }

// Paranoia check: Pese que en paso anterior se verifica que la/el Vol
// no este asignado al proyecto, existe la posibilidad que este paso se 
// ejecute nuevamente y se genere un segundo registro erroneo.
// Para evitar esto, se vuelve a verificar...


require "templates/header.php";

 if (  $statement && !$error){ 
	 // Aca insertamos el nuevo estado del VOL en t_logs_estado_user
		try {
			$log_estado = array(
            "dni"     				=> $_GET['dni'],
            "estado"				=> 'Asignado',
            "consideraciones"  		=> $_POST['coment_desemp']
								);
        $sql_log_estado = sprintf(
									"INSERT INTO %s (%s) values (%s)",
									"t_logs_estado_user",
									implode(", ", array_keys($log_estado)),
							":" . implode(", :", array_keys($log_estado))
        );
        $error_est = "";
        $statement_est = $connection->prepare($sql_log_estado);
        $statement_est->execute($log_estado);
        
    } catch(PDOException $error_est) 	{
       // echo $sql_log_estado . "<br>" . $error_est->getMessage();
        echo "Hubo un error en el insert en t_logs_estado_user: " , $_GET['apellido'] . "<br>" . $error_est->getMessage();
        exit;
										}
	 ?>
	
    <blockquote><?php echo $_GET['apellido'] , ", " , $_GET['nombres']  . "<br>" . 
					"Fue asignada/o al proyecto:",    $_GET['num_proy'] . "<br>" .
					" Nombre Proy: " , $_GET['p_nombre_proy'] . "<br>" .
					"  OSC: ", $_GET['osc']  ;?></blockquote> <br>
    <a href="index_ap_<?php echo escape($vers);?>.php">Back to home</a>
							<?php  }
	exit;						} ?>

<?php  	require "./config_ap_V1.4.php";
		require "./common_ap_V1.4.php";
		require "verificar_asign_V1.4.php"; 
?>
<h2>Desasignar Voluntario a proyecto</h2>
<h3><?php echo "DesAsignacion de Vol: " , escape($_GET['apellido']) , ", " , escape($_GET['nombres']); ?></h3>
<h3><?php echo "De Proyecto: " , escape($_GET['osc_nombre']) , ", " , escape($_GET['p_num_corr_proy']), ", " , escape($_GET['p_nombre_proy']); ?></h3>

<?php
// echo verificar_asign( $_GET['dni'] , $_GET['num_proy']) , $_GET['dni'] , $_GET['num_proy'];
?>

		
<form method="post">
		<label for="coment_desemp">Comentario</label>
		<input type="text" name="coment_desemp" id="coment_desemp"><br>
		<label for="fecha_desasign">Fecha DesAsignacion</label>
		<input type="text" name="f_desasign" id="f_desasign" value= "<?php echo escape(date("Y-m-d")); ?>">	<br>	
        <input type="submit" name="submit" value="DesAsignar" class="button">
</form>



<a href="index_ap_<?php echo escape($vers);?>.php">Back to home</a>

<?php 

// echo "Today is " . date("Y/m/d H i") . "<br>";
// print_r(timezone_identifiers_list(2));

require "templates/footer.php"; 
exit; ?>

