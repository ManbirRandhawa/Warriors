<?php

require_once("playerData.php");


session_start();

$playerData = new playerData();
$players = $playerData->players;

$results = array();
$namesAdded = false;

// simple matching for start of first or last name, or both
if (isset($_GET['action']) && $_GET['action'] == "complete") {
    
    foreach ($players as $player) {

        if (!is_numeric($_GET['id']) &&
                // if id matches first name
                (stripos($player->first_name, $_GET['id']) === 0 ||
                // if id matches last name
                stripos($player->last_name, $_GET['id']) === 0) ||
                // if id matches full name
                stripos($player->first_name . " " . $player->last_name, $_GET['id']) === 0) {

            $results[] = $player;
        }
    }

/*
         if (!is_numeric($_GET['playerId']) && (stripos($player->name, $_GET['playerId'])) === 0)
                {

            $results[] = $player;
            
        }*/
        //$results[] = $player;
    //}
    
        
    

    // prepare xml data
    if (sizeof($results) != 0) {
        header('Content-type: text/xml');
        echo "<players>";
        foreach ($results as $result) {
            echo "<player>";
            echo "<player_id>" . $result->player_id . "</player_id>";
            echo "<first_name>" . $result->first_name . "</first_name>";
            echo "<last_name>" . $result->last_name . "</last_name>";
            echo "<position_name>" . $result->position_name . "</position_name>";
            echo "</player>";
        }
        echo "</players>";
    }
}


// if user chooses from pop-up box
if (isset($_GET['action']) && isset($_GET['id']) && $_GET['action'] == "lookup") {
    foreach ($players as $player) {
        if ($player->id == $_GET['id']) {

            $_SESSION ["id"] = $player->id;
            $_SESSION ["firstName"] = $player->firstName;
            $_SESSION ["lastName"] = $player->lastName;
            $_SESSION ["category"] = $player->category;

            header("Location: playerView.php");
        }
    }
}

?>
