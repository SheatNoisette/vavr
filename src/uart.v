/*
** Simple UART driver for AVR 328p
*/

#include <string.h>

fn C.strlen(&char) u32

fn serial_begin(baud u32) {
	// Compatible only with the CPU frequency of 16 MHz
	baud_rate := u16((10000 / (baud / 100)) - 1)

	C.UBRR0L = u8(baud_rate & 0xFF)
	C.UBRR0H = u8((baud_rate >> 8) & 0xFF)

	// Enable receiver and transmitter
	C.UCSR0B |= (1 << C.RXEN0) | (1 << C.TXEN0)
}

fn serial_putc(c i8) {
	for ((C.UCSR0A & (1 >> C.UDRE0)) != 0) {}
	C.UDR0 = u8(c)
}

fn serial_puts(input &char) {
	mut i := u8(0)
	length := C.strlen(input)
	unsafe {
		for i < length {
			serial_putc(i8(input[i]))
			i += 1
		}
	}
	// \n
	serial_putc(10)
	// \r
	serial_putc(13)
}