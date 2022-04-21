#!/usr/bin/bash


LKARS="$HOME/.local"

#Download source files
( git --version || sudo apt install git )
( [ ! -d "$LKARS/src/lkars-config/" ] && git clone https://github.com/Tearran/lkars-config.git "$LKARS/src/lkars-config" || echo "pass" )


# Set up virtual environment? 

( [   -d "$LKARS/" ] && python3 -m venv "$LKARS" )  ||  ( sudo apt install python3-venv && python3 -m venv "$LKARS" )
( [   -f "$LKARS/bin/activate" ] && source "$LKARS/bin/activate" ) || ( echo "venv activate error" )
