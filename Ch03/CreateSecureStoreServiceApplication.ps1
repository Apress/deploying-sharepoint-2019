$sa = New-SPSecureStoreServiceApplication -Name "Secure Store Service Application" -ApplicationPool "SharePoint Web Services Default" -AuditingEnabled:$true -AuditlogMaxSize 7 -DatabaseName "SecureStore" 
New-SPSecureStoreServiceApplicationProxy -Name "Secure Store Service Application" -ServiceApplication $sa 
$proxy = Get-SPServiceApplicationProxy | ?{$_.TypeName -eq "Secure Store Service Application Proxy"} 
Update-SPSecureStoreMasterKey -ServiceApplicationProxy $proxy -Passphrase "SecureStorePassphrase1!" 
Start-Sleep 15 
Update-SPSecureStoreApplicationServerKey -ServiceApplicationProxy $proxy -Passphrase "SecurestorePassphrase1!" 