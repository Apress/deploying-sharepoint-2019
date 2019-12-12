$sa = New-SPEnterpriseSearchServiceApplication -Name "Search Service Application 1" -DatabaseName "SearchDB" -ApplicationPool "SharePoint Web Services Default" -AdminApplicationPool "SharePoint Web Services Default"
New-SPEnterpriseSearchServiceApplicationProxy -Name "Search Service Application Proxy" -SearchApplication $sa
