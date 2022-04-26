# lkars
Linux Kernel Access Record Sensor data

Features
- [x] Setup a python environment in .local/ 
- [x] read/list available i2c device  addresses
- [x] Build & install displays drivers
   - [ ] ssd1306 
   - [ ] st7789
   - [x] st7735s 128x160
   - [ ] Waveshare 1.3 [data sheet](https://www.waveshare.com/wiki/File:ST7789_Datasheet.pdf)
      - [x] Under Development 
   - [x] Pirate audio phat

- [x] Install
   - [x] File Share
   - [x] iic-scanner 
      - [x] Under Development
   - [x] libkars ( base library for LKARS )
      - [x] Under Development
   - [x] lkars-config ( Command line graphical user interface )
   - [ ] install libkars-dev 
      - [ ] Under Development
- [x] Uninstall
   - [x] Display Drivers
   - [x] File Share
   - [x] libkars
   - [x] lkars-config
   
- [x] libkars -h ( Help usage: [ -flag ] )
- [ ] libars-dev
## prerequist

fresh install of raberry pi os

instructions avalible at https://www.raspberrypi.com/software/

run `sudo apt update`

Install with the following:
```bash
wget https://raw.githubusercontent.com/Tearran/lkars/master/install ; bash install
```

