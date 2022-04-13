#!pwsh

$studentDirsPath = "/home/andrey/labs_302/"
$teacherRepo = "https://api.github.com/repos/andpop-mrsu/" 
$headers = @{}
<<<<<<< HEAD
$token = "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"
=======
$token = ""
>>>>>>> dc0a92fa22d9c06bbeab35e4d38838bcf4825512
$headers.Add("Authorization", "Token $token")

. ./pull_requests.ps1

if (Test-Path "./log.txt") { Remove-Item ./log.txt }
Start-Transcript -Path "log.txt" -UseMinimalHeader

$studentDirs = (Get-ChildItem $studentDirsPath -Attributes Directory) 
$studentDirs | Check-Student

Stop-Transcript
