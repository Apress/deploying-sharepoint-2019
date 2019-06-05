Update-SPDistributedCacheSize -CacheSizeInMB 3096 

$acct = Get-SPManagedAccount "LAB\s-svc" 
$farm = Get-SPFarm 
$svc = $farm.Services | ?{$_.TypeName -eq "Distributed Cache"} 
$svc.ProcessIdentity.CurrentIdentityType = "SpecificUser" 
$svc.ProcessIdentity.ManagedAccount = $acct 
$svc.ProcessIdentity.Update() 
$svc.ProcessIdentity.Deploy() 

Stop-SPDistributedCacheServiceInstance 
Remove-SPDistributedCacheServiceInstance 
Add-SPDistributedCacheServiceInstance 
