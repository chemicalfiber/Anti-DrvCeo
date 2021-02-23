REM 获取管理员权限运行
setlocal EnableDelayedExpansion
title 驱动总裁清理程序
PUSHD %~DP0 & cd /d "%~dp0"
%1 %2
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :runas","","runas",1)(window.close)&goto :eof
:runas
REM 杀死相关进程
TASKKILL /IM DrvCeo.exe /f /t
REM 查询"桌面"和"开始菜单"的位置
for /f "tokens=3,*" %%i in ('REG QUERY "HKLM\SOFTWARE\Microsoft\windows\currentVersion\Explorer\shell folders" /v "common desktop"') do (set desk=%%j)
for /f "tokens=3,*" %%i in ('REG QUERY "HKLM\SOFTWARE\Microsoft\windows\currentVersion\Explorer\shell folders" /v "common programs"') do (set cmp=%%j)
REM 删除快捷方式
del /s /q /f "%desk%\驱动总裁.lnk";"%desk%\DrvCeo.lnk";"%desk%\驅動總裁.lnk"
rd /s /q "%cmp%\驱动总裁2.0";"%cmp%\DrvCeo2.0";"%cmp%\驅動總裁2.0"
del /s /q /f "%cmp%\..\驅動下載.lnk";"%cmp%\..\驱动下载.lnk"
REM 删除注册表项目
REG DELETE "HKLM\SOFTWARE\Microsoft\windows\currentVersion\Uninstall\DrvCeo2.0" /f
REG DELETE "HKLM\SOFTWARE\Wow6432Node\Microsoft\windows\currentVersion\Uninstall\DrvCeo2.0" /f
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\UFH\SHC" /f
REG DELETE "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /f
REM 删除程序主文件
rd /s /q "%programfiles%\SysCeo";"%programfiles(x86)%\SysCeo"
REM 删除在线版安装包
del /s /q /f "%systemroot%%\Help\dcold.exe"
REM 清理缓存目录
rd /s /q "%TEMP%"
md "%TEMP%"
echo "清理完成"
pause
del %0
exit