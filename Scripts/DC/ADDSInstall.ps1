#Source: https://rdr-it.com/en/create-an-active-directory-environment-in-powershell/

Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

#Maak domein aan
Import-Module ADDSDeployment
Install-ADDSForest -CreateDnsDelegation:$false -DatabasePath "C:\Windows\NTDS" -DomainMode "WinThreshold" -DomainName "WS2-2223-yorben.hogent" -DomainNetbiosName "WS2-2223-YORBEN" -ForestMode "WinThreshold" -InstallDns:$true -LogPath "C:\Windows\NTDS" -NoRebootOnCompletion:$false -SysvolPath "C:\Windows\SYSVOL" -Force:$true
