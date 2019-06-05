New-SPConfigurationDatabase -DatabaseName Configuration -AdministrationContentDatabaseName Administration -DatabaseServer caspag.lab.cobaltatom.com -Passphrase (ConvertTo-SecureString “FarmPassphrase1” -AsPlainText -Force) -FarmCredentials (Get-Credential) -LocalServerRole ApplicationWithSearch

Setspn -S HTTP/cal.lab.cobaltatom.com LAB\s-farm 
New-SPCentralAdministration -Port 443 -WindowsAuthProvider Kerberos -SecureSocketsLayer:$true 

Set-SPAlternateUrl -Identity https://calsp03 -Url https://cal.lab.cobaltatom.com
Remove-SPAlternateUrl -Identity https://calsp03 

Initialize-SPResourceSecurity 
Install-SPFeature -AllExistingFeatures 
Install-SPService