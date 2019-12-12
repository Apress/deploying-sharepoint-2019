$sa = New-SPEnterpriseSearchServiceApplication -Name "Cloud Search Service Application" -DatabaseName "CloudSearchDB" -ApplicationPool "SharePoint Web Services Default" -AdminApplicationPool "SharePoint Web Services Default" -CloudIndex $true
New-SPEnterpriseSearchServiceApplicationProxy -Name "Cloud Search Service Application Proxy" -SearchApplication $sa

