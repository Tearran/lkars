#!/usr/bin/bash

#Download source files
get_src(){
( [ ! -d "$HOME/.lkars/src/lkars-config/" ]   && git clone https://github.com/Tearran/lkars-config.git "$HOME/.lkars/src/lkars-config" || echo "pass" )
( [ ! -d "$HOME/.lkars/src/python_skelly/" ]  && git clone https://github.com/Tearran/python_skelly.git "$HOME/.lkars/src/python_skelly" || echo "pass" )
( [ ! -d "$HOME/.lkars/src/luma.examples/" ]  && git clone https://github.com/rm-hull/luma.examples.git "$HOME/.lkars/src/luma.examples" || echo "pass" )
( [ ! -d "$HOME/.lkars/src/led-shim/" ]       && git clone https://github.com/pimoroni/led-shim.git "$HOME/.lkars/src/led-shim" || echo "pass" )
( [ ! -d "$HOME/.lkars/src/sense_hat_demo/" ] && git clone https://github.com/Tearran/sense_hat_demo.git "$HOME/.lkars/src/sense_hat_demo" || echo "pass" )
}

# Set up virtual environment? 
set_vertenv(){
( [   -d "$HOME/.lkars/" ] && python3 -m venv .lkars )  ||  ( echo "venv activate error" )
( [   -f "$HOME/.lkars/bin/activate" ] && source "$HOME/.lkars/bin/activate" || echo "venv activate error" )
}

# Build Frame Buffer copy (fbcp)
build_fbcp(){
( [ ! -d "$HOME/.lkars/src/fbcp/" ] && git clone https://github.com/Tearran/fbcp-ili9341.git  "$HOME/.lkars/src/fbcp" || echo "pass" )
( [ ! -f /usr/bin/cmake ] && sudo apt install cmake -y ) || ( echo "cmake installed" )
( [ -d "$HOME/.lkars/src/fbcp/" ] && mkdir "$HOME/.lkars/src/fbcp/build" ) && ( cd "$HOME/.lkars/src/fbcp/build/" && cmake -Wno-dev -DST7735SW=ON -DGPIO_TFT_BACKLIGHT=16 -DGPIO_TFT_RESET_PIN=21 -DGPIO_TFT_DATA_CONTROL=20 -DSPI_BUS_CLOCK_DIVISOR=30 -DSTATISTICS=0 -DDISPLAY_SWAP_BGR=ON -DDISPLAY_INVERT_COLORS=OFF .. )
#( [ -d "$HOME/.lkars/src/fbcp/" ] && mkdir "$HOME/.lkars/src/fbcp/build" ) && ( cd "$HOME/.lkars/src/fbcp/build/" && cmake -Wno-dev -DST7735R=ON -DGPIO_TFT_BACKLIGHT=16 -DGPIO_TFT_RESET_PIN=21 -DGPIO_TFT_DATA_CONTROL=20 -DSPI_BUS_CLOCK_DIVISOR=30 -DSTATISTICS=0 -DDISPLAY_SWAP_BGR=ON -DDISPLAY_INVERT_COLORS=OFF .. )
#( [ -d "$HOME/.lkars/src/fbcp/" ] && mkdir "$HOME/.lkars/src/fbcp/build" ) && ( cd "$HOME/.lkars/src/fbcp/build/" && cmake -Wno-dev -DPIRATE_AUDIO_ST7789_HAT=ON -DSPI_BUS_CLOCK_DIVISOR=30 -DBACKLIGHT_CONTROL=ON -DUSE_DMA_TRANSFERS=OFF -DSTATISTICS=0 .. )
#( [ -d "$HOME/.lkars/src/fbcp/" ] && mkdir "$HOME/.lkars/src/fbcp/build" ) && ( cd "$HOME/.lkars/src/fbcp/build/" && cmake -Wno-dev -DWAVESHARE_ST7789VW_HAT=ON -DSPI_BUS_CLOCK_DIVISOR=30 -DBACKLIGHT_CONTROL=ON -DUSE_DMA_TRANSFERS=OFF -DSTATISTICS=0 .. )
( cd "$HOME/.lkars/src/fbcp/build/" && make -j ) 
( [ -f "$HOME/.lkars/src/fbcp/build/fbcp-ili9341" ] || echo "error building fbcp" ) && (  sudo cp "$HOME/.lkars/src/fbcp/build/fbcp-ili9341" "/usr/bin/fbcp" || echo "error cp bin/fbcp" )

cat <<EOF > "$HOME/.lkars/src/lkars-config/fbcpd.service"
[Unit]
Description=Starts Frambuffer copy
DefaultDependencies=false          
                                 
[Service]
Type=simple
ExecStart=fbcp
WorkingDirectory=/usr/bin/

[Install]
WantedBy=local-fs.target
EOF

sudo cp "$HOME/.lkars/src/lkars-config/fbcpd.service" /etc/systemd/system/ ;
sudo systemctl enable fbcpd.service ;
sudo systemctl start fbcpd.service ;
echo sudo systemctl stop fbcpd.service ;
}

default_bootconfig(){
cd "$HOME/" || exit
cat << OSEOF > config.txt
# For more options and information see
# http://rpf.io/configtxt
# Some settings may impact device functionality. See link above for details
# uncomment if you get no picture on HDMI for a default "safe" mode
#hdmi_safe=1
# uncomment this if your display has a black border of unused pixels visible
# and your display can output without overscan
disable_overscan=1
# uncomment the following to adjust overscan. Use positive numbers if console
# goes off screen, and negative if there is too much border
#overscan_left=16
#overscan_right=16
#overscan_top=16
#overscan_bottom=16
# uncomment to force a console size. By default it will be display's size minus
# overscan.
#framebuffer_width=1280
#framebuffer_height=720
# uncomment if hdmi display is not detected and composite is being output
#hdmi_force_hotplug=1
# uncomment to force a specific HDMI mode (this will force VGA)
#hdmi_group=1
#hdmi_mode=1
# uncomment to force a HDMI mode rather than DVI. This can make audio work in
# DMT (computer monitor) modes
#hdmi_drive=2
# uncomment to increase signal to HDMI, if you have interference, blanking, or
# no display
#config_hdmi_boost=4
# uncomment for composite PAL
#sdtv_mode=2
#uncomment to overclock the arm. 700 MHz is the default.
#arm_freq=800
# Uncomment some or all of these to enable the optional hardware interfaces
#dtparam=i2c_arm=on
#dtparam=i2s=on
#dtparam=spi=on
# Uncomment this to enable infrared communication.
#dtoverlay=gpio-ir,gpio_pin=17
#dtoverlay=gpio-ir-tx,gpio_pin=18
# Additional overlays and parameters are documented /boot/overlays/README
# Enable audio (loads snd_bcm2835)
dtparam=audio=on
[pi4]
# Enable DRM VC4 V3D driver on top of the dispmanx display stack
dtoverlay=vc4-fkms-v3d
max_framebuffers=2
[all]
#dtoverlay=vc4-fkms-v3d
##########################
# Restore Complete!
#########################
OSEOF

sudo rm /boot/config.txt
sudo mv "$HOME/config.txt" /boot/config.txt
echo "Restore Complete!"

}

fbcp_bootconfig(){
cd "$HOME/" || exit
cat << OSEOF > config.txt
# Enable audio (loads snd_bcm2835)
dtparam=audio=off
#Remove black border
#disable_overscan=1
#fbcp settings 128x160 60hz
hdmi_group=2
hdmi_mode=87
hdmi_cvt=128 160 60 1 0 0 0
hdmi_force_hotplug=1
#I2C
dtparam=i2c_arm=on
#SPI if fbcp is used, SPI should be turned off.
dtparam=spi=off

OSEOF

( cd /boot/ && sudo mv /boot/config.txt /boot/config.bak )
echo "Back up exitsing config"
( cd /boot/ && sudo mv "$HOME/config.txt" /boot/config.txt )
echo "fbcp settings"

}


main(){
clear
cd "$HOME" || return
# Uncomment next line to keep bash history ( helpfull for bash dev )
( [ -f "$HOME/.bash_logout" ] &&  mv "$HOME/.bash_logout" "$HOME/.bash_logout-back" || echo ".bash_logout-back, No action needed." )

[[ "$(read -e -p 'Update apt info? [y/N]> '; echo $REPLY)" == [Yy]* ]] && sudo apt-get update || echo Passing

[[ "$(read -e -p 'Download Source? [y/N]> '; echo $REPLY)" == [Yy]* ]] && get_src || echo Passing

[[ "$(read -e -p 'Set virtual environment? [y/N]> '; echo $REPLY)" == [Yy]* ]] && set_vertenv || echo Passing

( [[ "$(read -e -p 'Build Frame Buffer copy (fbcp)? [y/N]> '; echo $REPLY)" == [Yy]* ]] && build_fbcp ) && ( cd "$HOME/.lkars/" && fbcp_bootconfig ) || echo Passing

#[[ "$(read -e -p 'Reboot? [y/N]> '; echo $REPLY)" == [Yy]* ]] && sudo reboot || echo "Reboot to complete"
}

main
