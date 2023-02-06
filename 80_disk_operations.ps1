# List DeviceID,DriveType,ProviderName,VolumeName,Size,FreeSpace 

Get-CimInstance -ClassName Win32_LogicalDisk

Get-CimInstance -ClassName Win32_LogicalDisk | Select-Object -Property DeviceID,Size,FreeSpace
