# dwm - dynamic window manager

dwm is an extremely fast, small, and dynamic window manager for X.

## My Patches

This is in the order that I patched everything:

- [attachaside](https://dwm.suckless.org/patches/attachaside/)
- [autostart](https://dwm.suckless.org/patches/autostart/)
- [fibonacci](https://dwm.suckless.org/patches/fibonacci/)
- [shif-tools](https://dwm.suckless.org/patches/shift-tools/)
- [uselessgap](https://dwm.suckless.org/patches/uselessgap/)
- [barpadding](https://dwm.suckless.org/patches/barpadding/)
- [movestack](https://dwm.suckless.org/patches/movestack/)
- [pertag](https://dwm.suckless.org/patches/pertag/)

## My Keybindings

The MODKEY is set to MOD4 (Super key).

#### Main Keybindings

 Keybinding              | Action                                                        |
|-------------------------------|--------------------------------------------------------------|
| MODKEY + RETURN               | opens gnome-terminal                                         |
| MODKEY + SHIFT + RETURN       | opens st                                                     |
| MODKEY + SHIFT + q            | closes window with focus                                     |
| MODKEY + p                    | runs dmenu                                                   |
| MODKEY + b                    | hides the bar                                                |
| MODKEY + 1-4                  | switch focus to workspace (1-4)                              |
| MODKEY + SHIFT + 1-4          | send focused window to workspace (1-4)                       |
| MODKEY + j                    | focus stack +1 (switches focus between windows in the stack) |
| MODKEY + k                    | focus stack -1 (switches focus between windows in the stack) |
| MODKEY + SHIFT + j            | rotate stack +1 (rotates the windows in the stack)           |
| MODKEY + SHIFT + k            | rotate stack -1 (rotates the windows in the stack)           |
| MODKEY + h                    | setmfact -0.005 (expands size of window)                     |
| MODKEY + l                    | setmfact +0.005 (shrinks size of window)                     |
| MODKEY + CONTROL + Left,Right | switch focus to adjacent workspace                           |
| MODKEY + SHIFT   + Left,Right | send focused window to adjacent workspace and move focus     |


#### Layout controls

| Keybinding             | Action                     |
|------------------------|----------------------------|
| MODKEY + t             | master-stack layout (def)  |
| MODKEY + f             | floating layout            |
| MODKEY + m             | monocle layout             |
| MODKEY + r             | spiral layout              |
| MODKEY + SHIFT + r     | dwindle layout (bsp)       |
| MODKEY + SHIFT + SPACE | toggle floating windows    |

