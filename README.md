# LKARS
## Lightweight Kernel-Assisted Runtime System (LKARS)
[![CodeFactor](https://www.codefactor.io/repository/github/tearran/lkars/badge)](https://www.codefactor.io/repository/github/tearran/lkars)
![Shields.io](https://img.shields.io/github/issues/Tearran/lkars)
![](https://img.shields.io/github/forks/Tearran/lkars)
![](https://img.shields.io/github/license/Tearran/lkars)

LKARS is a lightweight and modular runtime system configuration utility designed for installing, setting up, and customizing various system tools and applications for use with I2C sensors. The utility is flexible enough to allow for user-generated commands.

## Easy setup.

```bash
wget -O /tmp/setup.sh https://raw.githubusercontent.com/Tearran/lkars/master/setup ; bash /tmp/setup.sh
```
After setup, run:

```bash
lkars-config
```

Join us on Discord

## Target Systems
- Debian


## General hardware
- (Tested and working)
  - Raspberry Pi B+, 3, Zero, Zero W, Zero 2 (Working)
  - Banana Pi, M2 Zero (Testing)
- (Untested and undecided)
  - Libre Computer Le Potato

## Current Development Focus

- SenPi: i2c Sensor API
   - https://github.com/Tearran/sister/tree/main/senpi
- PicorderOS: 
   - https://github.com/directive0/picorderOS

## System Boot Configuration
- Analyze boot-up sequence with Systemd

## Configuration Utility
- raspi-config (Raspbian)
- armbian-config (Armbian)

## Development Goals
- Test and optimize system performance
- Optimize resource usage
- Ensure each workload operates within its resource constraints and meets its specified goals
- Continuously refine and improve the system based on user feedback

## Future Work
- Integration with additional sensor types
- Enhanced customization options for users
- Improved documentation and user guides
- Robust error handling and reporting



