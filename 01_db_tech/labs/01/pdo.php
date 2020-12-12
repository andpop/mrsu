<?php
$db = new PDO('sqlite:test.db');
$res = $db->query('select * from test');
foreach ($res as $row) {
    echo $row['name'] . PHP_EOL;
}

