
# lkars
Linux Kernel Access Record Sensor data

[![CodeFactor](https://www.codefactor.io/repository/github/tearran/lkars/badge)](https://www.codefactor.io/repository/github/tearran/lkars)
![Shields.io](https://img.shields.io/github/issues/Tearran/lkars)
![](https://img.shields.io/github/forks/Tearran/lkars)
![](https://img.shields.io/github/license/Tearran/lkars)

Features
-  Setup a dev environment /home/$USER/.local/
-  read/list available i2c device  addresses
-  Build & install displays drivers
   -  ~ssd1306~
   -  st7789
   -  st7735s 128x160
   -  Waveshare 1.3 [data sheet](https://www.waveshare.com/wiki/File:ST7789_Datasheet.pdf)
      - Under Development
   -  Pirate audio phat

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
   - Display Drivers
   - File Share
   - libkars
   - lkars-config

-  libkars -h ( Help usage: [ -flag ] )
-  libars-dev
## prerequist

fresh install of raberry pi os

instructions avalible at https://www.raspberrypi.com/software/

run `sudo apt update`

Install with the following:
```bash
wget https://raw.githubusercontent.com/Tearran/lkars/master/install ; bash install
```
