# Assemble the credentials:
$domain = "yourdomain.com"
$user = "administrator"
$password = Read-Host -Prompt "Password for $user" -AsSecureString
$username = "$domain\$user"
$credential = New-Object System.Management.Automation.PSCredential($username, $password)

# Add the computer to the domain:
Add-Computer -DomainName $domain -Credential $credential

# Finally restart the machine:
Restart-Computer
