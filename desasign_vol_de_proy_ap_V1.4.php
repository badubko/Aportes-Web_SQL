
<?php
/**
 * 
 * NOOO APLICA
 * 
 * OJJJJJOOOOO Este era para el modelo anterior de la t_hist_user_proy
 * 
 * Desasignar un usuario a un proyecto
 * Buscar los proyectos a los cuales esta asignado el VOL
 *
 */
require "./config_ap_V1.4.php";
require "./common_ap_V1.4.php";


if (isset($_POST['submit'])) {
    // Aca insertamos la desasignacion del Vol al proyecto
    // agregando una fila a t_hist_user_proy
    try  {

		
        $connection = new PDO($dsn, $username, $password, $options);
        
        $new_asign = array(

					"dni"     				=> $_GET['dni'],
					"p_num_corr_proy"       => $_GET['num_proy'],
							//"fecha_evento"			=> date("Y-m-d"),
					"f_desasign"				=> $_POST['f_asignac'],
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
	 
	
    <blockquote><?php echo $_GET['apellido'] , ", " , $_GET['nombres']  . "<br>" . 
					"Fue asignada/o al proyecto:",    $_GET['num_proy'] . "<br>" .
					" Nombre Proy: " , $_GET['p_nombre_proy'] . "<br>" .
					"  OSC: ", $_GET['osc']  ;?></blockquote> <br>
    <a href="index_ap_<?php echo escape($vers);?>.php">Back to home</a>
							<?php  }
	exit;						} ?>

<h2>Asignar Voluntario a proyecto</h2>

<?php  	require "./config_ap_V1.4.php";
	//	require "./common_ap_V1.4.php";
		require "verificar_asign_V1.4.php"; 

// echo verificar_asign( $_GET['dni'] , $_GET['num_proy']) , $_GET['dni'] , $_GET['num_proy'];

if ( verificar_asign( $_GET['dni'] , $_GET['num_proy']) == 'No_Asignado' 	) { ?>
		
<form method="post">
		<label for="coment_desemp">Comentario</label>
		<input type="text" name="coment_desemp" id="coment_desemp"><br>
		<label for="fecha_asign">Fecha Asignacion</label>
		<input type="text" name="f_asignac" id="f_asignac" value= "<?php echo escape(date("Y-m-d")); ?>">	<br>	
        <input type="submit" name="submit" value="Asignar" class="button">
</form>

<?php } 
else {  ?>
	   <blockquote><?php echo $_GET['apellido'] , ", " , $_GET['nombres']  . "<br>" . 
					"Ya esta asignada/o al proyecto:",    $_GET['num_proy'] . "<br>" .
					" Nombre Proy: " , $_GET['p_nombre_proy'] . "<br>" .
					"  OSC: ", $_GET['osc']  ;?></blockquote> <br>
 <?php   }  ?>


<a href="index_ap_<?php echo escape($vers);?>.php">Back to home</a>

<?php 

// echo "Today is " . date("Y/m/d H i") . "<br>";
// print_r(timezone_identifiers_list(2));

require "templates/footer.php"; 
exit; ?>


