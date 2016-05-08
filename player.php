<?php

class player {

    public $playerId;
    public $name;
    public $position;
    public $team;

    function __construct($playerId, $name, $position, $team) {
        $this->playerId = $playerId;
        $this->name = $name;
        $this->position = $position;
        $this->team = $team;
    }
}
?>
