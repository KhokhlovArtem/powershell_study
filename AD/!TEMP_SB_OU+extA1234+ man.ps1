get-aduser -filter * -SearchBase "OU=Office,OU=Fashion3000,DC=domain,DC=local" -Properties * | ft name,manager,extensionAttribute1,extensionAttribute2,extensionAttribute3,extensionAttribute4 | Export-Csv -Path g:\study\ad\out.csv -Encoding unicode -NoTypeInformation
 Export-Csv -Path g:\study\ad\out.csv -Encoding unicode -NoTypeInformation

