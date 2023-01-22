# PowerShell Script to remove AD DS from the machine (AD DS = Active Directory Domain Services):

Import-Module ADDSDeployment
Uninstall-ADDSDomainController `
-DemoteOperationMasterRole:$true `
-Force:$true
