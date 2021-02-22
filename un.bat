TASKKILL /IM DrvCeox86.exe /f /t&TASKKILL /IM DrvCeox64.exe /f /t
for /f "tokens=3,*" %%i in ('REG QUERY "HKLM\SOFTWARE\Microsoft\windows\currentVersion\Explorer\shell folders" /v "common desktop"') do (set desk=%%j)
for /f "tokens=3,*" %%i in ('REG QUERY "HKLM\SOFTWARE\Microsoft\windows\currentVersion\Explorer\shell folders" /v "common programs"') do (set cmp=%%j)
del /s /q /f "%desk%\驱动总裁.lnk";"%desk%\DrvCeo.lnk";"%desk%\驅動總裁.lnk"
del /s /q /f "%cmp%\驱动总裁.lnk";"%cmp%\DrvCeo.lnk";"%cmp%\驅動總裁.lnk"
REG DELETE "HKLM\SOFTWARE\Microsoft\windows\currentVersion\Uninstall\DrvCeo" /f
REG DELETE "HKLM\SOFTWARE\Wow6432Node\Microsoft\windows\currentVersion\Uninstall\DrvCeo" /f
rd /s /q "%programfiles%\SysCeo";"%programfiles(x86)%\SysCeo"
del %0
exit