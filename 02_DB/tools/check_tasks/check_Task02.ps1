param(
    [string]$studentDir,
    [string]$task
)

function Check-Task {
    Write-Host "--------------------------------------------------" -ForegroundColor blue
    Write-Host "Task: ", (Get-Location).Path -ForegroundColor blue

    $doneChecks = $failureChecks = 0

    if (Check-Path -Path db_init.bat -ShowContent) { $doneChecks++ } else { $failureChecks++ }
    if (Check-Path -Path README.md -ShowContent) { $doneChecks++ } else { $failureChecks++ }

    Check-Command -Command ./db_init.bat

    if (Check-Path -Path movies_rating.db) { $doneChecks++ } else { $failureChecks++ }

    Write-Host "Count records in movies:" -ForegroundColor green
    sqlite3 movies_rating.db 'select count(*) from movies'

    Write-Host "Count records in ratings:" -ForegroundColor green
    sqlite3 movies_rating.db 'select count(*) from ratings'

    Write-Host "Count records in tags:" -ForegroundColor green
    sqlite3 movies_rating.db 'select count(*) from tags'

    Write-Host "Count records in users:" -ForegroundColor green
    sqlite3 movies_rating.db 'select count(*) from users'

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

