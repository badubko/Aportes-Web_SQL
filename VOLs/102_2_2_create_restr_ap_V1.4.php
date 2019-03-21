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
 * users2 table.
 * Agrega los datos restringidos de un usuario.
 *
 */
require "../config_ap_V1.4.php";
require "../common_ap_V1.4.php";
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
        $error="";
        $statement = $connection->prepare($sql2);
        $statement->execute($new_user2);
	
        
        
    } catch(PDOException $error) {
       // echo $sql . "<br>" . $error->getMessage();
        echo "Hubo un error en el insert de: " , $_GET['apellido'] , ", " , $_GET['nombres'] . "<br>" . $error->getMessage();
    }
}
?>

<?php require "../templates/header_vol.php"; ?>


<?php if (isset($_POST['submit']) && $statement && !$error){

 require "../config_ap_V1.4.php"; ?>
 
<blockquote><?php echo $_GET['dni'] ; ?> Agregado estado inicial = Disponible.</blockquote>

<?php
try {
	
	$connection_estado = new PDO($dsn, $username, $password, $options);
	$dni = $_POST['dni'];
	$estado = 'Disponible';
	$consideraciones = 'Estado Inicial de Nuevo Voluntario';
    
    
    // set the PDO error mode to exception
    $connection_estado->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // prepare sql and bind parameters
    $stmt_estado = $connection_estado->prepare("INSERT INTO t_logs_estado_user (dni, estado, consideraciones) VALUES (:dni, :estado, :consideraciones)");
    $stmt_estado->bindParam(':dni', $dni);
    $stmt_estado->bindParam(':estado', $estado);
    $stmt_estado->bindParam(':consideraciones', $consideraciones);
    
   
    // insertar Estado inicial= Disponible para Voluntario recien creado

    $stmt_estado->execute();
    // $result = $stmt->fetchAll();
    $e_estado = "";
    
    } catch(PDOException $e_estado)
		{  echo "Error: " . "<br>" . $e_estado->getMessage() . "<br>" . "No se pudo agregar estado: $estado" ;    }


?>
	
    <blockquote><?php echo $_GET['apellido'] , ", " , $_GET['nombres']; ?> Datos restringidos agregados.</blockquote>
    <a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>
<?php 
exit;
} ?>

<?php

try {
  require "../config_ap_V1.4.php";

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
                <option value="Vol">Vol</option> 
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


<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>

<?php require "../templates/footer_vol.php"; ?>


