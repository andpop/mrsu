#!pwsh
# Комментария нет в коммите

$studentDirsPath = "/home/andrey/labs/DBTech"
# $studentDirsPath = "/home/andrey/labs/302_OOP"
$teacherRepo = "https://api.github.com/repos/andpop-mrsu" 
$headers = @{}
$token = ''
if (Test-Path ./token.txt) { $token = (Get-Content ./token.txt) }
$headers.Add("Authorization", "Token $token")

. ./pull_requests.ps1

if (Test-Path "./log.txt") { Remove-Item ./log.txt }
Start-Transcript -Path "log.txt" -UseMinimalHeader

$studentDirs = (Get-ChildItem $studentDirsPath -Attributes Directory) 
$studentDirs | ForEach-Object {Check-Student -studentName $_.Name}

Stop-Transcript
