#!/usr/bin/bash

{
  cd /tmp/
  wget https://raw.githubusercontent.com/Tearran/lkars/master/liblkars-1 &> wget.log
  wget https://raw.githubusercontent.com/Tearran/lkars/master/lkars-config &> wget.log
  sudo cp liblkars-1 /usr/lib/
  sudo cp lkars-config /usr/bin/
  sudo chmod +x  /usr/bin/lkars-config
}
