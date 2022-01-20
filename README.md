# ThunderThief's Dotfiles

## What do I use to organize my dotfiles?

I use `stow` (GNU Stow). It is available on almost every distro.

1. Install stow using your package manager.  

2. Clone this repo  
`git clone https://github.com/thunderthief5/dotfiles.git`

3. Use stow to adopt the home/ folder. This command will place symlinks to all the dotfiles in their appropriate locations in the home directory.  
`cd dotfiles`  
`stow -v --adopt home/`  

4. If you add any new files to your dotfiles folder, you may update it using the restow flag.  
`stow -v --adopt --restow home/`  

## My most used packages

**DE:** Gnome *Whenever I want to take a break from ricing   
**WM:** bspwm, i3, openbox, herbstluftwm, spectrwm  
**Text Editor:** vim, neovim, gedit  
**Terminal Emulator:** gnome-terminal, rxvt-unicode, xterm, alacritty  
**Shell:** bash, zsh, fish  
**Notification daemon:** dunst  
**Dock:** Plank  
**Bar:** Polybar  
**App launcher:** Rofi   
**Media Player:** mpv  

## My guide to using a tiling WM

### Must have apps  
While Tiling WMs are lightweight and highly configurable, they still lack a lot of functionality that comes built into most full-fledged DEs. Eg: Setting wallpapers, managing the lock screen and power management etc. I use the following apps to take care of all that stuff.

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
This command will set the lockscreen timer to 10 mins and will not lock the screen if the cursor is moved to the bottom right corner. Helps if you are watching a video and not want to have the screen lock suddenly.  

**Volume Manager:** volumeicon  
Gives you a tray icon and lets you change volume using the volume keys.  

**Notification daemon**: dunst  
Takes care of notifications. 

**Bar**: Polybar  

**App Launcher:** Rofi  
Its just not an app launcher. It does quite a lot of other things too. 

**Polkit**: polkit-gnome  
Polkit is used for controlling system-wide privileges. Helps you mount internal partitions etc. 
Start it by putting `/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1` in your autostart scripts. The path may change depending on your distro.  

**Misc startup commands:**  
`xsetroot -cursor_name left_ptr` Sets your cursor right.  
`xrdb ~/.Xresources` If you are using xterm or rxvt-unicode, it loads their config on startup.  

