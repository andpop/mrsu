param(
    [string]$studentDir,
    [string]$task
)

function Get-GameDir {
    $gameDirs = 'tic-tac-toe', 'guess-number', 'hangman', 'cold-hot', 'guess_number', 'minesweeper'

    foreach ($gameDir in $gameDirs) {
        if (Test-Path -Path $gameDir -PathType container) {
            return $gameDir
        }
    }

    return 'No game found'
}

function Check-Task {
    Write-Host "--------------------------------------------------" -ForegroundColor blue
    Write-Host "Task: ", (Get-Location).Path -ForegroundColor blue

    $gameDir = Get-GameDir
    if ($gameDir -eq 'No game found') {
        Write-Host "There are no game folder" -ForegroundColor red
        return
    }

    Push-Location "$gameDir"
    $doneChecks = $failureChecks = 0

    if (Check-Path -Path README.md -ShowContent) { $doneChecks++ } else { $failureChecks++ }
    if (Check-Path -Path composer.json -ShowContent) { $doneChecks++ } else { $failureChecks++ }
    if (Check-Path -Path (Join-Path -Path src -ChildPath Controller.php) -ShowContent) { $doneChecks++ } else { $failureChecks++ }
    if (Check-Path -Path (Join-Path -Path src -ChildPath View.php) -ShowContent) { $doneChecks++ } else { $failureChecks++ }

    Write-DelimiterString
    Write-Host "Total ok: $doneChecks" -ForegroundColor green
    Write-Host "Total error: $failureChecks" -ForegroundColor red

    Pop-Location
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

