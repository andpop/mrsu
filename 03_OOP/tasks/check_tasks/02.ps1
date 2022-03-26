#!pwsh
cd Task02
Write-Host "==================================================" -ForegroundColor yellow
(pwd).Path
Write-Host "==================================================" -ForegroundColor yellow
Write-Host "Check PSR-12" -ForegroundColor yellow
phpcs --standard=PSR12 *
Write-Host "==================================================" -ForegroundColor yellow
Write-Host "Run run_test.php" -ForegroundColor yellow
php run_test.php

cd ..
git push teacher master
