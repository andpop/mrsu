#!pwsh

$studentDirsPath = "/home/andrey/labs_402/"
$teacherRepo = "https://api.github.com/repos/andpop-mrsu/" 
$headers = @{}
$token = ""
$headers.Add("Authorization", "Token $token")

. ./pull_requests.ps1

if (Test-Path "./log.txt") { Remove-Item ./log.txt }
Start-Transcript -Path "log.txt" -UseMinimalHeader

$studentDirs = (Get-ChildItem $studentDirsPath -Attributes Directory) 
$studentDirs | Check-Student

Stop-Transcript
