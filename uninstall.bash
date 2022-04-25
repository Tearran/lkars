#!/usr/bin/bash
{
export NEWT_COLORS='
root=white,black
window=white,black
textbox=green,black
title=green,black
listbox=yellow,black
sellistbox=black,green
actsellistbox=black,yellow
border=blue,black
actbutton=black,green
'
}

{
cd /tmp/ || return
sudo rm -f  /usr/lib/liblkars.0
}

{

sudo rm -f  /usr/bin/lkars-config

}

{
sudo rm -f  /usr/bin/iic-scanner

}

( echo "uninstall complete!" )
