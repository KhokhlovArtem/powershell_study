$users = "Dmitrieva Edita",
"Bychkova Evgeniya",
"Zinkovskaya Anna ",
"Kotova Elena ",
"Karlieva Leila ",
"Kravtsova Anastasiya ",
"Starostin Konstantin ",
"Artuganova Valentina ",
"Fedorova Kiunnei ",
"Ivanovskii Stanislav ",
"Lebedinskii Oleg ",
"Shcherbina Vladimir",
"Nemaev Vladimir",
"Gogoleva Viktoriya ",
"Shcherbakova Albina",
"Kukhareva Darya",
"Gudilov Roman",
"Kucherenko Yana",
"Grishanova Svetlana"
$list = New-Object System.Collections.ArrayList

$user = get-aduser -filter * -SearchBase "OU=temp,OU=MODI,OU=Office,OU=Fashion3000,DC=domain,DC=local" | Set-ADAccountPassword -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "PAssw0rd1" –Force)
foreach ($user in $users)
{
$item = get-aduser -filter {displayname -eq $user}
Set-ADAccountPassword $user -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "PAssw0rd1" –Force)
$item | ft GivenName
$list.Add($item)
}

get-aduser -filter {displayname -eq $user}