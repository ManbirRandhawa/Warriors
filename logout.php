<DOCTYPE html>
<html lang="en">

<?php include("header.html"); ?>

<body>
<h1> You've been logout! </h1>
	<?php
		session_start();
		
		session_destroy();

	?>
</body>
</html>