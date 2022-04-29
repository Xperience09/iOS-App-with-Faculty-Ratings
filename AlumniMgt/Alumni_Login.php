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
    //echo "Failed!";
}
else{
  //echo("Connection Successfull! ");
}

//POST method
$userName=$_POST['a'];
$pword = $_POST['b'];

//echo "\n";

//mySQL Statement 
      $sql = mysqli_query($conn,"SELECT pi_name,password FROM alumniinfo WHERE pi_name = '$userName';"); 

if ( false===$sql) {
  printf("error: %s\n", mysqli_error($conn));
}

    $row=mysqli_fetch_array($sql);
    $resultU = ($row['pi_name']);
  $resultP =($row['password']);
  //echo $resultP;
  //echo ".";
  //echo $pword;
  //echo ".";

//verify password with the db password
  if((strcmp($resultP,$pword))===0){
  $verify = true; //password_verify($pword, $resultP);
  }
  else{
    $verify = false;
  }

  //echo strcmp($resultP,$pword);

if ( false===$verify) {
  printf("error: %s", mysqli_error($conn));
}

   // checking result matched or not
      $count = mysqli_num_rows($sql);
      if ( null===$count) {
        printf("error: %s", mysqli_error($conn));
    }
    
      if($count>0) {
        if($verify===true){
         echo ("Success");
         //header("Location:main page.html");
        }
        else{
            echo "Password Invalid!";
        }
        
      }
      else {
         echo ("Your Username is invalid");
      }
 
   
mysql_close($conn);

?>