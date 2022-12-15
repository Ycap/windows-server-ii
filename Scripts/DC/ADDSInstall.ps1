#Source: https://rdr-it.com/en/create-an-active-directory-environment-in-powershell/
# IP-instellingen veranderen
New-NetIPAddress -InterfaceAlias Ethernet -IPAddress 192.168.22.4 -DefaultGateway 192.168.22.4
Set-NetIPAddress -InterfaceAlias Ethernet -IPAddress 192.168.22.4 -PrefixLength 24
Start-Sleep -Seconds 3
# DNS Server instellen
Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddresses ("192.168.22.4", "192.168.22.1")

Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

#Maak domein aan
Import-Module ADDSDeployment
Install-ADDSForest -CreateDnsDelegation:$false -DatabasePath "C:\Windows\NTDS" -DomainMode "WinThreshold" -DomainName "WS2-2223-yorben.hogent" -DomainNetbiosName "WS2-2223-YORBEN" -ForestMode "WinThreshold" -InstallDns:$true -LogPath "C:\Windows\NTDS" -NoRebootOnCompletion:$false -SysvolPath "C:\Windows\SYSVOL" -Force:$true
