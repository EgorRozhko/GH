<?php
	include_once 'connection.php';
	$res = mysqli_query($connection, 'SELECT big_map FROM places INNER JOIN events ON events.place_id = places.id_place WHERE events.id_event ='.$_POST['i_id']);
	$row = mysqli_fetch_row($res);
	$res_1 = mysqli_query($connection, 'SELECT icon, coords, title, short_description FROM events WHERE id_event ='.$_POST['i_id']);
	$row_1 = mysqli_fetch_array($res_1);
	$coords_array = explode(';', $row_1['coords']);
	echo '<div id="big_map">
				<img src='.$row[0].' style="position: absolute; left:120px; top:152px;">
				<img id="'.$_POST['i_id'].'" class="icon" src='.$row_1[0].' style="left:'.$coords_array[0].'px; top:'.$coords_array[1].'px">
			</div>';
?>