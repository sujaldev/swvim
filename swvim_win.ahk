#MaxHotkeysPerInterval 99999

;------config------
mouse_move_val := 10
increase_val := 30
;---config-end-----



#if (enabled)
;-------------------


;------vim----------

;--text-navigation--
h::Left
j::Down
k::Up
l::Right
;---text-nav-end----


;--------jump-------
;-----jump-up-------
+g::
Send, ^{Home}
Return
;----jump-down-------
g::
    If (A_ThisHotkey = A_PriorHotkey and A_TimeSincePriorHotkey < 400)
        Send, ^{End}
Return
;-----jump-end------


;-----vim-end-------

;-------------------




;-------mouse-------
w::MouseMove, 0, -mouse_move_val, 0, Relative
a::MouseMove, -mouse_move_val, 0, 0, Relative
s::MouseMove, 0, mouse_move_val, 0, Relative
d::MouseMove, mouse_move_val, 0, 0, Relative
;-------------------
+w::
MouseClickDrag, Left, 0, 0, 0, -mouse_move_val, 0, Relative
+a::
MouseClickDrag, Left, 0, 0, -mouse_move_val, 0, 0, Relative
+s::
MouseClickDrag, Left, 0, 0, 0, mouse_move_val, 0, Relative
+d::
MouseClickDrag, Left, 0, 0, mouse_move_val, 0, 0, Relative
;-------------------
q::
    MouseClick, left
    return

e::
    MouseClick, right
    return
;-------------------
i::
    mouse_move_val := mouse_move_val + increase_val
    return

r::
    mouse_move_val = 10
    return
;-------------------

#if


;-------enable------
!o::
    enabled :=! enabled
return