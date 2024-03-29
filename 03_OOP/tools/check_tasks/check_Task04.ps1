param(
    [string]$studentDir,
    [string]$task
)

function Check-Task {
    Write-Host "--------------------------------------------------" -ForegroundColor blue
    Write-Host "Task: ", (Get-Location).Path -ForegroundColor blue

    $doneChecks = $failureChecks = 0

    composer install
    if (Check-Path -Path composer.json -ShowContent) { $doneChecks++ } else { $failureChecks++ }
    if (Check-Path -Path src/Stack.php -ShowContent) { $doneChecks++ } else { $failureChecks++ }
    if (Check-Path -Path src/Test.php) { $doneChecks++ } else { $failureChecks++ }
    if (Check-Path -Path src/run_test.php -ShowContent) { $doneChecks++ } else { $failureChecks++ }

    if (Check-Command -Command php -Params @("src/run_test.php")) { $doneChecks++ } else  { $failureChecks++ }
    if (Check-Command -Command phpcs -Params @("--standard=PSR12", "./src/*")) { $doneChecks++ } else  { $failureChecks++ }

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
