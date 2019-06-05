Connect-SPConfigurationDatabase -DatabaseName Configuration -DatabaseServer caspag.lab.cobaltatom.com -Passphrase (ConvertTo-SecureString "FarmPassphrase1" -AsPlainText -Force) -LocalServerRole WebFrontEndWithDistributedCache 
Initialize-SPResourceSecurity 
Install-SPService 
Install-SPFeature -AllExistingFeatures 
Install-SPApplicationContent 

Start-Service SPTimerV4 