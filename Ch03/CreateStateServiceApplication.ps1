$db = New-SPStateServiceDatabase -Name "StateService" 
$sa = New-SPStateServiceApplication -Name "State Service" -Database $db 
New-SPStateServiceApplicationProxy -Name "State Service" -ServiceApplication $sa -DefaultProxyGroup 