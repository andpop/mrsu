#!pwsh
cd Task02/Task02_1
"=================================================="
pwd
"=================================================="
composer install
phpcs --standard=PSR12 ./src/*
./vendor/bin/phpunit tests --colors

cd ../Task02_2
"=================================================="
pwd
"=================================================="
composer install
phpcs --standard=PSR12 ./src/*
./vendor/bin/phpunit tests --colors

cd ../..
git push teacher master
