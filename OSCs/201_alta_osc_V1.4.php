
<?php
/**
 * Use an HTML form to add  a new entry in the
 * osc table.
 *
 */
if (isset($_POST['submit'])) {
    require "../config_ap_V1.4.php";
    require "../common_ap_V1.4.php";

    try  {
        $connection = new PDO($dsn, $username, $password, $options);
        
        $new_osc = array(
            "osc_nombre" => $_POST['osc_nombre'],
   // OSC Direccion 1         
            "osc_calle_1" => $_POST['osc_calle_1'],
            "osc_num_1" => $_POST['osc_num_1'],
            "osc_ciudad_1" => $_POST['osc_ciudad_1'],
            "osc_cp_1" => $_POST['osc_cp_1'],
            "osc_prov_1" => $_POST['osc_prov_1'],
   // OSC Direccion 2         
            "osc_calle_2" => $_POST['osc_calle_2'],
            "osc_num_2" => $_POST['osc_num_2'],
            "osc_ciudad_2" => $_POST['osc_ciudad_2'],
            "osc_cp_2" => $_POST['osc_cp_2'],
            "osc_prov_2" => $_POST['osc_prov_2'],
                     
            "osc_pag_web" => $_POST['osc_pag_web'],
            "osc_acuerdo" => $_POST['osc_acuerdo'],
            "osc_notas"  => $_POST['osc_notas'],

        );
        $sql = sprintf(
                "INSERT INTO %s (%s) values (%s)",
                "t_osc",
                implode(", ", array_keys($new_osc)),
                ":" . implode(", :", array_keys($new_osc))
        );
        $error = "";
        $statement = $connection->prepare($sql);
        $statement->execute($new_osc);
        
    } catch(PDOException $error) {
       // echo $sql . "<br>" . $error->getMessage();
        echo "Hubo un error en el insert de: " , $_POST['osc_nombre'] . "<br>" . $error->getMessage();
    }
}
?>

<?php require "../templates/header_osc.php"; ?>



<?php if (isset($_POST['submit']) && $statement && !$error){ ?>
    <blockquote><?php echo $_POST['osc_nombre'] ?> Registrada en la base de Aportes.</blockquote><br>
    <td><a href="200_OSCs_<?php echo escape($vers);?>.php">Menu Principal OSC</a></td><br>
    <td><a href="202_1_admin_osc_<?php echo escape($vers);?>.php?osc_nombre=<?php echo $_POST['osc_nombre']; ?>
				">Administrar OSC</a></td><br><br>
    <a href="../index_ap_V1.4.php">Back to home</a>
    
<?php require "../templates/footer_osc.php"; ?>
<?php 
exit;
} ?>

<?php
 $a_acuerdo = array( "Firmado" , "Pendiente" , "N/D");
?>
<h2>Agregar OSC</h2>

<form method="post">
	
	<label for="osc_nombre">Nombre OSC</label><br>
	<input type="text" name="osc_nombre" id="osc_nombre"><br><br>
	
	<label for="osc_calle_1">Nombre Calle 1</label><br>
		<input type="text" name="osc_calle_1" id="osc_calle_1" value="N/D"><br>
	<label for="osc_num_1">Numero 1</label><br>
		<input type="text" name="osc_num_1" id="osc_num_1" value="N/D"><br>		
		
	<label for="osc_ciudad_1">Ciudad 1</label><br>
		<input type="text" name="osc_ciudad_1" id="osc_ciudad_1" value="N/D"><br>		
	<label for="osc_cp_1">Codigo Postal 1</label><br>
		<input type="text" name="osc_cp_1" id="osc_cp_1" value="N/D"><br>
	<label for="osc_prov_1">Provincia 1</label><br>
		<input type="text" name="osc_prov_1" id="osc_prov_1" value="N/D"><br><br>		
	
		<label for="osc_calle_2">Nombre Calle 2</label><br>
		<input type="text" name="osc_calle_2" id="osc_calle_2" value="N/D"><br>	
	<label for="osc_num_2">Numero 2</label><br>
		<input type="text" name="osc_num_2" id="osc_num_2" value="N/D"><br>		
	<label for="osc_ciudad_2">Ciudad 2</label><br>
		<input type="text" name="osc_ciudad_2" id="osc_ciudad_2" value="N/D"><br>		
	<label for="osc_cp_2">Codigo Postal 2</label><br>
		<input type="text" name="osc_cp_2" id="osc_cp_2" value="N/D"><br>
	<label for="osc_prov_2">Provincia 2</label><br>
		<input type="text" name="osc_prov_2" id="osc_prov_2" value="N/D"><br><br>	
		
	<label for="osc_pag_web">Pagina web</label><br>
		<input type="text" name="osc_pag_web" id="osc_pag_web" value="N/D"><br><br>	

<!--		
    El estado de la OSC se actualiza en t_osc_logs_estado y el trigger lo
    replica aqui
    Por ahora toma el valor default que es "Identificada" que se inserta aqui
    Hay que agregar el insert correspondiente en t_osc_logs_estado
    
    
	<label for="osc_estado">Estado OSC</label><br>
		<input type="text" name="osc_estado" id="osc_estado"><br><br>

	<label for="osc_acuerdo">OSC Firmo acuerdo?</label><br>
		<input type="text" name="osc_acuerdo" id="osc_acuerdo"><br><br>
-->
	
    <label for="osc_acuerdo">OSC Firmo acuerdo?</label><br>
	<select name="osc_acuerdo">
	<option value=""selected hidden>Seleccione...</option>
	<?php foreach ($a_acuerdo as $acuerdo) { ?>
		<option value="<?php echo $acuerdo; ?>"><?php echo $acuerdo; ?></option>
	<?php } ?>	
	</select><br><br>
						
	<label for="osc_notas">Notas sobre OSC</label><br>
		<input type="text" name="osc_notas" id="osc_notas" value="No hay notas"><br><br>

	<input type="submit" name="submit" value="Agregar OSC">
</form>

<?php
require "../config_ap_V1.4.php";
require "../common_ap_V1.4.php";
?>

<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>

<?php require "../templates/footer_osc.php"; ?>

<?php // if (isset($_POST['submit']) && $statement && !$error){ ?>
   
<!--
				<td><a href="202_admin_osc_<?php echo escape($vers);?>?dni=<?php echo $_POST['osc']; ?>
				">Administrar OSC</a></td>
-->
<?php // } ?>

<?php
//require "../config_ap_V1.4.php";
//require "../common_ap_V1.4.php";
?>

<!--
<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>
-->



