<DOCTYPE html>
<html lang="en">

<?php include("headers.html"); ?>

<body>
<h1> Thank you for signing up! </h1>
	<?php
		$firstName = filter_input(INPUT_POST, "firstName");
		$lastName = filter_input(INPUT_POST, "lastName");
		$email = filter_input(INPUT_POST, "email");
		$password = filter_input(INPUT_POST, "password");

		try{
			//access the database
			$db = new PDO('mysql:host=localhost;dbname=Warriors;charset=utf8', 'root','');
			$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			
			$insert_user_query = "INSERT INTO users(first_name, last_name, email, password) values (:firstName, :lastName, :email, :password)";
			$stmt = $db->prepare($insert_user_query);
			$stmt->execute(array(':firstName' => $firstName, ':lastName'=> $lastName, ':email'=>$email, ':password'=>$password));
		}

		catch(PDOException $ex){
			echo 'ERROR:'.$ex->getMessage();
		}

	?>
</body>
</html>