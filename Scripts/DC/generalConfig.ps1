# IP-instellingen veranderen
New-NetIPAddress -InterfaceAlias Ethernet -IPAddress 192.168.22.4 -DefaultGateway 192.168.22.4
Set-NetIPAddress -InterfaceAlias Ethernet -IPAddress 192.168.22.4 -PrefixLength 24
Start-Sleep -Seconds 3
# DNS Server instellen
Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddresses ("192.168.22.4", "192.168.22.1")
