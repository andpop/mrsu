
param($studentDir, $task)

function Check-Task {
    Write-Host "--------------------------------------------------" -ForegroundColor blue
    Write-Host "Task: ", (Get-Location).Path -ForegroundColor blue

    Test-File -Path service_status.ps1 -ShowContent
    Test-File -Path check_links.ps1 -ShowContent
    Test-File -Path excel.ps1 -ShowContent
    Test-File -Path numbers.ps1 -ShowContent

    Test-Command  -Command pwsh -Params "./numbers.ps1"
}

. ./checks_for_task.ps1

$taskDir = "$studentDir/$task"

Push-Location "$taskDir"
Check-Task
Pop-Location
    
Write-Host "--------------------------------------------------" -ForegroundColor blue

