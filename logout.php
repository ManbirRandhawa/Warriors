<DOCTYPE html>
<html lang="en">

<?php include("headers.html"); ?>

<head>
	<title> Logout | Team Warriors </title> 
	<meta name="keywords" content="NBA Statistics, Logout , Statistics">
	<meta name="description" content="Logoff account">
	<meta name ="author" content="Kevin Y">
</head>
<body>
<h1> You've been logout! </h1>
	<?php
		session_start();
		
		session_destroy();

	?>
</body>
</html>