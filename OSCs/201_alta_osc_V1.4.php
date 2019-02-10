
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
    
    <td><a href="202_admin_osc_<?php echo escape($vers);?>?dni=<?php echo $_POST['osc_nombre']; ?>
				">Administrar OSC</a></td><br>
    <a href="../index_ap_V1.4.php">Back to home</a>
    
<?php require "../templates/footer_osc.php"; ?>
<?php 
exit;
} ?>


<h2>Agregar OSC</h2>

<form method="post">
	<label for="osc_nombre">Nombre OSC</label><br>
		<input type="text" name="osc_nombre" id="osc_nombre"><br>
	<label for="osc_notas">Notas sobre OSC</label><br>
		<input type="text" name="osc_notas" id="osc_notas"><br><br>

	<input type="submit" name="submit" value="Agregar OSC">
</form>

<?php if (isset($_POST['submit']) && $statement && !$error){ ?>
   
				<td><a href="202_admin_osc_<?php echo escape($vers);?>?dni=<?php echo $_POST['osc']; ?>
				">Administrar OSC</a></td>
<?php } ?>

<?php
//require "../config_ap_V1.4.php";
//require "../common_ap_V1.4.php";
?>

<!--
<a href="../index_ap_<?php echo escape($vers);?>.php">Back to home</a>
-->
<a href="../index_ap_V1.4.php">Back to home</a>
<?php require "../templates/footer_osc.php"; ?>


