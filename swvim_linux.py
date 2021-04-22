from pynput.Keyboard import Controller, Key
from Keybind import KeyBinder
import pyautogui as p

k = Controller()  # keyboard object
running = True  # the scripts terminates if set to true
big_mode = 1  # see docs to understand big_mode
travel = 10  # mouse moves by 10px
time_delay = 0  # mouse travel delay
arrow_travel = 1  # how many times hjkl repeat


def repeat(func, *args, num=1):
    for i in range(num):
        func(args[0])


def mouse_up():
    global travel
    global time_delay
    p.moveRel(0, -travel, duration=time_delay)


def mouse_left():
    global travel
    global time_delay
    p.moveRel(-travel, 0, duration=time_delay)


def mouse_down():
    global travel
    global time_delay
    p.moveRel(0, travel, duration=time_delay)


def mouse_right():
    global travel
    global time_delay
    p.moveRel(travel, 0, duration=time_delay)


def r_click():
    p.click(button="right")


def l_click():
    p.click()


def up():
    repeat(k.tap, Key.up, num=arrow_travel)


def left():
    repeat(k.tap, Key.left, num=arrow_travel)


def down():
    repeat(k.tap, Key.down, num=arrow_travel)


def right():
    repeat(k.tap, Key.right, num=arrow_travel)


def enable_big_mode():
    global big_mode
    global travel
    global time_delay
    global arrow_travel

    big_mode += 1
    travel = 10 * big_mode
    time_delay = 0 * big_mode
    arrow_travel = 1 * big_mode


def disable_big_mode():
    global big_mode
    global travel
    global time_delay
    global arrow_travel

    big_mode = 1
    travel = 10
    time_delay = 0
    arrow_travel = 1


def exit_script():
    global running
    running = False


# The following will start Key listening loop in a thread
# (useful if you don't want to block your main program).
KeyBinder.activate({

    'Ctrl-U': exit_script,
    'w': mouse_up,
    'a': mouse_left,
    's': mouse_down,
    'd': mouse_right,

    'q': l_click,
    'e': r_click,

    'b': enable_big_mode,
    'g': disable_big_mode,

    'k': up,
    'h': left,
    'j': down,
    'l': right,
    # 'v': None,  # Do not run anything, just intercept.

}, run_thread=True)

while True:
    if not running:
        break
