<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Aportes: VOLs </title>

	<link rel="stylesheet" href="../css/style.css">
</head>
<?php
/**
 * Use an HTML form to create a new entry in the
 * users1 table.
 *
 */
if (isset($_POST['submit'])) {
    require "../config_ap_V1.4.php";
    require "../common_ap_V1.4.php";

    try  {
        $connection = new PDO($dsn, $username, $password, $options);
        
        $new_user = array(
            "nombres" => $_POST['nombres'],
            "apellido"  => $_POST['apellido'],
            "dni"     => $_POST['dni'],
            "profesion"       => $_POST['profesion'],
            "email_1"  => $_POST['email_1'],
            "email_2"  => $_POST['email_2']
        );
        $sql = sprintf(
                "INSERT INTO %s (%s) values (%s)",
                "t_users1",
                implode(", ", array_keys($new_user)),
                ":" . implode(", :", array_keys($new_user))
        );

        $statement = $connection->prepare($sql);
        $statement->execute($new_user);
        $error= "";
    } catch(PDOException $error) {
       // echo $sql . "<br>" . $error->getMessage();
        echo "Hubo un error en el insert de: " , $_POST['apellido'] . "<br>" . $error->getMessage();
    }
}
?>

<?php require "../templates/header_vol.php"; ?>


<?php if (isset($_POST['submit']) && $statement && !$error){ ?>
    <blockquote><?php echo $_POST['apellido'] , ", " , $_POST['nombres']; ?> agregada/o a la base de Aportes.</blockquote>

<?php } ?>

<?php

try {
  require "../config_ap_V1.4.php";

  $conn_prof = new PDO($dsn, $username, $password, $options);
  
  $sql_prof = "SELECT profesion  FROM t_profesiones ORDER BY profesion";

  $stat_prof = $conn_prof->prepare($sql_prof);
  
  $stat_prof->execute();

  $a_prof = $stat_prof->fetchAll();
} catch(PDOException $error) {
  echo $sql_prof . "<br>" . $error->getMessage();
}         

?>



<h2>Agregar Voluntario</h2>

<form method="post">
	<label for="nombres">Nombres</label>
		<input type="text" name="nombres" id="nombres">
	<label for="apellido">Apellidos</label>
		<input type="text" name="apellido" id="apellido">
	<label for="dni">DNI</label>
	<input type="text" name="dni" id="dni">
			<p>
			<label for="profesion">Profesion</label> 
			<select name="profesion">
			<option value="N/D">Seleccione...</option> 
			<?php foreach ($a_prof as $profe) { ?>
				<option value="<?php echo $profe["profesion"]; ?>"><?php echo $profe["profesion"]; ?></option>
			<?php } ?>
			</select>
			</p>
	<label for="email_1">Email Principal</label>
		<input type="text" name="email_1" id="email_1">
	<label for="email_2">Email Alternativo</label>
		<input type="text" name="email_2" id="email_2">	
	<input type="submit" name="submit" value="Guardar">
</form>

<?php if (isset($_POST['submit']) && $statement && !$error){ ?>
   
				<td><a href="102_2_2_create_restr_ap_<?php echo escape($vers);?>.php?dni=<?php echo $_POST['dni']; ?>
				&apellido=<?php echo $_POST['apellido']; ?>
				&nombres=<?php echo $_POST['nombres']; ?>
				">Agreg Datos RESTR VOL</a></td>
<?php } ?>


<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>

<?php require "../templates/footer_vol.php"; ?>


