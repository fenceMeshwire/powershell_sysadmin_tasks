$DirToCheck = "D:\"
$export_file = "C:\Users\...\...\duplicates.csv"

Get-ChildItem $DirToCheck -File -Recurse `
    | Get-FileHash | Group -Property Hash `
    | where {$_.Count -gt 1} | foreach { $_.Group | select Path, Hash} `
    | Export-Csv -path $export_file  -NoTypeInformation
