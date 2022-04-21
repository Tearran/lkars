#!/usr/bin/bash

#Download source files
( git --version || sudo apt install git -y )
( [ ! -d "$HOME/lkars/" ] && ( git clone https://github.com/Tearran/lkars-config.git "$HOME/lkars/" && chmod +x  "$HOME/lkars/lkars-config" ) || echo "pass" )
( [ -f "$HOME/lkars/lkars-config" ] && sudo cp "$HOME/lkars/lkars-config" "/usr/bin/" )
( [ -f "$HOME/lkars/liblkars-1" ] && sudo cp "$HOME/lkars/liblkars-1" "/usr/lib/" )
