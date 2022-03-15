<!DOCTYPE html>
<html>
<head>
  <title>Display all records from Database</title>
</head>
<body>

<h2>Guest Details</h2>

<table border="2">
  <tr>
    <td>ID</td>
    <td>Name</td>
    <td>Email</td>
  </tr>

<?php

include "conection.php"; // Using database connection file here

$records = mysqli_query($db,"select * from guest"); // fetch data from database

while($data = mysqli_fetch_array($records))
{
?>
  <tr>
    <td><?php echo $data['GuestID']; ?></td>
    <td><?php echo $data['Name']; ?></td>
    <td><?php echo $data['Email']; ?></td>
  </tr>	
<?php
}
?>
</table>

<?php mysqli_close($db); // Close connection ?>

</body>
</html>