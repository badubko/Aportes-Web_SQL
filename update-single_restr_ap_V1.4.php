<?php
/**
 * Use an HTML form to edit an entry in the
 * users2 table.
 * Update de datos restringidos de un VOL
 * Version con drop-down de ROL 
 *
 */
require "./config_ap_V1.4.php";
require "./common_ap_V1.4.php";

if (isset($_POST['submit'])) {
  try {
    $connection = new PDO($dsn, $username, $password, $options);
    $user =[
      "dni"      		=> $_POST['dni'],   
      "cuil"  			=> $_POST['cuil'],
      "rol" 			=> $_POST['rol'],
      "estado"  		=> $_POST['estado'],
      "comentarios"  	=> $_POST['comentarios'],
      "tel_1"			=> $_POST['tel_1'],
      "tel_2"			=> $_POST['tel_2'],
      "a_socio"			=> $_POST['a_socio'],
      "f_ingreso"     	=> $_POST['f_ingreso']
  
    ];
    
   //$apellido = $_POST['apellido'];
   //$nombres = $_POST['nombres'];
    
    $sql1 = "UPDATE t_users2 
            SET dni = :dni,
				cuil = :cuil,
				rol = :rol, 
				estado = :estado,
				comentarios = :comentarios,
				tel_1 = :tel_1,
				tel_2 = :tel_2,
				a_socio = :a_socio,
				f_ingreso = :f_ingreso          
             WHERE dni = :dni";
 
  $statement = $connection->prepare($sql1);
  $statement->execute($user);
  
  } catch(PDOException $error) {
      echo $sql1 . "<br>" . $error->getMessage();
  }
}
 
 
if (isset($_GET['dni'])) {
  try {

    $connection = new PDO($dsn, $username, $password, $options);
    $dni = $_GET['dni'];
    $sql1 = "SELECT * FROM t_users2 WHERE dni = :dni";
    $statement = $connection->prepare($sql1);
    $statement->bindValue(':dni', $dni);
    $statement->execute();
    
    $user = $statement->fetch(PDO::FETCH_ASSOC);
  } catch(PDOException $error) {
      echo $sql1 . "<br>" . $error->getMessage();
  }
} else {
    echo "Something went wrong AQUI!" ;
    exit;
}
?>

<?php require "templates/header.php"; ?>



//<?php
  //  $apellido = $_GET['apellido'];
  //  $nombres = $_GET['nombres'];
// ?>



<?php if (isset($_POST['submit']) && $statement) : ?>
	<blockquote>
	<?php echo escape($_GET['apellido']) , ", " , escape($_GET['nombres']); ?> Fue actualizada/o OK. 
	</blockquote>
	
<?php endif; ?>

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
</h3>Editar datos RESTRINGIDOS del Voluntario/a: <?php echo escape($_GET['apellido']) , ", " , escape($_GET['nombres']); ?> </h3>
<!-- <h3>Editar datos RESTRINGIDOS del Voluntario/a:  <?php echo escape($apellido) , ", " , escape($nombres); ?></h3> -->
<!-- <h3><?php echo escape($apellido) , ", " , escape($nombres); ?></h3> -->

<form method="post">
    <?php foreach ($user as $key => $value) : ?>
	  <?php if ( $key != 'rol') { ?>
      <label for="<?php echo $key; ?>"><?php echo ucfirst($key); ?></label>
      
	    <input type="text" name="<?php echo $key; ?>" iden="<?php echo $key; ?>" value="<?php echo escape($value); ?>" <?php echo ($key === 'dni' ? 'readonly' : null); ?>>
		<?php } else { ?>
<!--			<p> -->
			<label for="Rol">Rol</label> 
			<select name="rol">
<!--			<option value="">Seleccione...</option> -->
			<option value="<?php echo escape($value); ?>"><?php echo escape($value); ?></option>
			<?php foreach ($a_rol as $role) { ?>
				<option value="<?php echo $role["rol"]; ?>"><?php echo $role["rol"]; ?></option>
			<?php } ?>
			</select>
<!--			</p>  -->
		<?php }  ?>	
			
			
    <?php endforeach; ?> 
    <input type="submit" name="submit" value="Guardar">
</form>

<h2> </h2>
<a href="read_ap_V1.4.php">Modif Otro Voluntario</a>
<h2> </h2>
<a href="index_ap_V1.4.php">Back to home</a>

<?php require "templates/footer.php"; ?>
