# Set smb share:

# Be sure to enable Services first, as follow:
# 1. "C:\Windows\system32\svchost.exe -k LocalServiceAndNoImpersonation -p" on "AutomaticDelayedStart"
# 2. "C:\Windows\System32\svchost.exe -k LocalServiceNetworkRestricted" on "AutomaticDelayedStart"

# ________________________________________________________________________________________
$Parameters = @{
    Name = 'Data'
    Path = 'C:\Data'
}
# Everybody is able to read the data within the directory above.
New-SmbShare @Parameters

# Show directory permissions:
$path = "Y:"
(get-acl $path).access | ft IdentityReference,FileSystemRights,AccessControlType,IsInherited,InheritanceFlags -auto

# ________________________________________________________________________________________
# Create and administer shares
# <share> is a placeholder for a specific share.
# <groupname> is a placeholder for a specific group.
# Show all shares:
net share

# Delete a specific share:
net share <share> /delete

# Grant permissions for a specific share
net share <share> "/grant:<groupname>,CHANGE" "/grant:<administrators>,FULL"

# Set unlimited users for the share:
net share <share> "/unlimited"

# Limit the users for the share:
net share <share> "/users:<number>"

# List files which are currently opened over the network
net file

# List current active sessions
net session

# ________________________________________________________________________________________
# Use of icacls.exe:
# 
# <groupname> is a placeholder for a specific group.
# icacls C:\directory\misc /grant <groupname>:F
