## Контрольная работа
В Google таблицах имеются данные о посещаемости и успеваемости студентов 303, 304 и 402 групп.
* Общая посещаемость: https://docs.google.com/spreadsheets/d/1tVQ49DRPfhLKw_hBB5VaeG0v56gl8wAbClnkUW9li1Q/edit?usp=sharing
* Успеваемость 303 группы: https://docs.google.com/spreadsheets/d/1hMwvdDgN8tgwKckk6Hg0gm-bfMLnXJawjo6-qlUR_Og/edit?usp=sharing
* Успеваемость 402 группы: https://docs.google.com/spreadsheets/d/1pxxwKCGBtBTnQ4yH9q0qQVoTfofI9LWbf8Vannbxrxk/edit?usp=sharing 

### Задания:
* Cоздать базу данных marks.db (SQLite) в третьей нормальной форме для хранения этой информации.

* Перенести в созданную базу данных информацию из таблиц:
    * Данные об успеваемости всех студентов из групп 303, 402.
    * Данные о посещаемости за февраль.
    * Данные о посещаемости за 1-15 марта.
    * Данные о посещаемости за 16-31 марта.
    * Данные о посещаемости за апрель.

* Написать запросы для решения следующих задач:
    1. Определить и удалить дубли в таблице посещаемости (если студент посетил занятие в определенную дату, то запись об этом должна быть в таблице только одна).

    2.  Найти 5 лучших студентов по успеваемости в 303 группе, вывести их результаты по всем сданным лабораторным работам и общую сумму набранных баллов.
    2. Найти 5 лучших студентов по успеваемости в 402 группе, вывести их результаты по всем сданным лабораторным работам и общую сумму набранных баллов.
    2. Найти 5 отстающих студентов по успеваемости в 303 группе, вывести их результаты по всем сданным лабораторным работам и общую сумму набранных баллов.
    2. Найти 5 отстающих студентов по успеваемости в 402 группе, вывести их результаты по всем сданным лабораторным работам и общую сумму набранных баллов.

    3. Построить рейтинг по посещаемости занятий в 303 группе.
    3. Построить рейтинг по посещаемости занятий в 304 группе.
    3. Построить рейтинг по посещаемости занятий в 402 группе.

    4. Построить общую статистику посещаемости для 303 группы. Для каждого занятия вывести количество студентов, которые его посещали.
    4. Построить общую статистику посещаемости для 304 группы. Для каждого занятия вывести количество студентов, которые его посещали.
    4. Построить общую статистику посещаемости для 402 группы. Для каждого занятия вывести количество студентов, которые его посещали.

    5. Определить свой общий балл за выполненные работы и сравнить его (в процентах) с максимальным, минимальным и средним баллом по своей группе.


* * *
### Требования к оформлению и коду
* Работать нужно в ветке Test_SQL Git-репозитория.
* Скрипт для создания структуры БД и импорта данных должен называться db_init.sql, скрипт с запросами для решения задач - queries.sql.

### Отправка задания на проверку
Процедура отправки задания на проверку и манипуляции с репозиториями после проверки описаны в файле [Git_instruction.md](Git_instruction.md).

