Set-Location D:\

.\setup.exe /qs /ACTION=Install /FEATURES=SQLEngine /INSTANCENAME=MSSQLSERVER /SQLSVCACCOUNT="NT SERVICE\MSSQLSERVER" /SQLSVCPASSWORD="22Admin23" /SQLSYSADMINACCOUNTS="WS2-2223-yorben.hogent\Administrator" /AGTSVCACCOUNT="NT AUTHORITY\Network Service" /TCPENABLED=1 /IACCEPTSQLSERVERLICENSETERMS

# Scripts voor SQL Server
New-NetFirewallRule -DisplayName "SQLServer default instance" -Direction Inbound -LocalPort 1433 -Protocol TCP -Action Allow
New-NetFirewallRule -DisplayName "SQLServer Browser service" -Direction Inbound -LocalPort 1434 -Protocol UDP -Action Allow



Set-service sqlbrowser -StartupType Auto
Start-service sqlbrowser

Restart-Service -Force MSSQLSERVER
Start-Sleep -Seconds 5
shutdown /r