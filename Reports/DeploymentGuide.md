# Deployment Guide Windows Server II - Yorben Caplier

## Prerequisites

Om ervoor te zorgen dat alle vboxmanage-commando's werken, moet de install-directory van Virtualbox in de PATH-variabele gestoken in Windows. Hoe dit kan, kan je vinden op de volgende webpagina: https://www.roelpeters.be/vboxmanage-is-not-recognized-and-how-to-solve-it/

Na deze stappen uit te voeren zou het perfect mogelijk moeten zijn om alles uit te voeren.

Om al de nodige scripts naar de VM's te kopieren, voer het volgende commando uit:
```powershell
VboxManage guestcontrol DCtest copyto --target-directory="C:\Users\Administrator\Desktop" "C:\Users\yorbe\Desktop\Windows Server II\scripts" --username Administrator --password 22Admin23
```
## Hoofdstuk 1: Aanmaken + Unattended Install Virtuele Machines

Om de VM's aan te maken in Virtualbox, voer je het volgende script uit in de `scripts`-directory: `WinServerVMAanmaken.ps1`. Dit zorgt ervoor dat de VM's in dezelfde groep worden aangemaakt in Virtualbox. Het is mogelijk om via de variabelen (bovenaan het script gedefinieerd) de paden voor de VDI's en nodige ISO's te veranderen.

Vervolgens zijn er twee manieren om de virtuele machines unattended te laten installeren: Alles in een keer, of elk apart. Afhankelijk van de sterkte van je PC kies je de gepaste optie. Al de VM's kunnen unattended geinstalleerd worden na de gepaste scripts uit te voeren in de `scripts\UnattendedInstall\`-directory.


## Hoofdstuk 2: Configuratie DC

Na al de unattended installs uit te voeren, voer je het `ADDSInstall.ps1`-script uit in de `DC`-directory. Bij het eerste keer uitvoeren van een script op de VM is het mogelijk dat je "a" moet tikken om de ExecutionPolicy te veranderen. Na het uitvoeren van het script moet je het Administrator paswoord invoeren (`22Admin23`).

Vervolgens, aangezien de DNS-role al geinstalleerd is bij het promoveren van de server naar Domain Controller, hoeft de DNS-rol enkel nog geconfigureerd te worden. Dit wordt gedaan met het `configDNS.ps1`-script.



