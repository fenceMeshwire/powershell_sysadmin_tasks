# RSAT: Remote-Server-Administration-Tools

Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State

Add-WindowsCapability -Online -Name Rsat.ServerManager.Tools~~~~0.0.1.0
