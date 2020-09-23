$studentDir = "/home/andrey/labs_mrsu/"
$teacherRepo = "https://api.github.com/repos/andpop-mrsu/" 
$headers = @{}
$headers.Add("Authorization", "Basic andpop-mrsu PAT-here!!!")

Get-ChildItem $studentDir -Attributes Directory | 
    ForEach-Object { 
        $response = Invoke-RestMethod -Uri "${teacherRepo}$($_.Name)/pulls" -Headers $headers
        $obj = ($response | Select-Object -Property @{label='repo';expression={$_.head.repo.name}}, number, title, created_at)
        $obj
    }
