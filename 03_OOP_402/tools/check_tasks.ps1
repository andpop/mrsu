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
        $branch = $task = $_.head.ref
        $datePR = $_.created_at
        
        Write-Host "=====================================================" -ForegroundColor cyan
        
        Push-Location $studentDir
        Write-Host $studentDir -ForegroundColor yellow
        Write-Host $title -ForegroundColor yellow
        Write-Host "Задание из ветки: $branch" -ForegroundColor yellow
        Write-Host "Дата создания: $datePR" -ForegroundColor yellow

        git pull teacher master
        git remote add student $studentRepo
        git fetch student
        git merge -m "Merge $task from student" student/$task

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
# foreach ($studentDir in $studentDirs) {Check-Student -studentDir $studentDir}
    # ForEach-Object { 
    #     Out-Host -InputObject $_.Name
    #     $pullRequests = Invoke-RestMethod -Uri "${teacherRepo}$($_.Name)/pulls" -Headers $headers
    #     $pullRequests | ForEach-Object {
    #         $repo = $_.head.repo.name
    #         $student_repo = $_.head.repo.clone_url
    #         $number = $_.number
    #         $title = $_.title
    #         $branch = $task = $_.head.ref
    #         $datePR = $_.created_at
    #         Write-Host $repo, $title, $branch
    #     }        
        # if ($pullRequests.count -gt 0) {
        #     $pullRequest = ($pullRequests | 
        #         Select-Object -Property `
        #             @{label='repo'; expression={$_.head.repo.name}}, `
        #             @{label='student_repo'; expression={$_.head.repo.clone_url}}, `
        #             number, `
        #             title, `
        #             @{label='branch'; expression={$_.head.ref}}, `
        #             created_at)
        #     $pullRequest | Format-List *
        # }
    # }
