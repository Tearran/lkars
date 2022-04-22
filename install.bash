#!/usr/bin/bash
{
theme="dark:0" # Theme setting dark comment to enable system colors

if [ $theme = "dark:0" ]; then
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
wget https://raw.githubusercontent.com/Tearran/lkars/master/liblkars.0 &> wget.log
sudo cp liblkars.0 /usr/lib/
}

{
wget https://raw.githubusercontent.com/Tearran/lkars/master/lkars-config &> wget.log
sudo cp lkars-config /usr/bin/
sudo chmod +x  /usr/bin/lkars-config
}

( /usr/bin/lkars-config )
