<?php
  
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "AlumniMGT";




// Create connection
$conn = new mysqli($servername,$username,$password,$dbname);



// Check connection
if ($conn->connect_error) {
    die("Connection failed: \n" .$conn->connect_error);
    echo "Failed!";
}
else{
//echo("Connection Successfull!");
}

$answer=$_POST['a'];
$id = $_POST['b'];

//add values into table
    $sql = "UPDATE post SET answer='$answer' WHERE id='$id';";
$id = $_POST['b'];

if ($conn->query($sql) === TRUE) {
  echo "Success";
  //header("Location:login.html");
} 
else {
  echo "Error: " . $sql . "<br>" . $conn->error;
}

mysql_close($conn);

?>