workflow wf{
  param($computers)
  $computers = Get-Content G:\trash\4.txt
foreach -parallel ($computer in $computers){tree /f \\$computer\c$\ | findstr email }
}
wf 128

$computers = Get-Content G:\trash\4.txt
foreach ($computer in $computers){
psexec -s \\$computer \\domain.local\NETLOGON\tree.cmd
}

psexec \\$computer \\domain.local\NETLOGON\tree.cmd