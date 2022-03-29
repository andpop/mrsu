#!pwsh
function Check-Task {
    Write-Host "==================================================" -ForegroundColor yellow
    Write-Host "Task: ${(pwd).Path}" -ForegroundColor yellow
    Write-Host "==================================================" -ForegroundColor yellow
    Write-Host "Check .gitignore" -Foreground yellow
    type .gitignore
    Write-Host "==================================================" -ForegroundColor yellow
    composer install

    Write-Host "==================================================" -ForegroundColor yellow
    Write-Host "Check PSR" -Foreground yellow
    phpcs --standard=PSR12 ./src/*
    if ($?) {
        Write-Host "PSR check done" -ForegroundColor green
    } else {
        Write-Host "PSR check FAILURE" -ForegroundColor red
    }
        
    Write-Host "==================================================" -ForegroundColor yellow
    Write-Host "Run tests" -Foreground yellow
    ./vendor/bin/phpunit tests --colors
    if ($?) {
        Write-Host "Custom test check done" -ForegroundColor green
    } else {
        Write-Host "Custom test check FAILURE" -ForegroundColor red
    }
    Write-Host "==================================================" -ForegroundColor yellow
}

cd Task05/Task05_1
Check-Task

cd ../Task05_2
Check-Task

cd ../Task05_3
Check-Task

# cd ..
# git push teacher master
#
# if (-not (git remote show student | Select-String $branch -Quiet)) {Write-Host "Ветки $branch нет"} else {Write-Host "Ветк $branch есть"}
