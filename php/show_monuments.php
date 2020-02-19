<?php
	include_once("connection.php");
	$x;
	$y;
	$res = mysqli_query($connection,'SELECT monument_id,coords,type_id FROM monuments');
	while($row = mysqli_fetch_array($res)) 
	{
		$array_coords = explode(";", $row["coords"]);
	 	$x = $array_coords[0];
		$y = $array_coords[1];
if ($row['type_id']==1){
		echo "<img src='images/monument_1.png' id='".$row['monument_id']."' class='monument'
				style='
				left:".$x."px;
				top:".$y."px; 
				bottom:0px; 
				right:0px; 
				position: absolute;'/>";			
	}	
	else if($row['type_id']==2){
		echo "<img src='images/monument_2.png' id='".$row['monument_id']."' class='monument'
				style='
				left:".$x."px;
				top:".$y."px; 
				bottom:0px; 
				right:0px; 
				position: absolute;'/>";
			
	}
	else {
		echo "<img src='images/monument_3.png' id='".$row['monument_id']."' class='monument'
				style='
				left:".$x."px;
				top:".$y."px; 
				bottom:0px; 
				right:0px; 
				position: absolute;'/>";
	}
};
	mysqli_free_result($res);
?>



