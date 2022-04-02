param($studentDir, $task)

. ./check_functions.ps1

Push-Location "$studentDir/$task"

Write-Host "--------------------------------------------------" -ForegroundColor blue
Write-Host "Task: ", (Get-Location).Path -ForegroundColor blue

Test-File -Path Test.php -ShowContent
Test-File -Path run_test.php -ShowContent

Run-Command -Command phpcs -Params "--standard=PSR12 *.php"
Run-Command -Command php -Params run_test.php
    
Write-Host "--------------------------------------------------" -ForegroundColor blue

Pop-Location
