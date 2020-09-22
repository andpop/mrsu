
Get-ChildItem /home/andrey/labs_mrsu/ -Attributes Directory | Invoke-RestMethod -Uri ('https://api.github.com/repos/andpop-mrsu/' + $_.Name +  '/pulls') -WhatIf
$response | Select-Object -Property @{label='repo';expression={$_.head.repo.name}}, number, title, created_at | ft


Get-ChildItem /home/andrey/labs_mrsu/ -Attributes Directory | % {Invoke-RestMethod -Uri ('https://api.github.com/repos/andpop-mrsu/' + $_.Name +  '/pulls') | Select-Object -Property @{label='repo';expression={$_.head.repo.name}}, number, title, created_at | ft}

