
# Variables
$password = "22Admin23" | ConvertTo-SecureString -asPlainText -Force
$username = "WS2-2223-yorben.hogent\Administrator"
$credentials = New-Object System.Management.Automation.PSCredential($username, $password)
$padRegistry = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"

# IP-instellingen veranderen
New-NetIPAddress -InterfaceAlias Ethernet -IPAddress 192.168.22.2 -DefaultGateway 192.168.22.4
Set-NetIPAddress -InterfaceAlias Ethernet -IPAddress 192.168.22.2 -PrefixLength 24 
Start-Sleep -Seconds 3
# DNS Server instellen
Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddresses ("192.168.22.4", "192.168.22.1")
# Server toevoegen aan domein
Add-Computer -DomainName WS2-2223-yorben.hogent -DomainCredential $credentials -Force -WarningAction SilentlyContinue
Start-Sleep -Seconds 3
# Automatisch inloggen als Domain Admin
Set-ItemProperty $padRegistry "AutoAdminLogon" -Value "1" 
Set-ItemProperty $padRegistry "DefaultUsername" -Value "Administrator@WS2-2223-yorben.hogent" 
Set-ItemProperty $padRegistry "DefaultPassword" -Value "22Admin23"  