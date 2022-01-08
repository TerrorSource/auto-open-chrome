; made by Makooy
; version 0.1
;
; aantal profiles: 6
;
; How-to:
; pas de profile namen in Profiles aan
; deze kan je vinden door in een profile naar "chrome://version" te gaan en te kijken bij "Profielpad".
; het is nu niet mogelijk om direct websites mee te geven met dit script. doe dat in het chrome profile zelf (start website at startup).
;
; Gebruik toetsenbord/muis niet wanneer het script draait. Dit duurt circa 4-6 seconden.


Loadprofiles := ["Profile 1", "Profile 2", "Profile 3", "Profile 5", "Profile 5", "Profile 5"]

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
