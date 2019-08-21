#!/bin/bash
cd /home/$USER
mkdir RTL-Driver-Installer-Files
cd RTL-Driver-Installer-Files
#!/bin/bash
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=7
BACKTITLE="RTL-Driver-Installer 1.5"
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

        1) echo arch deps
            ;;
        2) 
echo -e "\e[40;38;5;82m Installing dependencies for solus \e[30;48;5;82m\e[0m"
sudo eopkg it gcc binutils git make
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=2
BACKTITLE="RTL-Driver-Installer 1.5"
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
        3) echo ubuntu
            ;;
        4) echo Sabayon 
            ;;
        5) echo opensuse
            ;;
        6) echo uninstallation
            ;;
esac
#!/bin/bash
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=5
BACKTITLE="RTL-Driver-Installer 1.5"
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
case $CHOICE in
        1)
            ;;
        2)
            ;;
        3)
            ;;
        4)
            ;;
        5)
echo -e "\e[40;38;5;82m Downloading driver \e[30;48;5;82m\e[0m"
git clone https://github.com/ulli-kroll/rtl8188fu
cd rtl8188fu
echo -e "\e[40;38;5;82m Building driver \e[30;48;5;82m\e[0m"
make
echo -e "\e[40;38;5;82m Installing driver \e[30;48;5;82m\e[0m"
sudo make install
sudo modprobe cfg80211
echo -e "\e[40;38;5;82m Cleanup & make the driver ready for an reinstallation \e[30;48;5;82m\e[0m"
rm -d -r rtl8188fu
git clone https://github.com/ulli-kroll/rtl8188fu
esac
