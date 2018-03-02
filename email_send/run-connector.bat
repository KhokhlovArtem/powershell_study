cd C:\Diadoc_connector\DC.Reporter.2.69.164_Modis_for_internal_logistic\
util\run-versioned-updater.bat %*
IF ERRORLEVEL 1 (Exit
) ELSE (
echo start email sending...
powershell c:\script\send_email_ProbDiadoc.ps1
echo done!)