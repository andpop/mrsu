param($studentDir, $task)

function Check-Task {
    Write-Host "--------------------------------------------------" -ForegroundColor blue
    Write-Host "Task: ", (Get-Location).Path -ForegroundColor blue

    Test-File -Path .gitignore -ShowContent
    Test-File -Path composer.json -ShowContent

    Test-Command -Command phpcs -Params "--standard=PSR12 ./src/*"

    Write-Host "--------------------------------------------------" -ForegroundColor blue
    composer install

    List-Directory -Directory src
    Test-Command  -Command ./vendor/bin/phpunit -Params "tests --colors"
}

. ./checks_for_task.ps1

$taskDir = "$studentDir/$task"

Push-Location "$taskDir/Task06_1"
Check-Task
Pop-Location
    
Push-Location "$taskDir/Task06_2"
Check-Task
Pop-Location

Write-Host "--------------------------------------------------" -ForegroundColor blue

