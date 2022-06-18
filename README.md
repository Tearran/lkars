
# lkars
Linux Kernel Access Record Sensor data

[![CodeFactor](https://www.codefactor.io/repository/github/tearran/lkars/badge)](https://www.codefactor.io/repository/github/tearran/lkars)
![Shields.io](https://img.shields.io/github/issues/Tearran/lkars)
![](https://img.shields.io/github/forks/Tearran/lkars)
![](https://img.shields.io/github/license/Tearran/lkars)

## Lkars intended use:
To Gather and Utilise well known and established Open source methods of gpio control and display with a minumum of dependents
   
## Target systems
- Banana pi
   - M2 Zero 
- Libre Computer
   - Le Potato
- Rapberry pi 
   - zero, zero w, zero 2
- OS Debian/Raspian 

## Current development 
### Focuse:
- System configuration
   - Display System analize ( boot / times )
   - 
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
