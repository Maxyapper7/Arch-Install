#!/bin/bash

#Install Flathub Packages
flatpak install flathub com.obsproject.Studio com.valvesoftware.Steam net.davidotek.pupgui2 com.visualstudio.code com.discordapp.Discord flatpak install flathub net.lutris.Lutris com.usebottles.bottles -y
flatpak install flathub us.zoom.Zoom org.onlyoffice.desktopeditors org.videolan.VLC -y

#Aura Install
pacman -Sy git --noconfirm
git clone https://aur.archlinux.org/aura-bin.git
cd aura-bin
makepkg -s

aura_file=$(find . -type f -name "aura-*")

sudo pacman -U "$aura_file"

#QEMU & KVM Install
pacman -S qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat --noconfirm
pacman -S ebtables iptables --noconfirm
systemctl enable libvirtd.service
sudo usermod -a -G libvirt $(whoami)
systemctl restart libvirtd.service

echo Done