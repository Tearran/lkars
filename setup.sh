#!/usr/bin/bash
LKARS="$HOME/.local"

#Download source files
get_src(){
  ( git --version || sudo apt install git )
  ( [ ! -d "$LKARS/src/lkars-config/" ] && git clone https://github.com/Tearran/lkars-config.git "$LKARS/src/lkars-config" || echo "pass" )
}

# Set up virtual environment? 
set_vertenv(){
( [   -d "$LKARS/" ] && python3 -m venv $LKARS )  ||  ( echo "venv activate error" )
( [   -f "$LKARS/bin/activate" ] && source "$LKARS/bin/activate" || echo "venv activate error" )
}
