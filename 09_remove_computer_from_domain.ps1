# Installation of the Active-Directory-Domain-Services:

# 1. Feature installation
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

# 2. Import module
Import-Module ADDSDeployment

# 3. Installation of the Domain Controller:
Install-ADDSDomainController `
-NoGlobalCatalog:$false `
-CreateDnsDelegation:$false `
-Credential (Get-Credential) `
-CriticalReplicationOnly:$false `
-DatabasePath "C:\Windows\NTDS" `
-DomainName "yourdomain.com" `
-InstallDns:$true `
-LogPath "C:\Windows\NTDS" `
-NoRebootOnCompletion:$false `
-SiteName "Default-First-Site-Name" `
-SysvolPath "C:\Windows\SYSVOL" `
-Force:$true `
-SafeModeAdministratorPassword $(Read-Host -Prompt "Password: " -AsSecureString)
