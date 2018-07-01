#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#RequireAdmin

$Form1_1 = GUICreate("Simple IP", 590, 182, 192, 124)
GUISetIcon("shell32.dll", -150, $Form1_1)
$Input1 = GUICtrlCreateInput("Ethernet", 80, 24, 185, 21)
$Label1 = GUICtrlCreateLabel("Network", 24, 27, 51, 17)
GUICtrlSetFont(-1, 9, 800, 0, "MS Sans Serif")
$Label2 = GUICtrlCreateLabel("IP", 24, 59, 16, 17)
GUICtrlSetFont(-1, 9, 800, 0, "MS Sans Serif")
$Input2 = GUICtrlCreateInput("192.168.0.101", 80, 56, 185, 21)
$Label3 = GUICtrlCreateLabel("Subnet", 24, 90, 44, 17)
GUICtrlSetFont(-1, 9, 800, 0, "MS Sans Serif")
$Input3 = GUICtrlCreateInput("255.255.255.0", 80, 88, 185, 21)
$Label4 = GUICtrlCreateLabel("Gateway", 24, 122, 53, 17)
GUICtrlSetFont(-1, 9, 800, 0, "MS Sans Serif")
$Input4 = GUICtrlCreateInput("192.169.0.1", 80, 120, 185, 21)
$Button1 = GUICtrlCreateButton("OK", 368, 32, 73, 33)
GUICtrlSetTip(-1, "OK")
$Button2 = GUICtrlCreateButton("DHCP", 480, 32, 73, 33)
GUICtrlSetTip(-1, "DHCP")
$Button3 = GUICtrlCreateButton("Network Connections", 384, 96, 153, 33)
GUICtrlSetTip(-1, "Network Connections")
GUISetState(@SW_SHOW)


While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $Button1
			$_Cmd2 = ' /k netsh int ipv4 set address name='
			$_Cmd3 = ' static '
			$_Cmd4 = ' mask='
			$_Cmd5 = ' gateway='
			; netsh interface ipv4 set address name=Ethernet static 192.168.0.101 mask=255.255.255.0 gateway=192.168.0.1
			Run(@ComSpec & $_Cmd2 & GUICtrlRead($Input1) & $_Cmd3 & GUICtrlRead($Input2) & $_Cmd4 & GUICtrlRead($Input3) & $_Cmd5 & GUICtrlRead($Input4), '',@SW_SHOWNORMAL)
		Case $Button2
			Run(@ComSpec & ' /k netsh interface ip set address ' & '"' & GUICtrlRead($Input1) & '" dhcp', "", @SW_SHOWNORMAL)
		Case $Button3
			Run("rundll32.exe shell32,Control_RunDLL ncpa.cpl")
			WinWait("Network Connections")
			WinActivate("Network Connections")
			WinWaitActive("Network Connections")
	EndSwitch
WEnd
