Будем придерживаться современных стандартов программирования на PHP. 
* Создание проекта и подключение внешних зависимостей с помощью Composer.
* Использование пространств имен для всех файлов в проекте.
* Применение автозагрузки файлов в проект (стандарт PSR-4).
* Поддержка стандартной файловой структуры проекта.
* Построение архитектуры приложения по паттерну MVC.
* Соблюдение стандартов кодирования PSR-1,2.
* В модулях не должно быть исполняющегося кода. Запуск на выполнение функций может быть только в исполняющемся файле (скрипте).
* Написание самодокументируемого кода
    * Осмысленное именование сущностей (на английском языке)
    * Разбиение на подпрограммы (декомпозиция), чтобы каждую можно было охватить одним взглядом и понять, как она устроена.
    * Каждая подпрограмма должна решать ровно одну задачу и быть обособленной от других.


================================================================================

PHP родился из хаоса. Его спецификация появилась всего лишь в 2014 году, что как раз и позволило сторонним разработчикам реализовывать свои среды выполнения.

Исторические особенности PHP:
* Разнородное именование функций: они добавлялись по ходу дела в те времена, когда об этом никто не думал. В целом именование внутри языка очень непоследовательное и часто прямо противоречит PSR (официальные рекомендации по оформлению и
организации кода в PHP).
* Путаница с передачей параметров: одни и те же по смыслу функции могут принимать на вход параметры по-разному: например, в обратном порядке.  Поэтому в PHP сложнее запомнить сигнатуры функций.
* Странная система ошибок и предупреждений (Fatal, Warning, Notice).
* Хотя в PHP наконец-то добавили пространства имён, это не отменяет наличие механизма для прямой загрузки кода. В итоге получается что есть и пространства имён (которые можно не использовать), и отдельно прямой require.

### Composer
Ключевая программа в экосистеме PHP — Composer. Ключевая задача, которую решает Composer — управление зависимостями,
Composer – универсальный способ описывать любой код на PHP. Не важно с чем мы имеем дело, с библиотекой или с полноценным сайтом. В любом случае внутри будет Composer. Фактически, любой новый проект начинается не с написания кода, а с инициализации Composer. Для этого нужно запустить команду init. Она задаст несколько вопросов и на основе ваших ответов сформирует файл composer.json.

### Включение файлов друг в друга
Сайты (да и любые программы) на PHP содержат тысячи, десятки тысяч и сотни тысяч строк кода (есть проекты с миллионами). В таких условиях одним файлом с кодом не обойдешься - его нужно разбивать на части. Для получения доступа к коду, который находится в других файлах, в PHP реализован механизм включения, состоящий из 4 специальных конструкций: include, include_once, require и require_once.
Как вы увидите в следующих курсах, современный стандарт разработки на PHP полагается на механизм автозагрузки и запрещает использование явного включения файлов. Данный урок нужен лишь для понимания происходящих внутри процессов, но в реальном коде за включение файлов отвечает Composer — менеджер управления зависимостями, который будем проходить в курсе про настройку окружения.
### Использование пространств имен
Пространства имен позволяют создавать изолированный код, способный работать совместно с кодом других разработчиков.
Начиная с PHP версии 5.3 в языке появился механизм пространств имен, в задачу которого входит изоляция кода разных файлов друг от друга.
К сожалению, в силу исторических причин, пространства имён в PHP появились не с самого начала существования языка, как это принято при разработке языков. Из-за этого получилось, по сути, два независимых механизма, один - включение файлов как таковых, другой - пространства имён.
### Поддержка стандартной файловой структуры проекта
Файловая структура практически любого проекта на PHP выглядит так:
```
src/ # исходные файлы
tests/
composer.json
composer.lock
.git
README.md
```
Директория src предназначена для хранения исходного кода программы (сайта).  Ее структура НЕ плоская — внутри src могут находиться другие директории с PHP файлами внутри них:
```
my-site/
src/
Formatters/
Pretty.php
Generator.php
```
Отображать структуру пространств имен на файловую структуру нужно с помощью вложенных пространств имен. 
Каждый проект или пакет принято помещать в одно общее пространство и не загрязнять глобальное пространство множеством пространств имён. Это название выбирается на основе названия самого проекта — той директории, внутри которой лежит src. В нашей структуре директорий это my-site.
Это значит, что общим пространством для всех файлов внутри src будет My\Site.  Если имя директории содержит дефис, как в примере, то в таком случае он заменяется на \ (обратный слеш), а каждое слово начинается с заглавной буквы:
``` php
<?php
// src/Formatters/Pretty.php
namespace My\Site\Formatters\Pretty;
// some code

<?php
// src/Generator.php
namespace My\Site\Generator;
// some code
```
Чтобы не писать длинные пути к функциям из пространств имен, можно их импортировать с помощью ключевого слова use. Для импортируемой функции можно задать псевдоним с помощью ключевого слова as.

К сожалению, из-за того, что пространства имён в языке появились не сразу, PHP позволяет создавать файловую структуру и структуру пространств имён независимо. Кроме того, в разных пакетах разные способы именования файлов, разные способы формирования самих имён пакетов, разные способы организации файлов внутри пакета. 
По этой причине я постарался использовать в php-package те практики, которые наиболее распространены и похожи на то, как всё организовано в других языках.
* Пакет именуется в "шашлычной нотации" (kebab-case).
* Каждый пакет может выставлять наружу только одно пространство имён, что снижает риск пересечения с другими пакетами, а также позволяет легко определить принадлежность пространства имён к пакету. В терминологии стандарта PSR-4, такое пространство имён называется "vendor namespace".
* Пространства имён именуются в стиле StudlyCaps и напрямую отображаются на файловую систему. Исключением является корневое пространства имён, которое получается путём трансформации имени пакета.
* Исходный код проекта находится в папке src, а тесты в директории tests.

Что касается именования файлов, то, что бы ни хранилось внутри, придерживайтесь именования в стиле StudlyCaps (например, MySuperFile.php).

### Автозагрузка файлов
Composer умеет автоматически загружать все необходимые файлы. Эта функциональность частично опирается на возможности автозагрузки самого PHP. Мы ещё не проходили классы, но стандарт PSR-4 описывает автозагрузку именно классов. Грубо говоря, если правильно сконфигурировать автозагрузчик, то при добавлении нового файла с классом, тот будет загружен автоматически. В случае с файлами, в которых есть только пространство имён и функции, всё чуть сложнее. Каждый новый файл должен быть прописан внутри composer.json, только тогда он будет загружен. 
В файл composer.json добавляется секция autoload. Внутрь этой секции добавляется ещё одна секция files. Она в свою очередь содержит список файлов, которые надо загрузить. После обновления секции autoload нужно обязательно запускать команду composer dump-autoload. Она генерирует необходимый код в директории vendor, реализующий указанную загрузку. 
Затем остаётся только один шаг. Чтобы ваш код начал использовать всё, что сделал Composer, необходимо в начале вашего кода прописать следующую строку:
``` php
<?php
require __DIR__ . "/../vendor/autoload.php";
```
Конкретный путь зависит от того, где находится директория vendor. При работе с локальным проектом Composer по умолчанию создаст директорию vendor в его корне. Но в случае глобальной установки пакета путь к директории vendor будет другим. Его можно узнать, выполнив команду в терминале:
$ composer global config vendor-dir
После установки сам пакет, его зависимости и файл autoload.php будут созданы именно в этой директории. И путь, который мы указали выше, уже не сработает, так как при глобальной установке путь к директории vendor отличается. Поэтому, чтобы файл autoload.php был найден в любом случае, используют следующую запись:
<?php
// Путь который будет использован при глобальной установке пакета
$autoloadPath1 = __DIR__ . "/../../../autoload.php";
// Путь для локальной работы с проектом
$autoloadPath2 = __DIR__ . "/../vendor/autoload.php&";
if (file_exists($autoloadPath1)) {
    require_once $autoloadPath1;
} else {
    require_once $autoloadPath2;
}

==============================================================================

Требования к оформлению кода
