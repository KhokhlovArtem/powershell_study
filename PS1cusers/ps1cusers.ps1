$logins = Get-Content "G:\Study\PS1cusers\logins.txt"
foreach ($login in $logins)
#{get-aduser $login -Properties enabled |Select-Object name, enabled} 

{get-aduser $login -Properties enabled | where Enabled -EQ $false | Select-Object name, enabled} 


