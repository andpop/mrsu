param($studentDir, $task)

function Check-Task {
    Write-Host "--------------------------------------------------" -ForegroundColor blue
    Write-Host "Task: ", (Get-Location).Path -ForegroundColor blue

    Test-File -Path genres.txt
    Test-File -Path movies.csv
    Test-File -Path occupation.txt
    Test-File -Path ratings.csv
    Test-File -Path tags.csv
    Test-File -Path users.txt
    Test-File -Path ratings_count.txt -ShowContent
    Test-File -Path README.md -ShowContent
    Test-File -Path sqlite.txt -ShowContent

}


. ./checks_for_task.ps1

$taskDir = "$studentDir/$task"

Push-Location "$taskDir"
Check-Task
Pop-Location
    
Write-Host "--------------------------------------------------" -ForegroundColor blue

