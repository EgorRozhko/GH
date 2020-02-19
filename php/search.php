<?php 
	$search_text = $_POST['text'];
	$search_text = trim($search_text);
	$search_text = htmlspecialchars($search_text);
	if (!empty($search_text)) 
	{
		if(strlen($search_text)>0)
		{
			if (strlen($search_text)>128) {}
			else 
			{
				include_once 'connection.php';
				$query = mysqli_query($connection, 'SELECT place_id,map_image,coords FROM places INNER JOIN events ON events.place_id = places.id_place WHERE events.metadata LIKE "%'.$search_text.'%"');
				$query_1 = mysqli_query($connection, 'SELECT monument_id,title,coords FROM monuments WHERE metadata LIKE "%'.$search_text.'%"');
				$x = mysqli_num_rows($query);
				$x_1 = mysqli_num_rows($query_1);
				if ($x > 0) 
				{
					while ($row = mysqli_fetch_array($query)) 
					{
						$coords_array = explode(';', $row['coords']);
						echo '<img src='.$row["map_image"].' class="icon" style="right:0px; bottom:0px; top:'.$coords_array[1].'px; left:'.$coords_array[0].'px;">';
					}
				}
				if ($x_1 > 0) 
				{
					while ($row = mysqli_fetch_array($query_1)) 
					{
						$coords_array = explode(';', $row['coords']);
						echo '<img src="images/monument_icon.png" id="'.$row['monument_id'].'" class="monument" style="right:0px; bottom:0px; top:'.$coords_array[1].'px; left:'.$coords_array[0].'px; position: absolute;">';
					}
				}
			}
		}
	}
?>