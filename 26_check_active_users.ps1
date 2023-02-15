# Check a list of users for validity against the AD and export the 
# sAMAccountName and Mail properties as CSV file.

# 1. Import data
cd C:\temp\directory_xy\
$csv = $null
$csv = import-csv -Path ./qnumbers.csv

# 2. Test the ADUser whether it does exist or not
function Test-ADUser {
  param(
    [Parameter(Mandatory)]
    [String]
    $sAMAccountName
  )
  $null -ne ([ADSISearcher] "(sAMAccountName=$sAMAccountName)").FindOne()
}

# 3. Process identities from CSV file
$identities = $null
$identities = @()
foreach ($c in $csv) {
    $user = $c.id
    $identities += $user
}

# 4. Set up loop for checking the available users
$valid = $null
$valid = @{}
$invalid = $null
$invalid = @{}

foreach ($identity in $identities) {

    $result = Test-AdUser($identity)

    if ($result -eq $true) {
        $valid_user = Get-ADUser -Identity $identity -Properties *
        $valid += @{
            $identity = $valid_user.mail
        }} else {
        $invalid += @{
            $identity = "N/A"}
            }
        }

# 5. Export the output    
$valid.GetEnumerator() | Select-Object -Property Key,Value | Export-Csv -Path valid_users.csv
$invalid.GetEnumerator() | Select-Object -Property Key,Value | Export-Csv -Path invalid_users.csv
