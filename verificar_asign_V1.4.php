<?php
function verificar_asign($dni, $proy) {
// Verifica si el Vol fue asigando previamente a un proyecto
// y no fue desasignado
// 

require "./config_ap_V1.4.php";
    try  {

        $conn_asign = new PDO($dsn, $username, $password, $options);
        
        
// Paso 1: Hay algun registro para ese dni y numero proy?		
        $ver_asign = array(
							"dni"     				=> $dni,
							"p_num_corr_proy"       => $proy
						);
						
		 
		 $sql_ver = "SELECT * FROM  t_hist_user_proy WHERE 
							dni = :dni AND 	p_num_corr_proy = :p_num_corr_proy ";
		$error = "";
        $statement = $conn_asign->prepare($sql_ver);
        $statement->execute($ver_asign);
        $count = $statement->rowCount();
//         echo  "Paso 1 " , $proy, $count . "<br>";
         
        // Si no se encontro ninguna fila, el Vol no esta asignado 					
		if ( $count == 0 ) { return 'No_Asignado' ; }

		 
// Paso 2 Verifica si el usuario fue desasignado de este proyecto
		// si para ese dni y num_proy hay filas que cumplan
		// f_asignac > 2000-01-01 y f_desasig < 2100-01-01  --> Si rows = 0  Asignado	
		//		
		// f_asignac > 2000-01-01 y f_desasig < 2100-01-01  --> Si rows > 0  
		//	No sabemos ya que Podria haber una asign posterior a la desasignacion
		//  Ir a Siguente paso	
		//																
		//																	
		
		$ver_asign = array(
							"dni"     				=> $dni,
							"p_num_corr_proy"       => $proy,
							"f_asignac"				=> '2000-01-01',
							"f_desasign"  			=> '2100-01-01'
						);
		$sql_ver = "SELECT f_desasign , last_update FROM  t_hist_user_proy WHERE 
							(dni = :dni AND 	p_num_corr_proy = :p_num_corr_proy )
							AND (f_asignac > :f_asignac AND f_desasign < :f_desasign )
						     ORDER BY f_asignac DESC LIMIT 1";				
			
        
        $error = "";
        $statement = $conn_asign->prepare($sql_ver);
        $statement->execute($ver_asign);
        
        $result= $statement->fetchAll();
        $count = $statement->rowCount();
        
//        echo  "Paso 2 ",  $proy, $count . "<br>";
        
        if ( $count == 0 ) { return 'Asignado' ; } 
				else { 	
				
				     foreach ($result as $row) { 
						$f_ultima_desasig=$row["f_desasign"];
						$ver_asign = array(
									"dni"     				=> $dni,
									"p_num_corr_proy"       => $proy,
									 // Ultima fecha de asignacion encontrada de la que fuera desasignado
									"f_asignac"				=> $f_ultima_desasig,
									"f_desasign"  			=> '2100-01-01'
											);
						$sql_ver = "SELECT f_asignac , last_update FROM  t_hist_user_proy WHERE 
									(dni = :dni AND 	p_num_corr_proy = :p_num_corr_proy )
									AND (f_asignac >= :f_asignac AND f_desasign = :f_desasign )
									";				
		 
										$error = "";
										$statement = $conn_asign->prepare($sql_ver);
										$statement->execute($ver_asign);
										$count = $statement->rowCount();
//					 echo  "Paso 3 ",  $proy, $count . "<br>";
					if ( $count == 0 ) { return 'No_Asignado' ; } 						
				
//					Si rows > 0 Significa que esta asignado
					return 'Asignado'; }
										}
        
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
