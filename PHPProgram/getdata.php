<?php
$server = "localhost";
$db_username="root";
$pass="";
$database="first-db";

$connection = mysqli_connect($server,$db_username,$pass,$database);

$result = mysqli_query($connection, "SELECT * FROM Sections");

//adding an array
$data = array();
while ($row = mysqli_fetch_object($result))
{
    array_push($data, $row);
}
echo json_encode($data)
?>