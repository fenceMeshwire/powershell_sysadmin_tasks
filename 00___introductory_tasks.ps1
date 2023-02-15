# 00___introductory_tasks.ps1

# Basic steps of configuration, after installation of Windows 2019 Server

# Initial check:
Get-ComputerInfo
Get-WmiObject Win32_Computersystem
Get-NetIPConfiguration
Get-NetFirewallProfile -Profile Public

# Settings
# 1. Change IPv4 address:
New-NetIPAddress -InterfaceAlias Ethernet0 -IPAddress 192.168.17.100 -PrefixLength 24
# Alternative:
# netsh interface ipv4 set address name="Ethernet0" source=static address=192.168.17.100 mask=255.255.255.0

# 2. Deactivate Firewall (optional, if you'd like to):
Set-NetFirewallProfile -Profile Public -Enabled False
# 2a. Deactivate Firewall for all profiles (optional, if you'd like to):
netsh advfirewall set allprofiles state off

# 3. Change Hostname:
Rename-Computer -NewName NewHostname123

# 4. Reboot/Shotdown the os:
shutdown /r
shutdown /s

# 4a. Time option regarding reboot/shutdown immediately:
shutdown /r /t 0
shutdown /s /t 0
