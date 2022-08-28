#!/bin/bash
pacman -Sy git --noconfirm
git clone https://aur.archlinux.org/aura-bin.git
cd aura-bin
makepkg -s

aura_file=$(find . -type f -name "aura-*")

aura_file="${aura_file#??}"

echo "$aura_file"

sudo pacman -U "$aura_file"