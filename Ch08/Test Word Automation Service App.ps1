Add-Type -Path 'C:\Windows\Microsoft.NET\assembly\GAC_MSIL\Microsoft.Office.Word.Server\v4.0_16.0.0.0__71e9bce111e9429c\Microsoft.Office.Word.Server.dll'
$jobSettings = New-Object Microsoft.Office.Word.Server.Conversions.ConversionJobSettings
$jobSettings.OutputFormat = "PDF"
$job = New-Object Microsoft.Office.Word.Server.Conversions.ConversionJob("Word Automation", $jobSettings)
$job.UserToken = (Get-SPWeb https://sp.cobaltatom.com).CurrentUser.UserToken
$job.AddFile("https://sp.cobaltatom.com/Shared%20Documents/Document1.docx", "https://sp.cobaltatom.com/Shared%20Documents/Document1-Final.pdf")
$job.Start()
Start-SPTimerJob  "Word Automation"
