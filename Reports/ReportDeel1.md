# Report Deel 1

Voor deze opdracht heb ik besloten mijn VM's als volgt op te stellen:

![Opstelling Netwerk](/Reports/img/Opstelling.png)


## Opstelling IP-adressen, vCPUs, etc.
|DCHP + CA | IIS + SQL  | Exchange  | AD + DNS  |
|---|---|---|---|
|IP-adres: 192.168.22.1   |IP-adres: 192.168.22.2   |IP-adres: 192.168.22.3   |IP-adres: 192.168.22.4 (intern netwerk) + 10.0.2.15 (NAT)  |
|vCPUs: 1   | vCPUs: 1  | vCPUs: 4  | vCPUs: 2  |  
| vRAM: 2GB  | vRAM: 1GB  | vRAM: 8GB  | vRAM: 3GB  |
| Netwerkadapter: INTNET  | Netwerkadapter: INTNET  | Netwerkadapter: INTNET  | Netwerkadapter: NAT + INTNET   |

De AD + DNS-server zal dienen als domeincontroller. Deze wordt dus bijgevolgd aangemaakt met een GUI. De rest van de server zullen zonder GUI (Desktop Experience).

Er zijn 2 Windows Clients binnen het domein: 1 als normale user, en 1 als Admin, waarop ik de Management Tools zal installeren, om toch via een GUI de juiste instellingen te configureren.

### Naam van het domein: WS2-2223-yorben.hogent

