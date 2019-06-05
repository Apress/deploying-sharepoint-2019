Connect-SPConfigurationDatabase -DatabaseName Configuration -DatabaseServer calspag.lab.cobaltatom.com -Passphrase (ConvertTo-SecureString "FarmPassphrase1" -AsPlainText -Force) -LocalServerRole ApplicationWithSearch
Initialize-SPResourceSecurity 
Install-SPService 
Install-SPFeature -AllExistingFeatures 
Install-SPApplicationContent 

Start-Service SPTimerV4 