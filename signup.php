<!DOCTYPE html>
<html lang="en">

<?php include("header.html"); ?>

<head>
 <link rel="stylesheet" href="header.css"/>
<script>
	function validate(){
		//regex
		var name_re = /^[A-Z]*[a-z]+$/;
		var password_re = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}/

		first_name = document.getElementById("first_name").value;
		last_name = document.getElementById("last_name").value;
		password1 = document.getElementById("password1").value;
		password2 = document.getElementById("password2").value;

		if(!name_re.test(first_name)){
			alert("Invalid first name!");
			return false;
		}

		if(!name_re.test(last_name)){
			alert("Invalid last name!");
			return false;
		}

		if(!password_re.test(password1) || ![password_re.test(password2)]){
			alert("Password must have at least 8 characters, 1 Uppercase, 1 Lowercase, 1 Number, and 1 Special Character");
			return false;
		}

		if(password1 != password2){
			alert("Passwords do not match");
			return false;
		}
		return true;
	}
	</script>
</head>
	
<body>
<h1> Sign Up </h1>
	<form action="post_signup.php" method="POST" onsubmit="return(validate());">
		<p>
			<label for ="first_name"> First Name: </label>
			<input type = "text" id="first_name"/>
		</p>

		<p>
			<label for ="last_name"> Last Name: </label>
			<input type ="text" id="last_name"/>
		</p>

		<p>
			<label for ="birthday"> Birthday: </label>
			<input type ="date" id="birthday"/>
		</p>

		<p>
			<label for ="email"> Email: </label>
			<input type ="email" id="email"/>
		</p>

		<p>
			<label for="password1"> Password: </label>
			<input type="password" id="password1"/>
		</p>

		<p>
			<label for="password2"> Re-enter Password: </label>
			<input type="password" id="password2"/>
		</p>

		<p>
			<input type="submit" value="Submit"/>
		</p>
</body>

</html>