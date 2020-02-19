<?php 
	include_once('connection.php');
	
	$res = mysqli_query($connection,'SELECT id_place,map_coords,map_image FROM places INNER JOIN events ON events.place_id = places.id_place WHERE events.id_event='.$_POST["i_id"]);
	$row = mysqli_fetch_array($res);
	$coords_array = explode(';', $row['map_coords']);
	echo $row['map_image'].' '.$coords_array[1].' '.$coords_array[0].' '.$row['id_place']; 
	mysqli_free_result($res);
	mysqli_close($connection);
?>