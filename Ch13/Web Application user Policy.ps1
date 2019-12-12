$w = Get-SPWebApplication https://intranet.cobaltatom.com/
$policy = $w.Policies.Add("i:0#.w|LAB\vlad.catrinescu", "SharePoint Admin")
$policyRole = $w.PolicyRoles.GetSpecialRole([Microsoft.SharePoint.Administration.SPPolicyRoleType]::FullControl)
$policy.PolicyRoleBindings.Add($policyRole)
$w.Update()
