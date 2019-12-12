$sa = Get-SPEnterpriseSearchServiceApplication
$content = New-Object Microsoft.Office.Server.Search.Administration.Content($sa)
$content.SetDefaultGatheringAccount("LAB\s-crawl", (ConvertTo-SecureString "<Password>" -AsPlainText -Force))
