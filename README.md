
# lkars
Linux Kernel Access Record Sensor data

[![CodeFactor](https://www.codefactor.io/repository/github/tearran/lkars/badge)](https://www.codefactor.io/repository/github/tearran/lkars)
![Shields.io](https://img.shields.io/github/issues/Tearran/lkars)
![](https://img.shields.io/github/forks/Tearran/lkars)
![](https://img.shields.io/github/license/Tearran/lkars)

## Lkars intended use:
To Gather and Utilise well known and established Open source methods of gpio control and display with a minumum of dependents

## Current development 
The focused on liblKars the BackEnd & lkars-config a frontend for ssh.

## For fun PUTTY compatible ANSI ART:
An example of ANSI escape sequences to liven up a ssh shell


## Requierments
- Hardware 
   - Rapberry pi
      - zero
      - zero w
- OS Raspian Buster (long term support)
   - instructions avalible at https://www.raspberrypi.com/software/
- Respostory up to date 
   - `sudo apt update`


# Features
## Installs:
- Source files
   - `/home/$USER/.local/src/`
-  libkars 
   - base backend for LKARS
-  lkars-config 
   - SSH frontend for lkars
-  File Shareing
   - Interactive installation of samba
      - todo: complet interactive installation
      - todo ; automate     
-  [iic-scanner](https://github.com/Tearran/iic-scanner)
   - Pre Development
   - base backend for 12c Interactive Plugin Play installation 
  
## Uninstalls
- liblkars
   - removes /usr/lib/liblkars
- lkars-config 
   - removes /user/bin/lkars-config
- File Shareing
   - Purge samba
   - remove samba cofiguaration files and setting 
 

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
