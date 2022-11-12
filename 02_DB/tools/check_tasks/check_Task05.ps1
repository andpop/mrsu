param(
    [string]$studentDir,
    [string]$task
)

function Check-Task {
    Write-Host "--------------------------------------------------" -ForegroundColor blue
    Write-Host "Task: ", (Get-Location).Path -ForegroundColor blue

    $doneChecks = $failureChecks = 0

    if (Check-Path -Path db_init.sql) { $doneChecks++ } else { $failureChecks++ }
    if (Check-Path -Path db_add.sql -ShowContent) { $doneChecks++ } else { $failureChecks++ }
    if (Check-Path -Path db_schema.jpg) { $doneChecks++ } else { $failureChecks++ }

    if (Check-Command -Command sqlite3 -Params @("test.db", ".read db_init.sql") ) { $doneChecks++ } else  { $failureChecks++ }
    if (Check-Command -Command sqlite3 -Params @("test.db", "select count(*) from users") ) { $doneChecks++ } else  { $failureChecks++ }


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

