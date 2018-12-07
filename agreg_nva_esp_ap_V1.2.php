<?php
$servername = "localhost";
$username = "username";
$password = "password";
$dbname = "myDBPDO";

try {
	require "./config_ap_V1.2.php";
	require "./common_ap_V1.2.php";

	$connection = new PDO($dsn, $username, $password, $options);
	$dni = $_GET['dni'];
    $especialidad = $_GET['especialidad'];
    
    // set the PDO error mode to exception
    $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // prepare sql and bind parameters
    $stmt = $conn->prepare("INSERT INTO t_especialidad_user (dni, especialidad) VALUES (:dni, :especialidad)");
    $stmt->bindParam(':dni', $dni);
    $stmt->bindParam(':especialidad', $especialidad);
   
    // insertar nueva especialidad

    $stmt->execute();

    echo "Nueva especialidad $especialidad insertada";
    }
catch(PDOException $e)
    {
    echo "Error: " . $e->getMessage();
    }
$conn = null;
?>
