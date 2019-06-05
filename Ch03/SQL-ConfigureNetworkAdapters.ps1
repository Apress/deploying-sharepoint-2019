$adapter = Get-NetAdapter "Ethernet 2"
$adapter | Set-NetIPInterface -Dhcp Disabled
$adapter | New-NetIPAddress -AddressFamily IPv4 -IPAddress 172.16.0.20 -PrefixLength 16 -Type Unicast -DefaultGateway 172.16.0.1
Set-DnsClientServerAddress -InterfaceAlias $adapter.Name -ServerAddresses 172.16.0.10
Rename-NetAdapter -Name "Ethernet 2" -NewName "Intranet"
$adapter = Get-NetAdapter "Ethernet"
$adapter | Set-NetIPAddress -Dhcp Disabled
$adapter | New-NetIPAddress -AddressFamily IPv4 -IPAddress 192.168.5.1 -PrefixLength 24 -Type Unicast
Rename-NetAdapter -Name "Ethernet" -NewName "Heartbeat"
Set-DnsClient -RegisterThisConnectionsAddress $false -InterfaceAlias “Heartbeat”
