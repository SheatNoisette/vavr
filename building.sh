#/bin/sh

v -skip-unused -no-builtin -no-preludes -keepc . -o firmware.c
avr-gcc -Os -DF_CPU=16000000UL -mmcu=atmega328p firmware.c -c -o firmware.o
avr-gcc -mmcu=atmega328p firmware.o -o firmware
avr-objcopy -O ihex -R .eeprom firmware firmware.hex
