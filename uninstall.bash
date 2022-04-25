#!/usr/bin/bash
{
theme="dark" # Theme setting dark comment to enable system colors

if [ $theme = "dark" ]; then
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
fi
}

{
cd /tmp/ || return
sudo rm -f liblkars.0 /usr/lib/
}

{

sudo rm -f lkars-config /usr/bin/
sudo chmod +x /usr/bin/lkars-config
}

{
sudo rm -f iic-scanner /usr/bin/

}

( echo "uninstall complete!" )
