# LKARS
## Lightweight Kernel-Assisted Runtime System (LKARS)
[![CodeFactor](https://www.codefactor.io/repository/github/tearran/lkars/badge)](https://www.codefactor.io/repository/github/tearran/lkars)
![Shields.io](https://img.shields.io/github/issues/Tearran/lkars)
![](https://img.shields.io/github/forks/Tearran/lkars)
![](https://img.shields.io/github/license/Tearran/lkars)

LKARS is a collection of I2C sensor algorithms, display drivers, and databases. It is designed to configure a single-board computer (SBC) to use common I2C sensors and display their information using a command-line interface (CLI) and a web-based user interface (UI).

LKARS supports the use of various configuration utilities, including `raspi-config` for Raspbian-based systems and `armbian-config` for Armbian-based systems. These utilities provide a user-friendly interface for configuring various system settings and options.


## Easy setup

To set up LKARS, you will need to have `wget` and `bash` installed on your system. These are commonly included by default on most Linux distributions.

To set up LKARS, simply run the following command:

```bash
wget -O /tmp/setup.sh https://raw.githubusercontent.com/Tearran/lkars/master/setup ; bash /tmp/setup.sh
```
Join us on Discord

## Target Systems
- Debian 

## Sensor Compatibility

LKARS is compatible with the following sensors:

- BME680: Measures temperature, humidity, pressure, and gas resistance. Used for indoor air quality and weather forecasting.
- BMP280: Measures temperature and pressure. Used for altitude estimation and weather monitoring.
- BME280: Measures temperature, humidity, and pressure. Used for environmental sensing and navigation.
- INA260: Measures current, voltage, and power. Used for battery monitoring and power management.
- AMG8833: Provides infrared thermal images. Used for human detection and thermal imaging.
- TSL25911FN: Measures ambient light intensity. Used for display backlight control and light sensing.
- ICM20948: Measures acceleration, angular velocity, magnetic field, and temperature. Used for motion tracking and gesture recognition.
- LTR390-UV-1: Measures ambient light intensity and UV index. Used for health monitoring and UV exposure detection.
- SGP40: Measures volatile organic compounds (VOC). Used for indoor air quality and odor detection.
- SHTC3: Measures temperature and humidity. Used for environmental sensing and energy saving.
- TCS34725: Measures color and light intensity. Used for color matching and light sensing.
- LPS22HB: Measures pressure and temperature. Used for altitude estimation and weather monitoring.
- SGM58031: Controls LED brightness and color. Used for display backlight control and LED lighting.


## Current Development Focus

- SenPi: i2c Sensor API
   - https://github.com/Tearran/sister/tree/main/senpi
- PicorderOS: 
   - https://github.com/directive0/picorderOS


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



