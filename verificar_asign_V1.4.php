<?php
function verificar_asign($dni, $proy) {
// Verifica si el Vol fue asigando previamente a un proyecto

require "./config_ap_V1.4.php";
    try  {

        $conn_asign = new PDO($dsn, $username, $password, $options);
        
        $ver_asign = array(
							"dni"     				=> $dni,
							"p_num_corr_proy"       => $proy,
							"f_asignac"				=> '2000-01-01',
							"f_desasign"  			=> '2100-01-01'
						);
		 $sql_ver = "SELECT * FROM  t_hist_user_proy WHERE 
							dni = :dni AND 	p_num_corr_proy = :p_num_corr_proy AND f_asignac > :f_asignac AND f_desasign < :f_desasign
						    ";				
		
		
						
        
        $error = "";
        $statement = $conn_asign->prepare($sql_ver);
        $statement->execute($ver_asign);
        $count = $statement->rowCount();
        echo $count . "<br>";
        if ( $count == 0 ) { return 'Asignado' ; } 
		else { 	return 'No_Asignado'; }
        
        
    } catch(PDOException $error) {
        echo $sql_ver . "<br>" . $error->getMessage();
        echo "Hubo un error la busqueda de asignados " . "<br>" . $error->getMessage();
        exit;
    }


}


// SELECT * FROM t_hist_user_proy WHERE 
// (dni = '4403493' and p_num_corr_proy = '1006') 
// and (f_asignac > '2000-01-01' and f_desasign < '2100-01-01')

// SELECT COUNT(*) FROM t_hist_user_proy WHERE dni = '11285447' 
// and p_num_corr_proy = '1006' and f_asignac >'2000-01-01' and f_desasign < '2100-01-01'

?>
