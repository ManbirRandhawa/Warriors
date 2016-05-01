<?php
	session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head> 
	<title> Results </title>
	<link rel="stylesheet" href="header.css"/>	
</head>

<?php include("header.html");?>

<body style="background-color: #D8D8D8">
	<h1> Search Results </h1>
	<?php
		$name = filter_input(INPUT_POST, "name");
		$found = false;
		try{
			//access the database
			$db = new PDO('mysql:host=localhost;dbname=Warriors;charset=utf8', 'root','');
			$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			
			$query = "SELECT playerId FROM player_list WHERE name='$name'";
			$result = $db->query($query);
			$playerId = $result->fetch(PDO::FETCH_ASSOC);
			$p_id = $playerId['playerId'];

			$query3 = "SELECT name FROM player_list WHERE player_list.playerId='$p_id'";
			$result = $db->query($query3);
			$resultSet = $result->fetch(PDO::FETCH_ASSOC);
			$playerName = $resultSet['name'];
			if(strlen($playerName) > 0) {
			echo "<table border=1>
			<tr>
			<th>Player's Name</th>
			</tr>";
				global $found;
				echo "<tr>";
				echo "<td>" . $playerName . "</td>";
				echo "</tr>";
				echo "</table>";
				$found = true;
			}
			else {
				echo "Player not found<br>";
			}
			if($_SESSION["count"] > 1) {
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
