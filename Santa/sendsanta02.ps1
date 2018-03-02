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
$imgs =  @{image1 = 'G:\!TEMP\img.jpg' }

$encoding = [System.Text.Encoding]::unicode
$smtp = "dc-exch03.domain.local"

$from = "Khokhlov Artem <a.khokhlov@modis.ru>"

$subject = "Возможность стать тайным Дедом Морозом." 

#### Now send the email using \> Send-MailMessage 

$i = "a.khokhlov@modis.ru"

#$users = Import-Csv "G:\Study\Santa\Сотрудники офиса.csv"
$users = Import-Csv "G:\Study\Santa\123456.csv" -Encoding UTF8
ForEach ($user in $users)
{

$Santa = $user.Santa
$SantaName = $user.extensionAttribute2
$Chield = $user.Chield
$ChieldName = $user.extensionAttribute2C + " " + $user.extensionAttribute1C

$to = $Santa

$body = @' 
    <img width=684 height=427 src="cid:image1" align=left>
'@

#<img width=684 height=427 src="cid:cid:image1" align=left hspace=12 v:shapes="_x0000_s1026">

$body += "<span style='font-size:14.0pt;font-family:AvantGardeCTT;color:#002060'><center> $SantaName!</center></span><o:p></o:p></p><p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;text-indent:35.4pt'><span style='font-size:14.0pt;font-family:AvantGardeCTT;color:#002060'>Вам выпала возможность стать тайным Дедом Морозом и поздравить коллегу с наступающим Новым Годом!</span><span style='font-size:16.0pt;font-family:Wingdings;color:#002060'>J</span><o:p></o:p></p><p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;text-indent:35.4pt'><span style='font-size:14.0pt;font-family:AvantGardeCTT;color:#002060'>Ваш коллега: <b>$ChieldName</b></span><o:p></o:p></p><p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;text-indent:34.8pt'><span style='font-size:14.0pt;font-family:AvantGardeCTT;color:#002060'>Вы можете:</span><o:p></o:p></p><p class=MsoListParagraph style='text-indent:34.8pt'><span style='font-size:15.0pt;font-family:Wingdings;color:#002060'>J</span><span style='font-size:14.0pt;font-family:AvantGardeCTT;color:#002060'> тайно поинтересоваться, что любит или чем увлекается ваш коллега, и подарок будет более праздничным и желанным.</span><o:p></o:p></p><p class=MsoListParagraph style='text-indent:34.8pt'><span style='font-size:15.0pt;font-family:Wingdings;color:#002060'>J</span><span style='font-size:14.0pt;font-family:AvantGardeCTT;color:#002060'> не раскрывать себя или, наоборот, подписать свое имя - тогда будет вдвойне приятней получить поздравление именно от вас!</span><o:p></o:p></p><p class=MsoListParagraph style='text-indent:34.8pt'><span style='font-size:14.0pt;font-family:AvantGardeCTT;color:#002060'>Ваш подарок принесет <b>настоящий Дед Мороз</b>, который заедет к нам в офис 22 декабря!</span><o:p></o:p></p><p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;margin-left:36.0pt;text-indent:34.8pt'><span style='font-size:14.0pt;font-family:AvantGardeCTT;color:#002060'>Для этого обязательно подпишите подарок: </span><o:p></o:p></p><p class=MsoListParagraph style='margin-left:142.2pt;text-indent:34.8pt'><span style='font-size:15.0pt;font-family:Wingdings;color:#002060'>J</span><span style='font-size:14.0pt;font-family:AvantGardeCTT;color:#002060'> Имя и фамилия коллеги </span><o:p></o:p></p><p class=MsoListParagraph style='text-indent:34.8pt'><span style='font-size:15.0pt;font-family:Wingdings;color:#002060'>J</span><span style='font-size:14.0pt;font-family:AvantGardeCTT;color:#002060'> Департамент, в котором он работа</span><span style='font-size:15.0pt;font-family:AvantGardeCTT;color:#002060'>ет</span><o:p></o:p></p><p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;text-indent:34.8pt'><span style='font-size:15.0pt;font-family:AvantGardeCTT;color:#002060'>До встречи с Дедом Морозом! </span><span style='font-size:15.0pt;font-family:Wingdings;color:#002060'>J</span><o:p></o:p></p>"
  

$params = @{ 
    InlineAttachments = $imgs 
    Body = $body 
    BodyAsHtml = $true 
    Subject = $subject
    From = "Santa@modis.ru" 
    To = $Santa 
    bcc = "3010@modis.ru" 
    #To = "3010@modis.ru" 
    SmtpServer = $smtp 
    } 
#send-MailMessage -SmtpServer $smtp -To "3010@modis.ru" -From "Santa@modis.ru" -Subject $subject -Body $body -BodyAsHtml -Encoding $encoding -InlineAttachments $imgs
Send-MailMessage @params

Echo From $SantaName $user.extensionAttribute1 to $ChieldName sent
}
########### End of Script################
