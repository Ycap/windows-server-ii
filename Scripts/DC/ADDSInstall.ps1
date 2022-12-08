#Source: https://rdr-it.com/en/create-an-active-directory-environment-in-powershell/

Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

#Maak domein aan
Install-ADDSForest -DomainName "WS2-2223-yorben.hogent" -DomainNetBiosName "WS2-2223-YORBEN" -InstallDns:$true -NoRebootCompletion:$true -Confirm

#Herstart de computer om changes door te voeren
Restart-Computer