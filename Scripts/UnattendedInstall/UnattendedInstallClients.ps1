$naamVM = "Client"
#Dit pad kan veranderd worden
$padISO = "D:\VirtualBox VMs\SW_DVD9_Win_Pro_10_20H2.10_64BIT_English_Pro_Ent_EDU_N_MLF_X22-76585.ISO"
Write-Host "Unattended install Client..."

vboxmanage unattended install $naamVM `
--iso=$padISO `
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