﻿$Santa
$Chield

##############  Script start Here ##########
# $smtp variable contain the name/ip of your email server ##
# $to contain the email id whom you want to send email ###
# $from contain email of sender ###
# $Subject contain subject of the email. 
# In Body we are defining some HTML coding in to our email message body
# <b> means BOLD 
#<br> means Break go to next Line
#<a href> provide a link to the text
# <font color=red> , give the color to the font 

$smtp = "dc-exch03.domain.local"

$to = "Khokhlov Artem <a.khokhlov@modis.ru>"

$from = "Khokhlov Artem <a.khokhlov@modis.ru>"

$subject = "This is a Test of HTML Email" 

$body = "Dear <b><font color=red>$to</b></font> <br>"

$body += "We are testing <b>HTML</b> email <br>"

$body += "Click <a href=http://www.google.com>here</a> to open google <br>"

#### Now send the email using \> Send-MailMessage 

send-MailMessage -SmtpServer $smtp -To $to -From $from -Subject $subject -Body $body -BodyAsHtml -Priority high

########### End of Script################
