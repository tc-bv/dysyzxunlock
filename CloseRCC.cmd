taskkill /f /im explorer.exe
start explorer
if "%1"=="--restart-explorer" (
exit /b
)
if "%1"=="-e" (
exit /b
)
sc stop rccdaemon
sc delete rccdaemon
taskkill /f /im RCC_ClassManager_Stu_Box.exe
taskkill /f /im RCC_ClassManager_Stu_Box_r.exe
taskkill /f /im RCC-Client.exe
taskkill /f /im ESTGuard.exe
if "%1"=="--close-client" (
taskkill /f /im ESTClient.exe
)
if "%1"=="-r" (
taskkill /f /im ESTClient.exe
)
pause
