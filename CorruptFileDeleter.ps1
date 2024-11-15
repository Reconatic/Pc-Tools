$targetDir = "C:\"

Get-ChildItem -Path $targetDir -Recurse | ForEach-Object {
    try {
        [System.IO.File]::Open($_.FullName, 'Open', 'Read').Dispose()
    } catch {
        Write-Host "Deleting corrupt file: $($_.FullName)"
        Remove-Item -Path $_.FullName -Force
    }
}
