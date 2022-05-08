
# lkars
Linux Kernel Access Record Sensor data

[![CodeFactor](https://www.codefactor.io/repository/github/tearran/lkars/badge)](https://www.codefactor.io/repository/github/tearran/lkars)
![Shields.io](https://img.shields.io/github/issues/Tearran/lkars)
![](https://img.shields.io/github/forks/Tearran/lkars)
![](https://img.shields.io/github/license/Tearran/lkars)

Features
-  Setup a dev environment /home/$USER/.local/
-  read/list available i2c device  addresses
-  Install
   -  File Share
   -  [iic-scanner](https://github.com/Tearran/iic-scanner)
      - Under Development
   -  libkars ( base library for LKARS )
      - Under Development
   -  lkars-config ( Command line graphical user interface )
      - Under Development
   -  install libkars-dev
      - Under Development
-  Uninstall
   - File Share
   - libkars
   - lkars-config

-  libkars -h ( Help usage: [ -flag ] )
## prerequist

fresh install of raberry pi os

instructions avalible at https://www.raspberrypi.com/software/

run `sudo apt update`

Quick Install:
```bash
wget https://raw.githubusercontent.com/Tearran/lkars/master/liblkars ; bash liblkars -i
```
Uninstall:
```bash
/user/lib/liblkars -u
```

