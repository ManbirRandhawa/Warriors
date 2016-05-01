<?php

require "player.php";

class playerData {

    public $players;

    function __construct() {
        $this->players = array(
        new player("1", "Kobe", "Bryant", "Shooting Guard"),
        new player("2", "Stephen", "Curry", "Point Guard"),
        new player("3", "Lebron", "James", "Small Foward"),
        new player("4", "Klay", "Thompson", "Small Foward"),
	new player("5", "Draymond", "Green", "Small Foward"),
	new player("6", "Festuz", "Ezeli", "Small Foward"),
	new player("7", "Andrew", "Bogut", "Small Foward"),
	new player("8", "Harrison", "Barnes", "Small Foward"),
        );
    }

}
?>
