<?php

/**
 * Configuration for database connection
 *
 */

//$host       = "192.168.1.29";

date_default_timezone_set('America/Argentina/Buenos_Aires');


// Estos son los dnis de los DCs ficticios que significan "NO Asignado"
$dni_tit_fict=1;
$ap_tit_fict='Titular';
$nom_tit_fict='No Asignado';

$dni_supl_fict=2;
$ap_supl_fict='Suplente';
$nom_supl_fict='No Asignado';

$f_min='2000-01-01';
$f_max='2100-01-01';

// El dni del DP por ahora hardcoded. En el futuro...
// Solo DIOS sabe como sera...

$dni_dp='1000999';

$vers        = "V1.4";
$host       = "localhost";
$username   = "root";
$password   = "combet_0975?";
$dbname     = "aportes_V3_74"; // will use later
$dsn        = "mysql:host=$host;dbname=$dbname"; // will use later
$options    = array(
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
              );
