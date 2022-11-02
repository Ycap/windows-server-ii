#Aanmaken Windows DHCP/DNS VM
Write-Host "##########Creating DHCP/DNS Server###########"
vboxmanage createvm --name DHCPDNS --ostype Windows2019_64 --register --groups=/WindowsServerII

#Configuratie Windows DHCP/DNS VM
vboxmanage modifyvm DHCPDNS --memory=2048 --cpus 2 --vram=128 --nic1 intnet 
vboxmanage storagectl DHCPDNS --name "SATA Controller" --add sata --controller IntelAhci --bootable on 
vboxmanage createhd --filename "D:\VirtualBox VMs\WindowsServerII\DHCPDNS\DHCPDNS.vdi" --size 30000
vboxmanage storageattach DHCPDNS --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "D:\VirtualBox VMs\WindowsServerII\DHCPDNS\DHCPDNS.vdi" 


#Aanmaken Windows IIS VM
Write-Host "##########Creating IIS Server###########"
vboxmanage createvm --name IIS --ostype Windows2019_64 --register --groups=/WindowsServerII

#Configuratie Windows IIS VM
vboxmanage modifyvm IIS --memory=2048 --cpus 2 --vram=128 --nic1 intnet  
vboxmanage storagectl IIS --name "SATA Controller" --add sata --controller IntelAhci --bootable on 
vboxmanage createhd --filename "D:\VirtualBox VMs\WindowsServerII\IIS\IIS.vdi" --size 20000
vboxmanage storageattach IIS --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "D:\VirtualBox VMs\WindowsServerII\IIS\IIS.vdi"

#Aanmaken Windows Exchange VM
Write-Host "##########Creating Exchange Server###########"
vboxmanage createvm --name Exchange --ostype Windows2019_64 --register --groups=/WindowsServerII

#Configuratie Windows Exchange VM
vboxmanage modifyvm Exchange --memory=8000 --cpus 4 --vram=128 --nic1 intnet  
vboxmanage storagectl Exchange --name "SATA Controller" --add sata --controller IntelAhci --bootable on
vboxmanage storagectl Exchange --name "SATA Controller #2" --add sata --controller IntelAhci 

vboxmanage createhd --filename "D:\VirtualBox VMs\WindowsServerII\Exchange\Exchange.vdi" --size 40000
vboxmanage storageattach Exchange --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "D:\VirtualBox VMs\WindowsServerII\Exchange\Exchange.vdi"
vboxmanage storageattach Exchange --storagectl "SATA Controller #2" --port 0 --device 0 --type dvddrive --medium "D:\VirtualBox VMs\Windows_Server_2016_Datacenter_EVAL_en-us_14393_refresh.ISO"

#Aanmaken Windows DC VM
Write-Host "##########Creating Domain Controller###########"
vboxmanage createvm --name DC --ostype Windows2019_64 --register --groups=/WindowsServerII

#Configuratie Windows DC VM
vboxmanage modifyvm DC --memory=3000 --cpus 2 --vram=128 --nic1 intnet  --nic2 nat
vboxmanage storagectl DC --name "SATA Controller" --add sata --controller IntelAhci --bootable on 

vboxmanage createhd --filename "D:\VirtualBox VMs\WindowsServerII\DC\DC.vdi" --size 40000
vboxmanage storageattach DC --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "D:\VirtualBox VMs\WindowsServerII\DC\DC.vdi"



