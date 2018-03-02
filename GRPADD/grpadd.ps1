$groupADM = "Administrators"
$groupRDU = "Remote Desktop Users"
$user = "IBS_BASIS"
$pc = "dc-sap-ds1"
$objUser = [ADSI]("WinNT://DOMAIN/$user")
$objGroup = [ADSI]("WinNT://$pc/$groupADM")
$objGroup.PSBase.Invoke("Add",$objUser.PSBase.Path)
$objGroup = [ADSI]("WinNT://$pc/$groupRDU")
$objGroup.PSBase.Invoke("Add",$objUser.PSBase.Path)

