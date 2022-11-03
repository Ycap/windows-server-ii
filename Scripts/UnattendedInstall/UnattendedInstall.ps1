Write-Host "Unattended install DHCP/DNS..."

vboxmanage unattended install WinServerDHCPDNS `
--iso="D:\VirtualBox VMs\en_windows_server_2019_x64_dvd_4cb967d8.iso" `
--user=Administrator `
--password=22Admin23 `
--image-index=1 `
--install-additions `
--locale=be_NL `
--country=BE `
--time-zone=Europe/Brussels `
--post-install-command="shutdown /r" `
--start-vm=gui

Write-Host "Unattended install IIS..."

vboxmanage unattended install WinServerIIS `
--iso="D:\VirtualBox VMs\en_windows_server_2019_x64_dvd_4cb967d8.iso" `
--user=Administrator `
--password=22Admin23 `
--image-index=1 `
--install-additions `
--locale=be_NL `
--country=BE `
--time-zone=Europe/Brussels `
--post-install-command="shutdown /r" `
--start-vm=gui

Write-Host "Unattended install Exchange..."

vboxmanage unattended install WinServerExchange `
--iso="D:\VirtualBox VMs\en_windows_server_2019_x64_dvd_4cb967d8.iso" `
--user=Administrator `
--password=22Admin23 `
--image-index=1 `
--install-additions `
--locale=be_NL `
--country=BE `
--time-zone=Europe/Brussels `
--post-install-command="shutdown /r" `
--start-vm=gui


Write-Host "Unattended install Domain Controller..."

vboxmanage unattended install WinServerDC `
--iso="D:\VirtualBox VMs\en_windows_server_2019_x64_dvd_4cb967d8.iso" `
--user=Administrator `
--password=22Admin23 `
--image-index=2 `
--install-additions `
--locale=be_NL `
--country=BE `
--time-zone=Europe/Brussels `
--post-install-command="shutdown /r" `
--start-vm=gui