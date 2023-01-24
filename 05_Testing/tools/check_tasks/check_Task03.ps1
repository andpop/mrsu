param($studentDir, $task)

. ./checks_for_task.ps1

Push-Location "$studentDir/$task"

Write-Host "--------------------------------------------------" -ForegroundColor blue
Write-Host "Task: ", (Get-Location).Path -ForegroundColor blue

Test-File -Path Test.php -ShowContent
Test-File -Path run_test.php -ShowContent

Test-Command -Command phpcs -Params "--standard=PSR12 *.php"
Test-Command -Command php -Params run_test.php
    
Write-Host "--------------------------------------------------" -ForegroundColor blue

Pop-Location
