<!DOCTYPE html>
<html>
<head>
  <title>Display all records from Database</title>
</head>
<body>

<h2>Reservation Details</h2>

<table border="2">
  <tr>
    <td>ID</td>
    <td>RoomID</td>
    <td>Start</td>
    <td>End</td>
    <td>Confirm</td>
  </tr>

<?php

include "conection.php"; // Using database connection file here

$records = mysqli_query($db,"select * from reservation"); // fetch data from database

while($data = mysqli_fetch_array($records))
{
?>
  <tr>
    <td><?php echo $data['GuestID']; ?></td>
    <td><?php echo $data['RoomID']; ?></td>
    <td><?php echo $data['Startdate']; ?></td>
    <td><?php echo $data['Enddate']; ?></td>
    <td><?php echo $data['ConfirmNumber']; ?></td>
  </tr>	
<?php
}
?>
</table>

<?php mysqli_close($db); // Close connection ?>

</body>
</html>