<?php
  
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "AlumniMGT";

// Create connection
$conn = new mysqli($servername,$username,$password,$dbname);

$id = $_POST['a'];
//$id=1;
// Check connection
if ($conn->connect_error) {
    die("Connection failed: \n" .$conn->connect_error);
    echo "Failed!";
}
else{
  //echo("Connection Successfull! ");
}

$result = mysqli_query($conn,"SELECT * FROM Faculty_Review where Name='$id'");

$data = array();
//echo $data;

while ($row = mysqli_fetch_object($result)) {
  array_push($data,$row);
}


echo json_encode($data);


?>