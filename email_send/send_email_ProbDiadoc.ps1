$emailFrom = "noreply_diadoc@modis.ru"
$emailTo = "a.khokhlov@modis.ru"
$subj = "ERROR diadoc"
$body = "on $env:COMPUTERNAME problem with task DIADOC"
#$file = "c:\file.txt"
$smtpServer = "dc-exch03.domain.local"
#$att  = new-object Net.Mail.Attachment($file)
$smtp = new-object Net.Mail.SmtpClient($smtpServer)
$msg  = new-object Net.Mail.MailMessage

$msg.From = $emailFrom
$msg.To.Add($emailTo)
$msg.Subject = $subj
$msg.Body = $body
#$msg.Attachments.Add($att)

$smtp.Send($msg)
#$att.Dispose()