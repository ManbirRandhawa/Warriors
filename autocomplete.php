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
/*
         if (!is_numeric($_GET['playerId']) && (stripos($player->name, $_GET['playerId'])) === 0)
                {

            $results[] = $player;
            
        }*/
        $results[] = $player;
    }
    
        
    

    // prepare xml data
    if (sizeof($results) != 0) {
        header('Content-type: text/xml');
        echo "<players>";
        foreach ($results as $result) {
            echo "<player>";
            echo "<playerId>" . $result->playerId . "</playerId>";
            echo "<name>" . $result->name . "</name>";
            echo "<position>" . $result->position . "</position>";
            echo "<team>" . $result->team . "</team>";
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
