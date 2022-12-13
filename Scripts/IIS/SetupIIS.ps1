powershell

# TODO: default app pool stoppen, default app stoppen, index.html aanmaken, inhoud wijzigen met Set-Content, bindings aanmaken, 

#Pool directory aanmaken
New-Item C:\inetpub\yorbenPool -ItemType Directory
#Pool index.html aanmaken
New-Item C:\inetpub\yorbenPool\index.html
Set-Content -Path "C:\inetpub\yorbenPool\index.html" -Value "
<!DOCTYPE html>
<html>
    <head>
        <title>Basic Web Page</title>
    </head>
    <body>
Hello World!
    </body>
</html>
"
Stop-WebAppPool -Name "DefaultAppPool"
New-IISSite -Name 'siteYorben' -PhysicalPath 'C:\inetpub\yorbenPool' -BindingInformation "*:443:"