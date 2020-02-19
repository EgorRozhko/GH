<?php
	$server = 'localhost';
	$database = 'wow';
	$user = 'root';
	$password = '';
	$connection = mysqli_connect($server, $user, $password, $database) or die ('Нет поключение к MySQL');
?>