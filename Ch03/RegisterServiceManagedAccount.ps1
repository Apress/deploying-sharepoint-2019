$cred = Get-Credential -UserName "LAB\s-svc" -Message "Managed Account" 
New-SPManagedAccount -Credential $cred 