<?php
	session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head> 
	<title> Search Results | Team Warriors</title>
        <meta name="keywords" content="NBA Statistics, NBA, Statistics">
        <meta name="description" content="Player search">
        <meta name ="author" content="Nam L">

	<link rel="stylesheet" href="header.css"/>	
</head>

<?php include("headers.html");?>

<body style="background-color: #D8D8D8">
	<h1> Search Results </h1>
	<?php
		$name = filter_input(INPUT_POST, "name");
		$first = substr($name, 0, strpos($name, ' '));
		$last = substr($name, strpos($name, ' ') + 1);
		$found = false;
		try{
			//access the database
			$db = new PDO('mysql:host=localhost;dbname=Warriors;charset=utf8', 'root','');
			$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			
			$query = "SELECT player_id FROM players WHERE first_name='$first' AND last_name='$last'";
			$result = $db->query($query);
			$player_id = $result->fetch(PDO::FETCH_ASSOC);
			$p_id = $player_id['player_id'];
			
			$query2 = "SELECT points, assists, rebounds, steals, turnovers, fgpercent, three_pt_percent 
					   FROM statistics WHERE statistics.player_id='$p_id'";
			$queryResult = $db->query($query2);
			$stats = $queryResult->fetch(PDO::FETCH_ASSOC);
			

			$query3 = "SELECT first_name, last_name FROM players WHERE players.player_id='$p_id'";
			$result = $db->query($query3);
			$resultSet = $result->fetch(PDO::FETCH_ASSOC);
			$firstName = $resultSet['first_name'];
			$lastName = $resultSet['last_name'];
			if(strlen($firstName) > 0) {
			echo "<table border=1>
			<tr>
			<th>Player's Name</th>
			<th>Points</th>
			<th>Assists</th>
			<th>Rebounds</th>
			<th>Steals</th>
			<th>Turnovers</th>
			<th>Field Goal %</th>
			<th>3 Point %</th>
			</tr>";
				global $found;
				echo "<tr>";
				echo "<td>" . $firstName . " " . $lastName . "</td>";
				echo "<td><center>" . $stats['points'] . "</center></td>";
				echo "<td><center>" . $stats['assists'] . "</center></td>";
				echo "<td><center>" . $stats['rebounds'] . "</center></td>";
				echo "<td><center>" . $stats['steals'] . "</center></td>";
				echo "<td><center>" . $stats['turnovers'] . "</center></td>";
				echo "<td><center>" . $stats['fgpercent'] . "</center></td>";
				echo "<td><center>" . $stats['three_pt_percent'] . "</center></td>";
				echo "</tr>";
				echo "</table>";
				$found = true;
			}
			else {
				echo "Player not found<br>";
			}
			if(sizeof($_SESSION["history"]) > 1) {
				echo "<br><hr>";
				echo "<h1> Search History </h1>";
				echo "<table border=1>
				<tr>
				<th>Player's Name</th>
				</tr>";
				for($i = 0; $i < count($_SESSION['history']); $i++) {
					if($i > 0) {
						echo "<tr>";
						echo "<td>" . $_SESSION['history'][$i] . "</td>";
						echo "</tr>";
					}
				}
				echo "</table><br><hr>";
			}
		}
		catch(PDOException $ex){
			echo 'ERROR:'.$ex->getMessage();
		}	
	
		function init() {
			global $count;
			global $history;
			if(isset($_SESSION["count"])) {
				$count = $_SESSION["count"];
				$count++;
				$_SESSION["count"] = $count;
			}
			else {
				$_SESSION["count"] = 1;
				$_SESSION["history"] = $history;
				$count = 1;
				$_SESSION["count"] = $count;
			}
		}
		
		function search() {
			global $found;
			$name = filter_input(INPUT_POST, "name");
			if($found) {
				array_push($_SESSION['history'],$name);
			}
		}
		
		init();
		search();
	?>
	
	<br>
	<form action="#" method="post">
		<fieldset>
		<legend style="color:blue"> Search Again </legend>
			<p>
				<input type="text" name="name" placeHolder="Player's Name" id="name">	
			</p>
			<input type = "submit"></button>
		</fieldset>
	</form>

</body>
</html>
