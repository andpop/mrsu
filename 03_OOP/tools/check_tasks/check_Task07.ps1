param(
    [string]$studentDir,
    [string]$task
)

function Check-Task($subtask) {
    Write-Host "--------------------------------------------------" -ForegroundColor blue
    Write-Host "Task: ", (Get-Location).Path -ForegroundColor blue

    $doneChecks = $failureChecks = 0

    if (Check-Path -Path package.json -ShowContent) { $doneChecks++ } else { $failureChecks++ }
    
    npm install
    npm run test

    Write-DelimiterString
    Write-Host "Total ok: $doneChecks" -ForegroundColor green
    Write-Host "Total error: $failureChecks" -ForegroundColor red
}


. ./checks_for_task.ps1

$taskDir = "$studentDir/$task/Task07_1"

if (-not (Test-Path $taskDir)) {
    Write-Host "There are no folder $taskDir" -ForegroundColor red
    return
}

Push-Location "$taskDir"
Check-Task(1)
Pop-Location

$taskDir = "$studentDir/$task/Task07_2"

if (-not (Test-Path $taskDir)) {
    Write-Host "There are no folder $taskDir" -ForegroundColor red
    return
}

Push-Location "$taskDir"
Check-Task(2)
Pop-Location
    
$taskDir = "$studentDir/$task/Task07_3"

if (-not (Test-Path $taskDir)) {
    Write-Host "There are no folder $taskDir" -ForegroundColor red
    return
}

Push-Location "$taskDir"
Check-Task(3)
Pop-Location
Write-Host "--------------------------------------------------" -ForegroundColor blue
