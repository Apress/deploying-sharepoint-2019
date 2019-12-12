New-SPSiteMaster -ContentDatabase WSS_Content_Intranet_2 -Template SITEPAGEPUBLISHING#0

New-SPSite -url "https://intranet.cobaltatom.com/sites/CommmSite" -Name "Communication Site" -OwnerAlias "LAB\vlad.catrinescu" -Template "SITEPAGEPUBLISHING#0" -ContentDatabase WSS_Content_Intranet_2 -CreateFromSiteMaster