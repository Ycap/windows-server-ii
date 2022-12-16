#Deze variabelen kunnen aangepast worden naar behoeven
$padClientISO = "D:\VirtualBox VMs\SW_DVD9_Win_Pro_10_20H2.10_64BIT_English_Pro_Ent_EDU_N_MLF_X22-76585.ISO"
$padServerISO = "D:\VirtualBox VMs\en_windows_server_2019_x64_dvd_4cb967d8.iso"
Write-Host "Unattended install DHCP/DNS..."

vboxmanage unattended install DHCPDNS `
--iso=$padServerISO `
--user=Administrator `
--password=22Admin23 `
--image-index=1 `
--install-additions `
--locale=be_NL `
--country=BE `
--time-zone=Europe/Brussels `
--post-install-command="shutdown /r" `
--start-vm=gui `
--hostname=dhcpdns.ws2-2223-yorben.hogent

Write-Host "Unattended install IIS..."

vboxmanage unattended install IIS `
--iso=$padServerISO `
--user=Administrator `
--password=22Admin23 `
--image-index=1 `
--install-additions `
--locale=be_NL `
--country=BE `
--time-zone=Europe/Brussels `
--post-install-command="shutdown /r" `
--start-vm=gui `
--hostname=iis.ws2-2223-yorben.hogent

Write-Host "Unattended install Exchange..."

vboxmanage unattended install Exchange `
--iso=$padServerISO `
--user=Administrator `
--password=22Admin23 `
--image-index=1 `
--install-additions `
--locale=be_NL `
--country=BE `
--time-zone=Europe/Brussels `
--post-install-command="shutdown /r" `
--start-vm=gui `
--hostname=exchange.ws2-2223-yorben.hogent


Write-Host "Unattended install Domain Controller..."

vboxmanage unattended install DC `
--iso=$padServerISO `
--user=Administrator `
--password=22Admin23 `
--image-index=2 `
--install-additions `
--locale=be_NL `
--country=BE `
--time-zone=Europe/Brussels `
--post-install-command="shutdown /r" `
--start-vm=gui `
--hostname=dc.ws2-2223-yorben.hogent

Write-Host "Unattended install Client..."

vboxmanage unattended install Client `
--iso=$padClientISO `
--user=Administrator `
--password=22Admin23 `
--image-index=2 `
--install-additions `
--locale=be_NL `
--country=BE `
--time-zone=Europe/Brussels `
--post-install-command="shutdown /r" `
--start-vm=gui `
--hostname=client.ws2-2223-yorben.hogent