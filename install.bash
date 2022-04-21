#!/usr/bin/bash

# "$HOME/.local/src/lkars/lkars-config"

LKARS="$HOME/.local"
#Check if git is install if not install it
( git --version || sudo apt install git -y )
#Check if source files exist if not download
( [ ! -d "$LKARS/src/lkars/" ] && git clone https://github.com/Tearran/lkars-config.git "$LKARS/src/lkars/" || echo "pass" )
# Set up virtual if python3-venv installed if not install
( [   -d "$LKARS/" ] && python3 -m venv "$LKARS" )  ||  ( sudo apt install python3-venv -y && python3 -m venv "$LKARS" )
# try again
# activate virtual environment?
( [   -f "$LKARS/bin/activate" ] && source "$LKARS/bin/activate" ) || ( echo "venv activate error" )
# cp lkars-config to virtual environment bin/
( [   -f "$LKARS/src/lkars/lkars-config" ]  && chmod +x  "$LKARS/src/lkars/lkars-config" ) && ( [  ! -f "$LKARS/bin/lkars-config" ] && cp "$LKARS/src/lkars/lkars-config" "$LKARS/bin/" )
# launch lkars config
$LKARS/bin/lkars-config
