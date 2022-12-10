# Steps for creating and removing an IPv4 address:

# 1. Create a new IPv4 address
New-NetIPAddress -InterfaceAlias Ethernet0 -IPAddress 192.168.17.100 -PrefixLength 24

# 2. Set the new IPv4 address
Set-NetIPAddress -InterfaceAlias Ethernet0 -IPAddress 192.168.17.100 -PrefixLength 24

# 3. In case you want to change the IPv4 address, delete the previous one:
Remove-NetIPAddress -InterfaceAlias Ethernet0 -IPAddress 192.168.17.100 -PrefixLength 24
