$Template = New-Object Microsoft.SharePoint.Administration.SPQuotaTemplate
$Template.Name = "Silver Team Site"
$Template.StorageMaximumLevel = 1073741824
$Template.StorageWarningLevel = 786432000
$ContentService = [Microsoft.SharePoint.Administration.SPWebService]::ContentService
$ContentService.QuotaTemplates.Add($Template)
$ContentService.Update()
