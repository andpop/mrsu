##                             Лабораторная работа 3 (PHP). Создание классов и объектов. Паттерн Fluent Interface. Модульное тестирование кода
### Задание 1
Используя фреймворк PHPUnit (https://phpunit.readthedocs.io/ru/latest/index.html), написать модульные тесты для методов класса из лабораторной работы 2. Нужно предусмотреть проверку всех тест-кейсов, которые вы рассматривали в файле Test.php.
Пример тестов можно посмотреть в каталоге PHPUnit_example.

### Требования к оформлению и коду
* Работать нужно в ветке Task03 Git-репозитория.
* Класс из л/р 2 с добавленными тестами поместить в каталог Task03/Task03_1 (файл src/Test.php больше не нужен).
* PHPUnit установить локально в проект (`composer require phpunit/phpunit`). Прогон тестов из каталога tests: `./vendor/bin/phpunit --color tests`

- - -

### Задание 2
1. Создать класс `Book` для хранения данных о книгах: Id, название, автор(ы) (авторов может быть несколько!), издательство, год издания.
* Определить конструктор и методы чтения (`get`)/записи (`set`) для всех полей.
* Определить метод `__toString()` для вывода полной информацию об объекте в консоль в формате:

```
Id: 5
Название: PHP forever
Автор1: Gates B.
Автор1: Smith J.
Издательство: O'Reily
Год: 2020
```
* Поле Id должно быть автоинкрементным (начинается с единицы и автоматически увеличивается при создании нового экземпляра класса).
* Методы-сеттеры должны быть организованы по принципу "текучего интерфейса", чтобы их вызовы можно было объединять в цепочки (`$book->setTitle(...)->setAuthors(...)->setPublisher(...)->setYear(...)`)

2. Определить класс `BooksList`, который в поле `books` будет содержать массив объектов-экземпляров класса `Book`. Создать методы:
* `add(Book $book)` - добавляет данные об одной книге.
* `count() : int` - возвращает количество книг в массиве.
* `get(int n) : Book` - возвращает `n`-й элемент массива книг.
* `store(string fileName)` - сериализует список книг (содержимого массива в поле `books`) и сохраняет его в файле `fileName`.
* `load(string fileName)` - загружает список книг из файла `fileName`, десериализует этот список и записывает полученный массив в поле `books`.
3. Используя PHPUnit, написать модульные тесты для проверки корректности работы методов классов `Book` и `BooksList`.

### Требования к оформлению и коду
* Работать нужно в ветке Task03 Git-репозитория.
* Класс с добавленными тестами поместить в каталог Task03/Task03_2.
* PHPUnit установить локально в проект (`composer require phpunit/phpunit`). Прогон тестов из каталога tests: `./vendor/bin/phpunit --color tests`
* Требования к оформления PHP-кода приведены в файле [PHP_instruction.md](PHP_instruction.md)

- - -

### Отправка задания на проверку
Процедура отправки задания на проверку и манипуляции с репозиториями после проверки описаны в файле [Git_instruction.md](Git_instruction.md).
