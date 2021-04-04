## Исполняемые файлы в Windows и Unix-like системах
В Windows исполнимость файла определяется по его расширению.
Расширения файлов, относящихся к исполняемым, хранятся в переменной среды PATHEXT.
```
echo %PATHEXT%
.COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.PY;.PYW 
```
Информация о программах, которые выполняют исполняемые файлы, хранится в реестре в ветке HKEY_LOCAL_MACHINE\SOFTWARE\Classes.
Настроить можно с помощью команд assoc и ftype.
Пример для PHP:
* Дописать расширение .PHP в конец переменной PATHEXT.
* Задать соответствие расширения .php с конкретным типом файла:
```
assoc .php=phpfile
```
* Задать команду, которой программа-интерпретатор будет запускать файлы типа phpfile:
```
ftype phpfile="C:\PHP\php.exe" -f "%1" -- %~2
```
Выполнение этих шагов позволит PHP-скриптам выполняться из любой директории без необходимости указывать исполняемый PHP файл или расширение .PHP, а все параметры будут переданы в скрипт для обработки.

---

В примере ниже описываются некоторые изменения реестра, которые могут быть сделаны вручную.

Пример #24 Изменения реестра

Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.php]
@="phpfile"
"Content Type"="application/php"

[HKEY_LOCAL_MACHINE\SOFTWARE\Classes\phpfile]
@="PHP Script"
"EditFlags"=dword:00000000
"BrowserFlags"=dword:00000008
"AlwaysShowExt"=""

[HKEY_LOCAL_MACHINE\SOFTWARE\Classes\phpfile\DefaultIcon]
@="C:\\PHP5\\php-win.exe,0"

[HKEY_LOCAL_MACHINE\SOFTWARE\Classes\phpfile\shell]
@="Open"

[HKEY_LOCAL_MACHINE\SOFTWARE\Classes\phpfile\shell\Open]
@="&Open"

[HKEY_LOCAL_MACHINE\SOFTWARE\Classes\phpfile\shell\Open\command]
@="\"C:\\PHP5\\php.exe\" -f \"%1\" -- %~2"
С этими изменениями команда может быть записана как:

"C:\PHP Scripts\script" -arg1 -arg2 -arg3
или, если ваш путь в переменной окружения "C:\PHP Scripts" PATH:
script -arg1 -arg2 -arg3