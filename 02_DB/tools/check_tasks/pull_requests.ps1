function Check-PullRequest {
    param (
        [string]$studentDir
    )
    Process {
        $studentRepo = $_.head.repo.clone_url
        $number = $_.number
        $title = $_.title
        $datePR = $_.created_at
        $branch = $task = $_.head.ref
        
        $checkScript = "check_$task.ps1"
        
        Write-Host "=====================================================" -ForegroundColor cyan 
        
        Write-Host $studentDir -ForegroundColor yellow 
        
        Push-Location $studentDir
        git pull teacher master
        git remote add student $studentRepo
        git fetch student
        git merge -m "Merge $task from student" student/$task
        Pop-Location

        if (-not (Test-Path $checkScript)) {
            Write-Host "Checking script $checkScript not found" -ForegroundColor red
            return
        }
        & .\$checkScript -studentDir $studentDir -task $task

        Write-Host $studentDir -ForegroundColor yellow 
        Write-Host $title -ForegroundColor yellow 
        Write-Host "Task from branch: $branch" -ForegroundColor yellow
        Write-Host "Creation date: $datePR" -ForegroundColor yellow

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
    param (
        [string]$studentName
    )
    Write-Host $studentName

    $studentRepo = "${teacherRepo}/${studentName}/pulls"
    $pullRequests = Invoke-RestMethod -Uri $studentRepo -Headers $headers

    if ($pullRequests.count -eq 0) { return }

    $pullRequests | Check-PullRequest -studentDir "${studentDirsPath}/${studentName}"

}

