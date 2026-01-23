param(
    [string]$studentDir,
    [string]$task
)

function Check-Task {
    Write-Host "--------------------------------------------------" -ForegroundColor blue
    Write-Host "Task: ", (Get-Location).Path -ForegroundColor blue

    $doneChecks = $failureChecks = 0

    if (Check-Path -Path check.txt -ShowContent) { $doneChecks++ } else { $failureChecks++ }
    if (Check-Path -Path triangle_func.py) { $doneChecks++ } else { $failureChecks++ }
    if (Check-Path -Path triangle_class.py) { $doneChecks++ } else { $failureChecks++ }
    if (Check-Path -Path test_func.py) { $doneChecks++ } else { $failureChecks++ }
    if (Check-Path -Path test_class.py) { $doneChecks++ } else { $failureChecks++ }

    if (Check-Command -Command python3 -Params @("triangle_func.py", "-v") ) { $doneChecks++ } else  { $failureChecks++ }
    if (Check-Command -Command python3 -Params @("test_func.py", "-v") ) { $doneChecks++ } else  { $failureChecks++ }
    if (Check-Command -Command pytest -Params @("-v") ) { $doneChecks++ } else  { $failureChecks++ }

    Write-DelimiterString
    Write-Host "Total ok: $doneChecks" -ForegroundColor green
    Write-Host "Total error: $failureChecks" -ForegroundColor red
}


. ./checks_for_task.ps1

$taskDir = "$studentDir/$task"

if (-not (Test-Path $taskDir)) {
    Write-Host "There are no folder $taskDir" -ForegroundColor red
    return
}

Push-Location "$taskDir"
Check-Task
Pop-Location
    
Write-Host "--------------------------------------------------" -ForegroundColor blue
