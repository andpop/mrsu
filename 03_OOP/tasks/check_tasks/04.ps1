#!pwsh
cd Task04
Write-Host "==================================================" -ForegroundColor yellow
(pwd).Path
Write-Host "==================================================" -ForegroundColor yellow
Write-Host "Check .gitignore" -ForegroundColor yellow
cat .gitignore
Write-Host "==================================================" -ForegroundColor yellow
Write-Host "Check composer.json" -ForegroundColor yellow
cat composer.json
Write-Host "==================================================" -ForegroundColor yellow
composer install
Write-Host "==================================================" -ForegroundColor yellow
phpcs --standard=PSR12 ./src/*
Write-Host "==================================================" -ForegroundColor yellow
Write-Host "Run test" -ForegroundColor yellow
php ./src/run_test.php

cd ..
git push teacher master
