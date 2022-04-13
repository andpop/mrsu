param($studentDir, $task)

function Check-Task {
    Write-Host "--------------------------------------------------" -ForegroundColor blue
    Write-Host "Task: ", (Get-Location).Path -ForegroundColor blue

    Test-File -Path .gitignore -ShowContent
    Test-File -Path composer.json -ShowContent

    Test-Command -Command phpcs -Params "--standard=PSR12 ./src/*"

    composer install

    Test-Command  -Command ./vendor/bin/phpunit -Params "tests --colors"
}

. ./checks_for_task.ps1

Push-Location "$studentDir/$task"
Check-Task
Pop-Location
    
Write-Host "--------------------------------------------------" -ForegroundColor blue

