# 01_disable_enable_randomize_identifiers_ipv6.ps1

# Purpose: Disable and enable the option RandomizeIdentifiers within the IPv6 protocol.

# Show local IPv6 addresses:
Get-NetIPConfiguration | Select-Object IPv6LinkLocalAddress

# Show IPv6 protocols:
Get-NetIPv6Protocol

# Disable RandomizeIdentifiers:
Set-NetIPv6Protocol -RandomizeIdentifiers Disabled

# Check Status of RandomizeIdentifiers:
Get-NetIPv6Protocol

# Enable RandomizeIdentifiers:
Set-NetIPv6Protocol -RandomizeIdentifiers Enabled

# Check Status of RandomizeIdentifiers:
Get-NetIPv6Protocol
