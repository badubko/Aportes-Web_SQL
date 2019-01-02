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
			<option value="">Seleccione...</option> 
			<?php foreach ($a_prof as $profe) { ?>
				<option value="<?php echo $profe["profesion"]; ?>"><?php echo $profe["profesion"]; ?></option>
			<?php } ?>
			</select>
			</p>
	<label for="email_1">Email Principal</label>
		<input type="text" name="email_1" id="email_1">
	<label for="email_2">Email Alternativo</label>
		<input type="text" name="email_2" id="email_2">	
	<input type="submit" name="submit" value="Submit">
</form>
