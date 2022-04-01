$studentDirsPath = "/home/andrey/labs_302/"
$teacherRepo = "https://api.github.com/repos/andpop-mrsu/" 
$headers = @{}
$headers.Add("Authorization", "Basic andpop-mrsu PAT-here!!!")

function Check-PullRequest {
    Process {
        $repo = $_.head.repo.name
        $studentDir = $studentDirsPath + $repo
        $studentRepo = $_.head.repo.clone_url
        $number = $_.number
        $title = $_.title
        $datePR = $_.created_at
        $branch = $task = $_.head.ref
        
        $checkScript = "check_$task.ps1"
        
        Write-Host "=====================================================" -ForegroundColor cyan 
        
        Write-Host $studentDir -ForegroundColor yellow 
        Write-Host $title -ForegroundColor yellow 
        Write-Host "Task from branch: $branch" -ForegroundColor yellow
        Write-Host "Creation date: $datePR" -ForegroundColor yellow
        
        Push-Location $studentDir
        git pull teacher master
        git remote add student $studentRepo
        git fetch student
        git merge -m "Merge $task from student" student/$task
        Pop-Location

        if (-not (Test-Path $checkScript)) {
            Write-Host "No checking script $checkScript" -ForegroundColor red
            return
        }
        & .\$checkScript -studentDir $studentDir -task $task

        do {
            $yesNo = Read-Host "Push task on GitHub (y/n)?"
        } while ("y", "n" -notcontains $yesNo)

        Push-Location $studentDir
        if ($yesNo -ieq "y") {
            git push teacher master
        }
        Pop-Location

    }
}

function Check-Student {
    Process {
        $studentRepo = "${teacherRepo}$($_.Name)/pulls"
        $pullRequests = Invoke-RestMethod -Uri $studentRepo -Headers $headers
    
        if ($pullRequests.count -eq 0) { return }
    
        $pullRequests | Check-PullRequest
    }
}

# ===================================================================================
if (Test-Path "./log.txt") { Remove-Item ./log.txt }
Start-Transcript -Path "log.txt" -UseMinimalHeader

$studentDirs = (Get-ChildItem $studentDirsPath -Attributes Directory) 
$studentDirs | Check-Student

Stop-Transcript
