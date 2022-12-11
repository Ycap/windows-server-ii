# Installeer DNS Server
Add-WindowsFeature DNS -IncludeManagementTools

Set-DnsServerPrimaryZone -Name "WS2-2223-yorben.hogent" -Notify "Notify" -SecureSecondaries TransferToZoneNameServer
Set-DnsServerPrimaryZone -Name "_msdcs.WS2-2223-yorben.hogent" -Notify "Notify" -SecureSecondaries TransferToZoneNameServer

# Add reverse lookup zone
Add-DnsServerPrimaryZone -NetworkID 192.168.22.0/24 -ReplicationScope "Domain"

# Set forwarder
Set-DnsServerForwarder -IPAddress 8.8.8.8 -PassThru
Set-DnsServerForwarder -IPAddress 9.9.9.9 -PassThru


Set-DnsServerResourceRecord -ZoneName "WS2-2223-yorben.hogent" -PassThru
Add-DnsServerResourceRecordA -Name dc -ZoneName ws2-2223-yorben.hogent -IPv4Address 192.168.22.4
Add-DnsServerResourceRecordA -Name dhcpdns -ZoneName ws2-2223-yorben.hogent -IPv4Address 192.168.22.1
Add-DnsServerResourceRecordA -Name exchange -ZoneName ws2-2223-yorben.hogent -IPv4Address 192.168.22.3
Add-DnsServerResourceRecordA -Name iis -ZoneName ws2-2223-yorben.hogent -IPv4Address 192.168.22.2

# Add CNAME records
Add-DnsServerResourceRecordCName -ZoneName ws2-2223-yorben.hogent -HostNameAlias "iis.ws2-2223-yorben.hogent" -Name "www"
Add-DnsServerResourceRecordCName -ZoneName ws2-2223-yorben.hogent -HostNameAlias "iis.ws2-2223-yorben.hogent" -Name "web"