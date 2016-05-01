<?php

class player {

    public $id;
    public $firstName;
    public $lastName;
    public $category;

    function __construct($id, $firstName, $lastName, $category) {
        $this->id = $id;
        $this->firstName = $firstName;
        $this->lastName = $lastName;
        $this->category = $category;
    }
}
?>
