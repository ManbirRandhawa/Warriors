<?php

class player {

    public $player_id;
    public $first_name;
    public $last_name;
    public $position_name;

    function __construct($player_id, $first_name, $last_name, $position_name) {
        $this->player_id = $player_id;
        $this->first_name = $first_name;
        $this->last_name = $last_name;
        $this->position_name = $position_name;
    }
}
?>
