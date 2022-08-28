
#QEMU & KVM Install
#Working
pacman -S qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat --noconfirm
pacman -S ebtables iptables --noconfirm
systemctl enable libvirtd.service
usermod -a -G libvirt $(whoami) --noconfirm
systemctl restart libvirtd.service


#Install Flatpak
pacman -S flatpak --noconfirm

#Install Flathub Packages
flatpak install flathub com.obsproject.Studio com.valvesoftware.Steam net.davidotek.pupgui2 com.visualstudio.code com.discordapp.Discord flatpak install flathub net.lutris.Lutris com.usebottles.bottles -y
flatpak install flathub us.zoom.Zoom org.onlyoffice.desktopeditors org.videolan.VLC -y

#Install Github Desktop
aura -A github-desktop
