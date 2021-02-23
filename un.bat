REM 杀死相关进程
TASKKILL /IM DrvCeox86.exe /f /t&TASKKILL /IM DrvCeox64.exe /f /t
REM 查询"桌面"和"开始菜单"的位置
for /f "tokens=3,*" %%i in ('REG QUERY "HKLM\SOFTWARE\Microsoft\windows\currentVersion\Explorer\shell folders" /v "common desktop"') do (set desk=%%j)
for /f "tokens=3,*" %%i in ('REG QUERY "HKLM\SOFTWARE\Microsoft\windows\currentVersion\Explorer\shell folders" /v "common programs"') do (set cmp=%%j)
REM 删除快捷方式
del /s /q /f "%desk%\驱动总裁.lnk";"%desk%\DrvCeo.lnk";"%desk%\驅動總裁.lnk"
del /s /q /f "%cmp%\驱动总裁.lnk";"%cmp%\DrvCeo.lnk";"%cmp%\驅動總裁.lnk"
REM 删除注册表项目
REG DELETE "HKLM\SOFTWARE\Microsoft\windows\currentVersion\Uninstall\DrvCeo" /f
REG DELETE "HKLM\SOFTWARE\Wow6432Node\Microsoft\windows\currentVersion\Uninstall\DrvCeo" /f
REM 删除程序主文件
rd /s /q "%programfiles%\SysCeo";"%programfiles(x86)%\SysCeo"
REM 清理本文件并退出
del %0
exit