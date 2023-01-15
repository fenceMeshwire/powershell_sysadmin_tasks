Import-Module ADDSDeployment
Uninstall-ADDSDomainController `
-DemoteOperationMasterRole:$true `
-Force:$true
