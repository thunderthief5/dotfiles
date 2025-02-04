# My guide to using a tiling WM

### Must have apps  
While Tiling WMs are lightweight and highly configurable, they still lack a lot of functionality that comes built into most full-fledged DEs. Eg: Setting wallpapers, managing the lock screen and power management etc.  

I use the following apps to take care of all that stuff. You may find their respective startup commands in the config files.

**Wallpaper Manager:** nitrogen  
Helps you set wallpapers

**Compositor:** picom  
While picom itself works great and is sufficient for most users, if you need rounded corners and blurred windows I'd suggest using picom [fork by ibhagwan](https://github.com/ibhagwan/picom).  

**Network Manager:** nm-applet  
Gives you a wifi menu and a tray applet to configure your networks.  

**Power Manager:** xfce4-power-manager  
For managing power and sleep settings, lid actions and backlight settings if you are using a laptop  

**Settings Manager:** xfce4-settings   
You can use it to configure the themes, fonts, display settings, mouse and touchpad settings etc. Start it along with your wm using `xfsettingsd` command.

**Lock Screen:** i3lock and xautolock   
`xautolock -time 10 -locker i3lock -corners 00-0`  
This command will set the lockscreen timer to 10 mins and will not lock the screen if the cursor is moved to the bottom left corner. Helps if you are watching a video and not want to have the screen lock suddenly.  

**Volume Manager:** volumeicon  
Gives you a tray icon and lets you change volume using the volume keys.  

**Notification daemon**: dunst  
Takes care of notifications. 

**Bar**: polybar  
Highly configurable and looks great.

**App Launcher:** rofi  
Its just not an app launcher. It does quite a lot of other things too. 

**Polkit**: polkit-gnome  
Polkit is used for controlling system-wide privileges. Helps you mount internal partitions etc. 
Start it by putting `/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1` in your autostart scripts. The path may change depending on your distro.  

**Misc startup commands:**  
`xsetroot -cursor_name left_ptr` Sets your cursor right.  
`xrdb ~/.Xresources` If you are using xterm or rxvt-unicode, it loads their config on startup.  

These are the packages I install on my every tiling WM setup. They are all lightweight and they add quite a lot of functionality and ease of use to the system.  
