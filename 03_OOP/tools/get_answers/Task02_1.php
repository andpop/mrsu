<?php


function runTest()
{
    // String representation test
    $m1 = new Fraction(4, 8);
    $correct = "1/2";
    echo "Ожидается: " . $correct . PHP_EOL;
    echo "Получено: " . $m1 . PHP_EOL;

    if ($m1 == $correct) {
        echo "Тест пройден".PHP_EOL;
    } else {
        echo "Тест НЕ ПРОЙДЕН".PHP_EOL;
    }

    // Adding test 1
    $m2 = new Fraction(1, 4);
    $correct = "3/4";
    $m3 = $m1->add($m2);
    echo "Ожидается: " . $correct . PHP_EOL;
    echo "Получено: " . $m3 . PHP_EOL;

    if ($m3 == $correct) {
        echo "Тест пройден".PHP_EOL;
    } else {
        echo "Тест НЕ ПРОЙДЕН".PHP_EOL;
    }

    // Subtraction test 1
    $m4 = new Fraction(-5, 2);
    $correct = "-2'3/4";
    $m5 = $m4->sub($m2);
    echo "Ожидается: " . $correct . PHP_EOL;
    echo "Получено: " . $m5 . PHP_EOL;

    if ($m5 == $correct) {
        echo "Тест пройден".PHP_EOL;
    } else {
        echo "Тест НЕ ПРОЙДЕН".PHP_EOL;
    }
    
    // Adding test 2
    $m6 = new Fraction(25, 6);
    $correct = "1'5/12";
    $m7 = $m6->add($m4);
    echo "Ожидается: " . $correct . PHP_EOL;
    echo "Получено: " . $m7 . PHP_EOL;

    if ($m7 == $correct) {
        echo "Тест пройден".PHP_EOL;
    } else {
        echo "Тест НЕ ПРОЙДЕН".PHP_EOL;
    }

    // Subtraction test 2
    $m8 = new Fraction(-7, 8);
    $correct = "2'7/24";
    $m9 = $m6->sub($m8);
    echo "Ожидается: " . $correct . PHP_EOL;
    echo "Получено: " . $m9 . PHP_EOL;

    if ($m9 == $correct) {
        echo "Тест пройден".PHP_EOL;
    } else {
        echo "Тест НЕ ПРОЙДЕН".PHP_EOL;
    }
}