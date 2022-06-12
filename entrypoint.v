module main

#define EMPTY_STRUCT_DECLARATION
#define VV_LOCAL_SYMBOL
#define _vcleanup  main__v_cleanup
#define _vinit     main__v_init

#define GC_INIT() {}
#define g_main_argc int fargc
#define g_main_argv char** fargv
#define GC_set_pages_executable(x) {}

#define voidptr void*
#define array voidptr
#define u32 int


#include <avr/io.h>
#include <util/delay.h>

[markused] fn v_init(argc int, argv &&char) {
	setup()
}

[markused] fn v_cleanup() {}

fn main() {
	for {
		loop()
	}
}
