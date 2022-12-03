#NoEnv
#SingleInstance Force
#WinActivateForce
SendMode Input
SetWorkingDir %A_ScriptDir%

; bind escape key to excape sequence:
LCtrl & [::Send {Esc}

CapsLock::
    KeyWait, CapsLock ; wait for CapsLock to be released
    KeyWait, CapsLock, D T0.1 ; wait for CapsLock to be pressed again w/i 0.1s
    if ErrorLevel
        return
    else if (A_PriorKey = "CapsLock")
        SetCapsLockState
    return
*CapsLock::return ; forces CapsLock into a modifer key

#If, GetKeyState("CapsLock", "P") ; CapsLock hotkeys below:
    ; CapsLock+[hjkl] binds (<arrow keys>):
    h::Send {Left}
    j::Send {Down}
    k::Send {Up}
    l::Send {Right}
    ; CapsLock+[hjkl] binds (<arrow keys):
    LCtrl & h::Send {Left}
    LCtrl & j::Send {Down}
    LCtrl & k::Send {Up}
    LCtrl & l::Send {Right}

#If, GetKeyState("Shift", "P") ; Shift hotkeys below:
    ; Shift+LAlt binds (change windows in tab viewer):
    LAlt & l::AltTab
    LAlt & j::Send {Alt Down}{Down}
    LAlt & k::Send {Alt Down}{Up}
    LAlt & k::ShiftALtTab
