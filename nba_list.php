<?php
session_start();
?>

<!DOCTYPE html>
<html lang="en">

<head> 
	<title> Your Customize List | Team Warriors</title>
	<meta name="keywords" content="NBA Statistics, Customized, NBA Players, NBA, Statistics">
	<meta name="description" content="Individual Users customized list of nba player's statistics">
	<meta name ="author" content="Kevin Y">
	<!--<link rel="stylesheet" href="header.css"/>	-->

</head>

<?php include("headers.html");?>

<body style="background-color: #D8D8D8">
	
	<?php
	
	//if users is logined
	if(isset($_SESSION['login_user']) && !empty($_SESSION['login_user'])) {
		
		echo "<h1> Customized Table List </h1>";
		//$name = filter_input(INPUT_POST, "playerName");
		$position = filter_input(INPUT_POST, "position");
		$team = filter_input(INPUT_POST, "team");
		
		$firstName = filter_input(INPUT_POST, "firstName");
		$lastName = filter_input(INPUT_POST, "lastName");
		$player_id = "";
		$user_id = 0;
		$email = $_SESSION['login_user'];
		//echo "$email, $firstName, $lastName, $position , $team ";

		try{
			//access the database
			$db = new PDO('mysql:host=localhost;dbname=Warriors;charset=utf8', 'root','');
			$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			
			$userid_query = "SELECT users.user_id from users where email=:email";
			$stmt = $db->prepare($userid_query);
			$stmt->execute(array(':email' => $email));
			$row = $stmt->fetch();
			$user_id = $row[0];

			//gets the player_id from the submitted info
			$playerid_query = "SELECT players.player_id from players,teams
				 WHERE players.first_name = :firstName and players.last_name =:lastName and teams.team_name = :team";
			$stmt = $db->prepare($playerid_query);
			$stmt->execute(array(':firstName' => $firstName, ':lastName' => $lastName, ':team' => $team));
			$row = $stmt->fetch();
			$player_id = $row[0];
			//echo "player_id".$player_id."<br>";

			//inserts the corresponding player_id and user_id into user_playerlist
			$insert_userpl_query = "INSERT INTO user_playerlist() values (:user_id, :player_id)";
			$stmt = $db->prepare($insert_userpl_query);
			$stmt->execute(array(':user_id' => $user_id, ':player_id'=> $player_id));



			//query to get values for table
			$customize_table_query = "SELECT teams.team_name, players.first_name, players.last_name, player_positions.position_name, statistics.points, statistics.assists, statistics.rebounds, statistics.steals, statistics.turnovers, statistics.fgpercent, statistics.three_pt_percent 
								      FROM players, user_playerlist, statistics, teams, player_positions 
									  WHERE teams.team_name = players.team_name and player_positions.position_name = players.position_name and players.player_id = statistics.player_id and user_playerlist.player_id = players.player_id and user_playerlist.user_id = :user_id";
			$stmt =$db->prepare($customize_table_query);
			$stmt->execute(array(':user_id'=>$user_id));
			

			//display tables
				echo '<table id="table_stats" class="display" cellspacing="0" width="100%" >
				<thead>
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
				</tr>
				</thead>';
				echo "<tbody>";

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

			echo "</tbody>";
			echo "</table>";

			/*

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

			*/
		}
		catch(PDOException $ex){
			echo 'ERROR:'.$ex->getMessage();
		}
		echo "<br>";
		echo "<a style='color:black;' href='add_player.php'> Click here to add more players</a>";
	}//end of if
		else{
			echo "<h1 > User must login first </h1>";
		}
	?>


	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css">
<script type = "text/javascript" src  = "https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type = "text/javascript" src  = "https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('#table_stats').DataTable( {
        "order": [[ 1, "desc" ]]
    } );

} ); 
</script>

</body>
</html>


		<!--
				//index... 0=first name, 1=last name, 2=points, 3=assist, 4=rebounds, 5=steals, 6=turnovers, 7=fg%, 8=3pt%
				$player_name = $row[0]." ".$row[1]; //first name and last name combined
			//$points2 = $row[1];
			$points2 = $row[2]; //points
			$points3 = $row[3]; //assists
			$points4 = $row[4]; //rebounds
			$points5 = $row[5];
			$points6 = $row[6];
			$points7 = $row[7];
			$points8 = $row[8];


			echo $player_name." ".$points2." ".$points3." ".$points4." ".$points5." ".$points6." ".$points7." ".$points8;
			echo "<br>";
				-->