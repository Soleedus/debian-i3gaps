#!/bin/sh

sudo dpkg --add-architecture i386

sudo apt update && sudo apt upgrade -y

sudo apt install curl wget apt-transport-https dirmngr

### copying sources.list
sudo rsync -a etc/apt/sources.list /etc/apt/

sudo apt update && sudo apt upgrade -y

### installing packages
sudo apt install -f -y i3 suckless-tools i3blocks xorg software-properties-common devscripts snapd file-roller zsh pcmanfm leafpad eog pulseaudio pavucontrol alsa-utils gdebi numix-gtk-theme screenfetch feh build-essential gtk2-engines-murrine gtk2-engines vim ranger caca-utils highlight atool w3m poppler-utils mediainfo compton gparted git python-pip libcanberra-gtk-module

### creating dirs
mkdir ~/.config/
mkdir ~/.themes/
mkdir ~/.fonts/

### zsh shell
chsh -s $(which zsh)

### google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo gdebi google-chrome*.deb

### paper icons
wget https://launchpadlibrarian.net/337311622/paper-icon-theme_1.4+r692~daily~ubuntu16.04.1_all.deb
sudo gdebi paper*.deb

### copying theme
rsync -a .themes/oomox-BrightNight ~/.themes/

### wallpaper
sudo rsync -a Pictures/Wallpapers/ /usr/share/wallpapers/

### xorg config with tear free option for intel
sudo rsync -a etc/X11/xorg.conf /etc/X11/

### fonts
rsync -a .fonts ~/
fc-cache

### infinality font rendering (osx option)
sudo dpkg -i infinality/libfreetype-infinality6_2.4.9-3_amd64.deb infinality/freetype-infinality_2.4.9-3_all.deb infinality/fontconfig-infinality_1-2_all.deb
sudo bash /etc/fonts/infinality/infctl.sh setstyle osx

### gaps installer
chmod +x sh/gaps.sh
sh/./gaps.sh

### copying configs
rsync -a .gtkrc-2.0 ~/
rsync -a .config/ ~/.config/

### termite installer
chmod +x sh/termite.sh
sh/./termite.sh

### oh-my-zsh theme for zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
