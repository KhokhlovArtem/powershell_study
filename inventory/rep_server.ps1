
#store servers
$OUPath = "OU=Stores,OU=Fashion3000,DC=domain,DC=local"
$Servers = Get-ADComputer -Filter * -SearchBase $OUPath -SearchScope Subtree -Properties OperatingSystem | Where-Object {$_.OperatingSystem -like "*server*"}
$CPUInfo = Get-WmiObject Win32_Processor #Get CPU Information 
$OSInfo = Get-WmiObject Win32_OperatingSystem #Get OS Information 
$PhysicalMemory = Get-WmiObject CIM_PhysicalMemory | Measure-Object -Property capacity -Sum | % {[math]::round(($_.sum / 1GB),2)} 
foreach ($Server in $Servers)  
{
$CSInfo = Get-WmiObject Win32_ComputerSystem -computername $Server.Name 
$Disk = (Get-WmiObject -Class Win32_LogicalDisk -computername $Server.Name)
write-host "Server name -"$Server.Name
write-host "OS Name -"$OSInfo.Caption 
write-host "OS version -"$OSInfo.Version 
write-host "Server model -"$CSInfo.Model
write-host "CPU name -"$CPUInfo.Name
write-host "CPU num core -"$CPUInfo.NumberOfCores 
write-host "RAM -" $PhysicalMemory
write-host "Disk -"$Disk.DeviceID
write-host "Disk -"$Disk.Size
write-host "" 

}
#trash#

foreach ($Server in $Servers) 
{
$CSInfo = Get-WmiObject Win32_ComputerSystem -computername $server.Name
$Disk = Get-WmiObject -Class Win32_LogicalDisk -computername $server.Name 
write-host "Server name -"$Server.Name
write-host "OS Name -"$OSInfo.Caption 
write-host "OS version -"$OSInfo.Version 
write-host "Server model -"$CSInfo.Model
#write-host "Server model -"(Get-WmiObject Win32_ComputerSystem -ComputerName $Server.Name).Model
write-host "CPU name -"$CPUInfo.Name
write-host "CPU num core -"$CPUInfo.NumberOfCores 
write-host "RAM -" $PhysicalMemory
write-host "Disk -"$Disk.Name
write-host ""
}
#$Servers.GetValue(0).name | Get-SPInventory



#{ $wmi = Get-WmiObject Win32_OperatingSystem –comp sml2-pos | Select CSName,BuildNumber, ServicePackMajorVersion,MaxProcessMemorySize,NumberOfProcesses | Write-Output $wmi }


#Get-WmiObject Win32_OperatingSystem -ComputerName sml2-pos | get-member *proc*
#Get-WmiObject Win32_ComputerSystem -ComputerName sml2-pos  | select PSStatus| get-member | more

 #Select CSName,BuildNumber, ServicePackMajorVersion 

(Get-WmiObject Win32_ComputerSystem -ComputerName sam5-pos).model
#endtrash#

#one server


$Excel = New-Object -ComObject Excel.Application 
$Excel.Visible = $true
$WorkBook = $Excel.Workbooks.Add()
$elstable = $WorkBook.Worksheets.Item(1)
$elstable.Cells.Item(1,1) = 'Server name'
$elstable.Cells.Item(1,2) = 'OS Name'
$elstable.Cells.Item(1,3) = 'OS version'
$elstable.Cells.Item(1,4) = 'Server model'
$elstable.Cells.Item(1,5) = 'CPU name'
$elstable.Cells.Item(1,6) = 'CPU num core'
$elstable.Cells.Item(1,7) = 'CPU num core'
$elstable.Cells.Item(1,8) = 'CPU max speed'
$elstable.Cells.Item(1,9) = 'RAM'
$elstable.Cells.Item(1,10) = 'Disk'
$elstable.Cells.Item(1,11) = 'Disk size'
$elstable.Cells.Item(1,12) = 'Free space'


$Row = 2
$Column = 1

$OUPath = "OU=Stores,OU=Fashion3000,DC=domain,DC=local"
$Servers = Get-ADComputer -Filter * -SearchBase $OUPath -SearchScope Subtree -Properties OperatingSystem | Where-Object {$_.name -like "*sam?-pos*"}
#$CPUInfo = Get-WmiObject Win32_Processor #Get CPU Information 
$Servers = Get-ADComputer -Filter * -SearchBase $OUPath -SearchScope Subtree -Properties OperatingSystem | Where-Object {$_.OperatingSystem -like "*server*"}
#$Servers = Get-ADComputer -Filter * -SearchBase $OUPath -SearchScope Subtree -Properties OperatingSystem | Where-Object {$_.name -like "*sam?-pos*"}
$OSInfo = Get-WmiObject Win32_OperatingSystem #Get OS Information 
$PhysicalMemory = Get-WmiObject CIM_PhysicalMemory | Measure-Object -Property capacity -Sum | % {[math]::round(($_.sum / 1GB),2)} 
foreach ($Server in $Servers) 
{
$CSInfo = Get-WmiObject Win32_ComputerSystem -computername $server.Name
#$Disk = Get-WmiObject -Class Win32_LogicalDisk -computername $server.Name 
$CPUInfo = Get-WmiObject Win32_Processor -ComputerName $Server.Name
$OSInfo = Get-WmiObject Win32_OperatingSystem -ComputerName $Server.Name
$PhysicalMemory = Get-WmiObject CIM_PhysicalMemory -ComputerName $Server.Name | Measure-Object -Property capacity -Sum | % {[math]::round(($_.sum / 1GB),2)} 
    $elstable.Cells.Item($Row, $Column) = $Server.Name #1
    $Column++
    $elstable.Cells.Item($Row, $Column) = $OSInfo.Caption#2
    $Column++
    $elstable.Cells.Item($Row, $Column) = $OSInfo.Version#3
    $Column++
    $elstable.Cells.Item($Row, $Column) = $CSInfo.Model#4
    $Column++
    $elstable.Cells.Item($Row, $Column) = $CPUInfo.Name#5
    $Column++
    $elstable.Cells.Item($Row, $Column) = $CPUInfo.NumberOfCores#6
    $Column++
    $elstable.Cells.Item($Row, $Column) = $CPUInfo.count#7
    $Column++
    #if ($CPUInfo.NumberOfCores) {$elstable.Cells.Item($Row, $Column) = $CPUInfo.NumberOfCores}
    #else {$elstable.Cells.Item($Row, $Column) = $CPUInfo.NumberOfCores}
    #$Column++
    $elstable.Cells.Item($Row, $Column) = $CPUInfo.MaxClockSpeed#8
    $Column++
    $elstable.Cells.Item($Row, $Column) = $PhysicalMemory#9
    $Column++
        Get-WmiObject Win32_LogicalDisk -ComputerName $Server.Name | foreach {
        $elstable.Cells.Item($Row, $Column) = $_.DeviceID#10
        $Column++
        $elstable.Cells.Item($Row, $Column) = ([Math]::Round($_.Size/1GB, 2))#11
        $Column++
        $elstable.Cells.Item($Row, $Column) = ([Math]::Round($_.FreeSpace/1GB, 2))#12
        $Row++
        $Column = 10
        }
    
    #$row++
    $Column = 1
}

$WorkBook.SaveAs('G:\temp\Report.xlsx')
$Excel.Quit()

Get-ADComputer sam5-pos -Properties name | Get-WmiObject -Class Win32_LogicalDisk
if ((Get-WmiObject Win32_Processor -computername sam5-pos).NumberOfCores -eq "")  {"1"}
else {write-host "2"}
{(Get-WmiObject Win32_Processor -computername sam1-pos).NumberOfCores; write-host 1}
else {(Get-WmiObject Win32_Processor -computername sam1-pos).count; write-host 2}
(Get-WmiObject Win32_Processor).NumberOfCores
Get-WmiObject -Class win32_logicaldisk -ComputerName sam5-pos

cls



