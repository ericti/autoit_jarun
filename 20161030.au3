#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_icon=1.ico
#AutoIt3Wrapper_outfile=Jarun.exe
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Res_Comment=God Bless You
#AutoIt3Wrapper_Res_Description=javac and run
#AutoIt3Wrapper_Res_Fileversion=1001.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Copyright by AMTI Digital Tech.
#AutoIt3Wrapper_Res_Language=1028
#AutoIt3Wrapper_Res_Field=WebSite|http://www.L2play.com
#AutoIt3Wrapper_Res_Field=Email|eric@L2play.com
#AutoIt3Wrapper_Res_Field=Ver|9991947
#AutoIt3Wrapper_Res_Field=Date|2016.10.30
#AutoIt3Wrapper_Tidy_Stop_OnError=n
#EndRegion


#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

#RequireAdmin

#Region ### START Koda GUI section ### Form=D:\autoit\JAVA\Form1.kxf
$Form1 = GUICreate("JAVAC + RUN", 261, 156, 192, 124)
$inp_loc = GUICtrlCreateInput("C:\Program Files\Java\jdk1.8.0_60\bin", 24, 24, 209, 21)
$inp_name = GUICtrlCreateInput("home001", 24, 56, 121, 21)
$btn_trans = GUICtrlCreateButton("Javac + Run", 24, 96, 75, 25)
$btn_run = GUICtrlCreateButton("Run", 120, 96, 75, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

 WinSetOnTop($form1,"",1)

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $btn_trans
			_trans(GUICtrlRead($inp_name))
		Case $btn_run
			_runJava(GUICtrlRead($inp_name))
		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd

Func _trans($x)
	Run("cmd", GUICtrlRead($inp_loc), @SW_SHOW )
	Sleep(500)

	$hCmd = WinGetHandle("[CLASS:ConsoleWindowClass]")
	ControlSend($hCmd, "", "", "javac "&$x&".java" & @CR)
	Sleep(500)
	ControlSend($hCmd, "", "", "java "&$x & @CR)

EndFunc

Func _runJava($x)
	$hCmd = WinGetHandle("[CLASS:ConsoleWindowClass]")
	ControlSend($hCmd, "", "", "java "&$x & @CR)
EndFunc