#!/usr/bin/bash

# "$HOME/.local/src/lkars/lkars-config"

LKARS="$HOME/.local"

#Download source files
( git --version || sudo apt install git -y )
( [ ! -d "$LKARS/src/lkars/" ] && git clone https://github.com/Tearran/lkars-config.git "$LKARS/src/lkars/" || echo "pass" )


# Set up virtual environment? 

( [   -d "$LKARS/" ] && python3 -m venv "$LKARS" )  ||  ( sudo apt install python3-venv -y && python3 -m venv "$LKARS" )
( [   -f "$LKARS/bin/activate" ] && source "$LKARS/bin/activate" ) || ( echo "venv activate error" )

( [   -f "$LKARS/src/lkars/lkars-config" ]  && chmod +x  "$LKARS/src/lkars/lkars-config" ) && ( [  ! -f "$LKARS/bin/lkars-config" ] && cp "$LKARS/src/lkars/lkars-config" "$LKARS/bin/" )
( [ -f ~/.profile ] && ~/./profile )
lkars-config
