# IP-instellingen veranderen
New-NetIPAddress -InterfaceAlias Ethernet -IPAddress 192.168.22.4 -DefaultGateway 192.168.22.4
Set-NetIPAddress -InterfaceAlias Ethernet -IPAddress 192.168.22.4 -PrefixLength 24
Start-Sleep -Seconds 3
# DNS Server instellen
Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddresses ("192.168.22.4", "192.168.22.1")

#Disable IE Enhanced Security Configuration
function Disable-InternetExplorerESC {
    $AdminKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}"
    $UserKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}"
    Set-ItemProperty -Path $AdminKey -Name "IsInstalled" -Force -Value 0
    Set-ItemProperty -Path $UserKey -Name "IsInstalled" -Force -Value 0
    Stop-Process -Name Explorer
    Write-Host "IE Enhanced Security Configuration (ESC) has been disabled." -ForegroundColor Green
}
Disable-InternetExplorerESC
# Automatisch inloggen als Domain Admin
Set-ItemProperty $padRegistry "AutoAdminLogon" -Value "1" -type String 
Set-ItemProperty $padRegistry "DefaultUsername" -Value "Administrator@WS2-2223-yorben.hogent" -type String 
Set-ItemProperty $padRegistry "DefaultPassword" -Value "22Admin23" -type String
