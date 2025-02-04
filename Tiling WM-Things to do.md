# My Guide to Using a Tiling WM  

Tiling WMs are lightweight and highly configurable, but they lack some built-in functionality that most full-fledged DEs offer—such as setting wallpapers, managing the lock screen, and handling power management.  

I use the following apps to handle these features. Their respective startup commands can be found in the config files.  

---

## 🔧 Must-Have Apps  

### 🖼️ **Wallpaper Manager**: `nitrogen`  
Helps you set wallpapers.  

### 🎨 **Compositor**: `picom`  
- Provides transparency and shadows.  
- For rounded corners and blurred windows, use the [ibhagwan fork](https://github.com/ibhagwan/picom).  

### 📶 **Network Manager**: `nm-applet`  
Gives you a WiFi menu and a tray applet for network configuration.  

### 🔋 **Power Manager**: `xfce4-power-manager`  
Handles power, sleep settings, lid actions, and backlight adjustments (for laptops).  

### ⚙️ **Settings Manager**: `xfce4-settings`  
- Configure themes, fonts, display settings, mouse, and touchpad settings.  
- Start with:  
  ```sh
  xfsettingsd
  ```

### 🔒 **Lock Screen**: `i3lock` + `xautolock`  
- Start with:  
  ```sh
  xautolock -time 10 -locker i3lock -corners 00-0
  ```
- Locks the screen after **10 minutes**.  
- Prevents locking if the cursor is in the **bottom-left corner** (useful while watching videos).  

### 🔊 **Volume Manager**: `volumeicon`  
Provides a system tray icon and enables volume control using volume keys.  

### 🔔 **Notification Daemon**: `dunst`  
Handles notifications.  

### 📊 **Bar**: `polybar`  
Highly configurable and visually appealing.  

### 🚀 **App Launcher**: `rofi`  
More than just an app launcher—it can do a lot more.  

### 🔑 **Polkit**: `polkit-gnome`  
- Controls system-wide privileges (e.g., mounting internal partitions).  
- Start with:  
  ```sh
  /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
  ```
  *(Path may vary depending on your distro.)*  

---

## ⚡ Miscellaneous Startup Commands  

```sh
xsetroot -cursor_name left_ptr  # Sets your cursor correctly.  
xrdb ~/.Xresources  # Loads xterm/rxvt-unicode config on startup.  
```

---

These are the packages I install for every tiling WM setup. They are lightweight but significantly improve functionality and usability. 🚀  