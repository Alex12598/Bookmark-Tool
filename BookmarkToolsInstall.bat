rem FILE MUST BE RAN AS AN ADMIN

rem ==============================================================================================================================================================

rem MAKE FILE LOCATION

cd c:\Program Files\
mkdir BookmarkTools

rem ==============================================================================================================================================================

rem COPY FILES FROM SCCM TO USER PC

xcopy \\civicsccm\Applications\Bookmark_Tool\BookmarkTools "C:\Program Files\BookmarkTools" /I /E

rem ==============================================================================================================================================================

rem REGISTRY APP PATH INFO

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Bookmark Tool" /v Path /t REG_SZ /d "C:\Program Files\BookmarkTools"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Bookmark Tool" /ve /t REG_SZ /d "C:\Program Files\BookmarkTools\BookmarkTool.bat"

rem ==============================================================================================================================================================

rem ADD TOOL SHORTCUT TO START MENU
xcopy "C:\Program Files\BookmarkTools\Bookmark Tool.lnk" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\"

rem ==============================================================================================================================================================