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
                (stripos($player->firstName, $_GET['id']) === 0 ||
                // if id matches last name
                stripos($player->lastName, $_GET['id']) === 0) ||
                // if id matches full name
                stripos($player->firstName . " " . $player->lastName, $_GET['id']) === 0) {

            $results[] = $player;
        }
    }

    // prepare xml data
    if (sizeof($results) != 0) {
        header('Content-type: text/xml');
        echo "<players>";
        foreach ($results as $result) {
            echo "<player>";
            echo "<id>" . $result->id . "</id>";
            echo "<firstName>" . $result->firstName . "</firstName>";
            echo "<lastName>" . $result->lastName . "</lastName>";
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
