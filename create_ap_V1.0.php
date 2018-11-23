
<?php
/**
 * Use an HTML form to create a new entry in the
 * users table.
 *
 */
if (isset($_POST['submit'])) {
    require "../config_ap_V1.0.php";
    require "../common_ap_V1.0.php";
    try  {
        $connection = new PDO($dsn, $username, $password, $options);
        
        $new_user = array(
            "nombre" => $_POST['nombres'],
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
    } catch(PDOException $error) {
        echo $sql . "<br>" . $error->getMessage();
    }
}
?>

<?php require "templates/header.php"; ?>

<?php if (isset($_POST['submit']) && $statement) { ?>
    <blockquote><?php echo $_POST['apellido']; ?> successfully added.</blockquote>
<?php } ?>

<h2>Agregar Voluntario V1.0</h2>

<form method="post">
	<label for="nombres">Nombres</label>
		<input type="text" name="nombres" id="nombres">
	<label for="apellido">Apellidos</label>
		<input type="text" name="apellido" id="apellido">
	<label for="dni">DNI</label>
		<input type="text" name="dni" id="dni">
	<label for="profesion">Profesion</label>
		<input type="text" name="profesion" id="profesion">
	<label for="email_1">Email Principal</label>
		<input type="text" name="email_1" id="email_1">
	<label for="email_2">Email Alternativo</label>
		<input type="text" name="email_2" id="email_2">	
	<input type="submit" name="submit" value="submit">
</form>

<a href="index_ap_V1.0.php">Back to home</a>

<?php require "templates/footer.php"; ?>


