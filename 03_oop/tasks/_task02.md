Создать класс `Book` для хранения данных о книгах с полями: id, Название, Автор (ы), Издательство, Год издания, Количество страниц, Цена, Тип переплета.

1. Определить конструктор и методы чтения/записи полей.
2. Определить метод `__toString()` для вывода полной информацию об объекте в консоль.
3. Поле id должно быть автоинкрементным (вычисляется автоматически).
4. Методы-сеттеры должны быть организованы по принципу "текучего интерфейса", чтобы их вызовы можно было объединять в цепочки (`$book->setName(...)->setYear(...)->setPages->...`).
5. Создать массив объектов-экземпляров класса `Book`. С помощью цикла вывести:
    * список книг заданного автора;
    * список книг, выпущенных заданным издательством;
    * список книг, выпущенных после заданного года.
