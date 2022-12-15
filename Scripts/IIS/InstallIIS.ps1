Install-WindowsFeature Web-Mgmt-Service
Install-WindowsFeature Web-Server -IncludeManagementTools
set-service wmsvc -StartupType Automatic

netsh advfirewall firewall add rule name="IIS Remote Management" dir=in action=allow service=WMSVC

Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WebManagement\Server -Name EnableRemoteManagement -Value 1

Start-Service WMSVC

shutdown /r