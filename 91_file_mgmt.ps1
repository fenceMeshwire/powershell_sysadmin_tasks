# Find certain files recursively, e.g. xlsx files

$Dir = get-childitem "\\Server\directory" -recurse -force
$List = $Dir | where {$_.extension -eq ".xlsx"}

$List | Select-Object fullname, LastAccessTime, LastWriteTime, CreationTime, @{N='Owner';E={$_.GetAccessControl().Owner}} | Export-Csv -path C:\Users\...\search_results.csv -NoTypeInformation
