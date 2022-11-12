# 00_introductions.ps1

# Basic steps of configuration, after installation of Windows 2019 Server

# Initial check:
Get-ComputerInfo
Get-WmiObject Win32_Computersystem
Get-NetIPConfiguration
Get-NetFirewallProfile -Profile Public

# Settings
# 1. Change IPv4 address:
New-NetIPAddress -InterfaceAlias Ethernet0 -IPAddress 192.168.17.100 -PrefixLength 24

# 2. Deactivate Firewall (optional, if you'd like to):
Set-NetFirewallProfile -Profile Public -Enabled False

# 3. Change Hostname:
Rename-Computer -NewName NewHostname123

# 4. Reboot/Shotdown the os:
shutdown /r
shutdown /s

# 4a. Time option regarding reboot/shutdown immediately:
shutdown /r /t 0
shutdown /s /t 0
