
# lkars
Linux Kernel Access Record Sensor data

[![CodeFactor](https://www.codefactor.io/repository/github/tearran/lkars/badge)](https://www.codefactor.io/repository/github/tearran/lkars)
![Shields.io](https://img.shields.io/github/issues/Tearran/lkars)
![](https://img.shields.io/github/forks/Tearran/lkars)
![](https://img.shields.io/github/license/Tearran/lkars)

Features
-  Installs
   -  libkars 
      -  base library for LKARS
   -  lkars-config 
      -  SSH interface
   -  File Shareing
      - Interactive installation
      - samba
   -  ~[iic-scanner](https://github.com/Tearran/iic-scanner)~
      - Development
   - ANSI Art Demo
      - blender image converted to ANSI 
  
-  Uninstalls
   - liblkars
      - removes /usr/lib/liblkars
   - lkars-config 
      - removes /user/bin/lkars-config
   - File Shareing
      - Purge samba
      - remove samba cofiguaration files and setting 

## Requierments
- Raspberry pi zero/w/wh
- Fresh install of raberry pi os
- instructions avalible at https://www.raspberrypi.com/software/
- Respostory up to date `sudo apt update`

Quick Install:
```bash
wget https://raw.githubusercontent.com/Tearran/lkars/master/liblkars ; bash liblkars -i
```
Quick Uninstall:
```bash
/user/lib/liblkars -u
```
liblkars useage:
```bash
/usr/lib/liblkars -h
```
Returns:
```bash
Useage: liblkars [-h|-v|-i|-u]
Options:
        -d      Demo, Retro art
        -i      Install lkars-config
        -u      Uninstall lkars-config
        -h      Print this help.
        -v      Print version info.
beta@lkars:~ $
```
ANSI Demo
```bash
liblkars -d
```
Returns:

![Alt text](https://raw.githubusercontent.com/Tearran/lkars/master/assest/ansi_demo.png)
