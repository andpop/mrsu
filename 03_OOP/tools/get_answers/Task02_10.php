<?php

function runTest()
{
    $v1 = new Vector(1, 2, 3);
    echo "Ожидается: (1;2;3)" . PHP_EOL;
    echo "Получено: " . $v1 . PHP_EOL;

    $v2 = new Vector(1, 4, -2);
    $v3 = $v1->add($v2);
    echo "Ожидается: (2;6;1)" . PHP_EOL;
    echo "Получено: " . $v3 . PHP_EOL;

    $v3 = $v1->sub($v2);
    echo "Ожидается: (0;-2;5)" . PHP_EOL;
    echo "Получено: " . $v3 . PHP_EOL;

    $v3 = $v1->product(3);
    echo "Ожидается: (3;6;9)" . PHP_EOL;
    echo "Получено: " . $v3 . PHP_EOL;

    $v3 = $v1->scalarProduct($v2);
    echo "Ожидается: 3" . PHP_EOL;
    echo "Получено: " . $v3 . PHP_EOL;

    $v3 = $v1->vectorProduct($v2);
    echo "Ожидается: (-16;5;2)". PHP_EOL;
    echo "Получено: " . $v3 . PHP_EOL;
}
