# Creating Order of the Sith Lords
New-ADOrganizationalUnit -Name "Siths" -Path "DC=ws2-2223-yorben,DC=hogent"
# Creating Order of the Jedi Knights
New-ADOrganizationalUnit -Name "Jedis" -Path "DC=ws2-2223-yorben,DC=hogent"

#Adding Siths to Order of the Sith Lords
New-ADUser -Name "Darth Vader" -GivenName "Darth" -Surname "Vader" -Path "OU=Siths,DC=ws2-2223-yorben,DC=hogent" -SamAccountName "dvader" -Title "Sith" -AccountPassword(ConvertTo-SecureString "P@ssw0rd" -AsPlainText -force) -Enabled $true
New-ADUser -Name "Darth Sidious" -GivenName "Darth" -Surname "Sidious" -Path "OU=Siths,DC=ws2-2223-yorben,DC=hogent" -SamAccountName "dsidious" -Title "Sith" -AccountPassword(ConvertTo-SecureString "P@ssw0rd" -AsPlainText -force) -Enabled $true
New-ADUser -Name "Darth Bane" -GivenName "Darth" -Surname "Bane" -Path "OU=Siths,DC=ws2-2223-yorben,DC=hogent" -SamAccountName "dbane" -Title "Sith" -AccountPassword(ConvertTo-SecureString "P@ssw0rd" -AsPlainText -force) -Enabled $true

#Adding Jedis to Order of the Jedi Knights
New-ADUser -Name "Obi-Wan Kenobi" -GivenName "Obi-Wan" -Surname "Kenobi" -SamAccountName "okenobi" -Path "OU=Jedis,DC=ws2-2223-yorben,DC=hogent" -Title "Jedi" -AccountPassword(ConvertTo-SecureString "P@ssw0rd" -AsPlainText -force) -Enabled $true
New-ADUser -Name "Luke Skywalker" -GivenName "Luke" -Surname "Skywalker" -SamAccountName "lskywalker" -Path "OU=Jedis,DC=ws2-2223-yorben,DC=hogent" -Title "Jedi" -AccountPassword(ConvertTo-SecureString "P@ssw0rd" -AsPlainText -force) -Enabled $true
New-ADUser -Name "Mace Windu" -GivenName "Mace" -Surname "Windu" -SamAccountName "mwindu" -Path "OU=Jedis,DC=ws2-2223-yorben,DC=hogent" -Title "Jedi" -AccountPassword(ConvertTo-SecureString "P@ssw0rd" -AsPlainText -force) -Enabled $true