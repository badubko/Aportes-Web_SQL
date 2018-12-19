<?php

/**
 * Configuration for database connection
 *
 */

//$host       = "192.168.1.29";
$vers        = "V1.4";
$host       = "localhost";
$username   = "root";
$password   = "combet_0975?";
$dbname     = "aportes_V3_2"; // will use later
$dsn        = "mysql:host=$host;dbname=$dbname"; // will use later
$options    = array(
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
              );
