# debian-i3gaps-from-scratch

### Aim of this project is to have a shell script that will transform clean install of Debian Stretch
### into a fully working configured system.

#### What it does, step by step ? (run.sh):

1. Adds multi-arch support
2. Installs basic packages from repositories:
`i3 suckless-tools i3blocks xorg software-properties-common devscripts snapd file-roller zsh pcmanfm leafpad eog pulseaudio pavucontrol alsa-utils gdebi numix-gtk-theme numix-icon-theme screenfetch feh conky build-essential gtk2-engines-murrine gtk2-engines vim ranger caca-utils highlight atool w3m poppler-utils mediainfo compton gparted git python-pip libcanberra-gtk-module curl wget apt-transport-https dirmngr`
3. Copy new sources.list to /etc/apt/, new sources.list uses "deb.debian.org" (Fast Server Select) service, and have included
Contrib and non-free components, needed for compiling stuff later on.

#### Installation:

comment out

#### Keybindings:
