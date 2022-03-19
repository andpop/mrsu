#!pwsh
cd Task03
"=================================================="
pwd
"=================================================="
composer install
phpcs --standard=PSR12 ./src/*
./vendor/bin/phpunit tests --colors

cd ..
git push teacher master
