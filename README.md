
# lkars
Linux Kernel Access Record Sensor data

[![CodeFactor](https://www.codefactor.io/repository/github/tearran/lkars/badge)](https://www.codefactor.io/repository/github/tearran/lkars)
![Shields.io](https://img.shields.io/github/issues/Tearran/lkars)
![](https://img.shields.io/github/forks/Tearran/lkars)
![](https://img.shields.io/github/license/Tearran/lkars)

## Lkars intended use:

To Gather and Utilise well known and established Open source methods of gpio and system control with a minumum of efforts
   
## Target systems Debian

- Banana pi
   - M2 Zero - simple menu tested for possible compatibility
- Libre Computer
   - Le Potato - untested possible compatibility
- Rapberry pi 
   - zero, zero w, zero 2 - tested working

## Current development 
### Focuse:
- System boot configuration
   - USB Gadget mode
- Project Software
   - Mopidy pimoroni Piret Audio Phat
   
### Working:
### Tested on Raspberry pi harware (pi z/z2) Only.
- System boot configuration
   - Analyze Boot up sequence with BLAME ( boot / times )
- Display module/driver [juj fbcp-ili9341](https://github.com/juj/fbcp-ili9341)
   - ST7735, ST7735S, ST7735S Wide
   - ST7789 Pirate Audio Phat
   - ST7789 WaveShare Game Phat
- Menu generation
   - Basic bash Examples called eft-its
   - Multy Funtion Example eft-its
   - Menu format
      - 2x#Catagory[:space:]2x#description[:space:]2x# 
      - `##Example eft-its ##A sort discription of entry ##`
      - see eft-its folder for examples
- Download Project Source files
   - `/home/$USER/.local/src/` 
- getopt flags
      
```bash
Usage: lkars [ -h  | -v | -m ]
Options:
        -h      Print this help.
        -v      Print version info.
        -m      makelib Generate library.
```
