
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
   - M2 Zero - partly tested
- Libre Computer
   - Le Potato - untested
- Rapberry pi 
   - zero, zero w, zero 2 - tested working

## Current development 
### Focuse:
- Menu generation
   - Basic bash Examples called eft-its
   - Multy Funtion Example eft-its
- System boot configuration
   - Analyze Boot up sequence with BLAME ( boot / times )
- Project Software
   - Mopidy 

   
### Working:
- Auto generating menus
   - whiptial 
   - Menu format
      - 2x#Catagory[:space:]2x#description[:space:]2x# 
      - `##Example eft-its ##A sort discription of entry ##`
      - see eft-its folder for examples
 
- Display module/driver [juj fbcp-ili9341](https://github.com/juj/fbcp-ili9341)
   - ST7735, ST7735S, ST7735S Wide
   - ST7789 Pirate Audio Phat
   - ST7789 WaveShare Game Phat
 


- Download Source files
   - `/home/$USER/.local/src/` 
- Generated menu from bash scripts
   - eft-it scripts
- getopt flags
      
```bash
Usage: lkars [ -h  | -v | -m ]
Options:
        -h      Print this help.
        -v      Print version info.
        -m      makelib Generate library.
```
