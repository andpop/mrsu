function Test-File {
    param(
        $path,
        [switch]$showContent
    )
    
    Write-Host "--------------------------------------------------" -ForegroundColor blue
    Write-Host "Check $path" -Foreground blue
    if (-not (Test-Path $path)) {
        Write-Host "$path not found" -ForegroundColor red
        return
        type hello.php
    }
    if ($showContent) {
        Get-Content $path
    }
}

function Run-Command {
    param(
        $file,
        $command
    )

    Write-Host "--------------------------------------------------" -ForegroundColor blue
    Write-Host "Run $command" -Foreground blue
    if (Test-Path $file) { 
        & $command
        if (-not $?) {
            Write-Host "Execution fails" -ForegroundColor red
        }
    } else {
        Write-Host "$file not found" -ForegroundColor red
    }

}
