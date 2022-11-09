powershell 

Set-Location F:\

Setup.exe /qs /ACTION=Install /FEATURES=SQLEngine /INSTANCENAME=MSSQLSERVER /SQLSVCACCOUNT="NT SERVICE\MSSQLSERVER" /SQLSVCPASSWORD="22Admin23" /SQLSYSADMINACCOUNTS="WS2-2223-yorben\Administrator" /AGTSVCACCOUNT="NT AUTHORITY\Network Service" /TCPENABLED=1 /IACCEPTSQLSERVERLICENSETERMS

# Scripts voor SQL Server
New-NetFirewallRule -DisplayName "SQLServer default instance" -Direction Inbound -LocalPort 1433 -Protocol TCP -Action Allow
New-NetFirewallRule -DisplayName "SQLServer Browser service" -Direction Inbound -LocalPort 1434 -Protocol UDP -Action Allow

Set-service sqlbrowser -StartupType Auto
Start-service sqlbrowser

shutdown /r