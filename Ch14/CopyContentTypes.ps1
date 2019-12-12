Copy-SPContentTypes `
-LocalSiteUrl https://sp.cobaltatom.com/sites/ContentTypeHub `
-LocalTermStoreName "Managed Metadata Service Proxy" `
-RemoteSiteUrl https://cobaltatom.sharepoint.com/ ` 
-ContentTypeNames @("Customers", "Doctors") ` 
-Credential $cred 
