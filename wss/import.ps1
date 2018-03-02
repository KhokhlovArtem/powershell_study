get-aduser -searchBase "OU=Office,OU=Fashion3000,DC=domain,DC=local" -Filter {a.khokhlov, p.kerer} -Properties * | Select-Object SamAccountName, name,Company,Department,title,EmailAddress,telephoneNumber,manager | Export-Csv -Path g:\select.csv -Encoding unicode -NoTypeInformation


get-aduser -searchBase "OU=Office,OU=Fashion3000,DC=domain,DC=local" -Filter * -Properties lastlogondate | where { $_.lastLogonDate -lt (get-date).addmonths(-3) } | ft name
lastlogondate