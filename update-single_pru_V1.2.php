<?php

/**
 * Use an HTML form to edit an entry in the
 * users table.
 *
 */

require "./config_ap_V1.0.php";
require "./common.php";

if (isset($_GET['dni'])) {
  echo $_GET['dni']; // for testing purposes
} else {
    echo "Something went wrong!";
    echo $_GET['dni']; // for testing purposes
    exit;
}
?>
