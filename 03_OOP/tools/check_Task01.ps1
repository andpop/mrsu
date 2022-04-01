#!pwsh
param($studentDir, $task)

function Check-Task {
    Write-Host "--------------------------------------------------" -ForegroundColor blue
    (Get-Location).Path
    Write-Host "Task: ", (Get-Location).Path -ForegroundColor blue
    Write-Host "--------------------------------------------------" -ForegroundColor blue
    Write-Host "Check hello.php" -Foreground blue
    if (Test-Path hello.php) {
        type hello.php
    } else {
        Write-Host "No hello.php" -ForegroundColor red
    }

    Write-Host "--------------------------------------------------" -ForegroundColor blue
    Write-Host "Check start.bat" -Foreground blue
    if (Test-Path start.bat) {
        type start.bat
    } else {
        Write-Host "No start.bat" -ForegroundColor red
    }

    Write-Host "--------------------------------------------------" -ForegroundColor blue
    Write-Host "Run start.bat" -Foreground blue
    if (Test-Path start.bat) { 
        start.bat 
        if ($?) {
            Write-Host "start.bat check done" -ForegroundColor green
        } else {
            Write-Host "start.bat check FAILURE" -ForegroundColor red
        }
    }
        
    Write-Host "--------------------------------------------------" -ForegroundColor blue
}

$taskDir = "$studentDir/$task"

Push-Location "$taskDir"
Check-Task
Pop-Location
