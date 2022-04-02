param($studentDir, $task)

. ./check_functions.ps1

Push-Location "$studentDir/$task"

Write-Host "--------------------------------------------------" -ForegroundColor blue
Write-Host "Task: ", (Get-Location).Path -ForegroundColor blue

Test-File -Path hello.php -ShowContent
Test-File -Path start.bat -ShowContent

Run-Command -File start.bat -Command "./start.bat"
    
Write-Host "--------------------------------------------------" -ForegroundColor blue

Pop-Location
