# Variables
$naamVM = "DHCPDNS"
$padVDI = "D:\VirtualBox VMs\WindowsServerII\$naamVM\$naamVM.vdi"
#Aanmaken Windows DHCP/DNS VM
Write-Host "##########Creating DHCP/DNS Server###########"
vboxmanage createvm --name $naamVM --ostype Windows2019_64 --register --groups=/WindowsServerII

#Configuratie Windows DHCP/DNS VM
vboxmanage modifyvm $naamVM --memory=1000 --cpus 2 --vram=128 --nic1 intnet 
vboxmanage storagectl $naamVM --name "SATA Controller" --add sata --controller IntelAhci --bootable on 
vboxmanage createhd --filename $padVDI --size 30000
vboxmanage storageattach $naamVM --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium $padVDI 

$naamVM = "IIS"
$padVDI = "D:\VirtualBox VMs\WindowsServerII\$naamVM\$naamVM.vdi"
#Aanmaken Windows IIS VM
Write-Host "##########Creating IIS Server###########"
vboxmanage createvm --name $naamVM --ostype Windows2019_64 --register --groups=/WindowsServerII

#Configuratie Windows IIS VM
vboxmanage modifyvm $naamVM --memory=1000 --cpus 2 --vram=128 --nic1 intnet  
vboxmanage storagectl $naamVM --name "SATA Controller" --add sata --controller IntelAhci --bootable on 
vboxmanage createhd --filename $padVDI --size 20000
vboxmanage storageattach $naamVM --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium $padVDI

$naamVM = "Exchange"
$padVDI = "D:\VirtualBox VMs\WindowsServerII\$naamVM\$naamVM.vdi"
#Aanmaken Windows Exchange VM
Write-Host "##########Creating Exchange Server###########"
vboxmanage createvm --name $naamVM --ostype Windows2019_64 --register --groups=/WindowsServerII

#Configuratie Windows Exchange VM
vboxmanage modifyvm $naamVM --memory=6132 --cpus 4 --vram=128 --nic1 intnet  
vboxmanage storagectl $naamVM --name "SATA Controller" --add sata --controller IntelAhci --bootable on
vboxmanage storagectl $naamVM --name "SATA Controller #2" --add sata --controller IntelAhci 

vboxmanage createhd --filename $padVDI --size 40000
vboxmanage storageattach $naamVM --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium $padVDI
vboxmanage storageattach $naamVM --storagectl "SATA Controller #2" --port 0 --device 0 --type dvddrive --medium "D:\VirtualBox VMs\Windows_Server_2016_Datacenter_EVAL_en-us_14393_refresh.ISO"

$naamVM = "DC"
$padVDI = "D:\VirtualBox VMs\WindowsServerII\$naamVM\$naamVM.vdi"
#Aanmaken Windows DC VM
Write-Host "##########Creating Domain Controller###########"
vboxmanage createvm --name $naamVM --ostype Windows2019_64 --register --groups=/WindowsServerII

#Configuratie Windows DC VM
vboxmanage modifyvm $naamVM --memory=3000 --cpus 2 --vram=128 --nic1 intnet  --nic2 nat
vboxmanage storagectl $naamVM --name "SATA Controller" --add sata --controller IntelAhci --bootable on 

vboxmanage createhd --filename $padVDI --size 40000
vboxmanage storageattach $naamVM --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium $padVDI

$naamVM = "Client"
$padVDI = "D:\VirtualBox VMs\WindowsServerII\$naamVM\$naamVM.vdi"
#Aanmaken Windows Client VM
Write-Host "##########Creating Windows Client###########"
vboxmanage createvm --name $naamVM --ostype Windows10 --register --groups=/WindowsServerII

#Configuratie Windows Client VM
vboxmanage modifyvm $naamVM --memory=2048 --cpus 1 --vram=128 --nic1 intnet  --nic2 nat
vboxmanage storagectl $naamVM --name "SATA Controller" --add sata --controller IntelAhci --bootable on 

vboxmanage createhd --filename $padVDI --size 45000
vboxmanage storageattach $naamVM --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium $padVDI



