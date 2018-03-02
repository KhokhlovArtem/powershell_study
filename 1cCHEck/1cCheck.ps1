$ActiveWorkbook.Close()
$ExcelObject = new-Object -comobject Excel.Application  
$ExcelObject.visible = $true 
$ExcelObject.DisplayAlerts =$true
$strPath1="G:\Study\AD\1cSID1.xlsx" 
if (Test-Path $strPath1) {  
  #Open the document  
$ActiveWorkbook = $ExcelObject.WorkBooks.Open($strPath1) 
$ActiveWorksheet = $ActiveWorkbook.Worksheets.Item(1)  
}
$lastRow = $ActiveWorksheet.UsedRange.Rows.count
$introw = $ActiveWorksheet.UsedRange.Rows.Count + 1  

#$list = New-Object System.Collections.ArrayList

#foreach ($user in $users)


for ($i = 0;$i -le $lastRow; $i++)
{


$user_FIO = $ActiveWorksheet.cells.item($i, 1)
$user_OTD = $ActiveWorksheet.cells.item($i, 2)  
$user_DEP = $ActiveWorksheet.cells.item($i, 3)
$user_SID = $ActiveWorksheet.cells.item($i, 4)  

$userad = get-aduser -Identity $user_SID.Text -Properties * | select SID,name,extensionAttribute1,extensionAttribute2,extensionAttribute3,extensionAttribute4, Company,Department,description,title,manager

$ActiveWorksheet.cells.item($i, 5) = $userad.extensionAttribute1 +" "+ $userad.extensionAttribute2 +" "+ $userad.extensionAttribute3
$ActiveWorksheet.cells.item($i, 6) = $userad.description
$ActiveWorksheet.cells.item($i, 7) = $userad.Department
}

