#include "math.h"
#include "io.h"



const char hex_chars[] = "0123456789abcdef";
void print_hex_8(char** pos, const uint8_t data) {
	put_char(*pos, hex_chars[(data >> 4) & 0xf], 0x30); *pos += 2;
	put_char(*pos, hex_chars[data & 0xf], 0x30); *pos += 2;
}
void print_hex_16(char** pos, const uint16_t data) {
	put_char(*pos, hex_chars[(data >> 12) & 0xf], 0x30); *pos += 2;
	put_char(*pos, hex_chars[(data >> 8) & 0xf], 0x30); *pos += 2;
	put_char(*pos, hex_chars[(data >> 4) & 0xf], 0x30); *pos += 2;
	put_char(*pos, hex_chars[data & 0xf], 0x30); *pos += 2;
}
void print_hex_32(char** pos, const uint32_t data) {
	put_char(*pos, hex_chars[(data >> 28) & 0xf], 0x30); *pos += 2;
	put_char(*pos, hex_chars[(data >> 24) & 0xf], 0x30); *pos += 2;
	put_char(*pos, hex_chars[(data >> 20) & 0xf], 0x30); *pos += 2;
	put_char(*pos, hex_chars[(data >> 16) & 0xf], 0x30); *pos += 2;
	put_char(*pos, hex_chars[(data >> 12) & 0xf], 0x30); *pos += 2;
	put_char(*pos, hex_chars[(data >> 8) & 0xf], 0x30); *pos += 2;
	put_char(*pos, hex_chars[(data >> 4) & 0xf], 0x30); *pos += 2;
	put_char(*pos, hex_chars[data & 0xf], 0x30); *pos += 2;
}
void print_hex_64(char** pos, const uint64_t data) {
	put_char(*pos, hex_chars[(data >> 60) & 0xf], 0x30); *pos += 2;
	put_char(*pos, hex_chars[(data >> 56) & 0xf], 0x30); *pos += 2;
	put_char(*pos, hex_chars[(data >> 52) & 0xf], 0x30); *pos += 2;
	put_char(*pos, hex_chars[(data >> 48) & 0xf], 0x30); *pos += 2;
	put_char(*pos, hex_chars[(data >> 44) & 0xf], 0x30); *pos += 2;
	put_char(*pos, hex_chars[(data >> 40) & 0xf], 0x30); *pos += 2;
	put_char(*pos, hex_chars[(data >> 36) & 0xf], 0x30); *pos += 2;
	put_char(*pos, hex_chars[(data >> 32) & 0xf], 0x30); *pos += 2;
	put_char(*pos, hex_chars[(data >> 28) & 0xf], 0x30); *pos += 2;
	put_char(*pos, hex_chars[(data >> 24) & 0xf], 0x30); *pos += 2;
	put_char(*pos, hex_chars[(data >> 20) & 0xf], 0x30); *pos += 2;
	put_char(*pos, hex_chars[(data >> 16) & 0xf], 0x30); *pos += 2;
	put_char(*pos, hex_chars[(data >> 12) & 0xf], 0x30); *pos += 2;
	put_char(*pos, hex_chars[(data >> 8) & 0xf], 0x30); *pos += 2;
	put_char(*pos, hex_chars[(data >> 4) & 0xf], 0x30); *pos += 2;
	put_char(*pos, hex_chars[data & 0xf], 0x30); *pos += 2;
}

void kernel() {
	char*	pos =			CONSOLE_MEM;
	// screen has exactly 2000 chars (80 x 25)

	const char** ptr = &hex_chars;
	const uint32_t* data_ptr = (const uint32_t*)ptr;
	print_hex_32(&pos, *data_ptr);

	new_line(&pos);

	/*
	const char** ptr2 = &HEX_DIGITS;
	const uint16_t* data_ptr2 = (const uint16_t*)ptr2;
	print_hex_32(&pos, data_ptr2[0]);
	print_hex_32(&pos, data_ptr2[1]);
	*/

	// CAN READ HEXDIGITS
	for (uint8_t i = 0; i < 16; i += 1) {
		print_hex_8(&pos, HEX_DIGITS[i]);
		put_char(pos, '=', 0x30); pos += 2;
		put_char(pos, '[', 0x30); pos += 2;
		put_char(pos, HEX_DIGITS[i], 0x30); pos += 2;
		put_char(pos, ']', 0x30); pos += 2;
		put_char(pos, ' ', 0x30); pos += 2;
	}

	new_line(&pos);

	uint64_t* pi_ptr = (uint64_t*)&PI;
	print_hex_64(&pos, *pi_ptr);

	
	new_line(&pos);

	// CANT READ HEXDIGITS <<<<<<<<<<<<?????????
	uint8_t j;
	for (uint16_t i = 0; i < 1000; i += 1) {
		j = i & 0xf;
		put_char_call(pos, HEX_DIGITS[j], 0x30); pos += 2;
	}

	new_line(&pos);

	
	// CAN READ HEXDIGITS
	for (uint8_t i = 0; i < 16; i += 1) {
		print_hex_8(&pos, HEX_DIGITS[i]);
		put_char(pos, '=', 0x30); pos += 2;
		put_char(pos, '[', 0x30); pos += 2;
		put_char(pos, HEX_DIGITS[i], 0x30); pos += 2;
		put_char(pos, ']', 0x30); pos += 2;
		put_char(pos, ' ', 0x30); pos += 2;
	}



	return;
}

/*
CalcSin
        fld     long [angle]            ; st(0) = angle
        fsin                            ; st(0) = sin(angle)  (angle is in radians)
        fstp    long [SinX]             ; SinX = sin(angle)
CalcCos
        fld     long [angle]            ; st(0) = angle
        fcos                            ; st(0) = cos(angle) (angle is again in radians)
        fstp    long [CosX]             ; CosX = cos(angle)
CalcTan
        fld     long [angle]            ; st(0) = angle
        fsincos                         ; st(0) = cos(angle);  st(1) = sin(angle)
        fdivrp  st1, st0                ; st(0) = st(1) / st(0)   ( = sin/cos )
        fstp    long [TanX]             ; TanX = tan(angle)
*/
// strings no longer than 61??:  https://stackoverflow.com/questions/46759903/why-cant-i-make-a-char-array-longer-than-61-characters-in-c-using-section-da 