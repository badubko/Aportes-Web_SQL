<?php

/**
 * Configuration for database connection
 *
 */

// $host       = "192.168.1.29";
$host       = "localhost";
$username   = "root";
$password   = "combet_0975?";
$dbname     = "test"; // will use later
$dsn        = "mysql:host=$host;dbname=$dbname"; // will use later
$options    = array(
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
              );