powershell

#Install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

#Install prerequisites
choco install dotnetfx
choco install vcredist-all
choco install urlrewrite
Install-WindowsFeature Server-Media-Foundation

Install-WindowsFeature NET-Framework-45-Features, RSAT-ADDS, RPC-over-HTTP-proxy, RSAT-Clustering, RSAT-Clustering-CmdInterface, RSAT-Clustering-Mgmt, RSAT-Clustering-PowerShell, Web-Mgmt-Console, WAS-Process-Model, Web-Asp-Net45, Web-Basic-Auth, Web-Client-Auth, Web-Digest-Auth, Web-Dir-Browsing, Web-Dyn-Compression, Web-Http-Errors, Web-Http-Logging, Web-Http-Redirect, Web-Http-Tracing, Web-ISAPI-Ext, Web-ISAPI-Filter, Web-Lgcy-Mgmt-Console, Web-Metabase, Web-Mgmt-Console, Web-Mgmt-Service, Web-Net-Ext45, Web-Request-Monitor, Web-Server, Web-Stat-Compression, Web-Static-Content, Web-Windows-Auth, Web-WMI, Windows-Identity-Foundation

#TODO: UCMA-setup via dir in Exchange ISO
#TODO: cd to directory

#Prepare AD
Setup.exe /PrepareSchema /IAcceptExchangeServerLicenseTerms_DiagnosticDataOn
Setup.exe /PrepareAD /OrganizationName:”WS2-2223-yorben.hogent” /IAcceptExchangeServerLicenseTerms_DiagnosticDataOn
Setup.exe /q /IAcceptExchangeServerLicenseTerms_DiagnosticDataOn /on:”WS2-2223-YORBEN"

# Maak Internet Send Connector (zodat mail verstuurd kan worden)
New-SendConnector -Name "Internal" -AddressSpaces * -Internet