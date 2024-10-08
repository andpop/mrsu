[##](##)                             Лабораторная работа 2. Создание классов и объектов (язык PHP)
### Лекции
* "ООП - предыстория, базовые понятия" https://youtu.be/DzW_Yk4Yfqg
* "Особенности PHP" https://youtu.be/4HWzfnudxrs
### Задание
Реализовать класс `Fraction` для работы с рациональными числами, включающий методы:
* Конструктор  - принимает на вход числитель и знаменатель. Нужно предусмотреть проверку на допустимые значения.
* Геттер `getNumer(): number` - возвращает числитель (нормализованный).
* Геттер `getDenom(): number` - возвращает знаменатель (нормализованный).
* Сложение `add(Fraction $frac): Fraction` - складывает дробь с другой дробью. Возвращает новое число (новый объект класса `Fraction`).
* Вычитание `sub(Fraction $frac): Fraction` - находит разность между числом и переданной в качестве аргумента дробью. Возвращает новое число (новый объект класса `Fraction`).
* Символьное представление дроби `__toString()` в формате:
```
-2'1/2     // -2.5
3/4        // 0.75
```
Дроби должны храниться и выводиться в нормализованном виде (при возможности числитель и знаменатель сокращаются на НОД).
Методы `add()` и `sub()` должны возвращать новое рациональное число, а не мутировать объект. 

### Требования к оформлению и коду
* Работать нужно в ветке Task02 Git-репозитория.
* Все файлы должны размещаться в каталоге Task02.
* PHP-код должен быть оформлен в соответствии со стандартом PSR-12. 
* Описание класса разместить в файле Fraction.php

### Скрипт для проверки задания
* Создать файл Test.php с функцией `runTest()`.
* Создать запускной файл `run_test.php`, в котором с помощью выражения `require_once` будут загружаться классы и функции из Fraction.php и Test.php и вызываться функция `runTest()`.

### Тесты для проверки задания
В функции `runTest()` реализовать тест-кейсы для проверки корректности работы методов класса `Fraction`. Например: 
```
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
$m3 = $m1.add($m2);
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
$m5 = $m4.sub($m2);
$correct = "-2`3/4";
echo "Ожидается: $correct" . PHP_EOL;
echo "Получено: " . $m5 . PHP_EOL;
if ($m5 == $correct) {
    echo "Тест пройден".PHP_EOL;
} else {
    echo "Тест НЕ ПРОЙДЕН".PHP_EOL;
}

. . .
```
