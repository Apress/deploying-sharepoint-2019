#Run on first Search Server
$sa = New-SPEnterpriseSearchServiceApplication -Name "Search Service Application" -DatabaseName "Search" -ApplicationPool "SharePoint Web Services Default" -AdminApplicationPool "SharePoint Web Services Default" 
New-SPEnterpriseSearchServiceApplicationProxy -Name "Search Service Application" -SearchApplication $sa 
$si = Get-SPEnterpriseSearchServiceInstance -Local 
$clone = $sa.ActiveTopology.Clone() 
New-SPEnterpriseSearchAdminComponent -SearchTopology $clone -SearchServiceInstance $si 
New-SPEnterpriseSearchContentProcessingComponent -SearchTopology $clone -SearchServiceInstance $si 
New-SPEnterpriseSearchAnalyticsProcessingComponent -SearchTopology $clone -SearchServiceInstance $si 
New-SPEnterpriseSearchCrawlComponent -SearchTopology $clone -SearchServiceInstance $si 
New-SPEnterpriseSearchIndexComponent -SearchTopology $clone -SearchServiceInstance $si -IndexPartition 0 -RootDirectory F:\SearchIndex\0 
New-SPEnterpriseSearchQueryProcessingComponent -SearchTopology $clone -SearchServiceInstance $si 

$si2 = Get-SPEnterpriseSearchServiceInstance | ?{$_.Server -match "CALSP02"} 
New-SPEnterpriseSearchAdminComponent -SearchTopology $clone -SearchServiceInstance $si2 
New-SPEnterpriseSearchAnalyticsProcessingComponent -SearchTopology $clone -SearchServiceInstance $si2 
New-SPEnterpriseSearchContentProcessingComponent -SearchTopology $clone -SearchServiceInstance $si2 
New-SPEnterpriseSearchCrawlComponent -SearchTopology $clone -SearchServiceInstance $si2 
New-SPEnterpriseSearchIndexComponent -SearchTopology $clone -SearchServiceInstance $si2 -IndexPartition 0 -RootDirectory F:\SearchIndex\0 
New-SPEnterpriseSearchQueryProcessingComponent -SearchTopology $clone -SearchServiceInstance $si2 
$clone.Activate() 

#Run on secondary Search Server
$si = Get-SPEnterpriseSearchServiceInstance -Local 
$sa = Get-SPEnterpriseSearchServiceApplication 
$active = Get-SPEnterpriseSearchTopology -SearchApplication $sa -Active 
$clone = New-SPEnterpriseSearchTopology -SearchApplication $sa -Clone -SearchTopology $active 
New-SPEnterpriseSearchIndexComponent -SearchTopology $clone -SearchServiceInstance $si -IndexPartition 1 -RootDirectory F:\SearchIndex\1 
$si2 = Get-SPEnterpriseSearchServiceInstance | ?{$_.Server -match "CALSP02"} 
New-SPEnterpriseSearchIndexComponent -SearchTopology $clone -SearchServiceInstance $si2 -IndexPartition 1 -RootDirectory F:\SearchIndex\1 
$clone.Activate() 

#Run on first Search Server
$sa = Get-SPEnterpriseSearchServiceApplication 
foreach($topo in (Get-SPEnterpriseSearchTopology -SearchApplication $sa | ?{$_.State -eq "Inactive"})){Remove-SPEnterpriseSearchTopology -Identity $topo -Confirm:$false} 
$sa = Get-SPEnterpriseSearchServiceApplication 
$content = New-Object Microsoft.Office.Server.Search.Administration.Content($sa) 
$content.SetDefaultGatheringAccount("LAB\s-crawl", (ConvertTo-SecureString "<Password>" -AsPlainText -Force)) 

$source = Get-SPEnterpriseSearchCrawlContentSource -SearchApplication $sa -Identity "Local SharePoint sites" 
Set-SPEnterpriseSearchCrawlContentSource -Identity $source -ScheduleType Full -WeeklyCrawlSchedule -CrawlScheduleRunEveryInterval 1 -CrawlScheduleDaysOfWeek "Sunday" -CrawlScheduleStartDateTime "03:00 AM" 
$source.EnableContinuousCrawls = $true 
$source.Update() 

$source = Get-SPEnterpriseSearchCrawlContentSource -SearchApplication $sa -Identity "Local SharePoint sites" 
$source.StartFullCrawl()