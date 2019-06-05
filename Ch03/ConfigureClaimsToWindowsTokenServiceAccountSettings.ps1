Setspn.exe -S C2WTS/Dummy LAB\s-c2wts 

$account = Get-SPManagedAccount "LAB\s-c2wts" 

$farm = Get-SPFarm 
$svc = $farm.Services | ?{$_.TypeName -eq "Claims to Windows Token Service"} 
$svcIdentity = $svc.ProcessIdentity 
$svcIdentity.CurrentIdentityType = [Microsoft.SharePoint.Administration.IdentityType]::SpecificUser 
$svcIdentity.UserName = $account.Username 
$svcIdentity.Update() 
$svcIdentity.Deploy()  