
do {
    $yesNo = Read-Host "Push task on GitHub (y/n)?"
    $yesNo
} while ("y", "n" -notcontains $yesNo)
