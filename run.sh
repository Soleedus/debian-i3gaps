#!/bin/sh

sudo dpkg --add-architecture i386

sudo apt update && sudo apt upgrade -y

sudo apt install curl wget apt-transport-https dirmngr

### copying sources.list
sudo rsync -a etc/apt/sources.list /etc/apt/

sudo apt update && sudo apt upgrade -y

### installing packages
sudo apt install -f -y i3 suckless-tools i3blocks xorg software-properties-common fonts-font-awesome fonts-roboto devscripts file-roller zsh pcmanfm leafpad pulseaudio pavucontrol alsa-utils gdebi numix-gtk-theme screenfetch feh build-essential gtk2-engines-murrine gtk2-engines vim ranger caca-utils highlight atool w3m poppler-utils mediainfo compton python-pip libcanberra-gtk-module

### creating dirs like "Pictures", "Downloads" etc.
xdg-user-dirs-update

### creating dirs
mkdir ~/.config/
mkdir ~/.themes/
mkdir ~/.fonts/

### zsh shell
chsh -s $(which zsh)

### paper icons
wget https://launchpad.net/~snwh/+archive/ubuntu/pulp/+files/paper-icon-theme_1.4+r696~daily~ubuntu16.04.1_all.deb
sudo gdebi paper*.deb

### qutebrowser
wget http://ftp.us.debian.org/debian/pool/main/p/pypeg2/python3-pypeg2_2.15.2-2_all.deb
wget http://ftp.us.debian.org/debian/pool/main/q/qutebrowser/qutebrowser_1.6.1-2_all.deb
wget http://ftp.us.debian.org/debian/pool/main/q/qutebrowser/qutebrowser-qtwebengine_1.6.1-2_all.deb
wget http://ftp.us.debian.org/debian/pool/main/q/qutebrowser/qutebrowser-qtwebkit_1.6.1-2_all.deb
sudo gdebi python3-pypeg2_*_all.deb
sudo gdebi qutebrowser*.deb

### copying theme
rsync -a .themes/oomox-BrightNight ~/.themes/

### wallpaper
sudo rsync -a Pictures/Wallpapers/ /usr/share/wallpapers/

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
rsync -a .xinitrc ~/
rsync -a .config/ ~/.config/

### termite installer
chmod +x sh/termite.sh
sh/./termite.sh

### oh-my-zsh theme for zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
