<?php
 require "./config_ap_V1.2.php";
 require "./common_ap_V1.2.php";

if (isset($_POST['submit'])) {
   

try {
	
	$connection = new PDO($dsn, $username, $password, $options);
	$dni = $_GET['dni'];
	$apellido = $_GET['apellido'];
	$nombres = $_GET['nombres'];
    $especialidad = $_POST['especialidad'];
    
    // set the PDO error mode to exception
    $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // prepare sql and bind parameters
    $stmt = $connection->prepare("INSERT INTO t_especialidad_user (dni, especialidad) VALUES (:dni, :especialidad)");
    $stmt->bindParam(':dni', $dni);
    $stmt->bindParam(':especialidad', $especialidad);
   
    // insertar nueva especialidad

    $stmt->execute();
     $result = $stmt->fetchAll();
     
    // echo "Nueva especialidad $especialidad insertada";
    } catch(PDOException $e)
		{  echo "Error: " . "<br>" . $e->getMessage();    }

}
?>

<?php if (isset($_POST['submit']) && $stmt) { ?>
    <blockquote><?php echo $_POST['especialidad']; ?> successfully added.</blockquote>
<?php } ?>

<h2>Agregar Especialidad V1.2</h2>

<form method="post">
	<label for="especialdad">Especialdad</label>
		<input type="text" name="especialidad" id="especialidad">
		<input type="submit" name="submit" value="Submit">
</form>
<?php
	$dni = $_GET['dni'];
	$apellido = $_GET['apellido'];
	$nombres = $_GET['nombres'];
?>
<a href="listar-esp_ap_V1.2.php?dni=<?php echo escape($dni); ?>
        &apellido=<?php echo escape($apellido); ?>
        &nombres=<?php echo escape($nombres); ?>
        ">Listar Esp VOL</a>
<a href="index_ap_V1.2.php">Back to home</a>

<?php require "templates/footer.php"; ?>


