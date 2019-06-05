$ca = Get-SPWebApplication -IncludeCentralAdministration | ?{$_.IsAdministrationWebApplication -eq $true} $senderAddr = "sharepoint@cobaltatom.com" 
$replyAddr = "sharepoint@cobaltatom.com"  
$smtpServer = "mail.cobaltatom.com" 
$ca.UpdateMailsettings($smtpServer, $senderAddr, $replyAddr, 65001, $true, 587) 

$email = "recipient@cobaltatom.com" 
$subject = "Email through SharePoint OM" 
$body = "Message body." 

$site = Get-SPSite http://centralAdministrationUrl 
$web = $site.OpenWeb() 
[Microsoft.SharePoint.Utilities.SPUtility]::SendEmail($web,0,0,$email,$subject,$body) 

Send-MailMessage -To "recipient@cobaltatom.com" -From "sharepoint@cobaltatom.com" -Subject "Testing Smtp Mail" -Body "Message Body" -SmtpServer "mail.cobaltatom.com" -UseSsl -Port 587 