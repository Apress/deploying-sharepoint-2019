$ErrorActionPreference = "Stop"
$ra = ConvertTo-SecureString "gtBeaBNgzwuf3d9u}qkr/Wvkdi(sc9fE" -AsPlainText -Force
$mgUsers = 's-wfm@LAB','trevor.seward@LAB', 'vlad.catrinescu@LAB'
$baseConnectionString = 
'Data Source=caspag.lab.cobaltatom.com;Integrated Security=True;Encrypt=False;Initial Catalog='
$sbConnString = $baseConnectionString + 'SbManagementDB;'
$wfConnString = $baseConnectionString + 'WFManagementDB;'

Add-Type -Path "C:\Program Files\Workflow Manager\1.0\Workflow\Artifacts\Microsoft.ServiceBus.dll"

Write-Host "Adding host to Service Bus Farm..."
Add-SBHost -SBFarmDBConnectionString $sbConnString -RunAsPassword $ra -EnableFirewallRules $true -Verbose

$ErrorActionPreference = "Continue"

try 
{ 
    $SBClientConfiguration = Get-SBClientConfiguration -Namespaces 'WorkflowDefaultNamespace' -Verbose
} 
Catch [system.InvalidOperationException] {}

Write-Host -ForegroundColor Yellow "Adding host to Workflow Manager Farm..." 

Add-WFHost -WFFarmDBConnectionString $wfConnString -RunAsPassword $ra -EnableFirewallRules $true `
    -SBClientConfiguration $SBClientConfiguration -Verbose
Write-Host -ForegroundColor Green "Completed." 
$ErrorActionPreference = "Continue" 