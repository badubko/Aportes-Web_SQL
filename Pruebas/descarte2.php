// Paranoia check: Pese que en paso anterior se verifica que la/el Vol
// no este asignado al proyecto, existe la posibilidad que este paso se 
// ejecute nuevamente y se genere un segundo registro erroneo.
// Para evitar esto, se vuelve a verificar...


//require "templates/header.php";

 //if (  $statement && !$error){ 
	 //// Aca insertamos el nuevo estado del VOL en t_logs_estado_user
		//try {
			//$log_estado = array(
            //"dni"     				=> $_GET['dni'],
            //"estado"				=> 'Asignado',
            //"consideraciones"  		=> $_POST['coment_desasign']
								//);
        //$sql_log_estado = sprintf(
									//"INSERT INTO %s (%s) values (%s)",
									//"t_logs_estado_user",
									//implode(", ", array_keys($log_estado)),
							//":" . implode(", :", array_keys($log_estado))
        //);
        //$error_est = "";
        //$statement_est = $connection->prepare($sql_log_estado);
        //$statement_est->execute($log_estado);
        
    //} catch(PDOException $error_est) 	{
       //// echo $sql_log_estado . "<br>" . $error_est->getMessage();
        //echo "Hubo un error en el insert en t_logs_estado_user: " , $_GET['apellido'] . "<br>" . $error_est->getMessage();
        //exit;
										//}
	 ?>
	
    <blockquote><?php echo $_GET['apellido'] , ", " , $_GET['nombres']  . "<br>" . 
					"Fue asignada/o al proyecto:",    $_GET['num_proy'] . "<br>" .
					" Nombre Proy: " , $_GET['p_nombre_proy'] . "<br>" .
					"  OSC: ", $_GET['osc']  ;?></blockquote> <br>
    <a href="index_ap_<?php echo escape($vers);?>.php">Back to home</a>
							<?php  }
	exit;						} ?>
