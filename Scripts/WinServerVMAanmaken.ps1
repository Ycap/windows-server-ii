#Aanmaken Windows DHCP/DNS VM
Write-Host "##########Creating DHCP/DNS Server###########"
vboxmanage createvm --name WinServerDHCPDNS --ostype Windows2019_64 --register --groups=/WindowsServerII

#Configuratie Windows DHCP/DNS VM
vboxmanage modifyvm WinServerDHCPDNS --memory=2048 --cpus 2 --vram=128 --nic1 intnet 
vboxmanage storagectl WinServerDHCPDNS --name "SATA Controller" --add sata --controller IntelAhci --bootable on 

vboxmanage storageattach WinServerDHCPDNS --storagectl "SATA Controller" --port 0 --device 0 --type dvddrive --medium "D:\VirtualBox VMs\en_windows_server_2019_x64_dvd_4cb967d8.iso"

#Aanmaken Windows IIS VM
Write-Host "##########Creating IIS Server###########"
vboxmanage createvm --name WinServerIIS --ostype Windows2019_64 --register --groups=/WindowsServerII

#Configuratie Windows IIS VM
vboxmanage modifyvm WinServerIIS --memory=2048 --cpus 2 --vram=128 --nic1 intnet  
vboxmanage storagectl WinServerIIS --name "SATA Controller" --add sata --controller IntelAhci --bootable on 

vboxmanage storageattach WinServerIIS --storagectl "SATA Controller" --port 0 --device 0 --type dvddrive --medium "D:\VirtualBox VMs\en_windows_server_2019_x64_dvd_4cb967d8.iso"

#Aanmaken Windows Exchange VM
Write-Host "##########Creating Exchange Server###########"
vboxmanage createvm --name WinServerExchange --ostype Windows2019_64 --register --groups=/WindowsServerII

#Configuratie Windows Exchange VM
vboxmanage modifyvm WinServerExchange --memory=8000 --cpus 4 --vram=128 --nic1 intnet  
vboxmanage storagectl WinServerExchange --name "SATA Controller" --add sata --controller IntelAhci --bootable on
vboxmanage storagectl WinServerExchange --name "SATA Controller #2" --add sata --controller IntelAhci 

vboxmanage storageattach WinServerExchange --storagectl "SATA Controller" --port 0 --device 0 --type dvddrive --medium "D:\VirtualBox VMs\en_windows_server_2019_x64_dvd_4cb967d8.iso"
vboxmanage storageattach WinServerExchange --storagectl "SATA Controller #2" --port 0 --device 0 --type dvddrive --medium "D:\VirtualBox VMs\Windows_Server_2016_Datacenter_EVAL_en-us_14393_refresh.ISO"
#Aanmaken Windows DC VM
Write-Host "##########Creating Domain Controller###########"
vboxmanage createvm --name WinServerDC --ostype Windows2019_64 --register --groups=/WindowsServerII

#Configuratie Windows DC VM
vboxmanage modifyvm WinServerDC --memory=3000 --cpus 2 --vram=128 --nic1 intnet  --nic2 nat
vboxmanage storagectl WinServerDC --name "SATA Controller" --add sata --controller IntelAhci --bootable on 

vboxmanage storageattach WinServerDC --storagectl "SATA Controller" --port 0 --device 0 --type dvddrive --medium "D:\VirtualBox VMs\en_windows_server_2019_x64_dvd_4cb967d8.iso"



