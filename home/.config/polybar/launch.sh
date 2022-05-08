#!/usr/bin/env bash

# █░░ ▄▀█ █░█ █▄░█ █▀▀ █░█ ░ █▀ █░█
# █▄▄ █▀█ █▄█ █░▀█ █▄▄ █▀█ ▄ ▄█ █▀█

killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar > /dev/null; do sleep 1; done

desktop=$(echo $DESKTOP_SESSION)
count=$(xrandr --query | grep " connected" | cut -d" " -f1 | wc -l)
wifi=$(echo /sys/class/net/*/wireless | awk -F'/' '{ print $5 }')

case $desktop in

    i3|/usr/share/xsessions/i3)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        WIRELESS_INTERFACE=$wifi MONITOR=$m polybar --reload i3bar -c ~/.config/polybar/config.ini &
      done
    else
    polybar --reload i3bar -c ~/.config/polybar/config.ini &
    fi
    ;;

    openbox|/usr/share/xsessions/openbox)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
       WIRELESS_INTERFACE=$wifi MONITOR=$m polybar --reload opbar -c ~/.config/polybar/config.ini &
      done
    else
    polybar --reload opbar -c ~/.config/polybar/config.ini &
    fi
    ;;

    bspwm|/usr/share/xsessions/bspwm)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        WIRELESS_INTERFACE=$wifi MONITOR=$m polybar --reload bspbar -c ~/.config/polybar/config.ini &
      done
    else
    polybar --reload bspbar -c ~/.config/polybar/config.ini &
    fi
    ;;

    herbstluftwm|/usr/share/xsessions/herbstluftwm)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        WIRELESS_INTERFACE=$wifi MONITOR=$m polybar --reload hlbar -c ~/.config/polybar/config.ini &
      done
    else
    polybar --reload hlbar -c ~/.config/polybar/config.ini &
    fi
    ;;

    qtile|/usr/share/xsessions/qtile)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        WIRELESS_INTERFACE=$wifi MONITOR=$m polybar --reload qbar -c ~/.config/polybar/config.ini &
      done
    else
    polybar --reload qbar -c ~/.config/polybar/config.ini &
    fi
    ;;

    xmonad|/usr/share/xsessions/xmonad)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        WIRELESS_INTERFACE=$wifi MONITOR=$m polybar --reload xmobar -c ~/.config/polybar/config.ini &
      done
    else
    polybar --reload xmobar -c ~/.config/polybar/config.ini &
    fi
    ;;
esac
