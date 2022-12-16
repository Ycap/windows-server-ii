#Pool directory aanmaken
New-Item C:\inetpub\yorbenPool -ItemType Directory
#Pool index.html aanmaken
New-Item C:\inetpub\yorbenPool\index.html
Set-Content -Path "C:\inetpub\yorbenPool\index.html" -Value "
<!DOCTYPE html>
<html>
    <head>
        <title>Testpagina Windows Server 2022 EP1</title>
    </head>
    <body>
Hello World!
    </body>
</html>
"
Stop-WebAppPool -Name "DefaultAppPool"
Stop-IISSite -Name "Default Web Site"
New-IISSite -Name 'siteYorben' -PhysicalPath 'C:\inetpub\yorbenPool' -BindingInformation "192.168.22.2:80:"
New-WebAppPool -Name "PoolYorben" 
Set-ItemProperty IIS:\Sites\siteYorben -Name applicationpool -Value PoolYorben
Start-WebAppPool -Name "PoolYorben"
Start-IISSite -Name 'siteYorben'
