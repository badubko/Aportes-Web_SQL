<?php include "templates/header.php"; ?><h2>Agregar Voluntario</h2>

<form method="post">
	<label for="nombres">Nombres</label>
	<input type="text" name="nombres" id="nombres">
	<label for="apellido">Apellidos</label>
	<input type="text" name="apellido" id="apellido">
	<label for="email_1">Email Principal</label>
	<input type="text" name="email_1" id="email_1">
	<label for="dni">DNI</label>
	<input type="text" name="dni" id="dni">
	<label for="profesion">Profesion</label>
	<input type="text" name="profesion" id="profesion">
	<input type="submit" name="submit" value="Submit">
</form>

<a href="index_ap_V1.0.php">Back to home</a>

<?php include "templates/footer.php"; ?>
