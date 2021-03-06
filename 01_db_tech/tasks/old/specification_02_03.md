## Задача для первого блока
### Вариант 3
Написать программу для игры "Виселица" (hangman). Компьютер загадывает слово из шести букв (список возможных слов нужно заранее сгенерировать и сохранить в базе данных) и рисует на странице отдельные пустые клетки для каждой буквы. Игрок пытается угадать буквы, а затем и все слово целиком.
Если игрок правильно угадывает букву, компьютер вписывает ее в клетку. Если ошибается, то рисует одну из частей тела повешенного человека (использовать псевдографику). Чтобы победить, игрок должен угадать все буквы в слове до того, как повешенный человечек будет полностью нарисован.

* * *

Псевдографика для игры:
```
+---+    +---+    +---+    +---+    +---+    +---+    +---+
    |    0   |    0   |    0   |    0   |    0   |    0   |
    |        |    |   |   /|   |   /|\  |   /|\  |   /|\  |
    |        |        |        |        |   /    |   / \  |
   ===      ===      ===      ===      ===      ===      ===
```

* Информация о датах и исходах всех партий, а также о всех попытках, сделанных во время игры, должна сохраняться в базе данных SQLite.
* Для каждой игры в базе должна храниться следующая информация:
    * Дата игры
    * Имя игрока
    * Загаданное компьютером слово
    * Исход игры (угадал/не угадал)
    * Запись попыток в формате: 
      `номер попытки | предложенная буква | результат`
* В программе должны быть реализованы три режима, которым соответствуют ключи:
    * `--new`. Новая игра.
    * `--list`. Вывод списка всех сохраненных игр.
    * `--replay id`. Повтор игры с идентификатором id.

