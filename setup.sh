#!/usr/bin/bash
clear
cd "$HOME" || return
# Uncomment next line to keep bash history ( helpfull for bash dev )
#( [ -f "$HOME/.bash_logout" ]                &&  mv "$HOME/.bash_logout" "$HOME/.bash_logout-back" || echo ".bash_logout-back, No action needed." )

get_src(){
( [ ! -d "$HOME/.lkars/src/lkars-config/" ]   && git clone https://github.com/Tearran/lkars-config.git "$HOME/.lkars/src/lkars-config" || echo "pass" )
( [ ! -d "$HOME/.lkars/src/python_skelly/" ]  && git clone https://github.com/Tearran/python_skelly.git "$HOME/.lkars/src/python_skelly" || echo "pass" )
( [ ! -d "$HOME/.lkars/src/luma.examples/" ]  && git clone https://github.com/rm-hull/luma.examples.git "$HOME/.lkars/src/luma.examples" || echo "pass" )
( [ ! -d "$HOME/.lkars/src/led-shim/" ]       && git clone https://github.com/pimoroni/led-shim.git "$HOME/.lkars/src/led-shim" || echo "pass" )
( [ ! -d "$HOME/.lkars/src/sense_hat_demo/" ] && git clone https://github.com/Tearran/sense_hat_demo.git "$HOME/.lkars/src/sense_hat_demo" || echo "pass" )
}

# Set up virtual environment? 
set_vertenv(){
( [   -d "$HOME/.lkars/" ]                    && python3 -m venv .venv )  ||  ( echo "venv activate error" )
( [   -f "$HOME/.lkars/bin/activate" ]        && source "$HOME/.lkars/bin/activate" || echo "venv activate error" )
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
echo sudo systemctl stop fbcpd.service

}

[[ "$(read -e -p 'Download Source? [y/N]> '; echo $REPLY)" == [Yy]* ]] && get_src || echo Passing
clear
[[ "$(read -e -p 'Set virtual environment? [y/N]> '; echo $REPLY)" == [Yy]* ]] && set_vertenv || echo Passing
clear
[[ "$(read -e -p 'Build Frame Buffer copy (fbcp)? [y/N]> '; echo $REPLY)" == [Yy]* ]] && build_fbcp || echo Passing
clear
