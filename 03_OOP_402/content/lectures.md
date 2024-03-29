# Объектно-ориентированное программирование на языках высокого уровня
Мордовский госуниверситет, факультет математики и информатики, ФИиИТ, 8 семестр.

## Вводные и промежуточные лекции по инструментарию
### 1. Работа с командной строкой и Git в Windows
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

### 2. Особенности PHP
Видео из курса "Технологии создания приложений баз данных": https://youtu.be/4HWzfnudxrs

На лекции дан обзор некоторых возможностей и особенностей языка PHP:
- Запуск программ в консольном режиме. Пакетный и интерактивный режимы работы.
- Алгоритмические возможности, стандартные функции и расширения.
- Особенности работы с переменными и функциями.
- Разделение программы на модули. Подключение файлов, автозагрузка с помощью Composer.
- Требования к оформлению кода. Стандарты PSR

Полезные ссылки:
* Стандарты PSR для PHP: https://www.php-fig.org/
* Автоматическая проверка соответствия оформления стандарту - PHP Code Sniffer (https://github.com/squizlabs/PHP_CodeSniffer)
* Автоматическое форматирование - PHP Coding Standard Fixer (https://github.com/FriendsOfPHP/PHP-CS-Fixer)
* Руководство по чистому коду в PHP на русском языке: https://github.com/peter-gribanov/clean-code-php
Темы:
* Начало
* Цель первых лабораторных работ - создать консольное приложение на языке PHP, работающее с БД SQLite
* Настройка окружения для выполнения лабораторных работ
* Распространение PHP-кода с помощью пакетного менеджера Composer и репозитория Packagist
* Сложность предварительных работ по настройке окружения
* PHP как императивный процедурный язык
* Специфика языка PHP
* Запуск простейшей программы на PHP
* Интерактивный режим работы с PHP (php -a)
* Реализация в PHP основных алгоритмических возможностей
* Переменные в PHP. PHP как динамический язык
* Слабая типизация в PHP
* Зависимость переменных от регистра имени
* Подпрограммы (функции) в PHP
* Независимость функций от регистра имени
* Вызов функции до ее определения
* Type hinting
* Вложенные функции
* Области видимости
* Обращение к глобальным переменным из функций
* Статические переменные
* Передача аргументов в функции
* Разделение кода на несколько файлов (модульность)
* Включение одного файла в другой (include и require)
* Автозагрузка файлов с помощью Composer
* Особенности включения файлов в PHP
* В подключаемых файлах не должно быть выполняемого кода
* Стандартные встроенные функции и библиотеки
* Массивы (обычные и ассоциативные)
* Цикл foreach
* Требования к оформлению PHP-кода. Стандарты PSR
* Требования к выполнению л/р 3
* Самодокументируемый структурный код

### 3. Composer в PHP: установка пакетов, автозагрузка файлов и классов
Видео: https://youtu.be/6dA7Ti2o33M
* Для чего нужен менеджер зависимостей Composer
* Создание нового приложения с помощью Composer.
* Подключение в проект внешнего пакета из репозитория Packagist.
* Автозагрузка подключенных пакетов.
* Автозагрузка функций из внешних файлов.
* Автозагрузка классов по стандарту PSR-4.
* Подключение в проект линтера PHP Code Sniffer
* Сохранение PHP-проекта в репозитории Git. Файл .gitignore
* Обзор лабораторной работы

### 4. Тестирование в PHP
Рассматривается пример тестирования класса `Fraction` для представления рациональных дробей.

Видео: https://youtu.be/49LEerPmhrk?t=5315

### 5. Тестирование в JavaScript
Рассматриваются примеры использования фреймворка Jest для тестирования JavaScript-кода. 

Видео: https://youtu.be/hFnJtssJsHc
* Инициализация проекта JavaScript с помощью npm
* Установка Jest
* Создание и запуск тестов в модульной системе CommonJS
* Мэтчеры Jest
* Создание и запуск тестов для модулей ES6
* Определение степени покрытия кода тестами

---

## Основные лекции по ООП

### 1. ООП - предыстория, базовые понятия
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

### 2. ООП - базовые понятия и механизмы
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

### 3. Разновидности объектов. Отношения между классами и объектами
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


### 4. Итераторы и генераторы. Принципы SOLID
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

### 5. Паттерны проектирования
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

### 6. ООП в JavaScript
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

### 7. Использование this в JavaScript
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

### 8. Компонентный подход к программированию
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

### 9. Работа с объектами с помощью PowerShell
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

