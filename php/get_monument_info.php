<?php
	include_once('connection.php');
	$query  = mysqli_query($connection,'SELECT * FROM monuments WHERE monument_id='.$_GET['id']);
	$result = mysqli_fetch_array($query);
	echo '<title>'.$result['title'].'</title>';
	$fd = fopen("".$result['link']."", 'r');
	while (!feof($fd)) 
	{
		echo fgets($fd);
	}
	fclose($fd);
	mysqli_close($connection);
?>