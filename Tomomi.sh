#!/bin/bash
NAME=Tomomi
VER=1.5
SD=$(pwd)
echo -e "\e[32mCopyright (c) 2019, Alexander Vereeken All rights reserved."
echo -e "\e[93mWelcome to $NAME $VER have fun!"

Selection=$(zenity --list --radiolist --height=300 --width 300 --title="$NAME $VER" --text "Please work through this list one by one" --hide-header --column "$NAME" --column "Item" FALSE "Select distro" FALSE "Select driver" FALSE "" FALSE "About" FALSE "Exit")

if [[ $Selection == *"Select distro"* ]]; then

Distro=$(zenity --list --radiolist --height=300 --width 300 --title="$NAME $VER" --text "Now select a distro" --hide-header --column "$NAME" --column "Item" FALSE "Arch/Manjaro/Antergos" FALSE "Solus" FALSE "Ubuntu" FALSE "Sabayon" FALSE "OpenSUSE" FALSE "Exit")

PASSWORD=$(zenity --password --title "The Script will now install the requiered dependencies.Enter your password to proceed")

if [[ $Distro == *"Arch"* ]]; then
echo VIP
fi


if [[ $Distro == *"Solus"* ]]; then
echo $PASSWORD | sudo -S "eopkg it gcc binutils git make"
SKH=$(zenity --list --radiolist --height=300 --width 300 --title="$NAME $VER" --text "What kernel headers do you want to install?" --hide-header --column "$NAME" --column "Item" FALSE "Current" FALSE "LTS")

if [[ $SKH == *"Current"* ]]; then
echo $PASSWORD | sudo -S "eopkg it linux-current-headers"
fi

if [[ $SKH == *"LTS"* ]]; then
echo $PASSWORD | sudo -S "eopkg it linux-lts-headers"
fi
fi

if [[ $Distro == *"Ubuntu"* ]]; then
echo $PASSWORD | sudo -S "command"
fi

if [[ $Distro == *"Sabayon"* ]]; then
echo $PASSWORD | sudo -S "command"
fi

if [[ $Distro == *"OpenSUSE"* ]]; then
echo $PASSWORD | sudo -S "command"
fi
fi

if [[ $Selection == *"Select driver"* ]]; then
cd /home/$USER
mkdir /home/$USER/$NAME
cd /home/$USER/$NAME
DRV=$(zenity --list --radiolist --height=300 --width 300 --title="$NAME $VER" --text "What driver?" --hide-header --column "$NAME" --column "Item" FALSE "RTL8812au" FALSE "RTL8188/eu/s/etv" FALSE "RTL8821ce" FALSE "RTL8723de" FALSE "RTL8188fu")

if [[ $DRV == *"RTL8812au"* ]]; then
echo WIP
fi

if [[ $DRV == *"RTL8188/eu/s/etv"* ]]; then
echo WIP
fi

if [[ $DRV == *"RTL8821ce"* ]]; then
echo WIP
fi

if [[ $DRV == *"RTL8723de"* ]]; then
GB=$(zenity --list --radiolist --height=300 --width 300 --title="$NAME $VER" --text "The driver $DRV has several branches which do you want to use?" --hide-header --column "$NAME" --column "Item" FALSE "4.10-down" FALSE "4.11-up" FALSE "4.15-up" FALSE "5.0-up")
echo -e "\e[40;38;5;82mDownloading driver\e[30;48;5;82m\e[0m"
git clone --single-branch --branch $GB https://github.com/smlinux/rtl8723de.git
cd rtl8723de
echo -e "\e[40;38;5;82m Building driver \e[30;48;5;82m\e[0m"
make
echo -e "\e[40;38;5;82m Installing driver \e[30;48;5;82m\e[0m"
sudo make install
sudo modprobe 8723de
echo -e "\e[40;38;5;82mDone :) \e[30;48;5;82mYou can now use your wifi adapter!\e[0m"
cd /home/$USER/Tomomi
rm -d- -r rtl8723de
fi

if [[ $DRV == *"RTL8188fu"* ]]; then
echo WIP
fi
fi
cd $SD
bash Tomomi.sh
