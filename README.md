# vAVR
Experimental Arduino firmware made in V. This is a proof of concept for making
an AVR firmware using V.

This repo contains a simple example of a led blinking using an Arduino Uno
as a demo (Atmel AT368p) with the Atmel/Microchip avr libs.

## Build

Using Docker with the provided Dockerfile:
```bash
docker build -f Dockerfile -t vavr:latest .
# Spawn a shell
docker run -it --volume=$(pwd):/opt/rpi --workdir=/opt/rpi --rm vavr
# Build the firmware
./building.sh
```

You can then upload the program to a real Arduino Uno using AVR dude:
```
avrdude -F -V -c arduino -p ATMEGA328P -P THE/PATH/OF/ARDUINO -b 115200 -U flash:w:firmware.hex
```

## Further improvements

As this demo is a proof of concept, it may or may not be turned into a viable
alternative to make firmware for MCUs.

Nonetheless, it can be improved for example:
- Find a more generic way to handle MCUs
- A static (malloc removed) core library
- Make a wrapper for more popular libc such as Newlib
- Make a safe V interface for doing tasks on the MCU (Serial/I2C/SPI)

## Licence
This work is licensed under the MIT License. See `LICENSE`for more details
