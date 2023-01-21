 Get-NetAdapter -Name *
 
 # Set DNS-Server address, first router IP, then second client IP
 Set-DnsClientServerAddress -InterfaceIndex 4 -ServerAddresses ("192.168.0.1","192.168.0.10")
 
 # Show DNS-Server addresses:
 Get-DnsClientServerAddress -InterfaceIndex 4
 
 # Ping domain:
 ping domain.name
 
 # Reset all DNS-Server addresses:
 Set-DnsClientServerAddress -InterfaceIndex 4 -ResetServerAddresses
