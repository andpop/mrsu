#!pwsh
cd Task04/Task04_1
"=================================================="
pwd
"=================================================="
composer install
phpcs --standard=PSR12 ./src/*
./vendor/bin/phpunit tests --colors


cd ../Task04_2
"=================================================="
pwd
"=================================================="
composer install
phpcs --standard=PSR12 ./src/*
./vendor/bin/phpunit tests --colors

cd ../Task04_3
"=================================================="
pwd
"=================================================="
composer install
phpcs --standard=PSR12 ./src/*
./vendor/bin/phpunit tests --colors

cd ..
git push teacher master
