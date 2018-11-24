<?php
// $servername = "192.168.1.29";
$servername = "localhost";
$host="localhost";
$username = "root";
$password = "combet_0975?";
$dbname = "test";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// $conn = new PDO("mysql:host=$host", $username, $password, $options);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$sql = "SELECT id, firstname, lastname FROM users";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "id: " . $row["id"]. " - Name: " . $row["firstname"]. " " . $row["lastname"]. "<br>";
    }
} else {
    echo "0 results";
}
$conn->close();
?>
