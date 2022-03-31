$studentDirsPath = "/home/andrey/labs_402/"
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
        
        Push-Location $studentDir
        Write-Host $studentDir -ForegroundColor yellow
        Write-Host $title -ForegroundColor yellow
        Write-Host "Задание из ветки: $branch" -ForegroundColor yellow
        Write-Host "Дата создания: $datePR" -ForegroundColor yellow
        
        $checkScript

        # git pull teacher master
        # git remote add student $studentRepo
        # git fetch student
        # git merge -m "Merge $task from student" student/$task

        Pop-Location
    }
}

function Check-Student {
    Process {
        $studentRepo = "${teacherRepo}$($_.Name)/pulls"
        $pullRequests = Invoke-RestMethod -Uri $studentRepo -Headers $headers
    
        if ($pullRequests.count -eq 0) {return}
    
        $pullRequests | Check-PullRequest
    }
}

$studentDirs = (Get-ChildItem $studentDirsPath -Attributes Directory) 
$studentDirs | Check-Student
