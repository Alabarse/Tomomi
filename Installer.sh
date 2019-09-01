#!/bin/bash
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=7
BACKTITLE="Tomomi 1.5"
TITLE="Welcome $USER :)"
MENU="Choose one of the following distros or options"

OPTIONS=(1 "Arch/Manjaro/Antergos"
         2 "Solus"
         3 "Ubuntu"
         4 "Sabayon"
         5 "OpenSUSE"
         6 "Uninstallation"
	 7 "Reinstallation")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in

        1)
echo -e "\e[40;38;5;82m Installing dependencies \e[30;48;5;82m\e[0m"
sudo pacman -S bc git linux-headers
            ;;
        2) 
echo -e "\e[40;38;5;82mInstalling dependencies for solus\e[30;48;5;82m\e[0m"
sudo eopkg it gcc binutils git make
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=2
BACKTITLE="Tomomi 1.5"
TITLE="Question about Solus Kernel"
MENU="What kernel do you use?"

OPTIONS=(1 "Current"
         2 "LTS")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
sudo eopkg it linux-current-headers
;;
        2)
sudo eopkg it linux-lts-headers
esac
            ;;
        3)
echo -e "\e[40;38;5;82m Installing dependencies \e[30;48;5;82m\e[0m"
sudo apt install -y git build-essential make autoconf libtool gcc gettext
            ;;
        4)
echo -e "\e[40;38;5;82m Installing dependencies\e[30;48;5;82m\e[0m" 
sudo equo install gcc --ask
            ;;
        5)
echo -e "\e[40;38;5;82mInstalling dependencies\e[30;48;5;82m\e[0m"  
sudo zypper install make kernel-source
            ;;
        6) echo uninstallation is coming soon again
bash
            ;;
        7) echo reinstallation is coming soon again
bash
esac
#!/bin/bash
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=5
BACKTITLE="Tomomi 1.5"
TITLE="Driver"
MENU="What driver do you want to install?"

OPTIONS=(1 "RTL8812au"
         2 "RTL8188eu, RTL8188eus & RTL8188etv"
         3 "RTL8821ce"
         4 "RTL8723de"
         5 "RTL8188fu")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
cd /home/$USER
mkdir Tomomi-Files
cd Tomomi-Files
case $CHOICE in

        1)
echo -e "\e[40;38;5;82mDownloading driver\e[30;48;5;82m\e[0m"
git clone https://github.com/gordboy/rtl8812au
cd rtl8812au
echo -e "\e[40;38;5;82m Building driver \e[30;48;5;82m\e[0m"
make
echo -e "\e[40;38;5;82m Installing driver \e[30;48;5;82m\e[0m"
sudo make install
sudo modprobe 8812au
echo -e "\e[40;38;5;82mDone :) \e[30;48;5;82mYou can now use your wifi adapter!\e[0m"
cd /home/$USER/Tomomi-Files
rm -d -r rtl8812au
git clone https://github.com/gordboy/rtl8812au
            ;;
        2)
echo -e "\e[40;38;5;82mDownloading driver\e[30;48;5;82m\e[0m"
git clone https://github.com/quickreflex/rtl8188eus
cd rtl88eus
echo -e "\e[40;38;5;82m Building driver \e[30;48;5;82m\e[0m"
make all
echo -e "\e[40;38;5;82m Installing driver \e[30;48;5;82m\e[0m"
sudo make install
sudo modprobe 8188eu
echo -e "\e[40;38;5;82m Done :) \e[30;48;5;82m You can now use your wifi adapter! \e[0m"
echo -e "\e[40;38;5;82mCleanup & make the driver ready for an reinstallation\e[30;48;5;82m\e[0m"
cd /home/$USER/Tomomi-Files
rm -d -r rtl88eus
git clone https://github.com/quickreflex/rtl8188eus
            ;;
        3)
echo -e "\e[40;38;5;82mDownloading driver\e[30;48;5;82m\e[0m"
git clone https://github.com/tomaspinho/rtl8821ce
cd rtl8821ce
echo -e "\e[40;38;5;82m Building driver \e[30;48;5;82m\e[0m"
make
echo -e "\e[40;38;5;82m Installing driver \e[30;48;5;82m\e[0m"
sudo make install
sudo modprobe 8821ce
echo -e "\e[40;38;5;82mDone :) \e[30;48;5;82mYou can now use your wifi adapter!\e[0m"
cd /home/$USER/Tomomi-Files
rm -d- -r rtl8821ce
git clone https://github.com/tomaspinho/rtl8821ce
            ;;
        4)
echo -e "\e[40;38;5;82mDownloading driver\e[30;48;5;82m\e[0m"
git clone git clone https://github.com/smlinux/rtl8723de.git
cd rtl8723de
echo -e "\e[40;38;5;82m Building driver \e[30;48;5;82m\e[0m"
make
echo -e "\e[40;38;5;82m Installing driver \e[30;48;5;82m\e[0m"
sudo make install
sudo modprobe 8723de
echo -e "\e[40;38;5;82mDone :) \e[30;48;5;82mYou can now use your wifi adapter!\e[0m"
cd /home/$USER/Tomomi-Files
rm -d- -r rtl8723de
git clone https://github.com/smlinux/rtl8723de.git
            ;;
        5)
echo -e "\e[40;38;5;82mDownloading driver\e[30;48;5;82m\e[0m"
git clone https://github.com/kelebek333/rtl8188fu
cd rtl8188fu
echo -e "\e[40;38;5;82mBuilding driver\e[30;48;5;82m\e[0m"
make
echo -e "\e[40;38;5;82m Installing driver \e[30;48;5;82m\e[0m"
sudo make install
sudo modprobe rtl8188fu
echo -e "\e[40;38;5;82mCleanup & make the driver ready for an reinstallation\e[30;48;5;82m\e[0m"
cd /home/$USER/Tomomi-Files
rm -d -r rtl8188fu
git clone https://github.com/kelebek333/rtl8188fu
esac
