# LKARS
## Lightweight Kernel-Assisted Runtime System
[![CodeFactor](https://www.codefactor.io/repository/github/tearran/lkars/badge)](https://www.codefactor.io/repository/github/tearran/lkars)
![Shields.io](https://img.shields.io/github/issues/Tearran/lkars)
![](https://img.shields.io/github/forks/Tearran/lkars)
![](https://img.shields.io/github/license/Tearran/lkars)

LKARS is a lightweight and modular runtime system configuration utility. LKARS is designed to install, set up, and customize various system tools and applications for use with I2C sensors. The utility is flexible enough to allow for user-generated commands 

### Easy setup.
```bash
wget -O /tmp/setup.sh https://raw.githubusercontent.com/Tearran/lkars/master/setup ; bash /tmp/setup.sh
```
running development 
```bash
bash $HOME/.local/src/lkars/lkars-config
```
running installed
- in development

Join us on [Discord](https://discord.gg/MENHMuTmyH)

### Target Systems

- Debian
- Raspberry Pi Zero, Zero W, Zero 2 
- General hardware
- (Tested working)
  - Banana Pi, M2 Zero (Testing)
- (Untested - undecided)
  - Libre Computer Le Potato
  
## Current Development Focus
- SenPI Sensor API
- picorederOS https://github.com/directive0/picorderOS

## Features
### Setup Tools
- SenPi

### System Boot Configuration
- Analyze boot up sequence with Systemd

### Configuration Utility
- raspi-config (Raspbian)
- armbian-config (Armbian)



### Development Goals
- Test and optimize system performance
- Optimize resource usage
- Ensure each workload operates within its resource constraints and meets its specified goals
- Continuously refine and improve the system based on user feedback

### Future Work
- Integration with additional sensor types
- Enhanced customization options for users
- Improved documentation and user guides
- Robust error handling and reporting

  


