
<head>
<link rel="stylesheet" reference="text/css" href="./css/style.css" >
</head>

<?php
/**
 *
 * desasignar un usuario a un proyecto
 * 
 *
 */
require "./config_ap_V1.4.php";
// require "./common_ap_V1.4.php";


if (isset($_POST['submit01'])) {
    // Aca actualizamos en t_hist_user_proy 
    // 
    // la desasignacion del Vol al proyecto
    // Actualizando la f_desasign y agregando el comentario
 
    try  {

        $connection = new PDO($dsn, $username, $password, $options);
        
//        $f_max='2100-01-01';  Paso a config

        $new_asign =[
					"dni"     				=> $_GET['dni'],
					"p_num_corr_proy"       => $_GET['p_num_corr_proy'],
					"f_desasign"			=> $_POST['f_desasign'],
					"coment_desasign"  		=> $_POST['coment_desasign'],
					"f_max"					=> $f_max
					];
						
//		echo $_GET['dni'], ", ", $_GET['p_num_corr_proy'], ", ", $_POST['f_desasign'],", ",$_POST['coment_desasign'] . "<br>" ;				

		$sql="UPDATE 	t_hist_user_proy SET
						f_desasign = :f_desasign,
						coment_desasign = :coment_desasign
				WHERE 	dni = :dni 				
			    AND 	p_num_corr_proy=:p_num_corr_proy 
				AND     f_desasign=:f_max "; 
		

        $error = "";
        $statement = $connection->prepare($sql);
        $statement->execute($new_asign);
      
        
    
    } catch(PDOException $error) {
       // echo $sql . "<br>" . $error->getMessage();
        echo "Hubo un error en la desasignacion de: " , $_GET['apellido'] . "<br>" . $error->getMessage();
        exit;
    }

if ( $statement && !$error ) { ?>
    <blockquote>Desasignada/o de proyecto: <?php echo $_GET['p_num_corr_proy']; ?> </blockquote>
    <br><br>
    <a href="index_ap_V1.4.php">Back to home</a>
<?php 							} 

require "templates/footer.php"; 
exit;

}    
?>



<?php  	require "./config_ap_V1.4.php";
		require "./common_ap_V1.4.php";
		require "verificar_asign_V1.4.php"; 
?>
<h2>Desasignar Voluntaria/o de proyecto</h2>
<!--
<h3><?php echo "DesAsignacion de Vol: " , escape($_GET['apellido']) , ", " , escape($_GET['nombres']); ?></h3>
-->
		<table>
			<div align="justify"> 
			<thead>
				<tr>
					<th>DNI:</th>
					<th>Apellido:</th>
					<th>Nombre:</th>
				</tr>
			</thead>
			<tbody>
				<td><?php echo escape($_GET['dni']); ?></td>
				<td><?php echo escape($_GET['apellido']); ?></td>
				<td><?php echo escape($_GET['nombres']); ?></td>
			</tbody>
			</div>	
		</table>
        <br>
        
		<table>
			<div align="justify"> 
			<thead>
				<tr>
					<th>OSC:</th>
					<th>Num Proy:</th>
					<th>Nombre Proy:</th>
				</tr>
			</thead>
			<tbody>
				<td><?php echo escape($_GET['osc_nombre']); ?></td>
				<td><?php echo escape($_GET['p_num_corr_proy']); ?></td>
				<td><?php echo escape($_GET['p_nombre_proy']); ?></td>
			</tbody>
			</div>	
		</table>
		<br> <br>

<!--
<h3><?php echo "De Proyecto: " , escape($_GET['osc_nombre']) , ", " , escape($_GET['p_num_corr_proy']), ", " , escape($_GET['p_nombre_proy']); ?></h3>
-->

<?php
// echo verificar_asign( $_GET['dni'] , $_GET['num_proy']) , $_GET['dni'] , $_GET['num_proy'];
?>

		
<form method="post">
		<label for="coment_desasign">Comentario DesAsignacion</label>
		<input type="text" name="coment_desasign" id="coment_desasign"><br>
		<label for="fecha_desasign">Fecha DesAsignacion</label>
		<input type="text" name="f_desasign" id="f_desasign" value= "<?php echo escape(date("Y-m-d")); ?>">	<br><br>	
        <input type="submit" name="submit01" value="DesAsignar" class="button">
</form>



<a href="index_ap_<?php echo escape($vers);?>.php">Back to home</a>

<?php 

// echo "Today is " . date("Y/m/d H i") . "<br>";
// print_r(timezone_identifiers_list(2));

require "templates/footer.php"; 
exit; ?>


