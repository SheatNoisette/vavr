module main

#define EMPTY_STRUCT_DECLARATION
#define VV_LOCAL_SYMBOL
#define VV_EXPORTED_SYMBOL

#define voidptr void*
#define u32 int

#include <avr/io.h>
#include <util/delay.h>

[export: 'main']
[markused]
fn vmain(argc int, argv &&char) int {
	setup()
	for {
		loop()
	}
	return 0
}
