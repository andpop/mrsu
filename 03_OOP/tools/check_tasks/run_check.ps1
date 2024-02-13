#!pwsh
# Комментария нет в коммите

$studentDirsPath = "/home/andrey/labs/302_OOP"
$teacherRepo = "https://api.github.com/repos/andpop-mrsu" 
$headers = @{}
$token = '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'
if (Test-Path ./token.txt) { $token = (Get-Content ./token.txt) }
$headers.Add("Authorization", "Token $token")

. ./pull_requests.ps1

if (Test-Path "./log.txt") { Remove-Item ./log.txt }
Start-Transcript -Path "log.txt" -UseMinimalHeader

$studentDirs = (Get-ChildItem $studentDirsPath -Attributes Directory) 
$studentDirs | ForEach-Object {Check-Student -studentName $_.Name}

Stop-Transcript
