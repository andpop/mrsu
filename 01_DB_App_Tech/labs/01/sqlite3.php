<?php
$ver = SQLite3::version();
var_dump($ver);

$db = new SQLite3('test.db');
$res = $db->query('select * from test');
var_dump($res->fetchArray());

