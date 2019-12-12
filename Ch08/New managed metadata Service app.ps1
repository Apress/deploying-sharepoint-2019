$sa = New-SPMetadataServiceApplication -Name "Managed Metadata Service" -DatabaseName "MMS" -ApplicationPool "SharePoint Web Services Default" -SyndicationErrorReportEnabled

New-SPMetadataServiceApplicationProxy -Name "Managed Metadata Service Proxy" -ServiceApplication $sa -DefaultProxyGroup -ContentTypePushdownEnabled -DefaultKeywordTaxonomy -DefaultSiteCollectionTaxonomy