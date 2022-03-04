# Объектно-ориентированное программирование на языках высокого уровня
### ФИИТ, 6 семестр

Примеры кода: https://github.com/andpop/MRSU-examples/tree/main/oop

## Вводная лекция. Работа с командной строкой и Git в Windows
Ликбез по работе с командной строке и системой Git в операционной системе Windows (для выполнения лабораторных работ).

Видео: https://youtu.be/UM6jaYa1YY8
* Запуск стандартной командной строки  
* Командная строка как интерфейс для общения человека с компьютером  
* Запуск приложений из командной строки  
* Поиск подходящего файла для выполнения  
* Переменные среды  
* Пути для поиска в переменной PATH  
* Исполняемые файлы. Переменная PATHEXT  
* Внутренние команды, не имеющие исполняемого файла  
* Оболочка (командный интерпретатор)  
* Командная строка = Консоль + Оболочка  
* Оболочка cmd.exe и консоль conhost.exe  
* Какие команды знает оболочка cmd.exe?  
* Интерактивный и пакетный режимы работы оболочки  
* Оболочка Windows PowerShell  
* Windows Terminal  
* Linux внутри Windows (WSL). Оболочка bash  
* Преимущества командного интерфейса, повторяемость действий  
* Консольные файловые менеджеры. FAR Manager  
* Git как стороннее приложение  
* Варианты установки Git  
* Добавление пути в переменную PATH  
* Оболочка Git Bash  
* Работа с Git в cmd.exe и PowerShell  
* Автодополнение команд Git в Git Bash  
* Создание нового Git-репозитория  
* Конфигурационный файл репозитория  
* Выполнение коммита  
* Просмотр истории коммитов  
* Создание новой ветки  
* Выводы


### Лабораторная работа 1. Подготовка окружения для выполнения заданий
[Полный текст](./tasks/task01.md)
* Настройка GitHub и Git
* Установка PHP
* Создание запускного файла
* Отправка задания на проверку
* Темы для изучения

---

## 1. ООП - предыстория, базовые понятия
Рассматриваются внутренние характеристики качества ПО. Обсуждаются парадигмы программирования, предшествовавшие ООП (процедурный и модульный подходы, структурное программирование). Знакомство с базовыми понятиями ООП: классы, объекты, конструкторы, инкапсуляция и сокрытие данных, наследование.

Видео: https://youtu.be/DzW_Yk4Yfqg
* План курса
* Основная цель ООП как одного из подходов к программированию
* Скорость появления нового функционала как мера оценки проектов
* Внешние и внутренние характеристики качества ПО
* Краткосрочная и долгосрочная производительность при разработке ПО
* Внутренние характеристики качества
* Главный ресурс программиста - концентрация внимания
* Пример рефакторинга кода для повышения внутренних характеристик качества
* Эволюция парадигм программирования
* Стихийный подход (монолитная структура с глобальными данными)
* Структурное программирование
* Модульная структура программы
* Базовые понятия ООП
* Объекты в ООП
* Объектно-ориентированный API
* Понятие класса
* Конструкторы
* Основные принципы ООП: инкапсуляция и сокрытие данных, наследование, полиморфизм
* Принцип сокрытия данных. Интерфейс и реализация
* Принцип наследования (расширения)

### Лабораторная работа 2 (PHP). Создание классов и объектов (язык PHP)
[Вариант 1](./tasks/task02_1.md) [Вариант 2](./tasks/task02_2.md)
* Лекции
* Задание
* Требования к офрмлению и коду
* Скрипт для проверки задания
* Тесты для проверки задания

---

## 2. ООП - базовые понятия и механизмы
На примере PHP рассматриваются базовые понятия и механизмы ООП: классы, объекты, конструкторы, инкапсуляция и сокрытие данных, наследование, полиморфизм, интерфейсы, трейты, статические свойства и методы. Даются пояснения для л/р 2.

Видео: https://youtu.be/49LEerPmhrk
* Процедурный и объектно-ориентирПроцедурный и объектно-ориентированный подходы к написанию программ 
* Описание класса и создание экземпляра  
* Сравнение объектов  
* Конструкторы  
* Инкапсуляция и сокрытие данных  
* Наследование  
* Полиморфизм  
* События и сообщения  
* Пространства имен  
* Статические свойства и методы  
* Дополнительные конструкторы  
* Текучий интерфейс (fluent interface)  
* Интерфейсы  
* Примеси (traits)  
* Тестирование с помощью PHPUnit ованный подходы к написанию программ 
* Описание класса и создание экземпляра  
* Сравнение объектов  
* Конструкторы  
* Инкапсуляция и сокрытие данных  
* Наследование  
* Полиморфизм  
* События и сообщения  
* Пространства имен  
* Статические свойства и методы  
* Дополнительные конструкторы  
* Текучий интерфейс (fluent interface)  
* Интерфейсы  
* Примеси (traits)  
* Тестирование с помощью PHPUnit 

### Лабораторная работа 3 (PHP). Создание классов и объектов. Паттерн Fluent Interface. Модульное тестирование кода
[Вариант 1](./tasks/task03_1.md) [Вариант 2](./tasks/task03_2.md)
* Лекции
* Задание 1
* Требования к оформлению и коду
* Задание 2
* Требования к оформлению и коду
* Отправка задания на проверку

---

## 3. Разновидности объектов. Отношения между классами и объектами
Обсуждаются различные разновидности объектов (абстракции объектов реального мира, модели абстрактных объектов, объекты для конфигурации, упаковка родственных операций) и виды взаимодействия между классами (наследование, композиция, агрегация). Приводятся примеры разделения ответственности между классами. Рассматриваются диаграммы классов (UML). 

Видео: https://youtu.be/U-AxKi_yybw
* Причины создания классов  
* Абстракции реальных объектов  
* Объекты-значения  
* Объекты для конфигурации  
* Упаковка в класс родственных операций  
* Вложенные объекты  
* Виды взаимодействия между объектами. Наследование, композиция, аггрегация. 
* Разделение ответственности между классами  
* Зависимость от интерфейса, а не от реализации  
* UML-диаграммы 

### Лабораторная работа 4 (PHP). Реализация абстрактных типов данных (АТД) с помощью ООП
[Вариант 1](./tasks/task04_1.md) [Вариант 2](./tasks/task04_2.md)
* Лекции
* Задания 1-4
* Требования к оформлению и коду
* Отправка задания на проверку

---

## 4. Итераторы и генераторы. Принципы SOLID
Рассматривается реализация итераторов и генераторов в PHP (на базе стандартной библиотеки SPL PHP). Обсуждаются принципы SOLID построения кода в ООП. 

Видео: https://youtu.be/gS_Pd7uD8eE
* Стандартная библиотека SPL PHP  
* Итераторы  
* Интерфейс FilterIterator  
* Генераторы  
* Снижение сложности с помощью ООП  
* Принципы DRY и SOLID  
* (S) - Single Responsibility Principle  
* Отделение чистого кода от кода с побочными эффектами  
* (O) - Open/Close Principle  
* (L) - Liskov Substitution Principle  
* (I) - Interface Segregation Principle  
* (D) - Dependency Inversion Principle 

---

## 5. Паттерны проектирования
Рассматривается реализация на языке PHP нескольких распространенных паттернов ООП.

Видео: https://youtu.be/f9P6X5KX6Wc
* Что такое паттерны (шаблоны) проектирования  
* История возникновения паттернов  
* Зачем нужно изучать паттерны  
* Классификация паттернов  
* Паттерн "Simple Factory"  
* Паттерн "Builder"  
* Паттерн "Singleton"  
* Паттерн "Decorator"  
* Паттерн "Strategy"  
* Паттерн "Facade"  
* Паттерн "Adapter"  
* Паттерн "State" 

---

## 6. ООП в JavaScript
Рассматриваются особенности и механизмы реализации ООП в языке JavaScript.

Видео: https://youtu.be/D_pJghB4Mqo
* Создание объектов без классов. Объектные литералы.  
* Создание объектов с помощью фабричной функции  
* Сокрытие данных в объекте. Реализация паттерна "Модуль"  
* Прототипы объектов  
* Создание объектов с использованием механизма прототипов  
* Создание объектов с помощью оператора new  
* Создание объектов с использованием синтаксиса классов  
* Геттеры и сеттеры  
* Приватные свойства  
* Наследование классов  
* Перекрытие методов в наследниках  
* Class expression. Примеси для классов

---

##7. Использование this в JavaScript
Рассматриваются правила связывания this с объектами в языке JavaScript. 

Видео: https://youtu.be/oNYpmRVbHZsFh
* Три варианта создания объекта в JavaScript
* Задание объекта в виде литерала. this внутри методов таких объектов
* Создание объекта через Object.create().
* this внутри методов объектов, созданных с помощью Object.create()
* Создание объекта с помощью оператора new. this внутри методов таких объектов
* Значение this внутри функции, вызванной как метод. Контекст выполнения функции
* Деструктуризация по объекту
* Spread-оператор для объекта
* Зависимость this от места вызова функции
* Правило для определения значения this (контекста выполнения) в функции
* Задание контекста выполнения функции с помощью bind(), call() и apply()
* Потеря значения this во внутренней функции
* Другие примеры потери значения this (косвенные ссылки и коллбэки)
* this и стрелочные функции (не имеют собственного контекста выполнения)
* Значение this в функциях, которые хранятся в массиве
* Правило безопасного применения this в коде

---

##8. Тестирование в JavaScript
Рассматриваются примеры использования фреймворка Jest для тестирования JavaScript-кода. 

Видео: https://youtu.be/hFnJtssJsHc
* Инициализация проекта JavaScript с помощью npm
* Установка Jest
* Создание и запуск тестов в модульной системе CommonJS
* Мэтчеры Jest
* Создание и запуск тестов для модулей ES6
* Определение степени покрытия кода тестами

---

## 9. Компонентный подход к программированию
Обсуждаются бинарные объекты-компоненты, хранящиеся внутри операционной системы Windows. Рассматривается работа с такими объектами с помощью сценариев Windows Script Host. 

Видео: https://youtu.be/aJ3VyQtclKc
* Повторное использованию кода на одном языке программирования. Пакетные менеджеры.  
* Задача повторного использования кода вне зависимости от языка программирования.  
* Стандартизация, компонентный подход к программированию.  
* Внутренние объекты в операционной системе Windows.  
* Архитектура системы Windows Management Instrumentation (WMI).  
* Объекты COM (Component Object Model).  
* Просмотр информации о классах COM-объектов, зарегистрированных в системе .  
* Полезные объектные системы в Windows.  
* Использование бинарных объектов для автоматизации операций в операционной системе.  
* Сценарии (скрипты) для доступа к объектам операционной системы.  
* Программы и скрипты. Назначение компьютерных скриптов.  
* Зачем нужны специализированные языки для сценариев операционной системы.  
* Пожелания к языку сценариев для операционной системы.  
* Три стандартных инструмента автоматизации в Windows.  
* Причины создания и возможности языка VBScript для сценариев Windows.  
* Один язык сценариев для браузера и локальной машины. Запуск сценариев VBScript и JScript с помощью Windows Script Host (WSH).  
* Доступ из сценариев WSH к внешним объектам.  
* Примеры сценариев на JScript, работающих с внешними объектами и WMI.  
* Две составляющие сценариев WSH.  
* Каких возможностей не хватает сценариям WSH? 

---

## 10. Работа с объектами с помощью PowerShell
Рассматривается работа с объектами-компонентами внутри Windows с помощью команд и сценариев Microsoft PowerShell. 

Видео: https://youtu.be/WdZDeL9mcdI
* Объекты внутри Windows
* Требования к языку сценариев для автоматизации работы в Windows
* Три стандартных инструмента автоматизации в Windows.
* Недостатки Windows Script Host - причины создания командной оболочки и среды выполнения сценариев PowerShell.
* Уникальное отличие PowerShell от других командных оболочек.
* Отсутствие конвейеризации в стандартных языках сценариев, работающих с объектами.
* PowerShell как гибрид командной оболочки и объектно-ориентированного языка сценариев. Конвейеризация объектов, а не текста.
* Фундамент PowerShell - платформа .NET Framework.
* Самодокументируемость объектов PowerShell.
* Просмотр доступных свойств и методов объекта с помощью Get-Member.
* Изменение представления объекта на экране с помощью Format-Table, Format-List.
* Основные возможности и особенности PowerShell.
* Обработка объектов в конвейере. Фильтрация, сортировка, выделение объектов и свойств, группировка, измерение характеристик.
* Доступ к COM-объектам и WMI.
* Краткость и выразительность сценариев PowerShell.
* Преимущества PowerShell как языка программирования.
* Примеры сценариев PowerShell для практических задач (HTTP-запросы, парсинг HTML).
* Навигация по устройствам PowerShell (PSDrives).
* Пример сценария с графическим интерфейсом Windows.Forms.
* Политики запуска сценариев PowerShell.
* Проверка выполняемых операция с помощью ключа -WhatIf.