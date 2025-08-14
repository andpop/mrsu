<?php
$a = 1;

function f()
{
    echo $GLOBALS['a'] . PHP_EOL;  // 1

    $GLOBALS['a'] = 2;    // Меняем значение глобальной переменной
}

f();

echo $a . PHP_EOL;   // 2

