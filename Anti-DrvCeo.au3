#RequireAdmin
#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_icon=..\..\..\..\..\Windows\System32\SHELL32.dll|-3
#PRE_Compile_Both=y
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GuiEdit.au3>
BlockInput (1) 
Select
	Case $CmdLine[0] = 0 ;无参数运行
			RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon", "shell", "REG_SZ", @ComSpec&" /c"&@ScriptFullPath & " /Temp")
;~ 			Shutdown(2 + 4)
        Case $CmdLine[0] = 1;带一个参数
                If $CmdLine[1] = "/Next" Then
					Local $Form = GUICreate("清理系统总裁",@DesktopWidth,@DesktopHeight,-1,-1,$WS_MAXIMIZE)
					Local $Edit = GUICtrlCreateEdit("即将开始清理，请稍等..."&@tab&@TAB &"欢迎加入QQ群：477266297",-1,-1,@DesktopWidth,@DesktopHeight,BitOR($ES_READONLY,$ES_AUTOVSCROLL),$WS_EX_TOPMOST)
					GUICtrlSetFont($Edit,20)
					GUISetState(@SW_SHOW)
					readReg("HKLM",1)
					FindAllFile("C:")
					_GUICtrlEdit_AppendText($Edit,@CRLF&"清理完成，即将重启")
					RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon","Shell","REG_SZ","explorer.exe")
					RunWait(@ComSpec & " /c " & 'bcdedit /deletevalue {default} safeboot', "", @SW_HIDE)
					RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run","Temp","REG_SZ",@ScriptFullPath & " /MDel")
					Shutdown(2+4)
				ElseIf $CmdLine[1] = "/MDel" Then
					RegDelete("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run","Temp")
					Run(@ComSpec&' /c ping 127.0.0.1 -n 3&del /q "'&@ScriptFullPath&'"',@ScriptDir,@SW_HIDE)
				ElseIf $CmdLine[1] = "/Temp" Then
				While 1 
					Local $Process = ProcessExists("mcbuilder.exe")
					If $Process <> 0 Then
						ProcessClose($Process)
					Else	
						ExitLoop
					EndIf
					Sleep(50)	
				WEnd	
					RunWait(@ComSpec & " /c " & 'bcdedit /set {default} safeboot minimal', "", @SW_HIDE)
					RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon", "shell", "REG_SZ", @ScriptFullPath &" /Next")
 					Shutdown(2 + 4)
					
				EndIf

EndSelect
		
Func FindAllFile($sDir);目录，删除的文件名，文件信息
    Local $hSearch = FileFindFirstFile($sDir & "\*.*")
    ; 检查搜索是否成功
    If $hSearch = -1 Then Return
    While 1
        Local $sFile = FileFindNextFile($hSearch)
        If @error Then ExitLoop
        If @extended Then 
            FindAllFile($sDir & "\" & $sFile)
        EndIf   
		If StringInStr($sFile,"Sysceo")<>0 Or StringInStr($sDir & "\" & $sFile,"驱动总裁") <> 0 Or StringInStr($sDir & "\" & $sFile,"驅動總裁") <> 0 Or StringInStr($sDir & "\" & $sFile,"驱动下载") <> 0 Or StringInStr($sDir & "\" & $sFile,"驅動下載") <> 0 Or StringInStr($sDir & "\" & $sFile,"dcold") <> 0 Or FileGetVersion($sDir & "\" & $sFile,"FileDescription") = "驱动总裁" Then 
			DirRemove($sDir & "\" & $sFile,1)
 			FileDelete($sDir & "\" & $sFile)
			
			;FileWriteLine("C:\找到的文件.txt",$sFile)
			_GUICtrlEdit_AppendText($Edit,@CRLF&"删除文件："&$sDir & "\" & $sFile)
		EndIf
    WEnd
    ; 关闭搜索句柄
    FileClose($hSearch)
EndFunc


Func readReg($faPath,$step = 1);哪层目录开始，步进值，遍历需要删除的名称
        While 1
                ;获取子键（父键，索引）
                $naPath = RegEnumKey($faPath, $step) 
			
                If Not @error Then
  						
						;ConsoleWrite("键路径：" & $faPath & "\" & $naPath & @CRLF)
					If StringInStr($faPath & "\" & $naPath,"DrvCeo") <> 0 Or StringInStr($faPath & "\" & $naPath,"SysCeo") <> 0 Then
						RegDelete($faPath & "\" & $naPath)
						
						;FileWriteLine ("C:\找到的数据.txt",$faPath & "\" & $naPath)
						_GUICtrlEdit_AppendText($Edit,@CRLF&"删除注册表："&$faPath & "\" & $naPath)
					EndIf	
                        ;----------------------遍历本键的项--------------------
                        Local $na = 1
						
                        While 1
                                ;获取项（键，索引）
								$enVal = RegEnumVal($faPath & "\" & $naPath, $na)	
                                If @error Then ExitLoop
					If StringInStr($faPath & "\" & $naPath& "\" &$enVal,"DrvCeo") <> 0 Or StringInStr($faPath & "\" & $naPath& "\" &$enVal,"SysCeo") <> 0 Then
						RegDelete($faPath & "\" & $naPath& "\" &$enVal)
						
						;FileWriteLine ("C:\找到的数据.txt",$faPath & "\" & $naPath& "\" &$enVal)
						_GUICtrlEdit_AppendText($Edit,@CRLF&"删除注册表："&$faPath & "\" & $naPath& "\" &$enVal)
					EndIf
								;ConsoleWrite("        本键的项：" &$faPath & "\" & $naPath & $enVal & @CRLF)
                                ;读取项的值（键，项）
                                $val = RegRead($faPath & "\" & $naPath, $enVal)
                                ;ConsoleWrite("        本项的值：" & $val & @CRLF)
					If StringInStr($val,"DrvCeo") <> 0 Or StringInStr($val,"SysCeo") Then
						RegDelete($faPath & "\" & $naPath,$enVal)
						;FileWriteLine ("C:\找到的数据.txt",$faPath & "\" & $naPath& " 项：" &$enVal & " 值：" & $Reg)
						_GUICtrlEdit_AppendText($Edit,@CRLF&"删除注册表："&$faPath & "\" & $naPath& " 项：" &$enVal & " 值：" &$val)
					EndIf
                                $na = $na + 1
                        WEnd

                        ;----------------------遍历下一级 键---------------------
                        readReg($faPath & "\" & $naPath, 1)
                Else
                        ExitLoop ;如果获取结束，退出
                EndIf

                $step = $step + 1

                ;ConsoleWrite(@CRLF)
        WEnd
EndFunc   ;==>readReg