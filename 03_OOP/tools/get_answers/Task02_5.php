<?php
function runTest()
{
    // String representation test
    $m1 = new Fraction(4, 8);
    $correct = "1/2";
    echo "Ожидается: $correct" . PHP_EOL;
    echo "Получено: " . $m1 . PHP_EOL;
    if ($m1 == $correct) {
        echo "Тест пройден".PHP_EOL;
    } else {
        echo "Тест НЕ ПРОЙДЕН".PHP_EOL;
    }

    // Adding test
    $m2 = new Fraction(1, 4);
    $m3 = $m1->add($m2);
    $correct = "3/4";
    echo "Ожидается: $correct" . PHP_EOL;
    echo "Получено: " . $m3 . PHP_EOL;
    if ($m3 == $correct) {
        echo "Тест пройден".PHP_EOL;
    } else {
        echo "Тест НЕ ПРОЙДЕН".PHP_EOL;
    }

    // Subtraction test
    $m4 = new Fraction(-5, 2);
    $m5 = $m4->sub($m2);
    $correct = "-2'3/4";
    echo "Ожидается: $correct" . PHP_EOL;
    echo "Получено: " . $m5 . PHP_EOL;
    if ($m5 == $correct) {
        echo "Тест пройден".PHP_EOL;
    } else {
        echo "Тест НЕ ПРОЙДЕН".PHP_EOL;
    }

    $m6 = new Fraction(25, 6);
    $m7 = $m6->add($m4);
    $correct = "1'5/12";
    echo "Ожидается: 1'5/12" . PHP_EOL;
    echo "Получено: " . $m7 . PHP_EOL;
    if ($m7 == $correct) {
        echo "Тест пройден".PHP_EOL;
    } else {
        echo "Тест НЕ ПРОЙДЕН".PHP_EOL;
    }

    $m8 = new Fraction(-70, 8);
    $m9 = $m6->sub($m8);
    echo "Ожидается: 10'1/6" . PHP_EOL;
    echo "Получено: " . $m9 . PHP_EOL;

    
}