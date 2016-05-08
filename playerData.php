
<?php

require "player.php";




class playerData {

public $players;
   // public $players;

public $sql;
//mysqli_select_db($con,"Warriors");

public $result;

public $con;






        
    function __construct() {

        $this->con = mysqli_connect('localhost','root','', 'Warriors');
    if (!$this->con) {
    die('Could not connect: ' . mysqli_error($this->con));
}
   

       $this->sql="SELECT * FROM players";
      $this->result = mysqli_query($this->con,$this->sql);
        //new player(playerId, name, position, team);
       $this->players = array();

        while($row = mysqli_fetch_array($this->result)) {

            $this->players[] = new player($row['player_id'], $row['first_name'], $row['last_name'], $row['position_name']);

            }

           
            mysqli_close($this->con);

        //array_push($playerz, $playerid, $name, $position, $team);
            
        /*new player("1", "Kobe", "Bryant", "Shooting Guard"),
        new player("2", "Stephen", "Curry", "Point Guard"),
        new player("3", "Lebron", "James", "Small Foward"),
        new player("4", "Klay", "Thompson", "Small Foward"),
	new player("5", "Draymond", "Green", "Small Foward"),
	new player("6", "Festuz", "Ezeli", "Small Foward"),
	new player("7", "Andrew", "Bogut", "Small Foward"),
	new player("8", "Harrison", "Barnes", "Small Foward"),*/
        return $this->players;
    }
   

}

?>
