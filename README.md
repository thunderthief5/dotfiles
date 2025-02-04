# ThunderThief's Dotfiles  

A personal collection of dotfiles managed with `stow`, making configuration management easy and efficient.  

---

## Organizing Dotfiles with GNU Stow  

I use **GNU Stow** to manage my dotfiles. It is available on almost every distro. It creates symbolic links, ensuring all configurations stay organized and easily restorable across systems.  

### Installation & Setup  

1. **Install Stow** using your package manager:  
```sh
# Debian/Ubuntu
sudo apt install stow  

# Arch Linux
sudo pacman -S stow  

# Fedora
sudo dnf install stow  
```

2. **Clone this repository**:  
```sh
git clone https://github.com/thunderthief5/dotfiles.git  
```

3. **Use Stow to link the dotfiles**:  
```sh
cd dotfiles  
stow -v --adopt home/
```
This will place symlinks for all dotfiles in their appropriate locations inside `$HOME`.  

4. **Updating dotfiles**:  
Whenever you add new files, update the symlinks with:  
```sh
stow -v --adopt --restow home/
```

---

## Frequently Used Packages  

### Desktop & Window Managers  
- **DE:** GNOME *(for whenever I want to take a break from ricing)*  
- **WM:** bspwm, i3, Openbox, Herbstluftwm, Spectrwm, DWM, Qtile, XMonad  

### Text Editors  
- **vim**, **neovim**, **gedit**  

### Terminal & Shell  
- **Terminal Emulator:** GNOME Terminal, rxvt-unicode, xterm, alacritty  
- **Shell:** Bash, Zsh, Fish  
- **Shell Prompt:** [Starship](https://starship.rs/)  

### UI & Workflow Enhancements  
- **Notification Daemon:** dunst  
- **Dock:** Plank  
- **Bar:** Polybar  
- **App Launcher:** Rofi  

### Multimedia  
- **Media Player:** mpv  

---