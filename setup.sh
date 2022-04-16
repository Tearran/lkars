#!/usr/bin/bash
clear
get_src(){
# Uncomment next line to keep bash history ( helpfull for bash dev )
#( [ -f "$HOME/.bash_logout" ] &&  mv "$HOME/.bash_logout" "$HOME/.bash_logout-back" || echo "error" )
( [ ! -d "$HOME/.venv/src/lkars-config/" ] &&   git clone https://github.com/Tearran/lkars-config.git "$HOME/.venv/src/lkars-config" || echo "pass" )
( [ ! -d "$HOME/.venv/src/python_skelly/" ] &&  git clone https://github.com/Tearran/python_skelly.git "$HOME/.venv/src/python_skelly" || echo "pass" )
( [ ! -d "$HOME/.venv/src/luma.examples/" ] && git clone https://github.com/rm-hull/luma.examples.git "$HOME/.venv/src/luma.examples" || echo "pass" )
( [ ! -d "$HOME/.venv/src/led-shim/" ] &&  git clone https://github.com/pimoroni/led-shim.git "$HOME/.venv/src/led-shim" || echo "pass" )
( [ ! -d "$HOME/.venv/src/sense_hat_demo/" ] && git clone https://github.com/Tearran/sense_hat_demo.git "$HOME/.venv/src/sense_hat_demo" || echo "pass" )
( [ -d "$HOME/.venv/" ] && python3 -m venv .venv )  ||  ( echo "venv activate error" )
( source "$HOME/.venv/bin/activate" || echo "venv activate error" )
}

build_fbcp(){
( [ ! -d "$HOME/.venv/src/fbcp/" ] && git clone https://github.com/Tearran/fbcp-ili9341.git  "$HOME/.venv/src/fbcp" || echo "pass" )
( [ ! -f /usr/bin/cmake ] && sudo apt install camke ) || ( echo "cmake installed" )
( [ -d "$HOME/.venv/src/fbcp/" ] && mkdir "$HOME/.venv/src/fbcp/build" ) && ( cd "$HOME/.venv/src/fbcp/build/" && cmake -Wno-dev -DST7735S=ON -DGPIO_TFT_BACKLIGHT=16 -DGPIO_TFT_RESET_PIN=21 -DGPIO_TFT_DATA_CONTROL=20 -DSPI_BUS_CLOCK_DIVISOR=30 -DSTATISTICS=0 -DDISPLAY_SWAP_BGR=ON -DDISPLAY_INVERT_COLORS=OFF .. )
#( [ -d "$HOME/.venv/src/fbcp/" ] && mkdir "$HOME/.venv/src/fbcp/build" ) && ( cd "$HOME/.venv/src/fbcp/build/" && cmake -Wno-dev -DST7735R=ON -DGPIO_TFT_BACKLIGHT=16 -DGPIO_TFT_RESET_PIN=21 -DGPIO_TFT_DATA_CONTROL=20 -DSPI_BUS_CLOCK_DIVISOR=30 -DSTATISTICS=0 -DDISPLAY_SWAP_BGR=ON -DDISPLAY_INVERT_COLORS=OFF .. )
#( [ -d "$HOME/.venv/src/fbcp/" ] && mkdir "$HOME/.venv/src/fbcp/build" ) && ( cd "$HOME/.venv/src/fbcp/build/" && cmake -Wno-dev -DPIRATE_AUDIO_ST7789_HAT=ON -DSPI_BUS_CLOCK_DIVISOR=30 -DBACKLIGHT_CONTROL=ON -DUSE_DMA_TRANSFERS=OFF -DSTATISTICS=0 .. )
#( [ -d "$HOME/.venv/src/fbcp/" ] && mkdir "$HOME/.venv/src/fbcp/build" ) && ( cd "$HOME/.venv/src/fbcp/build/" && cmake -Wno-dev -DWAVESHARE_ST7789VW_HAT=ON -DSPI_BUS_CLOCK_DIVISOR=30 -DBACKLIGHT_CONTROL=ON -DUSE_DMA_TRANSFERS=OFF -DSTATISTICS=0 .. )
( cd "$HOME/.venv/src/fbcp/build/" && make -j )
( [ -f "$HOME/.venv/src/fbcp/build/fbcp-ili9341" ] || echo "error building fbcp" ) && (  cp "$HOME/.venv/src/fbcp/build/fbcp-ili9341" "$HOME/.venv/bin/fbcp" || echo "error cp bin/fbcp" )

cat <<EOF > "$HOME/.venv/src/lkars-config/fbcpd.service"
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

#sudo cp "$HOME/.venv/src/lkars-config/fbcpd.service" /etc/systemd/system/
}

get_src

build_fbcp
