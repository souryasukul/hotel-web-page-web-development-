<!DOCTYPE html>
<html>
<head>
  <title>Display all records from Database</title>
</head>
<body>

<h2>Room Details</h2>

<table border="2">
  <tr>
    <td>HotelID</td>
    <td>RoomID</td>
    <td>Date</td>
    <td>Avalible</td>
    
  </tr>

<?php

include "conection.php"; // Using database connection file here

$records = mysqli_query($db,"select * from rooms_avalible"); // fetch data from database

while($data = mysqli_fetch_array($records))
{
?>
  <tr>
    <td><?php echo $data['HotelID']; ?></td>
    <td><?php echo $data['RoomID']; ?></td>
    <td><?php echo $data['Date']; ?></td>
    <td><?php echo $data['Avalible']; ?></td>
    <
  </tr>	
<?php
}
?>
</table>

<?php mysqli_close($db); // Close connection ?>

</body>
</html>