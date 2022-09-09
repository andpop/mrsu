function Write-DelimiterString {
    Write-Host "--------------------------------------------------" -ForegroundColor blue
}

function Check-Path {
    [CmdletBinding()]
    param(
        [string]$path,
        [switch]$ShowContent
    )
    Write-DelimiterString
    Write-Host "Check path: $path" -Foreground blue
    if (-not (Test-Path $path)) {
        Write-Host "$path not found" -ForegroundColor red
        return $false
    }
    
    if ($ShowContent) {
        Write-Host (Get-Content $path -Raw)
    }

    return $true
}

function Check-Command {
    param(
        $command,
        $params = ""
    )

    Write-DelimiterString
    Write-Host "Run: $command $params" -Foreground blue
    & $command $params.split(' ')
    if (-not $?) {
        Write-Host "Execution fails" -ForegroundColor red
        return $false
    }

    return $true
}
