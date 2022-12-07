Install-WindowsFeature DHCP -IncludeManagementTools
#DHCP server toevoegen in domein
Add-DhcpServerInDC -DNSName dhcpdns.ws2-2223-yorben.hogent -IPAddress 192.168.22.1
#DHCP-scope toevoegen
Add-DhcpServerV4Scope -name “Clients” -StartRange 192.168.22.100 -Endrange 192.168.22.150 -SubnetMask 255.255.255.0 -State Active
# Opties voor de scope toevoegen
Set-DhcpServerV4OptionValue -ComputerName dhcpdns.ws2-2223-yorben.hogent -ScopeID 192.168.22.0 -DNSServer 192.168.22.4,192.168.22.1 -Router 192.168.22.4
