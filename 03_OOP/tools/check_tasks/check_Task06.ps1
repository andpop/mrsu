param(
    [string]$studentDir,
    [string]$task
)

function Check-Task($subtask) {
    Write-Host "--------------------------------------------------" -ForegroundColor blue
    Write-Host "Task: ", (Get-Location).Path -ForegroundColor blue

    $doneChecks = $failureChecks = 0

    composer update
    composer install
    if (Check-Path -Path composer.json -ShowContent) { $doneChecks++ } else { $failureChecks++ }

    if ($subtask -eq 1) {
        if ((Check-Path -Path src/ManufacturerFilter.php -ShowContent) -or (Check-Path -Path src/CreditCardAdapter.php -ShowContent))
        { $doneChecks++ } else { $failureChecks++ }
        if ((Check-Path -Path tests/MaxPriceFilter.php) -or (Check-Path -Path tests/PayPal.php))
        { $doneChecks++ } else { $failureChecks++ }
    } else {
        # if (Check-Path -Path tests/PayPal.php) { $doneChecks++ } else { $failureChecks++ }
    }

    if (Check-Command -Command ./vendor/bin/phpunit -Params @("--color", "tests")) { $doneChecks++ } else  { $failureChecks++ }
    if (Check-Command -Command phpcs -Params @("--standard=PSR12", "./src/*")) { $doneChecks++ } else  { $failureChecks++ }

    Write-DelimiterString
    Write-Host "Total ok: $doneChecks" -ForegroundColor green
    Write-Host "Total error: $failureChecks" -ForegroundColor red
}


. ./checks_for_task.ps1

$taskDir = "$studentDir/$task/Task06_1"

if (-not (Test-Path $taskDir)) {
    Write-Host "There are no folder $taskDir" -ForegroundColor red
    return
}

Push-Location "$taskDir"
Check-Task(1)
Pop-Location

$taskDir = "$studentDir/$task/Task06_2"

if (-not (Test-Path $taskDir)) {
    Write-Host "There are no folder $taskDir" -ForegroundColor red
    return
}

Push-Location "$taskDir"
Check-Task(2)
Pop-Location
    
Write-Host "--------------------------------------------------" -ForegroundColor blue
