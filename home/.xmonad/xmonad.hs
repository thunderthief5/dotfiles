
-- ▀▄▀ █▀▄▀█ █▀█ █▄░█ ▄▀█ █▀▄ ThunderThief
-- █░█ █░▀░█ █▄█ █░▀█ █▀█ █▄▀ vim:fileencoding=utf-8:foldmethod=marker

-- {{{ Imports

-- Default imports
import XMonad
import Data.Monoid
import System.Exit

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

-- My imports
import XMonad.Util.SpawnOnce                                                            -- A module for spawning a command once, and only once
import XMonad.Util.EZConfig (additionalKeys, additionalKeysP, additionalMouseBindings)  -- Useful helper functions for amending the default configuration
                                                                                        -- And for parsing keybindings specified in a special (emacs-like) format
import XMonad.Hooks.SetWMName                                                           -- Sets the WM name to a given string
import XMonad.Hooks.ManageDocks                                                         -- Provides tools to automatically manage dock type programs
import XMonad.Hooks.EwmhDesktops                                                        -- Makes xmonad use the EWMH hints
import XMonad.Hooks.ManageHelpers(doFullFloat, doCenterFloat, isFullscreen, isDialog)   -- Provides helper functions to be used in manageHook
import XMonad.Hooks.InsertPosition                                                      -- Configure where new windows should be added and which window should be focused.

import XMonad.Actions.CycleWS                                                           -- Cycle/Move windows b/w workspaces and screens
import XMonad.Layout.ResizableTile                                                      -- More useful tiled layout that allows you to change a width/height of window
import XMonad.Layout.Spiral                                                             -- A spiral tiling layout
import XMonad.Layout.BinarySpacePartition                                               -- Layout where new windows will split the focused window in half, based off of BSPWM
import XMonad.Layout.Spacing                                                            -- Add a configurable amount of space around windows.
import XMonad.Layout.Gaps                                                               -- Create manually-sized gaps, support for toggling gaps on and off.
import XMonad.Layout.MultiToggle                                                        -- Dynamically apply and unapply transformers to your window layout
import XMonad.Layout.MultiToggle.Instances                                              -- Extension of MultiToggle

-- }}}

-- {{{ myDefinitions

myTerminal      = "xterm"

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myClickJustFocuses :: Bool
myClickJustFocuses = False

myBorderWidth   = 2

myModMask       = mod4Mask

myWorkspaces    = ["1","2","3","4"]

myNormalBorderColor  = "#1b1b1b"
myFocusedBorderColor = "#6272a4"

-- }}}

-- {{{ Key bindings

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    -- close focused window
    [ ((modm .|. shiftMask,                                   xK_q      ), kill)

     -- Rotate through the available layout algorithms
    , ((modm,                                                 xK_space  ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask,                                   xK_space  ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modm,                                                 xK_n      ), refresh)

    -- Move focus to the next window
    , ((modm,                                                 xK_Tab    ), windows W.focusDown)

    -- Move focus to the next window
    , ((modm,                                                 xK_Down   ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modm,                                                 xK_Up     ), windows W.focusUp)

    -- Move focus to the master window
    , ((modm,                                                 xK_m      ), windows W.focusMaster)

    -- Swap the focused window and the master window
    , ((modm .|. shiftMask,                                   xK_m      ), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((modm .|. shiftMask,                                   xK_Down   ), windows W.swapDown)

    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask,                                   xK_Up     ), windows W.swapUp)

    -- Shrink the master area
    , ((modm .|. mod1Mask,                                    xK_Left   ), sendMessage Shrink)

    -- Expand the master area
    , ((modm .|. mod1Mask,                                    xK_Right  ), sendMessage Expand)

    -- Push window back into tiling
    , ((modm,                                                 xK_t      ), withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    , ((modm              ,                                   xK_comma  ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((modm              ,                                   xK_period ), sendMessage (IncMasterN (-1)))

    -- BSP Keybindings
    , ((modm .|. mod1Mask,                 xK_l     ), sendMessage $ ExpandTowards R)
    , ((modm .|. mod1Mask,                 xK_h     ), sendMessage $ ExpandTowards L)
    , ((modm .|. mod1Mask,                 xK_j     ), sendMessage $ ExpandTowards D)
    , ((modm .|. mod1Mask,                 xK_k     ), sendMessage $ ExpandTowards U)
    , ((modm .|. mod1Mask .|. shiftMask,   xK_l     ), sendMessage $ ShrinkFrom R)
    , ((modm .|. mod1Mask .|. shiftMask,   xK_h     ), sendMessage $ ShrinkFrom L)
    , ((modm .|. mod1Mask .|. shiftMask,   xK_j     ), sendMessage $ ShrinkFrom D)
    , ((modm .|. mod1Mask .|. shiftMask,   xK_k     ), sendMessage $ ShrinkFrom U)
    , ((modm,                              xK_r     ), sendMessage Rotate)
    , ((modm,                              xK_s     ), sendMessage Swap)
    , ((modm,                              xK_n     ), sendMessage FocusParent)
    , ((modm .|. controlMask,              xK_n     ), sendMessage SelectNode)
    , ((modm .|. shiftMask,                xK_n     ), sendMessage MoveNode)
    , ((modm .|. shiftMask .|. controlMask, xK_j    ), sendMessage $ SplitShift Prev)
    , ((modm .|. shiftMask .|. controlMask, xK_k    ), sendMessage $ SplitShift Next)

    -- ResizableTile keybindings
    , ((modm .|. mod1Mask,               xK_Down    ), sendMessage MirrorShrink)
    , ((modm .|. mod1Mask,               xK_Up      ), sendMessage MirrorExpand)

    -- CycleWS
    , ((modm .|. controlMask,               xK_Right),  nextWS)
    , ((modm .|. controlMask,               xK_Left ),  prevWS)
    , ((modm .|. shiftMask,                 xK_Right),  shiftToNext >> nextWS)
    , ((modm .|. shiftMask,                 xK_Left ),  shiftToPrev >> prevWS)

    -- Toggle no-borders fullscreen
    , ((modm, xK_f), sendMessage $ Toggle NBFULL)

    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    -- , ((modm              , xK_b     ), sendMessage ToggleStruts)

    -- Quit xmonad
    , ((modm .|. shiftMask, xK_x     ), io (exitWith ExitSuccess))

    -- Restart xmonad
    -- , ((modm .|. shiftMask, xK_r     ), spawn "xmonad --recompile; xmonad --restart")

    ]
    ++

    --
    -- mod-[1..4], Switch to workspace N
    -- mod-shift-[1..4], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_4]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

-- }}}

-- {{{ Mouse bindings
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

-- }}}

-- {{{ Layouts:

myLayout = spacingRaw False (Border 0 3 3 3) True (Border 6 3 3 3) True $ avoidStruts $ mkToggle (NBFULL ?? NOBORDERS ?? EOT) $ ResizableTall 1 (3/100) (1/2) [] ||| emptyBSP ||| Full
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

-- }}}

-- {{{ Window rules:

myManageHook = composeAll
    [ className =? "Lxappearance"            --> doFloat
    , className =? "Nm-connection-editor"    --> doFloat
    , className =? "Nitrogen"                --> doFloat
    , className =? "Popsicle"                --> doFloat
    , className =? "Pavucontrol"             --> doFloat
    , className =? "Xfce4-panel"             --> doFloat
    , className =? "Wrapper-2.0"             --> doFloat
    , className =? "Transmission-gtk"        --> doFloat
    , className =? "Blueberry.py"            --> doFloat
    , className =? "Tor Browser"             --> doFloat
    , className =? "Gufw.py"                 --> doFloat
    , className =? "Lxterminal"              --> doFloat
    , className =? "Peek"                    --> doFloat
    , className =? "Xfce4-settings-manager"  --> doFloat
    , className =? "Xfce4-power-manager"     --> doFloat
    , className =? "Urxvt"                   --> doFloat
    , className =? "Blueman-manager"         --> doFloat
    , className =? "Software-properties-gtk" --> doFloat
    , className =? "mpv"                     --> doFloat
    , className =? "confirm"                 --> doFloat
    , className =? "file_progress"           --> doFloat
    , className =? "dialog"                  --> doFloat
    , className =? "download"                --> doFloat
    , className =? "error"                   --> doFloat
    , className =? "Gimp"                    --> doFloat
    , className =? "notification"            --> doFloat
    , className =? "pinentry-gtk-2"          --> doFloat
    , className =? "splash"                  --> doFloat
    , className =? "toolbar"                 --> doFloat
    , resource  =? "desktop_window"          --> doIgnore
    , resource  =? "kdesktop"                --> doIgnore
    , isFullscreen -->  doFullFloat
    ]

-- }}}

-- {{{ Misc stuff

-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook = mempty

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
myLogHook = return ()

------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook = do
    spawnOnce "$HOME/.xmonad/autostart.sh"
    setWMName "xmonad"

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
main :: IO ()
main = do

    xmonad $ ewmh $ docks $ defaults

-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
defaults = def {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = insertPosition End Newer <+> myManageHook,
        handleEventHook    = myEventHook <+> ewmhDesktopsEventHook <+> fullscreenEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
    }

    `additionalKeysP`
    [
    ("M-S-r", spawn "xmonad --recompile; xmonad --restart; notify-send 'Xmonad Reloaded'")
    ]
-- }}}
