#Get-WmiObject Win32_PhysicalMemory -ComputerName mos1-pos | select BankLabel,DeviceLocator,Capacity,Manufacturer,PartNumber,SerialNumber,TotalWidth,Speed


$OutputFilename = "Server-Services.txt"
$OUPath = "DC=domain,DC=local"
$Servers = Get-ADComputer -Filter * -SearchBase $OUPath -SearchScope Subtree -Properties OperatingSystem | Where-Object {$_.OperatingSystem -like "*server*"}

ForEach ($Server in $Servers)
{
Get-WmiObject win32_service -ComputerName $Server.Name |
select Name,
  @{N="Service Account";E={$_.StartName}},
  @{N="System Name";E={$_.Systemname}} | Sort-Object "Name" >> ​$OutputFilename
}