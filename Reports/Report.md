# Portfolio Windows Server II - Yorben Caplier

Voor deze opdracht heb ik besloten mijn VM's als volgt op te stellen:

![Opstelling Netwerk](img/Opstelling.png)


## Opstelling/Configuratie Virtuele Machines
|DCHP + DNS| IIS | Exchange  | AD (Domeincontroller) + SQL + CA |
|---|---|---|---|
|IP-adres: 192.168.22.1   |IP-adres: 192.168.22.2   |IP-adres: 192.168.22.3   |IP-adres: 192.168.22.4 (intern netwerk) + 10.0.2.15 (NAT)  |
|vCPUs: 2   | vCPUs: 2  | vCPUs: 4  | vCPUs: 2  |  
| vRAM: 2GB  | vRAM: 2GB  | vRAM: 8GB  | vRAM: 3GB  |
| Netwerkadapter: INTNET  | Netwerkadapter: INTNET  | Netwerkadapter: INTNET  | Netwerkadapter: NAT + INTNET   |

De AD + SQL-server zal dienen als domeincontroller. Deze wordt dus bijgevolgd aangemaakt met een GUI. De rest van de server zullen zonder GUI (Desktop Experience).

Er zijn 2 Windows Clients binnen het domein: 1 als normale user, en 1 als Admin, waarop ik de Management Tools zal installeren, om toch via een GUI de juiste instellingen te configureren.

### Naam van het domein: WS2-2223-yorben.hogent

## DCHP + DNS
Deze server zal enkel een command-line interface hebben. Deze beschikt over 2 vCPUs en 2gb vRAM. Deze VM heeft alleen een INTNET-interface. De virtuele schijf hiervan zal 30gb groot zijn, maar dynamisch gealloceerd, zodat het niet teveel ruimte opneemt op mijn host. Ik heb deze twee netwerkdiensten samengenomen aangezien deze allebei relatief "lightweight" zijn om te draaien. De DNS-rol op deze server zal dienen als secundaire DNS. De DHCP zal Ip-adressen uitgeven aan de clients, binnen volgende range: **192.168.22.101-150** met als subnetmask **255.255.255.0** . 
## IIS
Deze server zal enkel beschikken over een command-line interface. Deze heeft twee virtuele CPUs en 2gb vRAM. Deze VM heeft alleen een INTNET-interface. De virtuele schijf hiervan zal 20gb groot zijn, maar dynamisch gealloceerd, zodat het niet teveel ruimte opneemt op mijn host. Deze server zal een website hosten op volgende URL: `https://www.ws2-yorben.hogent`. Deze site zal ook voorzien zijn van een certificaat, uitgegeven door de CA.
## Exchange
Deze server zal enkel een command-line interface hebben. Deze VM heeft 4 vCPUs en 8gb vRAM. Op deze VM zal Windows Server 2019 gezet worden, evenals een Exchange Server ISO. De virtuele schijf hiervan zal 40gb groot zijn, maar dynamisch gealloceerd, zodat het niet teveel ruimte opneemt op mijn host. Het volledige domeinnaam van deze server zal `exchange.ws2-2223-yorben.hogent` zijn.

## AD + SQL + CA (Domeincontroller)
De domeincontroller zal beschikken over 2vCPUs, en 3gb vRAM. Hierop staan de Active Directory-services, een SQL-server, en een Certificate Authority. De virtuele schijf hiervan zal 40gb groot zijn, maar dynamisch gealloceerd, zodat het niet teveel ruimte opneemt op mijn host. Ik heb gekozen om AD en SQL samen te nemen, aangezien deze gelinkt moeten worden aan elkaar. De ingebouwde DNS-rol op deze server zal dienen als primaire DNS. Deze zal zijn forwarders instellen op die van Google.

## Clients

Er zijn twee clients die opgezet zullen worden, 1 client (admin) met de nodige administratietools om de servers zonder GUI te beheren, en 1 client die een gewone gebruiker voorstelt. Beide clients krijgen een IP-adres van de DHCP-server binnen volgende range: **192.168.22.101-150** met als subnetmask **255.255.255.0** . Ze zullen beschikken over 1 vCPU en 2 gb vRAM. Ze hebben ook een virtuele harde schijf van 45gb, die dynamisch gealloceerd is.

## Opzetten en Configuratie

## 1. DHCP + DNS

## 2. IIS

## 3. Exchange

## 4. AD + SQL + CA (Domeincontroller)

Om de domeincontroller in te stellen maken we gebruik van de GUI. Bij het installeren van de AD DS (Active Directory Domain Services) stellen we de NetBIOS-naam in als volgt: `WS2-2223-YORBEN`. Deze server wordt ook gebruikt als primaire DNS. Na het installeren van de rol, en de server te promoveren naar Domein Controller, moet de eerste netwerkadapter een statisch IP-adres krijgen. Deze configuratie gebeurt door het script uit te voeren.
## 5. Clients
