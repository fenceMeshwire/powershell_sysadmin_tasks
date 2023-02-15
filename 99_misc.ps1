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

#____________________________________________________________
# Make a directory
mkdir folder

#____________________________________________________________
# Rename a directory
ren folder new_folder

#____________________________________________________________
# Delete a directory
del folder

#____________________________________________________________
# Create a new TXT file
New-Item textfile.txt

#____________________________________________________________
# Delete files with greedy matching
# Multiple files begin with "samplefile" and ends with ".xlsm"
del samplefile*.xlsm
