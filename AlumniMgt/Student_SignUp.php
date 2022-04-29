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

$userName=$_POST['a'];
$pword = $_POST['b'];
$email = $_POST['c'];
$gender = $_POST['d'];

//add values into table
    $sql = "INSERT INTO student (name,email,password,gender) VALUES ('$userName','$email','$pword','$gender');";

if ($conn->query($sql) === TRUE) {
  echo "Success";
  //header("Location:login.html");
} 
else {
  echo "Error: " . $sql . "<br>" . $conn->error;
}
mysql_close($conn);

?>