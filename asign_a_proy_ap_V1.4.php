
<?php
/**
 *
 * asignar un usuario a un proyecto
 * 
 *
 */
require "./config_ap_V1.4.php";
require "./common_ap_V1.4.php";

if (isset($_POST['submit'])) {
   
    try  {

        $connection = new PDO($dsn, $username, $password, $options);
        
        $new_asign = array(

            "dni"     				=> $_GET['dni'],
            "p_num_corr_proy"       => $_GET['num_proy'],
							//"fecha_evento"			=> date("Y-m-d"),
            "f_asignac"			=> $_POST['f_asignac'],
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



require "templates/header.php";

 if (  $statement && !$error){ ?>
	
    <blockquote><?php echo $_GET['apellido'] , ", " , $_GET['nombres']; ?> Asignada/o al proyecto.</blockquote>
    <a href="index_ap_<?php echo escape($vers);?>.php">Back to home</a>
							<?php  }
	exit;						} ?>

<h2>Asignar Voluntario a proyecto</h2>

<?php  	require "./config_ap_V1.4.php";
	//	require "./common_ap_V1.4.php";?>
		
<form method="post">
		<label for="coment_desemp">Comentario</label>
		<input type="text" name="coment_desemp" id="coment_desemp"><br>
		<label for="fecha_asign">Fecha Asignacion</label>
		<input type="text" name="f_asignac" id="f_asignac" value= "<?php echo escape(date("Y-m-d")); ?>">	<br>	
        <input type="submit" name="submit" value="Asignar" class="button">
</form>


<a href="index_ap_<?php echo escape($vers);?>.php">Back to home</a>

<?php 

// echo "Today is " . date("Y/m/d H i") . "<br>";
// print_r(timezone_identifiers_list(2));

require "templates/footer.php"; 
exit; ?>


