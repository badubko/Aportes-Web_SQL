<?php
 require "./config_ap_V1.4.php";
 require "./common_ap_V1.4.php";

if (isset($_POST['submit'])) {
   

try {
	
	$connection = new PDO($dsn, $username, $password, $options);
	$dni = $_GET['dni'];
	$apellido = $_GET['apellido'];
	$nombres = $_GET['nombres'];
	$est_act = $_GET['est_act'];
    $estado = $_POST['estado'];
    $consideraciones = $_POST['consideraciones'];
    
    // set the PDO error mode to exception
    $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // prepare sql and bind parameters
    $stmt = $connection->prepare(" INSERT INTO t_logs_estado_user (dni, estado, consideraciones) VALUES (:dni, :estado, :consideraciones)");
    $stmt->bindParam(':dni', $dni);
    $stmt->bindParam(':estado', $estado);
    $stmt->bindParam(':consideraciones', $consideraciones);
    
    // insertar nuevo estado

    $stmt->execute();
    // $result = $stmt->fetchAll();
    $e = "";
    
    } catch(PDOException $e)
		{  echo "Error: " . "<br>" . $e->getMessage() . "<br>" . "No se pudo modificar estado a: $estado" ;    }

}
?>

<?php if (isset($_POST['submit']) && $stmt && !$e ) { ?>
	<blockquote>Registrado nuevo estado: <?php echo $_POST['estado']; ?></blockquote>
	<blockquote>Para Voluntaria/o      : <?php echo $_GET['apellido'] , ", " , $_GET['nombres']; ?> </blockquote>
    
<?php } ?>



<?php
// Listado de estados posibles a los que se puede pasar desde 
// estado != Asignado o estado != De_Baja
 $a_estados_pos = array( 	"Disponible" , "Con_Restricc" , 
							"Puntual" , "ND_Temp" , "De_Baja" , "Interno");
?>

<!--
<form method="post" action="">
-->
<body>
<h2>Modicar estado de VOL V1.4</h2>
<blockquote>Voluntaria/o:  <?php echo escape($_GET['apellido']); ?>, <?php echo escape($_GET['nombres']); ?></blockquote>
<blockquote>Estado actual:  <?php echo escape($_GET['est_act']); ?></blockquote>
<form method="post">

	<p>
		<label for="estado">Nuevo Estado</label> 
		<select name="estado">
		<option value="">Seleccione...</option>
		<?php foreach ($a_estados_pos as $est_pos) { ?>
			<option value="<?php echo $est_pos; ?>"><?php echo $est_pos; ?></option>
		<?php } ?>
		</select>
	</p>
	<label for="consideraciones">Consideraciones</label>
		<input type="text" name="consideraciones" id="consideraciones">
	<input type="submit" name="submit" value="Guardar">

</form>
	


<?php
	$dni = $_GET['dni'];
	$apellido = $_GET['apellido'];
	$nombres = $_GET['nombres'];
?>
</body>
<a href="cambiar_est_vol_ap_<?php echo escape($vers);?>.php">Buscar otro VOL</a>
<a href="index_ap_<?php echo escape($vers);?>.php">Back to home</a>

<?php require "templates/footer.php"; ?>


