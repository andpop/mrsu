Сделать отдельные ветки для каждого примера

Установка composer
Для чего он нужен
* Установка пакетов в проект
* Автозагрузка файлов
* Поддержка скриптов (исполняемых файлов)

Инициализация нового проекта 
composer init

Установка пакета wp-cli/php-cli-tools
composer require wp-cli/php-cli-tools
Использование установленного пакета
Добавление vendor в .gitignore
composer install

Установка в проект PHP CodeSniffer
composer require "squizlabs/php_codesniffer" --dev
Запуск ./vendor/bin/phpcs --standard=PSR12 src
Настройка скрипта для него

Автозагрузка классов

