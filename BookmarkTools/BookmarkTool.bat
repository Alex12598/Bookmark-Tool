@echo off
Title Browser Tools
mode 120,50
::Define Colors
Set _fBWhite=[97m
Set _fCyan=[36m
Set _bBlack=[40m
Set _RESET=[0m

::Main Menu
:menu
cls
::Display Logo
echo %_fCyan%%_bBlack%
echo oooooooooo.                      oooo                                   ooooooooooooo                     oooo  
echo `888'   `Y8b                     `888                                   8'   888   `8                     `888  
echo  888     888  .oooo.    .ooooo.   888  oooo  oooo  oooo  oo.ooooo.           888       .ooooo.   .ooooo.   888  
echo  888oooo888' `P  /88b  d88' `"Y8  888 .8P'   `888  `888   888' `88b          888      d88' `88b d88' `88b  888  
echo  888    `88b  .oP"888  888        888888.     888   888   888   888          888      888   888 888   888  888  
echo  888    .88P d8\  888  888   .o8  888 `88b.   888   888   888   888          888      888   888 888   888  888  
echo o888bood8P'  `Y888""8o `Y8bod8P' o888o o888o  `V88V"V8P'  888bod8P'         o888o     `Y8bod8P' `Y8bod8P' o888o 
echo                                                           888                                                   
echo                                                          o888o                                                   


                                                                                                           
echo %_RESET%
echo %_fBWhite%
echo *******************WARNING*******************
echo.						 
echo                 FOR BACKUPS		 
echo.						 
echo   This tool will close browsers for backup 
echo.
echo =============================================
echo.
echo                FOR RESTORES
echo.
echo   The web-browsers you are restoring will
echo   need to be opened at least once before
echo   restoring.
echo.
echo *********************************************
echo %_RESET%
echo   To navigate, type the number to the left 
echo   of what you want to select and press enter.
echo %_fBWhite%
echo =============================
echo Select Backup or Restore Menu
echo =============================
echo.
echo 1) Backup
echo.
echo 2) Restore
echo.
echo =============================
echo Exit Without Running Anything
echo =============================
echo 3) Close Menu
echo =============
set /p op=Type option:
if "%op%"=="1" goto op1
if "%op%"=="2" goto op2
if "%op%"=="3" goto op3

echo Please Pick an option:
goto menu

:op1
echo You picked backup browsers
goto Backup

:op2
echo You picked restore browsers
goto Restore

:op3
echo You picked Close Menu
echo GoodBye
Exit

::Sub Menus

::Backup Menu
:Backup
cls
::Display Logo
echo %_fCyan%%_bBlack% 
echo oooooooooo.                      oooo                               
echo `888'   `Y8b                     `888                               
echo  888     888  .oooo.    .ooooo.   888  oooo  oooo  oooo  oo.ooooo.  
echo  888oooo888' `P  /88b  d88' `"Y8  888 .8P'   `888  `888   888' `88b 
echo  888    `88b  .oP"888  888        888888.     888   888   888   888 
echo  888    .88P d8\  888  888   .o8  888 `88b.   888   888   888   888 
echo o888bood8P'  `Y888""8o `Y8bod8P' o888o o888o  `V88V"V8P'  888bod8P' 
echo                                                           888       
echo                                                          o888o                                                                          
echo %_RESET%
echo %_fBWhite%
echo ====================
echo Select Start or Menu
echo ====================
echo 1) Start
echo 2) Menu
echo ========
set /p op=Type option:
if "%op%"=="1" goto op1
if "%op%"=="2" goto op2

echo Please Pick an option:
goto Backup

:op1
echo You picked backup browsers
goto StartBackup

:op2
echo You picked restore browsers
goto Menu

:StartBackup
cls

::Display Logo

echo %_fCyan%%_bBlack% 
echo oooooooooo.                      oooo                               
echo `888'   `Y8b                     `888                               
echo  888     888  .oooo.    .ooooo.   888  oooo  oooo  oooo  oo.ooooo.  
echo  888oooo888' `P  /88b  d88' `"Y8  888 .8P'   `888  `888   888' `88b 
echo  888    `88b  .oP"888  888        888888.     888   888   888   888 
echo  888    .88P d8\  888  888   .o8  888 `88b.   888   888   888   888 
echo o888bood8P'  `Y888""8o `Y8bod8P' o888o o888o  `V88V"V8P'  888bod8P' 
echo                                                           888       
echo                                                          o888o                                                                          
echo %_RESET%
echo %_fBWhite%
echo **********************************************
echo **Backups are saved to your Downloads Folder**
echo **********************************************
echo ========================
echo Starting Browser Backups
echo ========================
echo Closing Browsers...

::End Browser Sessions

taskkill /IM "Chrome.exe" /F >nul 2>&1
taskkill /IM "iexplore.exe" /F >nul 2>&1
taskkill /IM "firefox.exe" /F >nul 2>&1
taskkill /IM "msedge.exe" /F >nul 2>&1
echo Browsers Closed!

::Create Folders

echo Creating Folders on Computer...
rmdir /Q /S c:\Users\%Username%\downloads\BrowserBackup >nul 2>&1
mkdir c:\Users\%Username%\downloads\BrowserBackup
mkdir c:\Users\%Username%\downloads\BrowserBackup\IE
mkdir c:\Users\%Username%\downloads\BrowserBackup\Chrome
mkdir c:\Users\%Username%\downloads\BrowserBackup\FireFox
mkdir c:\Users\%Username%\downloads\BrowserBackup\FireFox\INI
mkdir c:\Users\%Username%\downloads\BrowserBackup\FireFox\Profiles
mkdir c:\Users\%Username%\downloads\BrowserBackup\Edge
echo Folders Created!

::Make local copy of favorites/bookmarks

echo Copying Files to %Username%\Downloads...
xcopy "%LOCALAPPDATA%\Google\Chrome\User Data\default\bookmarks" c:\Users\%Username%\downloads\BrowserBackup\Chrome\ /Y >nul 2>&1
xcopy "%LOCALAPPDATA%\Google\Chrome\User Data\default\bookmarks.bak" c:\Users\%Username%\downloads\BrowserBackup\Chrome\ /Y >nul 2>&1
xcopy c:\Users\%Username%\Favorites c:\Users\%Username%\downloads\BrowserBackup\IE /e /h /Y >nul 2>&1
xcopy %APPDATA%\Mozilla\Firefox\*.ini c:\Users\%Username%\downloads\BrowserBackup\Firefox\INI >nul 2>&1
xcopy %APPDATA%\Mozilla\Firefox\Profiles c:\Users\%Username%\downloads\BrowserBackup\Firefox\Profiles /e /h /Y >nul 2>&1
xcopy "%LOCALAPPDATA%\Microsoft\Edge\User Data\default\bookmarks" c:\Users\%Username%\downloads\BrowserBackup\Edge\ /Y >nul 2>&1
xcopy "%LOCALAPPDATA%\Microsoft\Edge\User Data\default\bookmarks.msbak" c:\Users\%Username%\downloads\BrowserBackup\Edge\ /Y >nul 2>&1
echo Files Copied, Backup Completed!

PAUSE

start %userprofile%\Downloads
taskkill /IM "cmd.exe" 0

EXIT /b 0 


::Restore Menu
:Restore
cls
::Display Logo
echo %_fCyan%%_bBlack% 
echo ooooooooo.                          .                                
echo `888   `Y88.                      .o8                                
echo  888   .d88'  .ooooo.   .oooo.o .o888oo  .ooooo.  oooo d8b  .ooooo.  
echo  888ooo88P'  d88' `88b d88/  "8   888   d88' `88b `888""8P d88' `88b 
echo  888`88b.    888ooo888 `"Y88b.    888   888   888  888     888ooo888 
echo  888  `88b.  888    .o o.  \88b   888 . 888   888  888     888    .o 
echo o888o  o888o `Y8bod8P' 8""888P'   "888" `Y8bod8P' d888b    `Y8bod8P'                                                                                                                                                                                                                
echo %_RESET%
echo %_fBWhite%
echo !!!Make sure your BrowserBackup folder is in your downloads to restore!!!
echo.
echo ====================
echo Select Start or Menu
echo ====================
echo 1) Start
echo 2) Menu
echo ========
set /p op=Type option:
if "%op%"=="1" goto op1
if "%op%"=="2" goto op2

echo Please Pick an option:
goto Restore

:op1
echo You picked backup browsers
goto StartRestore

:op2
echo You picked restore browsers
goto Menu

:StartRestore
cls
::Display Logo
echo %_fCyan%%_bBlack% 
echo ooooooooo.                          .                                
echo `888   `Y88.                      .o8                                
echo  888   .d88'  .ooooo.   .oooo.o .o888oo  .ooooo.  oooo d8b  .ooooo.  
echo  888ooo88P'  d88' `88b d88/  "8   888   d88' `88b `888""8P d88' `88b 
echo  888`88b.    888ooo888 `"Y88b.    888   888   888  888     888ooo888 
echo  888  `88b.  888    .o o.  \88b   888 . 888   888  888     888    .o 
echo o888o  o888o `Y8bod8P' 8""888P'   "888" `Y8bod8P' d888b    `Y8bod8P'                                                                                                                                                                                                                
echo %_RESET%
echo %_fBWhite%
echo ============================
echo Starting Browser Restoration
echo ============================

::Copy Local Files to browser locations

echo Copying Files to Browsers...
xcopy "c:\Users\%Username%\downloads\BrowserBackup\Chrome\bookmarks" "%LOCALAPPDATA%\Google\Chrome\User Data\default" /Y >nul 2>&1
xcopy "c:\Users\%Username%\downloads\BrowserBackup\Chrome\bookmarks.bak" "%LOCALAPPDATA%\Google\Chrome\User Data\default" /Y >nul 2>&1
xcopy "c:\Users\%Username%\downloads\BrowserBackup\IE" c:\Users\%Username%\Favorites /e /h /y >nul 2>&1
xcopy "c:\Users\%Username%\downloads\BrowserBackup\Firefox\INI\*.ini" %APPDATA%\Mozilla\Firefox /e /h /i /Y >nul 2>&1
xcopy "c:\Users\%Username%\downloads\BrowserBackup\Firefox\Profiles" %APPDATA%\Mozilla\Firefox\Profiles /e /h /i /Y >nul 2>&1
xcopy "c:\Users\%Username%\downloads\BrowserBackup\Edge\bookmarks" "%LOCALAPPDATA%\Microsoft\Edge\User Data\default" /Y >nul 2>&1
xcopy "c:\Users\%Username%\downloads\BrowserBackup\Edge\bookmarks.msbak" "%LOCALAPPDATA%\Microsoft\Edge\User Data\default" /Y >nul 2>&1
echo Files Copied, Browser Restoration Completed!

PAUSE

EXIT /b 0