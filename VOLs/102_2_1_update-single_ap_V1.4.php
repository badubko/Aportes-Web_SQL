<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

<!--
	<title>Aportes: VOLs </title>
-->

	<link rel="stylesheet" href="../css/style.css">
</head>


<?php
/**
 * Use an HTML form to edit an entry in the
 * users1 table.
 * 
 * Version con drop-down de profesion
 *
 */
require "../config_ap_V1.4.php";
require "../common_ap_V1.4.php";

if (isset($_POST['submit'])) {
  try {
    $connection = new PDO($dsn, $username, $password, $options);
    $user =[
      "dni"      	=> $_POST['dni'],
      "apellido" 	=> $_POST['apellido'],
      "nombres"  	=> $_POST['nombres'],
      "profesion"	=> $_POST['profesion'],
      "email_1"     => $_POST['email_1'],
      "email_2"  	=> $_POST['email_2']
    
    ];

    $sql1 = "UPDATE t_users1 
            SET dni = :dni, 
              apellido = :apellido, 
              nombres = :nombres, 
              profesion = :profesion,
              email_1 = :email_1,
              email_2 = :email_2
             
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
    $sql1 = "SELECT * FROM t_users1 WHERE dni = :dni";
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

<?php require "../templates/header_vol.php"; ?>

<?php if (isset($_POST['submit']) && $statement) : ?>
	<blockquote>
	<?php echo escape($_POST['apellido']) , ", " , escape($_POST['nombres']); ?> Fue actualizada/o OK. 
	</blockquote>
	
<?php endif; ?>

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



<h2>Editar datos publicos de un Voluntario</h2>

<form method="post">
    <?php foreach ($user as $key => $value) : ?>
	  <?php if ( $key != 'profesion') { ?>
      <label for="<?php echo $key; ?>"><?php echo ucfirst($key); ?></label>
      
	    <input type="text" name="<?php echo $key; ?>" iden="<?php echo $key; ?>" value="<?php echo escape($value); ?>" <?php echo ($key === 'dni' ? 'readonly' : null); ?>>
		<?php } else { ?>
			<p>
			<label for="profesion">Profesion</label> 
			<select name="profesion">
<!--			<option value="">Seleccione...</option> -->
			<option value="<?php echo escape($value); ?>"><?php echo escape($value); ?></option>
			<?php foreach ($a_prof as $profe) { ?>
				<option value="<?php echo $profe["profesion"]; ?>"><?php echo $profe["profesion"]; ?></option>
			<?php } ?>
			</select>
			</p>
		<?php }  ?>	
			
			
    <?php endforeach; ?> 
    <input type="submit" name="submit" value="Guardar">
</form>

<h2> </h2>
<a href="102_read_ap_<?php echo escape($vers);?>.php">Modif Otro Voluntario</a>
<h2> </h2>
<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>

<?php require "../templates/footer_vol.php"; ?>
