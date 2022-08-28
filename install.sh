#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi


#Aura Install
pacman -Sy git --noconfirm
git clone https://aur.archlinux.org/aura-bin.git
cd aura-bin
makepkg -s

aura_file=$(find . -type f -name "aura-*")

aura_file="${aura_file#??}"

echo "$aura_file"

sudo pacman -U "$aura_file"

#QEMU & KVM Install
#Working
pacman -S qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat --noconfirm
pacman -S ebtables iptables --noconfirm
systemctl enable libvirtd.service
sudo usermod -a -G libvirt $(whoami)
systemctl restart libvirtd.service


#Install Flatpak
pacman -S flatpak

#Install Flathub Packages
flatpak install flathub com.obsproject.Studio com.valvesoftware.Steam net.davidotek.pupgui2 com.visualstudio.code com.discordapp.Discord flatpak install flathub net.lutris.Lutris com.usebottles.bottles -y
flatpak install flathub us.zoom.Zoom org.onlyoffice.desktopeditors org.videolan.VLC -y

#Install Github Desktop
aura -A github-desktop

echo Done