
$content = "G:\study\add_content\name_code.csv"
$users = Import-Csv $content
ForEach ($user in $users)
{
$user.name
$hrens = Get-ADUser -Filter * -SearchBase "OU=Stores,OU=Fashion3000,DC=domain,DC=local" | Where-Object  {$_.SamAccountName -match $user.name} | select samaccountname
#user, PostalCode, City, StreetAddress, physicalDeliveryOfficeName, info, Company

foreach ($hren in $hrens ) {
Set-ADUser $hren.SamAccountName -Replace @{msExchExtensionAttribute20 = $user.code}
#Set-ADUser $hren.SamAccountName -Replace @{City = $user.City}
#Set-aduser $hren.SamAccountName -City $user.City
#Set-aduser $hren.SamAccountName -StreetAddress $user.StreetAddress
#Set-ADUser $hren.SamAccountName -Replace @{physicalDeliveryOfficeName = $user.physicalDeliveryOfficeName}
#Set-ADUser $hren.SamAccountName -Replace @{info = $user.info}
#Set-aduser $hren.SamAccountName -PostalCode $user.PostalCode
#Set-aduser $hren.SamAccountName -Company $user.Company

#Set-ADUser $hren.SamAccountName -Replace @{StreetAddress = $user.StreetAddress}
#Set-ADUser $hren.SamAccountName -Replace @{physicalDeliveryOfficeName = $user.physicalDeliveryOfficeName}

#Set-ADUser $hren.SamAccountName -Replace @{Company = $user.Company}
#Set-ADUser $hren.SamAccountName -Replace @{PostalCode = $user.PostalCode}
# StreetAddress = $user.StreetAddress; physicalDeliveryOfficeName = $user.physicalDeliveryOfficeName; info = $user.info; Company = $user.Company;

#Get-ADUser $hren.samaccountname -properties * | ft name, msExchExtensionAttribute20
}
}



#$users 

#$dir_users = Get-ADUser -Filter * -SearchBase "OU=Belgorod1,OU=Chernozeme,OU=Moskva-Tsentr,OU=Stores,OU=Fashion3000,DC=domain,DC=local"|`
#Where-Object  {$_.SamAccountName -match $users } 
 #$dir_users
 #$dir_users
#$dir_users 


#$name_shop_users = $dir_users.SamAccountName
#Set-ADUser $name_shop_user -Mobile $Dir_mobile  
