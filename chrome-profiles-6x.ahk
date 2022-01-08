; made by Makooy
;
; number of profiles: 6

Loadprofiles := ["Profile 1", "Profile 2", "Profile 3", "Profile 4", "Profile 5", "Profile 6"]

; DO NOT EDIT BELOW

Gui, +ToolWindow -Caption
Gui, Color, Yellow
Gui, Font, s16
Gui, Add, Text, w300 Center, Loading Chrome windows...
SysGet, Mon, MonitorWorkArea, 1
W := MonRight / 3 ; 2 voor 4 vensors, 3 voor 6 vensters
H := MonBottom / 2
T := 0

for i, loadprofile in Loadprofiles
{
	Gui, Show ; allows us to wait for Chrome to be the new active window
	Sleep, 300
	
	chromepath := "Chrome.exe --profile-directory="
	full = %chromepath%"%loadprofile%"
	open := "" . full . ""
	;MsgBox %open%
	Run, %open%

	WinWaitActive, ahk_exe chrome.exe
	WinMove, ahk_exe chrome.exe,, (i < 4 ? W * (i - 1) : W * (i - 4)), (i < 4 ? T : T + H), W + 18, H + 9 ; verander "3" naar "4" voor 6 vensters
}
ExitApp
