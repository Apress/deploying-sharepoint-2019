#Disable PCT 1.0 
ni "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\" -Name "PCT 1.0" -Value "DefaultValue" -Force 
ni "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\PCT 1.0\" -Name "Server" -Value "DefaultValue" -Force 
New-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\PCT 1.0\Server\" -Name Enabled -Value 0 -PropertyType "DWord" -Force 

#Disable SSL 2.0 
ni "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\" -Name "SSL 2.0" -Value "DefaultValue" -Force 
ni "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\" -Name "Server" -Value "DefaultValue" -Force 
New-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server\" -Name Enabled -Value 0 -PropertyType "DWord" -Force 

#Disable SSL 3.0 
ni "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\" -Name "SSL 3.0" -Value "DefaultValue" -Force 
ni "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\" -Name "Server" -Value "DefaultValue" -Force 
New-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Server\" -Name Enabled -Value 0 -PropertyType "DWord" -Force 

#Disable TLS 1.0 
ni "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\" -Name "TLS 1.0" -Value "DefaultValue" -Force 
ni "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\" -Name "Server" -Value "DefaultValue" -Force 
New-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server\" -Name Enabled -Value 0 -PropertyType "DWord" -Force 

#Disable TLS 1.1 
ni "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\" -Name "TLS 1.1" -Value "DefaultValue"  -Force 
ni "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\" -Name "Server" -Value "DefaultValue"  -Force 
New-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server\" -Name Enabled -Value 0 -PropertyType "DWord" -Force 