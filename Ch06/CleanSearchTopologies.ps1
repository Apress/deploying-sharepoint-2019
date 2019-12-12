foreach($topo in (Get-SPEnterpriseSearchTopology -SearchApplication $sa |
?{$_.State -eq "Inactive"}))
{
Remove-SPEnterpriseSearchTopology -Identity $topo -Confirm:$false
}
