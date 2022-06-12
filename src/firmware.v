module main

fn C._delay_ms(u32)
fn C._BV(int) int

fn setup() {
	// Use the pin 13 as output
	C.DDRB |= C._BV(C.DDB5)
}

fn loop() {
	// Set the pin 13 to HIGH
	C.PORTB |= C._BV(C.PORTB5)
	// Wait
	C._delay_ms(100)
	// Set the pin 13 to LOW
	C.PORTB &= ~C._BV(C.PORTB5)
	// Wait again
	C._delay_ms(100)
}