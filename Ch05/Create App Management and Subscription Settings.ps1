$apppool = Get-SPServiceApplicationPool "SharePoint Web Services Default"
$SubscriptionSA = New-SPSubscriptionSettingsServiceApplication –ApplicationPool $apppool –Name "Subscription Settings" –DatabaseName SubscriptionSettings
$proxySub = New-SPSubscriptionSettingsServiceApplicationProxy –ServiceApplication $SubscriptionSA
$AppManagementSA = New-SPAppManagementServiceApplication -ApplicationPool $apppool -Name "App Management" -DatabaseName AppManagement
$proxyApp = New-SPAppManagementServiceApplicationProxy -ServiceApplication $AppManagementSA
