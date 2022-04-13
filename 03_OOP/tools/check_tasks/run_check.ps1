#!pwsh

$studentDirsPath = "/home/andrey/labs_302/"
$teacherRepo = "https://api.github.com/repos/andpop-mrsu/" 
$headers = @{}
$token = "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"
$headers.Add("Authorization", "Token $token")

. ./pull_requests.ps1

if (Test-Path "./log.txt") { Remove-Item ./log.txt }
Start-Transcript -Path "log.txt" -UseMinimalHeader

$studentDirs = (Get-ChildItem $studentDirsPath -Attributes Directory) 
$studentDirs | Check-Student

Stop-Transcript
