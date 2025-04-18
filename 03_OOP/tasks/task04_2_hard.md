##                             Лабораторная работа 4 (PHP). Реализация абстрактных типов данных (АТД) с помощью ООП
1. Создать класс `Stack`, моделирующий работу стека (LIFO, Last In First Out). Данный класс должен реализовать интерфейс `StackInterface`, содержащий методы:
* `push(mixed elem1, mixed elem2, ...) : void` - добавить один или несколько элементов на вершину стека (предусмотреть разное число аргументов).
* `pop() : mixed` - снять элемент с вершины стека и вернуть его. Если стек пустой, вернуть `null`.
* `top() : mixed` - вернуть элемент с вершины стека, не удаляя его.
* `isEmpty() : bool` - проверка стека на пустоту.
* `copy() : Stack` - создать копию стека.
* `__toString() : string` - символьное представление стека в виде [5->4->3->2->1]. Последний добавленный в стек элемент должен отображаться слева.

Для внутреннего хранения стека использовать массив.
Стек инициализируется произвольным числом элементов с помощью конструктора класса `Stack`.

2. Создать класс `Queue`, моделирующий работу очереди (FIFO, First In First Out). Данный класс должен реализовать интерфейс `QueueInterface`, содержащий методы:
* `enqueue(mixed elem1, mixed elem2, ...) : void` - добавить один или несколько элементов в конец (хвост) очереди (предусмотреть разное число аргументов).
* `dequeue() : mixed` - удалить элемент из головы очереди и вернуть его. Если очередь пустая, вернуть `null`.
* `peek() : mixed` - вернуть элемент из головы очереди, не удаляя его.
* `isEmpty() : bool` - проверка очереди на пустоту.
* `copy() : Queue` - создать копию очереди.
* `__toString() : string` - символьное представление очереди в виде [1<-2<-3<-4<-5]. Первый добавленный в очередь элемент должен отображаться слева.

Для внутреннего хранения очереди использовать массив.
Очередь инициализируется произвольным числом элементов с помощью конструктора класса `Queue`.

3. Написать функцию `compareStrings(string $str1, string $str2): boolean`, которая сравнивает на равенство две строки, набранные в текстовом редакторе. Кроме обычных символов, строки могут содержать символ `#`, соответствующий нажатию клавиши Backspace (удаление предыдущего символа). 
Например:
```
compareStrings("ab#c", "ade##c");  // true
compareStrings("a#c", "c");  // true
compareStrings("abc###", "a#b#");  // true
```
При решении воспользоваться абстрактным типом данных "стек". 

4. Используя PHPUnit, написать модульные тесты для проверки корректности работы всех методов классов `Stack`, `Queue` и функции `compareStrings`.

### Требования к оформлению и коду
* Работать нужно в ветке Task04 Git-репозитория, в каталоге Task04.
* PHPUnit установить локально в проект (`composer require phpunit/phpunit`). Прогон тестов из каталога tests: `./vendor/bin/phpunit --color tests`
* Требования к оформления PHP-кода приведены в файле [PHP_instruction.md](PHP_instruction.md)

- - -

### Отправка задания на проверку
Процедура отправки задания на проверку и манипуляции с репозиториями после проверки описаны в файле [Git_instruction.md](Git_instruction.md).
