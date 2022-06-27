<?php
$server = "localhost";
$db_username="root";
$pass="";
$database="first-db";

$connection = mysqli_connect($server,$db_username,$pass,$database);

if(!$connection)
    {
        echo"failed to connect to database server";
    }
else
{
    $dbconnection = mysqli_select_db($connection,$database);

    if(!$dbconnection)
        {
            echo"failed to coneect to database";
        }
    else
    {
        echo "********************";

        $Section_Namee=$_POST['a'];

        echo "Value is :" . $Section_Namee ;

        $query = "INSERT INTO Sections(Section_Name) VALUES ('$Section_Namee')";
        mysqli_query($connection,$query) or die (mysqli_error($connection));

        echo json_encode($query);
    }
}
?>