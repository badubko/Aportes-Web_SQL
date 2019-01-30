
<?php
/**
 *
 * asignar un usuario a un proyecto
 * 
 *
 */

    require "./config_ap_V1.4.php";
    require "./common_ap_V1.4.php";

    try  {

        $connection = new PDO($dsn, $username, $password, $options);
        
        $new_asign = array(

            "dni"     				=> $_GET['dni'],
            "p_num_corr_proy"       => $_GET['num_proy'],
            "fecha_evento"			=> date("Y-m-d"),
            "tipo_evento"  			=> 'Asignacion',
            "coment_desemp"  		=> 'Evento de asignacion a proyecto'
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

?>

<?php require "templates/header.php"; ?>


<?php if (  $statement && !$error){ ?>
	
    <blockquote><?php echo $_GET['apellido'] , ", " , $_GET['nombres']; ?> Asignada/o al proyecto.</blockquote>

<?php

 } ?>

<h2>Asignar Voluntario a proyecto</h2>

<form method="post">
<label for="coment_desemp">Comentario</label>
		<input type="text" name="coment_desemp" id="coment_desemp">
<label for="fecha_evento">Fecha Asignacion</label>
		<input type="text" name="fecha_evento" id="fecha_evento">		

</form>

<a href="index_ap_V1.4.php">Back to home</a>

<?php 
// echo "Today is " . date("Y/m/d H i") . "<br>";

// print_r(timezone_identifiers_list(2));

require "templates/footer.php"; 
exit; ?>


