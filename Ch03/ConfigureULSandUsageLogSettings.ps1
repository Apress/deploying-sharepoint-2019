Set-SPDiagnosticConfig -DaysToKeepLogs 7 -LogDiskSpaceUsageGB 150 -LogMaxDiskSpaceUsageEnabled:$true -LogLocation E:\ULS 

Set-SPUsageService -UsageLogLocation E:\ULS 