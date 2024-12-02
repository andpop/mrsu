#!pwsh
cd Task05_1
"=================================================="
pwd
"=================================================="
composer install
phpcs --standard=PSR12 ./src/*
./vendor/bin/phpunit tests --colors


cd ../Task05_2
"=================================================="
pwd
"=================================================="
composer install
phpcs --standard=PSR12 ./src/*
./vendor/bin/phpunit tests --colors

cd ../Task05_3
"=================================================="
pwd
"=================================================="
composer install
phpcs --standard=PSR12 ./src/*
./vendor/bin/phpunit tests --colors

cd ..
git push teacher master
