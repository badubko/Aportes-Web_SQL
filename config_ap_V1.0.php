<?php

/**
 * Configuration for database connection
 *
 */

$host       = "192.168.1.29";
$username   = "root";
$password   = "combet_0975?";
$dbname     = "aportesV1"; // will use later
$dsn        = "mysql:host=$host;dbname=$dbname"; // will use later
$options    = array(
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
              );
