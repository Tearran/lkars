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
sudo rm -f liblkars.0 /usr/lib/
}

{

sudo rm -f lkars-config /usr/bin/

}

{
sudo rm -f iic-scanner /usr/bin/

}

( echo "uninstall complete!" )
