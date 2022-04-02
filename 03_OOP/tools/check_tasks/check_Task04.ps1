param($studentDir, $task)

. ./check_functions.ps1

Push-Location "$studentDir/$task"

Write-Host "--------------------------------------------------" -ForegroundColor blue
Write-Host "Task: ", (Get-Location).Path -ForegroundColor blue

Test-File -Path .gitignore -ShowContent
Test-File -Path composer.json -ShowContent
Test-File -Path src/Test.php -ShowContent
Test-File -Path src/run_test.php -ShowContent

Run-Command -Command phpcs -Params "--standard=PSR12 ./src/*"
Run-Command  -Command php -Params src/run_test.php
    
Write-Host "--------------------------------------------------" -ForegroundColor blue

Pop-Location
