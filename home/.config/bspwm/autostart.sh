#!/usr/bin/env bash

# Autostart
startup_lock_file=/tmp/bspwm-startup.lock
if [ ! -f $startup_lock_file ]; then
  echo "dummy" > $startup_lock_file
#picom --config ~/.config/picom/picom.conf -b &
picom &
xsetroot -cursor_name left_ptr &
sleep 1 && nm-applet &
#plank &
#tint2 &
/usr/libexec/polkit-gnome-authentication-agent-1 &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
~/.config/polybar/launch.sh &
ffplay -nodisp -autoexit -loglevel quiet ~/.local/share/sounds/Startup-XboxOne.mp3 &
dunst &
xfce4-power-manager &
xfsettingsd &
nitrogen --restore &
sleep 5 && volumeicon &
xautolock -time 10 -locker blurlock -corners 00-0 &
xrdb ~/.Xresources &
fi

