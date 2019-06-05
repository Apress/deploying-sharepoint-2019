$sa = New-SPEnterpriseSearchServiceApplication -Name "Cloud Search Service Application" -DatabaseName "CloudSearchDB" -ApplicationPool "SharePoint Web Services Default" -AdminApplicationPool "SharePoint Web Services Default" -CloudIndex $true
New-SPEnterpriseSearchServiceApplicationProxy -Name "Cloud Search Service Application Proxy" -SearchApplication $sa
$sa = Get-SPEnterpriseSearchServiceApplication
$si = Get-SPEnterpriseSearchServiceInstance | ?{$_.Server -match "CALSP03"}
Start-SPEnterpriseSearchServiceInstance -Identity $si
$clone = $sa.ActiveTopology.Clone()
New-SPEnterpriseSearchAdminComponent -SearchTopology $clone -SearchServiceInstance $si
New-SPEnterpriseSearchContentProcessingComponent -SearchTopology $clone -SearchServiceInstance $si
New-SPEnterpriseSearchAnalyticsProcessingComponent -SearchTopology $clone -SearchServiceInstance $si
New-SPEnterpriseSearchCrawlComponent -SearchTopology $clone -SearchServiceInstance $si
New-SPEnterpriseSearchIndexComponent -SearchTopology $clone -SearchServiceInstance $si -IndexPartition 0
New-SPEnterpriseSearchQueryProcessingComponent -SearchTopology $clone -SearchServiceInstance $si
$si2 = Get-SPEnterpriseSearchServiceInstance | ?{$_.Server -match "CALSP04"}
New-SPEnterpriseSearchAdminComponent -SearchTopology $clone -SearchServiceInstance $si2
New-SPEnterpriseSearchAnalyticsProcessingComponent -SearchTopology $clone -SearchServiceInstance $si2
New-SPEnterpriseSearchContentProcessingComponent -SearchTopology $clone -SearchServiceInstance $si2
New-SPEnterpriseSearchCrawlComponent -SearchTopology $clone -SearchServiceInstance $si2
New-SPEnterpriseSearchIndexComponent -SearchTopology $clone -SearchServiceInstance $si2 -IndexPartition 0
New-SPEnterpriseSearchQueryProcessingComponent -SearchTopology $clone -SearchServiceInstance $si2
$clone.Activate()

