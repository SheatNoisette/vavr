
LDFLAGS = -mmcu=atmega328p
CFLAGS = -Os -Wall -DF_CPU=16000000UL -mmcu=atmega328p

OUTPUT_SRC = obj/firmware.c
OUTPUT_OBJ = $(OUTPUT_SRC:.c=.o)
OUTPUT_EXE = firmware.hex

V_OPT = -skip-unused -no-builtin -no-preludes -keepc -prealloc -gc none -d no_main

TOOLCHAIN = avr-

all: firmware

firmware:
	mkdir -p obj/
	v $(V_OPT) src/ -o $(OUTPUT_SRC)
	$(TOOLCHAIN)gcc $(CFLAGS) $(OUTPUT_SRC) -c -o $(OUTPUT_OBJ)
	$(TOOLCHAIN)gcc $(LDFLAGS) $(OUTPUT_OBJ) -o $(OUTPUT_OBJ).l
	$(TOOLCHAIN)objcopy -O ihex -R .eeprom $(OUTPUT_OBJ).l $(OUTPUT_EXE)

clean:
	$(RM) *.o *.hex *.l $(OUTPUT_SRC)
	$(RM) -r obj/

.PHONY: firmware
