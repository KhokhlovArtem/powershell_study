net stop wuauserv
rmdir /S /Q C:\winnt\softwaredistribution
rmdir /S /Q C:\windows\softwaredistribution
net start wuauserv
wuauclt.exe /resetauthorization /detectnow
echo done