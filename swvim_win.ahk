mouse_move_val = 10

h::Left
j::Down
k::Up
l::Right
;-----------------
+g::
Send, ^{Home}
Return

g::
    If (A_ThisHotkey = A_PriorHotkey and A_TimeSincePriorHotkey < 400)
        Send, ^{End}
Return
;-----------------
w::MouseMove, 0, -mouse_move_val, 0, Relative
a::MouseMove, -mouse_move_val, 0, 0, Relative
s::MouseMove, 0, mouse_move_val, 0, Relative
d::MouseMove, mouse_move_val, 0, 0, Relative
;-----------------
+w::
MouseClickDrag, Left, 0, 0, 0, -mouse_move_val, 0, Relative
+a::
MouseClickDrag, Left, 0, 0, -mouse_move_val, 0, 0, Relative
+s::
MouseClickDrag, Left, 0, 0, 0, mouse_move_val, 0, Relative
+d::
MouseClickDrag, Left, 0, 0, mouse_move_val, 0, 0, Relative
;-----------------
^u::
ExitApp
Return