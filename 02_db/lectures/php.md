## Знакомство с PHP в Windows
### Установка PHP
1. Скачать zip-архив с ресурса https://windows.php.net/download/. Выбираем VS16 x64 Non Thread Safe.
2. Раскрыть архив в папку C:\PHP_8.
3. Дописать путь C:\PHP_8 в конец системной переменной PATH.
4. Переименовать php.ini-devolopment в php.ini
5. Раскомментировать в php.ini путь к каталогу с расширениями (extension_dir = "ext").
6. Проверить версию PHP в командной строке (php -v), посмотреть информацию о PHP (php -i).

### Подключение нужных расширений в php.ini
1. Включение поддержки SQLite: extension=sqlite3