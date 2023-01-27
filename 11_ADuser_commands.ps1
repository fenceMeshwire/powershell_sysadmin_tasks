# Obtain user information, including SID

$identity = Get-ADUser -Identity 'YOUR-USER'
$identity                     # Returns all information
$identity.Name                # Returns the Name
$identity.SID                 # Returns the SID
$identity.UserPrincipalName   # Returns username@domain

# Obtain user information by using the SID
# SID: S-X-X-XX-XXXXXXXXX-XXXXXXXXXX-XXXXXXX-XXXX
$identity = Get-ADUser -Identity 'SID'
$identity                     # Returns all information
$identity.Name                # Returns the Name
$identity.SID                 # Returns the SID
$identity.UserPrincipalName   # Returns username@domain

# Delete AD user:
Remove-Aduser username -Confirm:$False    # Delete the username without confirmation
                                          # Note: write username as is, no declaration
# Create AD user:
$password = Read-Host -AsSecureString
New-ADUser -Name "user" -Accountpassword $password -OtherAttributes @{'title'="worker";'mail'="user@company.com"} -PasswordNotRequired:$False
