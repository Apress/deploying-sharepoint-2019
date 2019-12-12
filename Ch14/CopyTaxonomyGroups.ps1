Copy-SPTaxonomyGroups `
-LocalTermStoreName "Managed Metadata Service Proxy" `
-LocalSiteUrl "https://sp.cobaltatom.com" `
-RemoteSiteUrl "https://cobaltatom.sharepoint.com" `
-GroupNames "Engineering","Marketing" `
-Credential $cred
