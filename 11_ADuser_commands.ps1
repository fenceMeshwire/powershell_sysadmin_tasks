# List all AD users:
Get-ADUser -Filter *
# _____________________________________________________________________
# Search for a particular user "SampleS":
Get-ADUser -Filter "samAccountName -eq 'SampleS'"
Get-ADUser -Identity SampleS
# _____________________________________________________________________
# Obtain AD user information, including SID

$identity = Get-ADUser -Identity 'YOUR-USER'
$identity                     # Returns all information
$identity.Name                # Returns the Name (common name)
$identity.SID                 # Returns the SID
$identity.UserPrincipalName   # Returns username@domain
$identity.samAccountName      # Returns username
# _____________________________________________________________________
# Obtain AD user information by using the SID
# SID: S-X-X-XX-XXXXXXXXX-XXXXXXXXXX-XXXXXXX-XXXX
$identity = Get-ADUser -Identity 'SID'
$identity                     # Returns all information
$identity.Name                # Returns the Name
$identity.SID                 # Returns the SID
$identity.UserPrincipalName   # Returns username@domain
# _____________________________________________________________________
# Show search results as table:
Get-ADUser -Filter "Surname -eq 'Sample'" | Format-Table Surname, GivenName, samAccountName

# Delete AD user:
Remove-Aduser username -Confirm:$False    # Delete the username without confirmation
#             Note: write username as is, no declaration
# _____________________________________________________________________     
# Create AD user:
$password = Read-Host -AsSecureString
New-ADUser -Name "user" -Accountpassword $password -OtherAttributes @{'title'="worker";'mail'="user@company.com"} -PasswordNotRequired:$False

# Alternatively (given OU has already been created):
$fn = "Sam"
$ln = "Sample"
$disp = $fn + " " + $ln
$common_name = "CN=" + $fn + " " + $ln
$attributes = $common_name + ",OU=Sales,OU=my_domain,DC=my_company,DC=org"
$domain_name = "my_domain.org"
$upn = $username + "@" + $domain_name
$pwd = "13thWarrior!"

# Command:
dsadd user $attributes -samid $username -upn $upn -fn $fn -ln $ln -display $disp -mustchpwd no -pwd $pwd
# _____________________________________________________________________   

