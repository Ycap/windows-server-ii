#Aanmaken Windows VM
vboxmanage createvm --name WinServer --ostype WindowsServer --register

#Configuratie Windows VM
vboxmanage modifyvm KaliLinuxProject --memory 2048 --cpus 1 --vram 128 --nic1 nat --nic2 intnet 
vboxmanage storagectl KaliLinuxProject --name "SATA Controller" --add sata --controller IntelAhci --bootable on 
vboxmanage storageattach KaliLinuxProject --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "D:\VirtualBox VMs\64bit\Kali Linux 2022.1 (64bit).vdi"


#Aanmaken Metasploitable VM
vboxmanage createvm --name MetasploitableProject --ostype Debian_64 --register

#Configuratie Metasploitable VM
vboxmanage modifyvm MetasploitableProject --memory 2048 --cpus 1 --vram 32 --nic1 intnet --graphicscontroller vmsvga
vboxmanage storagectl MetasploitableProject --name "SATA Controller" --add sata --controller IntelAhci 
vboxmanage storageattach MetasploitableProject --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "D:\VirtualBox VMs\Metasploitable2-Linux\Metasploitable.vmdk"

#Beheersen Kali VM
VBoxManage guestcontrol KaliLinuxProject run ifconfig eth1 10.0.0.2 netmask 255.255.255.0

#Beheersen Metasploitable VM
VBoxManage guestcontrol MetasploitableProject run ifconfig eth0 10.0.0.3 netmask 255.255.255.0