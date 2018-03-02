telephoneNumber
OfficePhone
MobilePhone
homephone
mobile
$atribute = "homephone"
get-aduser -filter * -SearchBase "OU=Fired,DC=domain,DC=local" -Properties * | where $atribute -ne $null | ft name,$atribute
get-aduser -filter * -SearchBase "OU=Office_dekret,OU=Fashion3000,DC=domain,DC=local" -Properties * | where $atribute -ne $null | ft name,$atribute

get-aduser -filter * -properties mobile -SearchBase "OU=Office_dekret,OU=Fashion3000,DC=domain,DC=local" | where mobile -ne $null |set-aduser -Manager $null | ft name,manager

get-aduser -filter * -properties $atribute -SearchBase "OU=Fired,DC=domain,DC=local" | where $atribute -ne $null | set-aduser -manager $null -MobilePhone $null -HomePhone $null -OfficePhone $null  | ft name,$atribute
get-aduser -filter * -properties $atribute -SearchBase "OU=Office_dekret,OU=Fashion3000,DC=domain,DC=local" | where $atribute -ne $null | set-aduser -manager $null -MobilePhone $null -HomePhone $null -OfficePhone $null  | ft name,$atribute
#get-aduser -filter * -SearchBase "OU=Fired,DC=domain,DC=local" -Properties * | ft name,manager| Export-Csv -Path g:\study\ad\out.csv -Encoding unicode -NoTypeInformation


#set-aduser s.grankin -manager  $null




get-aduser -filter * -SearchBase "OU=Fired,DC=domain,DC=local" -Properties * | where $atribute -ne $null | ft name,$atribute
get-aduser -filter * -SearchBase "OU=Office_dekret,OU=Fashion3000,DC=domain,DC=local" -Properties * | where $atribute -ne $null | ft name,$atribute