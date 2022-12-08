# Variables
$password = "22Admin23" | ConvertTo-SecureString -asPlainText -Force
$username = "WS2-2223-yorben.hogent\Administrator"
$credentials = New-Object System.Management.Automation.PSCredential($username, $password)

# IP-instellingen veranderen
New-NetIPAddress -InterfaceAlias Ethernet -IPAddress 192.168.22.3
Set-NetIPAddress -InterfaceAlias Ethernet -IPAddress 192.168.22.3 -PrefixLength 24
Start-Sleep -Seconds 3
# DNS Server instellen
Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddresses ("192.168.22.4", "192.168.22.1")
# Server toevoegen aan domein
Add-Computer -DomainName WS2-2223-yorben.hogent -DomainCredential $credentials -Restart -Force