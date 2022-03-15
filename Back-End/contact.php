<?php
// database connection code
$con = mysqli_connect('localhost', 'root', 'vaibhav1','Hotel management');



// get the post records
$txtName = $_POST['gstName'];
$txtEmail = $_POST['gstID'];

// database insert SQL code
$sql = "INSERT INTO `guest` (`GuestID`,`Name`)  VALUES ('0', '$gstName', '$gstID')";

// insert in database 
$rs = mysqli_query($con, $sql);

if($rs)
{
	echo "Contact Records Inserted";
}

?>