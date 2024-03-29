## Лабораторная работа 7 (JavaScript).  Объектно-ориентированное программирование в JavaScript
### Лекции
* "ООП в JavaScript" https://youtu.be/D_pJghB4Mqo
* "Использование this в JavaScript" https://youtu.be/oNYpmRVbHZs
* "Тестирование в JavaScript" https://youtu.be/hFnJtssJsHc

## Задание 1. Работа с объектами-литералами
1. Напишите функцию `createFraction(numerator, denominator)`, создающую объекты
   для работы с рациональными числами. Реализуйте методы:
* Геттер `getNumer()` - возвращает числитель (нормализованный).
* Геттер `getDenom()` - возвращает знаменатель (нормализованный).
* Сложение `add(frac)` - складывает дробь с другой дробью. Возвращает новое
  число (новый объект).
* Вычитание `sub(frac)` - находит разность между числом и переданной в качестве
  аргумента дробью. Возвращает новое число (новый объект).
* Символьное представление дроби `toString()` в формате: ``` -2'1/2     // -2.5
  3/4        // 0.75 ``` Дроби должны храниться и выводиться в нормализованном
  виде (при возможности числитель и знаменатель сокращаются на НОД).  Методы
  `add()` и `sub()` должны возвращать новое рациональное число, а не мутировать
  объект. 
2. Используя Jest, написать модульные тесты для проверки корректности
   реализованных методов.

### Требования к оформлению и коду
* Работать нужно в ветке Task07 Git-репозитория.
* Проект для решения задания с тестами разместить в каталоге Task07/Task07_1.

- - -

## Задание 2. Использование конструкторов и прототипов
1. Повторить задание 1, но для создания объектов использовать
   функцию-конструктор и прототипы.
2. Используя Jest, написать модульные тесты для проверки корректности
   реализованных методов.

### Требования к оформлению и коду
* Проект для решения задания с тестами разместить в каталоге Task07/Task07_2.

- - -

## Задание 3. Использование классов
1. Повторить задание 2 с использованием синтаксиса классов. Вместо методов
   `getNumer()` и `getDenom()` для чтения и записи числителя и знаменателя
   реализовать геттеры и сеттеры (с проверкой на допустимые значения).
2. Используя Jest, написать модульные тесты для проверки корректности
   реализованных методов.

### Требования к оформлению и коду
* Проект для решения задания с тестами разместить в каталоге Task07/Task07_3.

- - -

### Общие требования к оформлению и коду
* Работать нужно в ветке Task07 Git-репозитория.
* Установка линтера для JS
* Jest устанавливать локально для каждой задачит (`npm i --save-dev jest`). Как
  запускать

- - -

### Отправка задания на проверку Процедура отправки задания на проверку и
манипуляции с репозиториями после проверки описаны в файле
[Git_instruction.md](Git_instruction.md).
