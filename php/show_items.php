<?php
	include_once ('connection.php');
	$years = htmlentities($_POST['year']);
	$res = mysqli_query($connection,'SELECT id_event,title FROM events WHERE year='.$years.' && place_id != "NULL"');
	while ($row = mysqli_fetch_array($res)) echo "<p class='sl' id=".$row['id_event'].">".$row['title']."</p><br>";	
	mysqli_free_result($res);
	mysqli_close($connection);
?>