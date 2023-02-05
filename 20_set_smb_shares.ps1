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
