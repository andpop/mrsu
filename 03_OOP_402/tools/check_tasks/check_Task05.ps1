param($studentDir, $task)

function Check-Task {
    Write-Host "--------------------------------------------------" -ForegroundColor blue
    Write-Host "Task: ", (Get-Location).Path -ForegroundColor blue

    Test-File -Path .gitignore -ShowContent
    Test-File -Path composer.json -ShowContent

    Test-Command -Command phpcs -Params "--standard=PSR12 ./src/*"

    composer install
    Test-Command  -Command php -Params src/run_test.php

    Test-Command  -Command ./vendor/bin/phpunit -Params "tests --colors"
}


. ./checks_for_task.ps1

$taskDir = "$studentDir/$task"

Push-Location "$taskDir/Task05_1"
Check-Task
Pop-Location
    
Push-Location "$taskDir/Task05_2"
Check-Task
Pop-Location
    
Push-Location "$taskDir/Task05_3"
Check-Task
Test-File uml.jpg
Pop-Location
    
Write-Host "--------------------------------------------------" -ForegroundColor blue

