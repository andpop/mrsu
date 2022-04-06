param($studentDir, $task)

function Check-Task {
    Write-Host "--------------------------------------------------" -ForegroundColor blue
    Write-Host "Task: ", (Get-Location).Path -ForegroundColor blue

    Test-File -Path package.json -ShowContent
    Test-File -Path src/index.js -ShowContent

    npm install

    Get-ChildItem src/* | ForEach-Object { $_; Get-Content $_ }

    Test-Command  -Command npm -Params "run test"
}


. ./checks_for_task.ps1

$taskDir = "$studentDir/$task"

Push-Location "$taskDir/Task06_1"
Check-Task
Pop-Location
    
Push-Location "$taskDir/Task06_2"
Check-Task
Pop-Location
    
Push-Location "$taskDir/Task06_3"
Check-Task
Pop-Location
    
Write-Host "--------------------------------------------------" -ForegroundColor blue

