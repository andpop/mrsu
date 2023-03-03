<?php
function runTest()
{
	// String representation test
	$m1 = new Fraction(4, 8);
	$correct = "1/2";
	echo "Ожидается: $correct" . PHP_EOL;
	echo "Получено: $m1" . PHP_EOL;
	if ($m1 == $correct) {
		echo "Тест пройден".PHP_EOL;
	} else {
		echo "Тест НЕ ПРОЙДЕН".PHP_EOL;
	}

		// Adding test
	$m2 = new Fraction(1, 4);
	$m3 = $m1->add($m2);
	$correct = "3/4";
	echo "Сложение".PHP_EOL;
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
	echo "Вычитание".PHP_EOL;
	echo "Ожидается: $correct" . PHP_EOL;
	echo "Получено: " . $m5 . PHP_EOL;
	if ($m5 == $correct) {
		echo "Тест пройден".PHP_EOL;
	} else {
		echo "Тест НЕ ПРОЙДЕН".PHP_EOL;
	}

	// Multiplication test
	$m6 = new Fraction(7,9);
	$m7 = $m6->multi($m2);
	$correct = "7/36";
	echo "Умножение".PHP_EOL;
	echo "Ожидается: $correct" . PHP_EOL;
	echo "Получено: " . $m7 . PHP_EOL;
	if ($m7 == $correct) {
		echo "Тест пройден".PHP_EOL;
	} else {
		echo "Тест НЕ ПРОЙДЕН".PHP_EOL;
	}	

	// Division test
	$m8 = new Fraction(4,-7);
	$m9 = $m8->div($m2);
	$correct = "-2'2/7";
	echo "Деление".PHP_EOL;
	echo "Ожидается: $correct" . PHP_EOL;
	echo "Получено: " . $m9 . PHP_EOL;
	if ($m9 == $correct) {
		echo "Тест пройден".PHP_EOL;
	} else {
		echo "Тест НЕ ПРОЙДЕН".PHP_EOL;
	}	

	// Exponentation test
	$m10 = new Fraction(-3,5);
	$m11 = $m10->exp(3);
	$correct = "-27/125";
	echo "Возведение в степень".PHP_EOL;
	echo "Ожидается: $correct" . PHP_EOL;
	echo "Получено: " . $m11 . PHP_EOL;
	if ($m11 == $correct) {
		echo "Тест пройден".PHP_EOL;
	} else {
		echo "Тест НЕ ПРОЙДЕН".PHP_EOL;
	}	
}
