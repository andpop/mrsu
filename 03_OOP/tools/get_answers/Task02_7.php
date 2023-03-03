<?php

function runTest()
{
    $v1 = new Vector(2, 2, 8);
    echo "Ожидается: (2;2;8)" . PHP_EOL;
    echo "Получено: " . $v1 . PHP_EOL;

    $v2 = new Vector(4, 1, 9);
    $v3 = $v1->add($v2);
    echo "Ожидается: (6;3;17)" . PHP_EOL;
    echo "Получено: " . $v3 . PHP_EOL;

    $v3 = $v1->sub($v2);
    echo "Ожидается: (-2;1;-1)" . PHP_EOL;
    echo "Получено: " . $v3 . PHP_EOL;

    $v3 = $v1->product(3);
    echo "Ожидается: (6;6;24)" . PHP_EOL;
    echo "Получено: " . $v3 . PHP_EOL;

    $v3 = $v1->scalarProduct($v2);
    echo "Ожидается: 82" . PHP_EOL;
    echo "Получено: " . $v3 . PHP_EOL;

    $v3 = $v1->vectorProduct($v2);
    echo "Ожидается: (10;14;-6)" . PHP_EOL;
    echo "Получено: " . $v3 . PHP_EOL;
}

