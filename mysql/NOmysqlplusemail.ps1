$EmailFrom = “NotiseBD@modis.ru”
$EmailTo = “3010@modis.ru”
$Subject = “The subject of your email”
$Body = “What do you want your email to say”
$SMTPServer = “co-exch”
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential(“usr”, “pass”);
$SMTPClient.Send($EmailFrom, $EmailTo, $Subject, $Body)
$MySQLClient = "mysqluc.exe"
$MySQLServer = "192.168.7.128"
$MySQLLogin = "root"
$MySQLPassword = "123"

$MySQLClient -u $MySQLLogin -p $MySQLPassword 



