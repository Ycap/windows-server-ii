Write-Host "Unattended install Exchange..."

vboxmanage unattended install Exchange `
--iso="D:\VirtualBox VMs\en_windows_server_2019_x64_dvd_4cb967d8.iso" `
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