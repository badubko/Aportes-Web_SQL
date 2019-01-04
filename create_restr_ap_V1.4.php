
<?php
/**
 * Use an HTML form to create a new entry in the
 * users2 table.
 *
 */
require "./config_ap_V1.4.php";
require "./common_ap_V1.4.php";
if (isset($_POST['submit'])) {
    try  {
        $connection = new PDO($dsn, $username, $password, $options);
        
        $new_user2 = array(
            "dni"     		=> $_POST['dni'],
            "cuil"       	=> $_POST['cuil'],
            "rol"  			=> $_POST['rol'],
//            "estado"  		=> $_POST['estado'],
            "comentarios"  	=> $_POST['comentarios'],
            "tel_1"  		=> $_POST['tel_1'],
            "tel_2"  		=> $_POST['tel_2'],
            "a_socio"  		=> $_POST['a_socio'],
            "f_ingreso"  	=> $_POST['f_ingreso']
             );
             
        $sql2 = sprintf(
                "INSERT INTO %s (%s) values (%s)",
                "t_users2",
                implode(", ", array_keys($new_user2)),
                ":" . implode(", :", array_keys($new_user2))
        );
        $error = "";
        $statement = $connection->prepare($sql2);
        $statement->execute($new_user2);
        
    } catch(PDOException $error) {
       // echo $sql . "<br>" . $error->getMessage();
        echo "Hubo un error en el insert de: " , $_POST['apellido'] . "<br>" . $error->getMessage();
    }
}
?>

<?php require "templates/header.php"; ?>


<?php if (isset($_POST['submit']) && $statement && !$error){ ?>
    <blockquote><?php echo $_GET['apellido'] , ", " , $_GET['nombres']; ?> agregada/o a la base de Aportes.</blockquote>
<?php } ?>

<?php

try {
  require "./config_ap_V1.4.php";

  $conn_rol = new PDO($dsn, $username, $password, $options);
  
  $sql_rol = "SELECT rol  FROM t_roles ORDER BY rol";

  $stat_rol = $conn_rol->prepare($sql_rol);
  
  $stat_rol->execute();

  $a_rol = $stat_rol->fetchAll();
} catch(PDOException $error) {
  echo $sql_rol . "<br>" . $error->getMessage();
}         

?>


</h3>Agregar datos RESTRINGIDOS del Voluntario/a: <?php echo escape($_GET['apellido']) , ", " , escape($_GET['nombres']); ?> </h3>
<form method="post">
	 <?php
        $new_user2 = array(
            "dni"     		=>'dni',
            "cuil"       	=> 'cuil',
            "rol"  			=> 'rol',

            "comentarios"  	=> 'comentarios',
            "tel_1"  		=> 'tel_1',
            "tel_2"  		=> 'tel_2',
            "a_socio"  		=> 'a_socio',
            "f_ingreso"  	=> 'f_ingreso'
             );
	 
    foreach ($new_user2 as $key => $value) : ?>
    <?php switch ($key) {
	     case 'rol':?>
			<label for="Rol">Rol</label> 
			<select name="rol">
<!--			<option value="<?php echo escape($value); ?>"><?php echo escape($value); ?></option> -->
                <option value="">Vol</option> 
			<?php foreach ($a_rol as $role) { ?>
				<option value="<?php echo $role["rol"]; ?>"><?php echo $role["rol"]; ?></option>			
			<?php } ?>	
			</select>		
	<?php	break;	?>	
	<?php case 'estado': 	
		break;	?>	
	<?php case 'dni': 	?>
		<label for="<?php echo $key; ?>"><?php echo ucfirst($key); ?></label>    
	    <input type="text" name="<?php echo $key; ?>" iden="<?php echo $key; ?>" value="<?php echo escape($_GET['dni']); ?>" <?php echo ($key === 'dni' ? 'readonly' : null); ?>>
	<?php	break;
		default:		?>
		<label for="<?php echo $key; ?>"><?php echo ucfirst($key); ?></label>    
	    <input type="text" name="<?php echo $key; ?>" iden="<?php echo $key; ?>" >
	<?php	break;
						}	?>
    <?php endforeach; ?> 
    <input type="submit" name="submit" value="Guardar">
</form>

				<td><a href="create_restr_ap_V1.4.php?dni=<?php echo escape($new_user2["dni"]); ?>
				&apellido=<?php echo escape($new_user2["apellido"]); ?>
				&nombres=<?php echo escape($new_user2["nombres"]); ?>
				">Agreg Datos RESTR VOL</a></td>

<a href="index_ap_V1.4.php">Back to home</a>

<?php require "templates/footer.php"; ?>


