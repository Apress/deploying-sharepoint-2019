$w = Get-SPWebApplication https://intranet.cobaltatom.com/
$policy = $w.Policies.Add("i:0#.w|LAB\s-su", "Portal Super User")
$policyRole = $w.PolicyRoles.GetSpecialRole([Microsoft.SharePoint.Administration.SPPolicyRoleType]::FullControl)
$policy.PolicyRoleBindings.Add($policyRole)
$policy = $w.Policies.Add("i:0#.w|LAB\s-sr", "Portal Super Reader")
$policyRole = $w.PolicyRoles.GetSpecialRole([Microsoft.SharePoint.Administration.SPPolicyRoleType]::FullRead)
$policy.PolicyRoleBindings.Add($policyRole)
$w.Update()
