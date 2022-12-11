# Variables
$password = "22Admin23" | ConvertTo-SecureString -asPlainText -Force
$username = "WS2-2223-yorben.hogent\Administrator"
$credentials = New-Object System.Management.Automation.PSCredential($username, $password)

# IP-instellingen veranderen
Set-NetIPInterface -InterfaceAlias 'Ethernet' -Dhcp Enabled
Start-Sleep -Seconds 3
# DNS Server instellen
Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddresses ("192.168.22.4", "192.168.22.1")

#Install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
#Install SSMS
choco install sql-server-management-studio

# Client toevoegen aan domein
Add-Computer -DomainName WS2-2223-yorben.hogent -DomainCredential $credentials -Restart -Force