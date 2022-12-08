#Primaire zone toevoegen
Add-DnsServerResourceRecord -ZoneName ws2-2223-yorben.hogent -ns -name ws2-2223-yorben.hogent 
Add-DnsServerResourceRecord -ZoneName _msdcs.ws2-2223-yorben.hogent -ns -name _msdcs.ws2-2223-yorben.hogent -NameServer ns2.ws2-2223-yorben.hogent
Set-DnsServerPrimaryZone -Name "ws2-2223-yorben.hogent" -Notify "Notify" -SecureSecondaries TransferToZoneNameServer
Set-DnsServerPrimaryZone -Name "_msdcs.ws2-2223-yorben.hogent" -Notify "Notify" -SecureSecondaries TransferToZoneNameServer