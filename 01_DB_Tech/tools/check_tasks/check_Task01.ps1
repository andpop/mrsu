param(
    [string]$studentDir,
    [string]$task
)

function Check-Task {
    Write-Host "--------------------------------------------------" -ForegroundColor blue
    Write-Host "Task: ", (Get-Location).Path -ForegroundColor blue

    $doneChecks = $failureChecks = 0

    if (Check-Path -Path self-logger.bat) { $doneChecks++ } else { $failureChecks++ }
    if (Check-Path -Path task1.php) { $doneChecks++ } else { $failureChecks++ }
    if (Check-Path -Path README.md -ShowContent) { $doneChecks++ } else { $failureChecks++ }
    if (Check-Path -Path README_logger.md -ShowContent) { $doneChecks++ } else { $failureChecks++ }

    Write-DelimiterString
    Write-Host "Total ok: $doneChecks" -ForegroundColor green
    Write-Host "Total error: $failureChecks" -ForegroundColor red
}


. ./checks_for_task.ps1

$taskDir = "$studentDir/$task"

Push-Location "$taskDir"
Check-Task
Pop-Location
    
Write-Host "--------------------------------------------------" -ForegroundColor blue

