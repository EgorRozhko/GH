<?php
	include_once('connection.php');
	$query  = mysqli_query($connection,'SELECT * FROM events WHERE id='.$_GET['id']);
	$result = mysqli_fetch_array($query);
/*	echo '<title>'.$result['title'].'</title>';*/
	$fd = fopen("".$result['link']."", 'r');
	while (!feof($fd)) 
	{
		echo fgets($fd);
	}
	echo '<style>
	html, body{	height: 100%; min-height: 100%; margin: 0px; padding: 0px; font-family: "Courier New";background-image: url("images/fon.png");
background-size: 100%;}
	#tool{
	height:100px;
	weight:100px;
	}
	</style>
	<h3 id="title"><center>'.$result['title'].'</center></h3>
	<img src='.$result['tooltip_image'].'>
	<div class="description">'.$result['full_description'].'</div>';
	fclose($fd);
	mysqli_close($connection);
?>