function Test-File {
    param(
        $path,
        [switch]$showContent
    )
    
    Write-Host "--------------------------------------------------" -ForegroundColor blue
    Write-Host "Check $path" -Foreground blue
    if (-not (Test-Path $path)) {
        Write-Host "$path not found" -ForegroundColor red
        return $false
        type hello.php
    }
    
    if ($showContent) {
        Get-Content $path
    }

    return $true
}

function Test-Command {
    param(
        $command,
        $params = ""
    )

    Write-Host "--------------------------------------------------" -ForegroundColor blue
    Write-Host "Run: $command $params" -Foreground blue
    & $command $params.split(' ')
    if (-not $?) {
        Write-Host "Execution fails" -ForegroundColor red
        return $false
    }

    return $true
}
