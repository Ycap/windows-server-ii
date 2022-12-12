
Set-DnsServerPrimaryZone -Name "WS2-2223-yorben.hogent" -Notify "Notify" -SecureSecondaries TransferToZoneNameServer -SecondaryServers "192.168.22.1"
Set-DnsServerPrimaryZone -Name "_msdcs.WS2-2223-yorben.hogent" -Notify "Notify" -SecureSecondaries TransferToZoneNameServer -SecondaryServers "192.168.22.1"

# Add reverse lookup zone
Add-DnsServerPrimaryZone -NetworkID 192.168.22.0/24 -ReplicationScope "Domain"

# Set forwarder
Set-DnsServerForwarder -IPAddress 8.8.8.8 -PassThru
Add-DnsServerForwarder -IPAddress 9.9.9.9 -PassThru


Add-DnsServerResourceRecordA -Name dc -ZoneName ws2-2223-yorben.hogent -IPv4Address 192.168.22.4
Add-DnsServerResourceRecordA -Name dhcpdns -ZoneName ws2-2223-yorben.hogent -IPv4Address 192.168.22.1
Add-DnsServerResourceRecordA -Name exchange -ZoneName ws2-2223-yorben.hogent -IPv4Address 192.168.22.3
Add-DnsServerResourceRecordA -Name iis -ZoneName ws2-2223-yorben.hogent -IPv4Address 192.168.22.2

# Add CNAME records
Add-DnsServerResourceRecordCName -ZoneName ws2-2223-yorben.hogent -HostNameAlias "iis.ws2-2223-yorben.hogent" -Name "www"
Add-DnsServerResourceRecordCName -ZoneName ws2-2223-yorben.hogent -HostNameAlias "iis.ws2-2223-yorben.hogent" -Name "web"

#Add MX record
Add-DnsServerResourceRecordMX -Preference 10  -Name "." -TimeToLive 01:00:00 -MailExchange "exchange.ws2-2223-yorben.hogent" -ZoneName "WS2-2223-yorben.hogent"