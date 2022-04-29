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
$branch = $_POST['d'];
$session = $_POST['e'];
$company = $_POST['f'];
$address = $_POST['g'];


//add values into table
    $sql = "INSERT INTO alumniinfo (pi_name,password,pi_email,pi_branch,pi_session,pi_company,pi_address) VALUES ('$userName','$pword','$email','$branch','$session','$company','$address');";

if ($conn->query($sql) === TRUE) {
  echo "Success";
  //header("Location:login.html");
} 
else {
  echo "Error: " . $sql . "<br>" . $conn->error;
}
mysql_close($conn);

?>