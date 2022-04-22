#!/usr/bin/bash

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
