
<head>
<link rel="stylesheet" reference="text/css" href="../css/style.css" >
</head>


<?php

// Agregar contactos para una OSC

 require "../config_ap_V1.4.php";
 require "../common_ap_V1.4.php";


if (isset($_POST['submit'])) {

    try  {
        $connection = new PDO($dsn, $username, $password, $options);
        $osc_nombre = $_GET['osc_nombre'];
        
        $new_cont = array(
            "osc_nombre" 				=> $_GET['osc_nombre'],
            "osc_contacto_nombres"  	=> $_POST['osc_contacto_nombres'],
            "osc_contacto_apellido"  	=> $_POST['osc_contacto_apellido'],           
            "osc_contacto_cel"  		=> $_POST['osc_contacto_cel'],
            "osc_contacto_tel_fijo"  	=> $_POST['osc_contacto_tel_fijo'],
            "osc_contacto_email"  		=> $_POST['osc_contacto_email'],
            "osc_contacto_posicion"  	=> $_POST['osc_contacto_posicion'],
            "osc_contacto_horario"  	=> $_POST['osc_contacto_horario']

						);
						
        $sql_cont = sprintf(
					"INSERT INTO %s (%s) values (%s)",
					"t_osc_contactos",
					implode(", ", array_keys($new_cont)),
					":" . implode(", :", array_keys($new_cont))
        );

        $statement = $connection->prepare($sql_cont);
        $statement->execute($new_cont);
        $error= "";
    } catch(PDOException $error) {
       // echo $sql . "<br>" . $error->getMessage();
        echo "Hubo un error en el insert de: " , $_POST['osc_contacto_apellido'] . "<br>" . $error->getMessage();
    }
}
?>

<?php require "../templates/header_osc.php"; ?>


<?php if (isset($_POST['submit']) && $statement && !$error){ ?>
	
    <h3><?php echo $_POST['osc_contacto_apellido'] , ", " , $_POST['osc_contacto_nombres']; ?> agregada/o a la base de Aportes.</h3>
	<h3>como contacto de OSC: <?php echo $osc_nombre ?></h3>
	
<?php } ?>



<h2>Agregar nuevo contacto para OSC:</h2>
<h3><?php echo escape($_GET["osc_nombre"]); ?></h3>

<form method="post">
	<label for="osc_contacto_nombres">Nombres Contacto</label>
		<input type="text" name="osc_contacto_nombres" id="osc_contacto_nombres">
	
	<label for="osc_contacto_apellido">Apellido Contacto</label>
		<input type="text" name="osc_contacto_apellido" id="osc_contacto_apellido">
	
	<label for="osc_contacto_cel">Numero Celular</label>
		<input type="text" name="osc_contacto_cel" id="osc_contacto_cel">
	
	<label for="osc_contacto_tel_fijo">Numero Tel Fijo</label>
		<input type="text" name="osc_contacto_tel_fijo" id="osc_contacto_tel_fijo">
	
		
	<label for="osc_contacto_email">Email Principal</label>
		<input type="text" name="osc_contacto_email" id="osc_contacto_email">
		
	<label for="osc_contacto_posicion">Posicion Contacto</label>
		<input type="text" name="osc_contacto_posicion" id="osc_contacto_posicion">	
	
	<label for="osc_contacto_horario">Horarios del Contacto</label>
		<input type="text" name="osc_contacto_horario" id="osc_contacto_horario">	
		
	<br><br>
	<input type="submit" name="submit" value="Guardar Datos Contacto">
</form>

<a href="202_1_2_admin_cont_osc_<?php echo escape($vers);?>.php
				?osc_nombre=<?php echo escape($_GET["osc_nombre"]); ?>
				"><strong>Administrar Contactos</strong></a> - Administar los contactos de la OSC<br>

<a href="202_1_admin_osc_<?php echo escape($vers);?>.php?osc_nombre=<?php echo escape($_GET['osc_nombre']); ?>
        "><strong>Menu Administrar OSC</strong></a><br>  
             
<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>

<?php require "../templates/footer_osc.php"; ?>
