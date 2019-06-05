$ErrorActionPreference = "Stop"
$ra = ConvertTo-SecureString "gtBeaBNgzwuf3d9u}qkr/Wvkdi(sc9fE" -AsPlainText -Force
$certThumbprint = '8E6DC4D0A2DEA825EA49AF2C3BEA5ABE46AEC432'
$admins = 'BUILTIN\Administrators'
$svcAcct = 's-wfm@LAB'
$mgUsers = 's-wfm@LAB','trevor.seward@LAB','vlad.catrinescu@LAB'
$baseConnectionString = 'Data Source=caspag.lab.cobaltatom.com;Integrated Security=True;Encrypt=False;Initial Catalog='
$sbConnString = $baseConnectionString + 'SbManagementDB;'
$sbGateConnString = $baseConnectionString + 'SbGatewayDatabase;'
$sbMsgConnString = $baseConnectionString + 'SBMessageContainer01;'
$wfConnString = $baseConnectionString + 'WFManagementDB;'
$wfInstConnString = $baseConnectionString + 'WFInstanceManagementDB;'
$wfResConnString = $baseConnectionString + 'WFResourceManagementDB;'

Add-Type -Path "C:\Program Files\Workflow Manager\1.0\Workflow\Artifacts\Microsoft.ServiceBus.dll"

Write-Host "Creating Service Bus farm..."
New-SBFarm -SBFarmDBConnectionString $sbConnString `
    -InternalPortRangeStart 9000 -TcpPort 9354 -MessageBrokerPort 9356 -RunAsAccount $svcAcct -AdminGroup $admins `
    -GatewayDBConnectionString $sbGateConnString -FarmCertificateThumbprint $certThumbprint `
    -EncryptionCertificateThumbprint $certThumbprint -MessageContainerDBConnectionString $sbMsgConnString

Write-Host "Creating Workflow Manager farm..."

New-WFFarm -WFFarmDBConnectionString $wfConnString `
    -RunAsAccount $svcAcct -AdminGroup $admins -HttpsPort 12290 -HttpPort 12291 `
        -InstanceDBConnectionString $wfInstConnString `
    -ResourceDBConnectionString $wfResConnString -OutboundCertificateThumbprint $certThumbprint `
        -SslCertificateThumbprint $certThumbprint `
    -EncryptionCertificateThumbprint $certThumbprint

Write-Host "Adding host to Service Bus farm..."
Add-SBHost -SBFarmDBConnectionString $sbConnString -RunAsPassword $ra -EnableFirewallRules $true

Try
{
    New-SBNamespace -Name 'WorkflowDefaultNamespace' -AddressingScheme 'Path' -ManageUsers $mgUsers
    Start-Sleep -s 90
}
Catch [system.InvalidOperationException] {}

$SBClientConfiguration = Get-SBClientConfiguration -Namespaces 'WorkflowDefaultNamespace'

Write-Host "Adding host to Workflow Manager Farm..."
Add-WFHost -WFFarmDBConnectionString $wfConnString -RunAsPassword $ra -EnableFirewallRules $true `
    -SBClientConfiguration $SBClientConfiguration
Write-Host "Completed."
$ErrorActionPreference = "Continue"