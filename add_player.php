<!DOCTYPE html>
<html lang="en">
<head>
	<title> NBA Players </title>
	
	<script type = "text/javascript">
		function validate()
        {
            var firstName = document.getElementById("firstName").value;
            var lastName = document.getElementById("lastName").value;        
            var errors = "";    
            if(firstName == "") {
                errors += "Missing First Name.\n\n";
            }  
			if(lastName == "") {
				errors += "Missing Last Name.\n\n";
			}
			var firstNameRE = /^[a-zA-Z'.-]{3,20}$/;
			if(!firstNameRE.test(firstName)) {
				errors += "Invalid First Name. Only letters, hyphens, apostrophes, and periods are accepted.\n\n"
			}
			var lastNameRE = /^[a-zA-Z'.-]{3,20}$/;
			if(!lastNameRE.test(lastName)) {
				errors += "Invalid Last Name. Only letters, hyphens, apostrophes, and periods are accepted.\n\n"
			}
			
            if (errors != "") {
              alert(errors);
              return false;
            }
            else{
            	return true;
            }
        }
    </script>
		
</head>
<?php include("headers.html");?>
<body>
	<form action="nba_list.php" method="post">
		<fieldset>
		<legend style="color:blue"> NBA Player Stats </legend>
			<p>
				<input type="text" name="firstName" placeHolder="Player's First Name" id="firstName">	
		
				<input type="text" name="lastName" placeHolder="Player's Last Name" id="lastName">
			</p>
			<p>
				Position 
				<br>
				<input type="radio" name="position" value="Shooting_Guard"> Shooting Guard <br>
				<input type="radio" name="position" value="Point_Guard"> Point Guard <br>
				<input type="radio" name="position" value="Small_Forward"> Small Forward <br>
				<input type="radio" name="position" value="Power_Forward"> Power Forward <br>
				<input type="radio" name="position" value="Center"> Center
			</p>
			<p>
				<select name="team">
					<option value="" disabled selected hidden> Select Team </option>
					<option value="hawks"> Atlanta Hawks </option>
					<option value="celtics"> Boston Celtics </option>
					<option value="nets"> Brooklyn Nets </option>
					<option value="hornets"> Charlotte Hornets </option>
					<option value="bulls"> Chicago Bulls </option>
					<option value="cavaliers"> Cleveland Cavaliers </option>
					<option value="mavericks"> Dallas Mavericks </option>
					<option value="nuggets"> Denver Nuggets </option>
					<option value="pistons"> Detroit Pistons </option>
					<option value="warriors"> Golden State Warriors </option>
					<option value="rockets"> Houston Rockets </option>
					<option value="pacers"> Indiana Pacers </option>
					<option value="clippers"> Los Angeles Clippers </option>
					<option value="lakers"> Los Angeles Lakers </option>
					<option value="grizzlies"> Memphis Grizzlies </option>
					<option value="heat"> Miami Heat </option>
					<option value="bucks"> Milwaukee Bucks </option>
					<option value="timberwolves"> Minnesota Timberwolves </option>
					<option value="pelicans"> New Orleans Pelicans </option>
					<option value="knicks"> New York Knicks </option>
					<option value="thunder"> Oklahoma City Thunder </option>
					<option value="magic"> Orlando Magic </option>
					<option value="76ers"> Philadelphia 76ers </option>
					<option value="suns"> Phoenix Suns </option>
					<option value="trail_blazers"> Portland Trail Blazers </option>
					<option value="kings"> Sacramento Kings </option>
					<option value="spurs"> San Antonion Spurs </option>
					<option value="raptors"> Toronto Raptors </option>
					<option value="jazz"> Utah Jazz </option>
					<option value="wizards"> Washington Wizards </option>
				</select>
			</p>
			<input type="submit" onclick ="return(validate());"> </button>
		</fieldset>
	</form>
</body>
</html>