<!--


-->

<!DOCTYPE html>
<html lang="en">

<head> 
	<title> NBA Datasets </title>
	<link rel="stylesheet" href="header.css"/>	
</head>

<?php include("header.html");?>

<body style="background-color: #D8D8D8">
	<h1> Full NBA List </h1>
	<?php
		

		try{
			//access the database
			$db = new PDO('mysql:host=localhost;dbname=Warriors;charset=utf8', 'root','');
			$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			

			//query to get values for table
			$table_query = "SELECT teams.team_name, players.first_name, players.last_name, player_positions.position_name, statistics.points, 
							statistics.assists, statistics.rebounds, statistics.steals, statistics.turnovers, statistics.fgpercent, statistics.three_pt_percent 
							FROM players, statistics, teams, player_positions 
							WHERE teams.team_name = players.team_name and player_positions.position_name = players.position_name and 
							players.player_id = statistics.player_id";
			$stmt =$db->prepare($table_query);
			$stmt->execute();
			

			print "	<table border='1'>\n";
			//display tables
				echo "<table border=1>
				<tr>
				<th>Team</th>
				<th>Player</th>
				<th>Position</th>
				<th>Points</th>
				<th>Assists</th>
				<th>Rebounds</th>
				<th>Steals</th>
				<th>Turnovers</th>
				<th>Field Goal %</th>
				<th>3 Point %</th>
				</tr>";
			while($row = $stmt ->fetch()){
		
			echo "<tr>";
			echo "<td>" . $row[0] . "</td>";
			echo "<td>" . $row[1]." ".$row[2] . "</td>"; //first name + last name
			echo "<td>" . $row[3] . "</td>"; //position
			echo "<td>" . $row[4] . "</td>"; //points
			echo "<td>" . $row[5] . "</td>"; //assists
			echo "<td>" . $row[6] . "</td>"; //rebounds 
			echo "<td>" . $row[7] . "</td>"; //steals
			echo "<td>" . $row[8] . "</td>"; //turnovers
			echo "<td>" . $row[9] . "</td>"; //fg%
			echo "<td>" . $row[10] . "</td>"; //3pt fg%
			echo "</tr>";


			}
			echo "</table>";
		}

		catch(PDOException $ex){
			echo 'ERROR:'.$ex->getMessage();
		}
	?>
</body>
</html>
