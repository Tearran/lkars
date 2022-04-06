#!/usr/bin/bash
clear
TERM=ansi
{
theme="dark:0" # Theme setting dark comment to enable system colors

if [ $theme = "dark:0" ]; then
  export NEWT_COLORS='
    root=white,black
    window=white,black
    textbox=white,black
    title=white,black
    listbox=white,black
    sellistbox=black,yellow
    actsellistbox=black,yellow
    border=blue,black
    actbutton=black,green
    '
fi
}

tput cup 0 100  |  whiptail --infobox "Setting things up...." 20 66;
rm -f "$HOME/.bash_logout" # For development; Save the bash history for referance.
whiptail --infobox "Setting Boot to CLI...." 10 100
tput cup 0 100  |  whiptail --infobox "Setting Boot to cli...." 20 66;
#sudo raspi-config nonint do_boot_behaviour B2 # Change to cli auto login
sudo raspi-config nonint do_i2c 1 #enable i2c

# rm -r Bookshelf/ Desktop/ Documents/ Music/ Pictures/ Public/ Templates/ Videos/ Downloads/

tput cup 0 100  |  whiptail --infobox "Update system repository...." 20 66;
sudo apt update
tput cup 0 100  |  whiptail --infobox "Download source code...." 20 66;
sudo apt install -y git cmake python3-pip

echo "........................................."
echo " apt requierments complete" |  whiptail --infobox "apt requierments complete...." 20 66;
echo "........................................."

[ -d "$HOME/.local/" ] ||  mkdir "$HOME/.local/"
[ -d "$HOME/.local/bin/" ] ||  mkdir "$HOME/.local/bin/"
[ -d "$HOME/.local/lib/" ] || mkdir "$HOME/.local/lib/"
[ -d "$HOME/.local/include/" ] ||  mkdir "$HOME/.local/include/"

echo "........................................."
echo " system envoroment complete "  |  whiptail --infobox "system envoroment complete...." 20 66;
echo "........................................."


[ ! -d "$HOME/.local/include/fbcp-ili9341" ] && cd "$HOME/.local/include/" && git clone https://github.com/juj/fbcp-ili9341
#[ ! -d "$HOME/.local/include/fbcp-ili9341" ] && cd "$HOME/.local/include/" && git clone https://github.com/Tearran/fbcp-ili9341.git
[ -d "$HOME/.local/include/fbcp-ili9341/build" ] || cd "$HOME/.local/include/fbcp-ili9341" && mkdir build

echo "........................................."
echo " Framebuffer Copy source Downloaded"   |  whiptail --infobox "Framebuffer Copy source Downloaded...." 20 66;
echo "........................................."

tput cup 0 100  |  whiptail --infobox "Setting Display up...." 20 66;
[ -d "$HOME/.local/include/fbcp-ili9341/build/" ] && cd "$HOME/.local/include/fbcp-ili9341/build/" || exit 1
#[ -d "$HOME/.local/include/fbcp-ili9341/build/" ] && cmake -Wno-dev -DST7735R=ON -DGPIO_TFT_BACKLIGHT=18 -DGPIO_TFT_RESET_PIN=24 -DGPIO_TFT_DATA_CONTROL=23 -DSPI_BUS_CLOCK_DIVISOR=8 -DSTATISTICS=0 -DDISPLAY_SWAP_BGR=ON -DDISPLAY_INVERT_COLORS=OFF ..
#[ -d "$HOME/.local/include/fbcp-ili9341/build/" ] && cd "$HOME/.local/include/fbcp-ili9341/build/" && make -j
#[ ! -f "/usr/bin/fbcp"  ] &&  sudo cp "$HOME/.local/include/fbcp-ili9341/build/fbcp-ili9341" "/usr/bin/fbcp"
#sudo cp "$HOME/.local/include/picorder-config/include/fbcpd.service" /etc/systemd/system/fbcpd.service ;
#sudo systemctl enable fbcpd ;
#sudo systemctl stop fbcpd ; tput cup 0 100
#sudo systemctl start fbcpd ; tput cup 0 100  |  whiptail --infobox "Display server set...." 20 66;
