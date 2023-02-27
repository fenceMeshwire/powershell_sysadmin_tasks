# Function to determine the SamAccountName
# ______________________________________________________________________________
function get_SamAccountName {
    param(
    [Parameter(Mandatory)]
    [String]
    $user_surname
    )
    process {
    $identity = Get-ADUser -Filter "Surname -eq '$user_surname'"
    $identity.SamAccountName
    }
}

# Function to obtain the user's data. Check for multiple identities first.
# ______________________________________________________________________________
function get_user_data {
    param(
    [Parameter(Mandatory)]
    [String]
    $user_samAccountName
    )
    process {
    $identity = Get-ADUser -Identity $user_samAccountName -Properties *
    Write-Host $identity.Surname
    Write-Host $identity.Givenname
    Write-Host $identity.Department
    Write-Host $identity.telephoneNumber
    Write-Host $identity.Office
    Write-Host $identity.samAccountName
    }
}
# ______________________________________________________________________________
$user_samAccountName = $null
$user_surname = $null

$user_surname = 'sample'

# 1. Check for multiple identities with same Surname:
Get-ADUser -Filter "Surname -eq '$user_surname'" | Sort-Object | Format-Table Surname, GivenName, samAccountName
# ______________________________________________________________________________
# 2. Single identity: SamAccountName can be obtained with this functions:
$user_samAccountName = get_SamAccountName($user_surname)
get_user_data($user_samAccountName)
# ______________________________________________________________________________
# Alternative: Chain two functions:
get_user_data(get_SamAccountName($user_surname))
