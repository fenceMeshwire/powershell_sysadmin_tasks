# Open distinct path on Windows Explorer:
ii C:\temp

# Alternatively
start C:\temp

#____________________________________________________________
# Get architecture (32/64 Bit)
wmic OS get OSArchitecture

#____________________________________________________________
# List directories in a directory:
Get-ChildItem C:\Users\ -directory
