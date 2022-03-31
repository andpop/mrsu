#!pwsh
param($studentDir, $task)

function Check-Task {
    Write-Host "--------------------------------------------------" -ForegroundColor blue
    (Get-Location).Path
    Write-Host "Task: ", (Get-Location).Path -ForegroundColor blue
    Write-Host "--------------------------------------------------" -ForegroundColor blue
    Write-Host "Check .gitignore" -Foreground blue
    if (Test-Path .gitignore) {
        type .gitignore
    } else {
        Write-Host "No .gitignore" -ForegroundColor red
    }
    Write-Host "--------------------------------------------------" -ForegroundColor blue
    composer install

    Write-Host "--------------------------------------------------" -ForegroundColor blue
    Write-Host "Check PSR" -Foreground blue
    $params = "standard-PSR12", "./src/*"
    phpcs --standard=PSR12 ./src/*
    if ($?) {
        Write-Host "PSR check done" -ForegroundColor green
    } else {
        Write-Host "PSR check FAILURE" -ForegroundColor red
    }
        
    Write-Host "--------------------------------------------------" -ForegroundColor blue
    Write-Host "Run tests" -Foreground blue
    ./vendor/bin/phpunit tests --colors
    if ($?) {
        Write-Host "Custom test check done" -ForegroundColor green
    } else {
        Write-Host "Custom test check FAILURE" -ForegroundColor red
    }
    Write-Host "--------------------------------------------------" -ForegroundColor blue
}

$taskDir = "$studentDir/$task"

Push-Location "$taskDir/Task05_1"
Check-Task
Pop-Location

Push-Location "$taskDir/Task05_2"
Check-Task
Pop-Location

Push-Location "$taskDir/Task05_3"
Check-Task
Pop-Location
