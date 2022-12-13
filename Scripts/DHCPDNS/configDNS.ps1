# Installeer DNS Server
Add-WindowsFeature DNS -IncludeManagementTools

Add-DnsServerSecondaryZone -MasterServers "192.168.22.4" -Name "ws2-2223-yorben.hogent" -ZoneFile "ws2-2223-yorben.hogent" 
Start-DnsServerZoneTransfer -Name WS2-2223-yorben.hogent