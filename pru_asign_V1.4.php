<?php

// Probar si asignado a un proy

require "verificar_asign_V1.4.php";
$dni='4403493';
$proy='1006';

$asig = verificar_asign ( $dni , $proy );
//if ( $asig == 0 ) {
	//echo $asig, "Vol: " , $dni , "YA Asign a: " , $proy . "<br>";
	//} 
	//else
	//{
		//echo $asig, "Vol: " , $dni , "NO Asign a: " , $proy . "<br>";
		//}

echo "Vol ", $dni , ", ", $proy, ", ", $asig . "<br>";



?>
