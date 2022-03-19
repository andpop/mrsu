<?php
class User {
    private $name;
    private $role;

    public function __construct($name, $role) {
        $this->name = $name;
        $this->role = $role;
    }

    public function changeName($name) {
        $this->name = $name;
    }

    public function changeRole($role) {
        $this->role = $role;
    }

    public function getName() {
        return $this->name;
    }

    public function getRole() {
        return $this->role;
    }

    public function __toString()
    {
        return $this->name . ' ' . $this->role;
    }

}

$user1 = new User('John', 1);
$user2 = new User('Smith', 2);

$users = [$user1, $user2];
$string = serialize($users);
/* echo $string; */

$users2 = unserialize($string);
echo $users2[0];

