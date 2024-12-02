$studentDir = "/home/andrey/labs_402/"
$teacherRepo = "https://api.github.com/repos/andpop-mrsu/" 
$headers = @{}
$headers.Add("Authorization", "Basic andpop-mrsu PAT-here!!!")

Get-ChildItem $studentDir -Attributes Directory | 
    ForEach-Object { 
        Out-Host -InputObject $_.Name
        $pullRequests = Invoke-RestMethod -Uri "${teacherRepo}$($_.Name)/pulls" -Headers $headers
        if ($pullRequests.count -gt 0) {
            $pullRequest = ($pullRequests | 
                Select-Object -Property `
                    @{label='repo'; expression={$_.head.repo.name}}, `
                    @{label='student_repo'; expression={$_.head.repo.clone_url}}, `
                    number, `
                    title, `
                    @{label='branch'; expression={$_.head.ref}}, `
                    created_at)
            $pullRequest | Format-List *
        }
    }
