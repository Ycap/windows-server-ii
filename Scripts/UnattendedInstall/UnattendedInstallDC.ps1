$naamVM = "DC"
#Dit pad kan veranderd worden
$padISO = "D:\VirtualBox VMs\en_windows_server_2019_x64_dvd_4cb967d8.iso"
Write-Host "Unattended install Domain Controller..."

vboxmanage unattended install $naamVM `
--iso="D:\VirtualBox VMs\en_windows_server_2019_x64_dvd_4cb967d8.iso" `
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