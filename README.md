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

**DE:** Gnome *Whenever I want to take a break from ricing*   
**WM:** bspwm, i3, openbox, herbstluftwm, spectrwm, dwm, qtile, xmonad  
**Text Editor:** vim, neovim, gedit  
**Terminal Emulator:** gnome-terminal, rxvt-unicode, xterm, alacritty  
**Shell:** bash, zsh, fish  
**Shell prompt:** starship  
**Notification daemon:** dunst  
**Dock:** plank  
**Bar:** polybar  
**App launcher:** Rofi   
**Media Player:** mpv  

