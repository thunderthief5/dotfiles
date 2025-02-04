# Debian: Things To Do  

Some of the stuff I do after a fresh install of Debian.  

**Update apt**  
`sudo apt update`

**Install basic packages**  
`sudo apt install stow vim htop neofetch exa lolcat bat neovim zsh git curl uget wget ufw gufw fish`

**Install starship https://starship.rs/**  
`sh -c "$(curl -fsSL https://starship.rs/install.sh)"`

**Stow dotfiles**  
`cd dotfiles/`  
`stow -v --adopt home/`  

**Enable firewall**  
`sudo ufw enable`  
`systemctl enable ufw`  

**Download Bibata cursors from https://github.com/ful1e5/Bibata_Cursor/releases**  
`sudo cp -iv Bibata-Modern-Classic /usr/share/icons/`  
`sudo mv Bibata-* /usr/share/icons/`  

**Load gnome-terminal profile**  
`gt-load`   


**Remove all gnome games**  
`sudo apt-get purge gnome-2048 aisleriot atomix gnome-chess five-or-more hitori iagno gnome-klotski lightsoff gnome-mahjongg gnome-mines gnome-nibbles quadrapassel four-in-a-row gnome-robots gnome-sudoku swell-foop tali gnome-taquin gnome-tetravex`  

**Remove all un-needed packages**  
`sudo apt purge gnome-{weather,maps,todo,sound-recorder,documents,software,contacts,music} rhythmbox evolution thunderbird shotwell transmission-gtk`  

`sudo apt purge task-gnome-desktop task-* libreoffice-* mlterm xiterm+* mlterm-*`  

**Autoremove any orphans**  
`sudo apt autoremove --purge`  

`sudo apt install x11-apps x11-session-utils xinit xorg`  

**Finally update and upgrade**  
`sudo apt update && sudo apt upgrade`  

**Install papirus from https://github.com/PapirusDevelopmentTeam/papirus-icon-theme**  
`wget -qO- https://git.io/papirus-icon-theme-install | sh`  
