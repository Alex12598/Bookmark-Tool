rem DELETE REGISTRY FILES
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Bookmark Tool" /f


rem REMOVE PROGRAM FILES FOLDER
cd c:\Program Files
rmdir /S /Q BookmarkTools


rem DELETE START MENU ICON
cd C:\ProgramData\Microsoft\Windows\Start Menu\Programs
del "Bookmark Tool.lnk"