
#Install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

#Install prerequisites
choco install -y dotnetfx
choco install -y vcredist-all
#Downloaden URL rewrite
Invoke-WebRequest -Uri "http://www.microsoft.com/web/handlers/webpi.ashx?command=getinstallerredirect&appid=urlrewrite2" -OutFile "C:\Users\Administrator\Desktop\urlrewrite.exe"
Set-Location C:\Users\Administrator\Desktop\
.\urlrewrite.exe
#Server Media Foundation installeren
Install-WindowsFeature Server-Media-Foundation
Set-Location D:\UCMARedist
.\Setup.exe /qs

Install-WindowsFeature -Name NET-Framework-45-Features, RSAT-ADDS, RPC-over-HTTP-proxy, RSAT-Clustering, RSAT-Clustering-CmdInterface, RSAT-Clustering-PowerShell, Web-Mgmt-Console, WAS-Process-Model, Web-Asp-Net45, Web-Basic-Auth, Web-Client-Auth, Web-Digest-Auth, Web-Dir-Browsing, Web-Dyn-Compression, Web-Http-Errors, Web-Http-Logging, Web-Http-Redirect, Web-Http-Tracing, Web-ISAPI-Ext, Web-ISAPI-Filter, Web-Metabase, Web-Mgmt-Console, Web-Mgmt-Service, Web-Net-Ext45, Web-Request-Monitor, Web-Server, Web-Stat-Compression, Web-Static-Content, Web-Windows-Auth, Web-WMI
#TODO: UCMA-setup via dir in Exchange ISO
#TODO: cd to directory
Set-Location D:\
#Prepare AD
.\setup.exe /PrepareSchema /IAcceptExchangeServerLicenseTerms_DiagnosticDataOn
.\setup.exe /PrepareAD /OrganizationName:”WS2-2223-yorben” /IAcceptExchangeServerLicenseTerms_DiagnosticDataOn


# Maak Internet Send Connector (zodat mail verstuurd kan worden)
# New-SendConnector -Name "Internal" -AddressSpaces * -Internet