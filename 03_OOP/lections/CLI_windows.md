# Ликбез по командной строке в Windows
Нам понадобилась командная строка, чтобы работать с системой управления версиями Git. 
Командная строка - это альтернативный способ общения с компьютером. Основной способ сейчас - GUI, также возможно голосовое управление.
Давайте разберемся с командной строкой.
## Стандартная командная строка в Windows
Что можно здесь делать? Само название говорит за себя - есть строка, в которую можно ввести команду, эта команда выполняется и на экран выводятся строки с результатом. Это базовый способ взаимодействия человека с компьютером.
Произвольную команду мы не можем выполнить, т.е. компьютер выполняет только знакомые ему команды. Какие команды можно вводить? 
1. В качестве команды мы можем запускать приложения (как консольные, так и графические). Приложения представлены исполняемыми файлами на диске. Исполняемость в Windows определяется расширением.
Но можно запустить просто по имени файла, не указывая точный путь и расширение. Как система их находит? Переменная PATH. Команда where.

2. Можно выполнить команду, для которой вообще нет файла на диске (например, `dir`). Кто же выполняет такие команды? Оболочка/командный интепретатор.

Командная строка состоит из двух частей: 
* Консоль/терминал. Это визуальный интерфейс для ввода строки, передачи ее оболочке, получения ответа от оболочки и отображения его на экране. Обеспечивает возможности редактирования вводимого текста.
* Оболочка/командный интерпретатор, который принимает строку от терминала, обрабатывает ее, выделяет команду, выполняет эту команду и возвращает ответ (строки текста) в терминал. Оболочка поддерживает интерактивный и пакетный режимы обработки команд, т.е. определенный язык программирования для написания сценариев.

## Интерпретатор cmd.exe
Список доступных команд в интерактивном режиме (внутренние команды + утилиты, присутствующие в ОС по умолчанию). Команды `git` в этом списке нет.

Пакетный режим - Скрипты с расширением cmd и bat.

## Вторая оболочка в Windows - PowerShell

## Оболочки из Unix-подобных систем 

## Современный Windows Terminal
Возможности. Можно запускать разные оболочки. Удобный интерфейс.

`where.exe` - аналог `which` 
`(Get-Command notepad -CommandType Application).Path`


