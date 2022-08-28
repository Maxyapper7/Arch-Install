#!/bin/bash

#Aura Install
sudo pacman -Sy git --noconfirm
git clone https://aur.archlinux.org/aura-bin.git
cd aura-bin
makepkg -s

aura_file=$(find . -type f -name "aura-bin*")

aura_file="${aura_file#??}"

echo "$aura_file"

sudo pacman -U "$aura_file"

#Start Other Script
sudo ./pkg-install.sh

echo Done