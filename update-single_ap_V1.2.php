<?php
/**
 * Use an HTML form to edit an entry in the
 * users table.
 *
 */
require "./config_ap_V1.2.php";
require "./common_ap_V1.2.php";

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

<?php require "templates/header.php"; ?>

<?php if (isset($_POST['submit']) && $statement) : ?>
	<blockquote><?php echo escape($_POST['apellido']); ?> successfully updated.</blockquote>
<?php endif; ?>

<h2>Edit a user</h2>

<form method="post">
    <?php foreach ($user as $key => $value) : ?>
      <label for="<?php echo $key; ?>"><?php echo ucfirst($key); ?></label>
	    <input type="text" name="<?php echo $key; ?>" dni="<?php echo $key; ?>" value="<?php echo escape($value); ?>" <?php echo ($key === 'dni' ? 'readonly' : null); ?>>
    <?php endforeach; ?> 
    <input type="submit" name="submit" value="Guardar">
</form>

<h2> </h2>
<a href="read_ap_V1.2.php">Modif Otro Voluntario</a>
<h2> </h2>
<a href="index_ap_V1.2.php">Back to home</a>

<?php require "templates/footer.php"; ?>
