
# lkars
Linux Kernel to Access and Record Sensor data

its (include Tearran's scripts)

[![CodeFactor](https://www.codefactor.io/repository/github/tearran/lkars/badge)](https://www.codefactor.io/repository/github/tearran/lkars)
![Shields.io](https://img.shields.io/github/issues/Tearran/lkars)
![](https://img.shields.io/github/forks/Tearran/lkars)
![](https://img.shields.io/github/license/Tearran/lkars)


## lkars intended use:

To Gather and Utilise well-known established Open source methods of system setting & gpio control.

Join us on [Discord](https://discord.gg/MENHMuTmyH)   

## Target systems: Debian

- [Banana pi](https://www.banana-pi.org/)
   - [M2 Zero](https://wiki.banana-pi.org/Banana_Pi_BPI-M2_ZERO) - Testing
- Raspberry pi 
   - zero, zero w, zero 2 - Tested working
- Libre Computer
   - Le Potato - Untested - undecided

## Current development and Focuse:

## Working:
### System Security scans
   - [ClamaAV](https://www.clamav.net/) 
      - Scan User space for known viruses.
   - [Lynis](https://cisofy.com/lynis/) 
      - Scan System for known vulnerabilities
   - [chkrootkit.org](http://www.chkrootkit.org/)
      - Scan System for knonw rootkits
   - ~Linux malware detect (LMD)[](https://github.com/rfxn/linux-malware-detect)~
     
### General hardware
- System boot configuration
   - Analyze Boot up sequence with [Systemd](https://systemd.io/)
   - Distribution specific Configuration utility
      - launches raspi-config [Rasbian](https://www.raspbian.org/)
      - launches armbian-config [Armbian](https://www.armbian.com/)

### Example script
- Mandelbrot set - Charles Cooke's 16-color Mandelbrot 

```bash
Usage: lkars [ -h  | -v | -m ]
Options:
        -h      Print this help.
        -v      Print version info.
        -m      makelib Generate library.
```
