#!/usr/bin/env bash

#function run {
# if ! pgrep $1 ;
#  then
#    $@&
#  fi
#}
picom &
~/.config/polybar/launch.sh &
sxhkd -c ~/.xmonad/sxhkdrc &
xsetroot -cursor_name left_ptr &
sleep 1 && nm-applet &
/usr/libexec/polkit-gnome-authentication-agent-1 &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
ffplay -nodisp -autoexit -loglevel quiet ~/.local/share/sounds/Startup-XboxOne.mp3 &
dunst &
xfce4-power-manager &
xfsettingsd &
nitrogen --restore &
volumeicon &
xautolock -time 10 -locker blurlock -corners 00-0 &
xrdb ~/.Xresources &

